Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7D54750F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o01cp-0002LC-UL
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 09:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a0-0006ef-27
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:08 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01Zx-0003dl-41
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:07 -0400
Received: by mail-il1-x12d.google.com with SMTP id a15so1195183ilq.12
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NI+N2VEe5Mw6h4lhur+4hOroAOpLSh2NXyD5ov8MTCU=;
 b=MmUQpy7qlxYRBj1BeWoiSN9UHypkjw8Txve7YAowYpAkTbKFgQ3P6mv6TzhTF60sQQ
 /G9slimQATZ+8VtQH4Vjk0HYVRMvl1iCghWaDJ/eNarZ4OLfX0C5cNWvonkjDrs2IQE0
 iQYRVxu3UbbrNaLWi2rIHLYyedbUeiKK/8DnhiNJuGWl328xgpShbtyQQiLxk/DIBC4I
 Su4AiD2CVRbH4Chc0tX1Ok3z0pgJAGFlqOwIdYG54BJTmjasipy6AtMoGcHZOVvrGr15
 3XwpsLSlCqO3q24vySpKyLBr0Hxpqm/7a5I+T5zvj7dTeNvYrT4+NZsMNwa6Po4YQQI1
 qJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NI+N2VEe5Mw6h4lhur+4hOroAOpLSh2NXyD5ov8MTCU=;
 b=ktVA4gBw8bU3GZZqmwUZiSo7lO31U0rRTL1WY9hoEkNmKKZNwmtLPhF+rI1IKScgAZ
 UHey4Hpe6OBKEY62hV4UWsNxD0oEPMv+OipwkZX6ZM8rDULIqd0SX4b7u6+BTfES9woG
 loUoo/qcAFMhquT2JEp74CHTnIfiIPb4sqhd4J0UnSOapHXHYs2m/dRJMPWuf91sYWQX
 qiwagAd/oytWOCKJ0grVh+W1u2yBWcX1u/rI01+mXMkoED+x25HRx1+qYFjdZ9YD4pWP
 so8kZJ/DQOkCbBST4Ont2xNY+cojotJGVJtDDmk70daX/6HfcatJah7Lbr6abfLl/aw1
 totA==
X-Gm-Message-State: AOAM532khR1yrsaYQspfL1ei2tH853R4BDt/GoR1QAslGEUsIJzJqSZb
 Gnwjf+NIgCuRmdQ/QIEac2A+Bip9rAkPlA==
X-Google-Smtp-Source: ABdhPJx38y7gDYzZwLzIjo68YtphO7o4ZAyQufWo8DsSQ+kwSiiBRZp8x956uGG6kLef/RMILwHIFA==
X-Received: by 2002:a05:6e02:1a0e:b0:2d3:f72e:eaf1 with SMTP id
 s14-20020a056e021a0e00b002d3f72eeaf1mr26152369ild.260.1654955703732; 
 Sat, 11 Jun 2022 06:55:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 13-20020a056e0211ad00b002d781cc0875sm1023578ilj.29.2022.06.11.06.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:55:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, jrtc27@FreeBSD.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
Date: Sat, 11 Jun 2022 07:55:10 -0600
Message-Id: <20220611135514.92882-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220611135514.92882-1-imp@bsdimp.com>
References: <20220611135514.92882-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Releases the references to the iovec created by lock_iovec.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 67851937a8f..52093d479d8 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -175,6 +175,20 @@ fail2:
     return NULL;
 }
 
+void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
+    if (target_vec) {
+        helper_unlock_iovec(target_vec, target_addr, vec, count, copy);
+    }
+
+    g_free(vec);
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1


