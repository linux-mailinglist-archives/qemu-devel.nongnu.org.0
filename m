Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E92D9089
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:30:08 +0100 (CET)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY0H-0000Du-SR
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsX-0003sn-Lp
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:22:01 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsW-0005nG-5K
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:22:01 -0500
Received: by mail-wm1-x329.google.com with SMTP id w206so7882451wma.0
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVAITAmVV88TOoHja8gyTESqhv1q8JBRT/l8262AHZk=;
 b=NHiRLFi7tQsiEdJAPcfC0zbPhb6JmiwS/yPCkgmKA9XgHdOL9CAVSFJ33hrEG9NHuk
 VxTcak9a3ybUtHDn9Qb0ouA4nIAia2K4rA/4l6Ig1P4lPMTng48qsVzi4B7S0hIxSLTm
 ddoXqoZDDnR5r+msyxywj9pFkwuO8SQ8WQfGjlOowyZPmRVMzEfVyfRIU9bvBg4/pbRJ
 I/sjyV5KIyMcdT8b1EL3CLmKYB7LO8uRj3yt7Sx46ML2k/59VEmyABz/jy8/TJGc/6kV
 RAXzO4La7/sbECmoZWL4AGWSXTuA96vW92ne1NtkbXnFaXBBorVRToQyofsAZOz5723t
 adRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fVAITAmVV88TOoHja8gyTESqhv1q8JBRT/l8262AHZk=;
 b=O7tZe+naDR3JF7mklXcbHvH6ygh31hmhH5Ea2pE5/ZcQd/2f0gOulctgzJkj0osMpg
 6GtTx/2khQME3sNksbVbwaE59kj9X8D24ZEg/ITAO93XWpJcjLIL7tHEBO96Ecn1ZtJu
 Zf+GL1QugtI5rwo0LUzbhigUZ0sAAaFdKKk1jGDN/Bqs3NllsxMWKP/FRrg27xwFWruu
 atrOPhc7U5v9u9yKDfKF21umrF82fwWtAStz+BCBthP5cMOkOVgOlzLmLycn+kjf/JB6
 SlIRrHVVs+P7/iCNuagaqJ4oBzLcIblPipOqxusGQvYtWgqntWa0gPpgFBdoJB6gtKq6
 3ApQ==
X-Gm-Message-State: AOAM533++MtCohRzCjevGynagUPWs9nyM43yE9l74gWLopt+nsGRnX4G
 X7LabCcZil4UJcDk044rEzAnqbYD/0o=
X-Google-Smtp-Source: ABdhPJz0CPv/da6KphdHRQ8txpNwxGAeqv36g/49a8+2n8jK31ow8jEvleGDUtARLN/jfRXupU+u2w==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr24645226wmb.124.1607890918580; 
 Sun, 13 Dec 2020 12:21:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f16sm27335349wmh.7.2020.12.13.12.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] target/mips: Use FloatRoundMode enum for FCR31 modes
 conversion
Date: Sun, 13 Dec 2020 21:19:46 +0100
Message-Id: <20201213201946.236123-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the FloatRoundMode enum type introduced in commit 3dede407cc6
("softfloat: Name rounding mode enum") instead of 'unsigned int'.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201123204448.3260804-2-f4bug@amsat.org>
---
 target/mips/internal.h   | 3 ++-
 target/mips/fpu_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 0515966469b..e4d2d9f44f9 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -223,7 +223,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 uint32_t float_class_s(uint32_t arg, float_status *fst);
 uint64_t float_class_d(uint64_t arg, float_status *fst);
 
-extern unsigned int ieee_rm[];
+extern const FloatRoundMode ieee_rm[4];
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 static inline void restore_rounding_mode(CPUMIPSState *env)
diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 956e3417d0f..bdb65065ee7 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -38,7 +38,7 @@
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
 
 /* convert MIPS rounding mode in FCR31 to IEEE library */
-unsigned int ieee_rm[] = {
+const FloatRoundMode ieee_rm[4] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_up,
-- 
2.26.2


