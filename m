Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B230194E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:07:27 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3VkM-0003pY-9Z
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYc-0000T1-28; Sat, 23 Jan 2021 21:55:19 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYY-0003jD-IX; Sat, 23 Jan 2021 21:55:17 -0500
Received: by mail-pj1-x1034.google.com with SMTP id gx1so659125pjb.1;
 Sat, 23 Jan 2021 18:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lkc05bhxPEaurDuvorYROlMZGsONdTZ57rQZ1y9IAE0=;
 b=QiFGTGfvAiUlc9YJMxM4xb0EfsY44lW9T2VCWzwYoGimvJSZLb0ZVz1mFPk1l+QaON
 yaixGviK8ggOz9Xj8ww1WVXTv9cYtieTpVtn0NyRFI5+vdXnU6Q4OHmuBxyewRE4FI4H
 nD25C+1a25E5C3BOv82Q7twqLOm1RllITlNkxglsp2HyrdKS+oTYPOgIxxJKHnbJE0x2
 JPNXokaVeYaG/xUMN/LiwoVMUs+QLqaY73tLDvfKaxH/J5x49MY+xSqymzmMlmRg8dIE
 8aOaUkP5eIoxs6AH7Rw5wMt0xhtOf2sFWhea4TO/TyQvKGRjyK3nCxuh0FSPNeMkdhKR
 lPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lkc05bhxPEaurDuvorYROlMZGsONdTZ57rQZ1y9IAE0=;
 b=I0KRQElJaQyet+kixtQZwZeWjcw66eloTs+C005yKYe1+i5XtzrvjW9CylQ3sHxbg5
 CXFBPS1qiehTVsniS6qqif7HSDfgKzRWET7cIfzi48KVM26GJkudVjnrXRkvqRuAwTc/
 J0r3BF13Mo0ARcKIpoQ9XfzqPm7VF5akbfnX6gYPNL6k464yiTCA9dCHhEN+T26KHLoB
 y7YuRWDVXjFW6/K64Trzr4Y2UIrsn+x9q3Lva973KwMjmPIK295AXis8CGAxR+cWJMRo
 dGAsqEqKKyOFRRaeM0ENdrbzXcePwouuYcKUXM7H+9yiVROj7Xg0RkH8MXW5NgpdEYME
 MsDA==
X-Gm-Message-State: AOAM533LyiMIbV+geJMtrGFbEi/eZQNfKe93xSOhNmb4afYBPg8aji4U
 kbeONpoNZldpZVsyrPYi20tf9RWK5Uskgw==
X-Google-Smtp-Source: ABdhPJzEVuRZLlN90nt7AdTS8A4j8fWPOT7ECnL2LzHsBe2SE1B110wngtVVSS3z9LbfRcxUZtCHuA==
X-Received: by 2002:a17:90a:5993:: with SMTP id
 l19mr121428pji.203.1611456911891; 
 Sat, 23 Jan 2021 18:55:11 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:55:11 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 5/6] hw/block/nvme: add NMIC enum value for Identify
 Namespace
Date: Sun, 24 Jan 2021 11:54:49 +0900
Message-Id: <20210124025450.11071-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index d6415a869c1c..ad68cdc2b92d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1203,6 +1203,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeIdNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.17.1


