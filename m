Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E265433DAF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:46:00 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mctBX-0000Xv-7r
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFE-0000Qr-Q8
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:47 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEz-0000Y1-SH
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:43 -0400
Received: by mail-il1-x134.google.com with SMTP id h27so13312282ila.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAHyQTtLAX0HupvxuP4kXDyruDDTGfcKe5SrS3Tshaw=;
 b=WoH7hg2pByaQ2YRFCbynxpQpJ/UjcPMuIzGnIuT7ylOWfzV52DvHbBqdgNiqnEWmja
 DGms4z5fESvTXtO46hKaxK3rpd7V3Dmdqu2F/B+AmCx0VqpegkCXkkYq4WvZXNGWZJBu
 cV5cyyp8t6uze0jITnDvRo5uuWFWzvvC1+YSmd8S7EWYfrI7L01HMJ0PhmPa1I42VDEZ
 2uR3JxNKX4nVrHACoz9Xr+PAxdzGnjbS6Gv63XIAzpJn8Is8Th5Q4HO/3c4rL+FVDHIc
 GQ7DSJ5It9T1Hk9kziDS9Pzo7wArYc3ezhrOTP1jtgGXyLoPDqTVj/3Cthu5kosToUoa
 Oq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAHyQTtLAX0HupvxuP4kXDyruDDTGfcKe5SrS3Tshaw=;
 b=HHjDAFVScFxAU5Ck0Rny3HLTYqxbY4s4KQx2ur0T5fJFAbDeQQVRltQHcnm6cmuFeH
 4hdB0Rn7EZayktKEmT8VN6Ex8BNomYTW+M5je2qbRN7WZwXLhmBP9ZdZ+RzOafVbsTv+
 TYAAaT7JWQGDCk1amwGTy1j5sQXR+R8YLTWuBGp83WDQiHHrQnpzoOhJi4KKmIxGZLUL
 ZxssHk55AzltmUUNk8/kpVXFCY9efr5/GlRsPXyzDgaVX7128sFd0lcMrTZKZXMgngGw
 3nZta/FAnhwA75a8KsHRHhfdRCy77Ro89GhcCUaUHB+CR7wQunpdKzVir57KyCAyuWef
 9Ajw==
X-Gm-Message-State: AOAM532/PhuE0ZgQvUg6KhpkqRT0aygwyTzY3h24DOYRsskKcLWTC4z/
 1aQblq3Iv4jq+QPZ6dAsEXfBHNJ40dt2Vg==
X-Google-Smtp-Source: ABdhPJwgOKrVXgDPcP5r2WxnmjR1jz6252mBD+wN5mNe9YYcL6zwU1DjK/8yMEyL70dZGm87ThReIA==
X-Received: by 2002:a05:6e02:1e0c:: with SMTP id
 g12mr19016057ila.260.1634661928604; 
 Tue, 19 Oct 2021 09:45:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
Date: Tue, 19 Oct 2021 10:44:45 -0600
Message-Id: <20211019164447.16359-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the machine context to the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 302fdc2846..1d051af9ae 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -201,4 +201,35 @@ static inline abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/machdep.c set_mcontext() */
+static inline abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
+        int srflag)
+{
+    int err = 0;
+    const uint32_t *gr = mcp->__gregs;
+    uint32_t cpsr;
+
+    regs->regs[0] = tswap32(gr[TARGET_REG_R0]);
+    regs->regs[1] = tswap32(gr[TARGET_REG_R1]);
+    regs->regs[2] = tswap32(gr[TARGET_REG_R2]);
+    regs->regs[3] = tswap32(gr[TARGET_REG_R3]);
+    regs->regs[4] = tswap32(gr[TARGET_REG_R4]);
+    regs->regs[5] = tswap32(gr[TARGET_REG_R5]);
+    regs->regs[6] = tswap32(gr[TARGET_REG_R6]);
+    regs->regs[7] = tswap32(gr[TARGET_REG_R7]);
+    regs->regs[8] = tswap32(gr[TARGET_REG_R8]);
+    regs->regs[9] = tswap32(gr[TARGET_REG_R9]);
+    regs->regs[10] = tswap32(gr[TARGET_REG_R10]);
+    regs->regs[11] = tswap32(gr[TARGET_REG_R11]);
+    regs->regs[12] = tswap32(gr[TARGET_REG_R12]);
+
+    regs->regs[13] = tswap32(gr[TARGET_REG_SP]);
+    regs->regs[14] = tswap32(gr[TARGET_REG_LR]);
+    regs->regs[15] = tswap32(gr[TARGET_REG_PC]);
+    cpsr = tswap32(gr[TARGET_REG_CPSR]);
+    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


