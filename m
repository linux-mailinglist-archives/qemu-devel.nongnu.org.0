Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D43613784
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZT-0002va-QM; Mon, 31 Oct 2022 09:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYn-0007xz-Cd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYf-0001GR-G7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id v1so15890206wrt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=regKgimCFjr2lALH9EduWaStKp/E41H9lSPqMQbdVv4=;
 b=a+YVDI5tBN815q+4FXrEcwtjbJKTj1jwJ3qYVu0R2vh9GCj7xK964l/h6THiVhgthB
 +7ir+xv0mZV1gBMCahMmfKJd/JYvk3rkjK9U5zhxqDYyLldcVp4LZXliBqHLy82T5PA2
 83yR7uSTl4vUnGkaTg6gI8/awiHKg/t4Sp586wW8XleaaM2worEoU45xXtjYrO+e3QR3
 Scp+jcnoXd0WcW77ltKvmS9QhgWfC+HFC58jkJMGJvZcBUaPEzhG8wvJeRdsFxbMXU5d
 EL3eyl9Wl0qsajhsN+iOc4qKrMOjVzVrbGHlHDcv1/dsmRRf2hRxV2P1k2g8JKyUvfZ0
 xIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=regKgimCFjr2lALH9EduWaStKp/E41H9lSPqMQbdVv4=;
 b=Rj8/mKrRTPWu9IOTanNQXjogBcV1V2gffpCozxWzOCYBITYL8kFfL20ES150kOMN3Q
 zkkaxJgyhNCS0pxHlfhZ5cQ3yJvvlDO3d/LX8k59Z3uaDwt20iiuYVf2BateXEEn7CPQ
 8ZVO/IHvJieQjCUjmIgggacIMqoKuYrVtqnxdl2332Ta8DHNsikzAGGhldKAB4k/ou3v
 3cH7f2P8TTnQqlKuV6tOxiyq+VygOd7a6Xd71t8CQKhAGJNMancSHXXIqe9uKTcu1e8+
 dkClW5feaxDzMDkKBt5i4sx2zpQyt4FYw47Yp4yhusxK2Hdlkq8HUp8xDAzfn0jGnTiw
 hPJQ==
X-Gm-Message-State: ACrzQf2LR2ng1NtJOUpNnj6IWpVOFXJf/246vgn98S73Ey+hlNGpgXp2
 1G18z2gIN5cU9m6/XrLP+U0fk5RvzylIjw==
X-Google-Smtp-Source: AMsMyM5VOmI/UrDb0H7j+Kz9o3qmZ8p3szu1Qoktl3xHUQK+OZ+2wjnvFjcca2ybGTKT4zIzEK/R2g==
X-Received: by 2002:adf:f781:0:b0:236:5559:215b with SMTP id
 q1-20020adff781000000b002365559215bmr8133593wrp.16.1667221827460; 
 Mon, 31 Oct 2022 06:10:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b003b497138093sm7782115wmb.47.2022.10.31.06.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6DAF11FFCF;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 26/31] target/s390x: fake instruction loading when handling 'ex'
Date: Mon, 31 Oct 2022 13:10:05 +0000
Message-Id: <20221031131010.682984-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221027183637.2772968-26-alex.bennee@linaro.org>

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


