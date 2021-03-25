Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32333495C6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:39:02 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS4b-0001sX-Tq
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2U-00006D-Gv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:50 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2S-0006sg-R8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:50 -0400
Received: by mail-lf1-x12f.google.com with SMTP id m12so3142308lfq.10
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCTisIyvoNWgawBeszBHqeVacn5eanhn+vao3iu3bTQ=;
 b=e+32eQCYlpA06ymTRzRzQ1G4eL072gad9bSvIR2MDAT6odSmV4kDqqmc8cZJ9wsXR3
 duEKIqEYNxMq6R2FQStuK5yajZhZU6oSnGXsNg9KUlBKOOjth3YYhykWf8w9HTPcJdiH
 L7lKOHrpfQvAZywHeX6lvsUJb11R6YCoDRvOAAoMocIMsPqyWW2x3CBlTC3LDut+PoTA
 NZNylguLQ1qMRPPTkuUbUkF+o+ff/LfQF2reOWeO1FhRGYBo67YQsjtMhEFItOJnZOIf
 s3+gQoDBvOgHmRkEL+QlTUH3ZhJp3hBAt+8gAs2Z1t7m1CKIgXMw1LXZJxO++8sLUhmX
 DIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCTisIyvoNWgawBeszBHqeVacn5eanhn+vao3iu3bTQ=;
 b=VVbrBRI/2eWwCoCsamr9vf1IAV8eGX75G5NIvNd6ehkezdYLjBVekiuReRYU9eRPjo
 ioUNWCo68U9jHIUTyDkiF7NxLNN+u695WHpSVm/1ytmONm7eIgJYFJWfthobvLz6U5w3
 zZr+gDrRmjlMspjyb6J3jlzs8mVxIg1SOkpdXP7TSMmohUMXhjrLvB3ynZLHL9O0XaOM
 ug1i2ZTOkSP5PsuVgeeMmCYJKiwYBqGDggrZGDI/VlADJEjFD9Q+DXQ4GSN7yasTUePT
 SmsFkj1WEvdWCmzjl+B7XzI93qFvNxBO3PZrUbUJjuLP+9pizAkBr3X0435vSNPjCKG7
 +Hzw==
X-Gm-Message-State: AOAM533EpS1/CeoyzG4P/tbPbX2/1/g+BMKIjN2QnqssWFc1DpBeMI77
 IyFLesTnJh9jgFC8TVNXLJDDzg==
X-Google-Smtp-Source: ABdhPJwliadZrZBLsKJTkAFvTGr8qtnn2mIX6CULnlmPWFRTmnOwJ8af+v9caRKTGdTJE5RLk47Q4Q==
X-Received: by 2002:ac2:44c7:: with SMTP id d7mr5425373lfm.464.1616686607191; 
 Thu, 25 Mar 2021 08:36:47 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id w23sm796694lji.127.2021.03.25.08.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:36:46 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v5 1/7] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Thu, 25 Mar 2021 17:35:23 +0200
Message-Id: <20210325153529.75831-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325153529.75831-1-andrew@daynix.com>
References: <20210325153529.75831-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12f;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12f.google.com
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


