Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716A6100C1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:54:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7t6-0005iI-Lr; Thu, 27 Oct 2022 14:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sG-0005Tm-PB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sA-0004kv-8s
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id bk15so3682232wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0JRA0mnvT+Ez0S9FJevL8/17rYA8U8Yr0I5DkAbcVE=;
 b=lMm4/Urp5RBwBT1JJs4ncg6T+zhiacB3douZhbEVwEhUMDTWzwHOFPpbEpJjN4UqoZ
 SuQFEsZwupuXdrcW8RbQNckc0e6VY9jpjJyTBL31LgoC7IDB19dDaNxb5ZYWrTKH9rkB
 8zxviSJ/a3lDishfFj/TwUTgeX9AZKQ7my+A+ebvMoVYmov6TugapIbzjLKREIm2iEvk
 DOoA3Mo+sDcA9XrWKJU8I7PnfEFCiaRpg2NOBXc69dsdS/WSM+BfG04uN4lEAiUn5MLD
 Dq8o0Wj/814W/abem5FpwldYHtseee29D7NenCFS7K7c8W1WWDXaPF1bAQY1J2g5yO/9
 3YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0JRA0mnvT+Ez0S9FJevL8/17rYA8U8Yr0I5DkAbcVE=;
 b=CkNhhfFP9XLGEupmWa5xaCFfePTDqUyMM78htBZ1ybn9tc2h+4K6KputBE1Kc8AMOG
 ZSD4OuIfiWeM0wRm/o1BrKi1Ch9C4JFxSaMcWZ1XY840sMp8pT5n8pqyCjIu05Bck4E4
 kbaG/oVt0LgUUbg5A/MNKPK8TJFvLHQLi0A2R7GDlrrWASjf+xyho5py01IeNQcWDH0x
 UrWnt5SVw4odsR/BVwRxucyUowBeXrvL1zRgNSOiVkCfqjzOgePj4a2YpcAu4iqCLYjS
 cHDAmPNxKVgWdsvqTFWZQGBI3XjJ1hhmKx9ls/2koTrMJB/4IQ4NbJfM6229ZD9DykTW
 anJA==
X-Gm-Message-State: ACrzQf3vxtPZaeloysxKNGg3tTar7obIl5KR1HTRyYdQnjGe8oXIFuHX
 Y+ZuYwt+RD3ZdQMAwCdx2xrz0g==
X-Google-Smtp-Source: AMsMyM4XFho/X8FVrfS7dsU63Rk5G4gblx7M66PvNkw2Rb4G++FqByfxtQ2EYVwxhU0fvgBBYnG19w==
X-Received: by 2002:a05:6000:2a4:b0:22e:35ef:cc22 with SMTP id
 l4-20020a05600002a400b0022e35efcc22mr33438352wry.268.1666896296792; 
 Thu, 27 Oct 2022 11:44:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a5d595e000000b002366d1cc198sm1742209wri.41.2022.10.27.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A811B1FFCF;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v4 25/30] target/s390x: fake instruction loading when handling
 'ex'
Date: Thu, 27 Oct 2022 19:36:31 +0100
Message-Id: <20221027183637.2772968-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The s390x EXecute instruction is a bit weird as we synthesis the
executed instruction from what we have stored in memory. This missed
the plugin instrumentation.

Work around this with a special helper to inform the rest of the
translator about the instruction so things stay consistent.

Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - s/w/b/ for translator_fake_ldb
  - add comment to extract_insn
  - reword commit message
---
 include/exec/translator.h    | 17 +++++++++++++++++
 target/s390x/tcg/translate.c |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 3b77f5f4aa..af2ff95cd5 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
     return ret;
 }
 
+/**
+ * translator_fake_ldb - fake instruction load
+ * @insn8: byte of instruction
+ * @pc: program counter of instruction
+ *
+ * This is a special case helper used where the instruction we are
+ * about to translate comes from somewhere else (e.g. being
+ * re-synthesised for s390x "ex"). It ensures we update other areas of
+ * the translator with details of the executed instruction.
+ */
+
+static inline void translator_fake_ldb(uint8_t insn8, abi_ptr pc)
+{
+    plugin_insn_append(pc, &insn8, sizeof(insn8));
+}
+
+
 /*
  * Return whether addr is on the same page as where disassembly started.
  * Translators can use this to enforce the rule that only single-insn
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f4122db434..03efccdf9f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6317,12 +6317,18 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
     if (unlikely(s->ex_value)) {
         /* Drop the EX data now, so that it's clear on exception paths.  */
         TCGv_i64 zero = tcg_const_i64(0);
+        int i;
         tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value));
         tcg_temp_free_i64(zero);
 
         /* Extract the values saved by EXECUTE.  */
         insn = s->ex_value & 0xffffffffffff0000ull;
         ilen = s->ex_value & 0xf;
+        /* register insn bytes with translator so plugins work */
+        for (i = 0; i < ilen; i++) {
+            uint8_t byte = extract64(insn, 56 - (i * 8), 8);
+            translator_fake_ldb(byte, pc + i);
+        }
         op = insn >> 56;
     } else {
         insn = ld_code2(env, s, pc);
-- 
2.34.1


