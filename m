Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2A1508C6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 15:51:21 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyd4K-0003TB-GD
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 09:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iyd0Z-0006jA-6U
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iyd0Y-0003By-6J
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iyd0Y-0003B0-02
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:26 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so17477676wma.1
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HxFn/LN4dplxFN3c05IVUCGmUl6pKY2lLmTfpEZdCB0=;
 b=HklwrR9Q9Ev2LIPPJB0ioVBBHjHdEQMGP43Nk9WoIKlrDV7vPvpxGauzzmYHg/hnHM
 s9aXTJ/MKSmYjA/UG8GA4F1ltt1ZxuOP2alwqe+aszrSwofiNGhwwZoGo4mmYBR3L+15
 2JI1KBz7Yi+q2TM5+xcpyFTcAsXQocTxCqh13LsAfa/v7oUgqypmT/VW7YO6K1awN4qd
 QlxZjIBktDlMxRr5o5qyt0Ea5aFOKWWtXMsB5P6LdycPcM5Jb9fL6fMTiFxhPOF1lKj5
 W0degXKMZjHmyVdY8EszAE72cPRuH1HLEMgay8KhA/enx3Ok6w36/PY2JDcuLFO03Hb5
 43UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HxFn/LN4dplxFN3c05IVUCGmUl6pKY2lLmTfpEZdCB0=;
 b=bLf20vBSQ6+qbShGOc+LvhYZGp3858nz037qy/gSu420zd41aMT65+nEUW/i+Sbrl+
 7GXsqf81r0JepLNSUKowIcsYLDTqdqi1bRH9ZkuYeJld8MFe4KgQ34R/iF/lwxmP9P3U
 DmPvoHV+aNUP7U6s6xmNQMxTkmWA7Be28XDFSUgZbazDpefK7RW5jtWQI2XrywPf8pch
 lZvxns0zZzDEyrrOb1X0p5hDQmyfTYB9IzVR5nVuXVIyh3HrMipQs9KTn+nWgjo4f66X
 u31UnZWBCmq70xOnXmIgRjKPT2sKgh+08uRr3I2mWOC4O9sN6LUI5nw4TEG3G7fKQvvi
 4Ygw==
X-Gm-Message-State: APjAAAUIAPD0ugmKD6hctd0n7YwwA7EYS4agyjiLsjottN5H3cHPxjLa
 pfcM3JCuuz8K/UnQnzKbdLgwVXXMUw2SWw==
X-Google-Smtp-Source: APXvYqwCLdDnBfrB7XHL6H6DsGq9fRMWcOYohlZuh85MJiSAstGKIb4KvwXJOSmA4EMXci1suRkJtw==
X-Received: by 2002:a1c:6246:: with SMTP id w67mr28984376wmb.141.1580741244874; 
 Mon, 03 Feb 2020 06:47:24 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id h2sm26429739wrt.45.2020.02.03.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 06:47:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/20] target/arm: Use aarch32_cpsr_valid_mask in
 helper_exception_return
Date: Mon,  3 Feb 2020 14:47:03 +0000
Message-Id: <20200203144716.32204-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203144716.32204-1-richard.henderson@linaro.org>
References: <20200203144716.32204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using ~0 as the mask on the aarch64->aarch32 exception return
was not even as correct as the CPSR_ERET_MASK that we had used
on the aarch32->aarch32 exception return.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bf45f8a785..0c9feba392 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -959,7 +959,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
 {
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
-    uint32_t spsr = env->banked_spsr[spsr_idx];
+    uint32_t mask, spsr = env->banked_spsr[spsr_idx];
     int new_el;
     bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
@@ -1014,7 +1014,8 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
          */
-        cpsr_write(env, spsr, ~0, CPSRWriteRaw);
+        mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
+        cpsr_write(env, spsr, mask, CPSRWriteRaw);
         if (!arm_singlestep_active(env)) {
             env->uncached_cpsr &= ~PSTATE_SS;
         }
-- 
2.20.1


