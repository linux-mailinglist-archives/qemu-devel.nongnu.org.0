Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061DB1BAEF1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 22:12:51 +0200 (CEST)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTA7W-0006Rw-2z
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 16:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <amanieu@gmail.com>) id 1jTA6C-0005Gn-C6
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 16:11:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <amanieu@gmail.com>) id 1jTA6B-0004oF-Rx
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 16:11:28 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amanieu@gmail.com>) id 1jTA6B-0004fM-Fo
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 16:11:27 -0400
Received: by mail-wm1-x344.google.com with SMTP id h4so289588wmb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AocQf9nUqbYh8YApFIlrz1VFdLKMDVVrRs0J6jq1UcA=;
 b=QgOxdlBgCVzRaht58D04nOuCSk/+VT1xSkfp4XaRvrpMfLvYu52pkTnQ+SXCsDBOMl
 7HlT1FCtVAQEPwjjrNHRVnuV8w6TWoYMswtOYcTj4kCm6KgBqyx4w8X6PT92afRHWDnO
 aXqk/fNzXpqd9gN1Zm+FXFqOHrqlxO1jdO3L6Hue2iqNEBdL7OuawzV3DtaOt2ATZTxo
 YzMaCVGfuEH/IzEwPMFufZgSzuuEufUrwxHMIIey1Z6fcD9wS3FoxpcojiA/AdK02EeD
 ++DwvcGumc0R2+4pU2ybSAhChpPZvI6gPY39hXVyxxIkCowBtX62tQXL0Ta/ZlS0UlFo
 NKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AocQf9nUqbYh8YApFIlrz1VFdLKMDVVrRs0J6jq1UcA=;
 b=HNuMtXGhTLMzYHmVdXY8jXlk7xXTHp/6tGRIh/CHq9vuWQrc3EIKha5nyTMyVyjHpu
 bw3sB1IxxhugvYesZIAYxsWVF2MIEarfjr7rtbFzPpjmgIzPgbmuHwNmGTF7vb7k2rRI
 SvMwAsFptxklBxGFk11J/McaFlzVv+6eP8gREh8BYtUyhb8yml/P3NNTWP0zqZR/7MWa
 lgDbN4QoetFqcoh5+bHUK/6mFWwctsCIRwV77MSEvVfqbuA2ZLjymrG3tDiYipv35qoq
 WNTTDVFL/+6JFxzx11h8Cg9IORbQ4z+voMLpOX6mE/JS8mg4Y2p+X4znGyp2lkA4JCZJ
 Kmqg==
X-Gm-Message-State: AGi0PuYNyYx0//xFO9gsr9eLcEds3MX2VXjCox6xm4rjurSlk+cW4OQ3
 7vReRF3nyh+Wc/2F9Y/gzH8jFR/Dc/Q=
X-Google-Smtp-Source: APiQypJmqBmFeqXZHdIBuabWqAkbTJcX1cp871+ov+oMnkkU9chIewIL9vmAgGV9fZ09K/yHWmDkZA==
X-Received: by 2002:a05:600c:244:: with SMTP id 4mr447973wmj.0.1588018284114; 
 Mon, 27 Apr 2020 13:11:24 -0700 (PDT)
Received: from amanieu-laptop.home ([2a00:23c6:f081:f801:76b2:7504:9791:6959])
 by smtp.gmail.com with ESMTPSA id
 j13sm22287147wro.51.2020.04.27.13.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 13:11:23 -0700 (PDT)
From: Amanieu d'Antras <amanieu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/riscv: Fix target_ucontext and target_sigcontext
Date: Mon, 27 Apr 2020 21:11:20 +0100
Message-Id: <20200427201120.1500504-1-amanieu@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=amanieu@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Amanieu d'Antras <amanieu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These now match the field layout used by the kernel.

Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
---
 linux-user/riscv/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 83ecc6f799..2b15e32a7b 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -32,7 +32,7 @@
 struct target_sigcontext {
     abi_long pc;
     abi_long gpr[31]; /* x0 is not present, so all offsets must be -1 */
-    uint64_t fpr[32];
+    uint64_t fpr[32] __attribute__((aligned(16)));
     uint32_t fcsr;
 }; /* cf. riscv-linux:arch/riscv/include/uapi/asm/ptrace.h */
 
@@ -40,8 +40,9 @@ struct target_ucontext {
     unsigned long uc_flags;
     struct target_ucontext *uc_link;
     target_stack_t uc_stack;
-    struct target_sigcontext uc_mcontext;
     target_sigset_t uc_sigmask;
+    char __unused[1024 / 8 - sizeof(target_sigset_t)];
+    struct target_sigcontext uc_mcontext;
 };
 
 struct target_rt_sigframe {
-- 
2.26.1


