Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8031C35BC24
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:28:36 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrvv-00078s-Gq
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruH-0005eO-TG
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:26:53 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruG-0001sg-4N
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:26:53 -0400
Received: by mail-lj1-x22a.google.com with SMTP id z8so14323546ljm.12
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCTisIyvoNWgawBeszBHqeVacn5eanhn+vao3iu3bTQ=;
 b=rTW5qf0a9G4+BlBRcBOC4gBjxApjO/a+mu6stuO2U2P6t2C7KciU+slJspaDXWkYEZ
 UDwXqmR+juvOyxWXIQTQdyJDdgxvNg/7nDv0A009AzMqDzMvLVNvRNUPduCXj/yodmFK
 Abar7Y0c65pFxmToKC4ZuhewWRrJcEy7DNfK5EBO6wx/POH8d8uLiE5fKwpCJaXv9mlN
 dnkLEQXzrTa+X/p/o9p2EiqC/PrYm7s9tABqckLj76sU5aWlX/kfjUmO7P1JjiFhxS5w
 yT12TNol6hAFgFlq0NfCYDY3cvxxkl5SPDJpQxCJfYGRel1g1HYdLQxPxsGq3xstJcLk
 8zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCTisIyvoNWgawBeszBHqeVacn5eanhn+vao3iu3bTQ=;
 b=kOLhQS4Ob7P7pJ/Nnl6eQIxmpBa5hm1ad4WTV5JiEqwvEW9w/A1hN8RCJqZFjtTTZU
 wFnJsQ0PqrzFaRofQ77dGc864ygeYhSIboz8+63owkN1PxhPEv+wLHr0JOZau5CltSaa
 HcyYgVwIyqLFagWwB7zu9ZB2qxz/LiTbKK0oQWMPHOBX0gmR1DXTm79Wa3UEdxImF/jQ
 i9qNPm4co7tHS1sD+/9JPOLmL2FFLUNQ1yeiVEwWRcYOeHEi1wpCDYFxSRHOaB5RATQl
 I1U5CUub+Cx+HX+7xsidisBLPXIMblo99jHommGeB8I5TR3p54dogFUw/1z/3dQNIUDi
 kvQA==
X-Gm-Message-State: AOAM533fjlJfPZaqUb57ecbROQaphHTXt3EgpNOKCSbTCTBbQH0GJwgc
 nNN02m8ihRNHSFi8AF+yNSTyYw==
X-Google-Smtp-Source: ABdhPJzAgbg1A4EYgUu6lEe4rkp8CVPXcrSSFdvqjX5YYkgV9UQlfQsLw1GIJQ7RzuTb1u3t4wqO1Q==
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr16943434ljo.241.1618216010388; 
 Mon, 12 Apr 2021 01:26:50 -0700 (PDT)
Received: from localhost.localdomain (128-124-64-30.mobile.vf-ua.net.
 [128.124.64.30])
 by smtp.gmail.com with ESMTPSA id n22sm2679702ljc.23.2021.04.12.01.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 01:26:49 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v6 1/7] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Mon, 12 Apr 2021 11:25:06 +0300
Message-Id: <20210412082512.14998-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210412082512.14998-1-andrew@daynix.com>
References: <20210412082512.14998-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22a;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Additional code that will be used for eBPF setting steering routine.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 net/tap-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-linux.h b/net/tap-linux.h
index 2f36d100fc..1d06fe0de6 100644
--- a/net/tap-linux.h
+++ b/net/tap-linux.h
@@ -31,6 +31,7 @@
 #define TUNSETQUEUE  _IOW('T', 217, int)
 #define TUNSETVNETLE _IOW('T', 220, int)
 #define TUNSETVNETBE _IOW('T', 222, int)
+#define TUNSETSTEERINGEBPF _IOR('T', 224, int)
 
 #endif
 
-- 
2.31.0


