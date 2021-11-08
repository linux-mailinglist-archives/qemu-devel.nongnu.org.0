Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17F449CA9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 20:50:34 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAf1-0002Cx-WC
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 14:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mkAcn-0001J1-5f
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:48:13 -0500
Received: from [2607:f8b0:4864:20::536] (port=43752
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mkAcl-0005gA-JT
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:48:12 -0500
Received: by mail-pg1-x536.google.com with SMTP id b4so16094743pgh.10
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 11:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2zhDUNlH9V2NZmbK5FxvXdG3eYIRKHrHgc0sLLsiMMM=;
 b=Oh+A4sr8YmpT9PBQ/NZnsXC1VC4FARrHuiDV3ybrFHpxWeZS4xauk4XbyWPcFocznQ
 Bc4RS2Oe5DLPsygK2YIjZMkxVbUyKgW0lTNA7SR0UBQMLOkZeCYaWp86GeT0cRdxTtJY
 KsPNYomCbK16PwJE5HYWw6kCLyb4MNTpPGsAKRArMlp91++BiocxqhlSgO0PHc+XCeXn
 McTZKTwC7vFXpm74aeZGT7PH4yGVKWo94ZsY30gNFAHzqNJnShcVR4tysDJjW/Gz71pm
 DDJCiE6f80vwAZLxYP3cdAY+h5fOzNI4YAmVgOzHFLpEf15kl23NTs+bDVijEEbAO/9T
 sSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2zhDUNlH9V2NZmbK5FxvXdG3eYIRKHrHgc0sLLsiMMM=;
 b=a/21EkYY5tnruffubteeHGHDdvvWrVm8atlstPVCeP9A9iG5P0384NaXDfNPzhiKLz
 S/rhrwDY+w0BHygk58U+22HJ8j5pRyMyuz2yN8odMYUhKI4B2TG0rzOqOF27n9O15+7P
 wfbM9yXck8D9NL5Wdb8nF8+vksScSpsfEKnq1bF5oWzheguIBMte0BB9QyCxWBk6silz
 JJLFvfhpR4oECetYrqRBpxhLJrxX6HRxvLJtVZjWw7Z02ohuNxl5Qebdd/WGZaIIvewh
 uTxC+eQ4BqgdHaGIxOIFPb4n1OdNEtHe2LQMutelK3xaDJpkWi7ajH12XzvkzH53uPgW
 RB4g==
X-Gm-Message-State: AOAM530Bkotbt+cv7t4ucKTQ3Lh7kWDi6x7di+mPDiE+LC+n1aN7clhx
 mtbQ1UWdPpgrKTvJuZNWdeQ/CS1TL+0=
X-Google-Smtp-Source: ABdhPJyz49/p+xLlz2XmoXeUDwFPAn+gx6/69e6z3bR3Ii4wFk3hw1M3ilzmt2uVi0k6OcOqcr+kLA==
X-Received: by 2002:a17:903:2055:b0:142:497c:a249 with SMTP id
 q21-20020a170903205500b00142497ca249mr1456779pla.35.1636400553571; 
 Mon, 08 Nov 2021 11:42:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
 by smtp.gmail.com with ESMTPSA id b130sm16515581pfb.9.2021.11.08.11.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 11:42:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Replace __u64 with uint64_t
Date: Mon,  8 Nov 2021 11:42:30 -0800
Message-Id: <20211108194230.1836262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=raj.khem@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

uint64_t is available in all userspaces via compiler include stdint.h
therefore use it instead of __u64 which is linux internal type, it fixes
build on some platforms eg. aarch64 systems using musl C library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 linux-user/host/aarch64/hostdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
index a8d41a21ad..34d934f665 100644
--- a/linux-user/host/aarch64/hostdep.h
+++ b/linux-user/host/aarch64/hostdep.h
@@ -25,7 +25,7 @@ extern char safe_syscall_end[];
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
     ucontext_t *uc = puc;
-    __u64 *pcreg = &uc->uc_mcontext.pc;
+    uint64_t *pcreg = &uc->uc_mcontext.pc;
 
     if (*pcreg > (uintptr_t)safe_syscall_start
         && *pcreg < (uintptr_t)safe_syscall_end) {
-- 
2.33.1


