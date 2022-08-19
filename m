Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56F59939F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:42:02 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOstV-00046y-9x
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOsea-00021g-0O
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:36 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseY-0002lz-BH
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:35 -0400
Received: by mail-pf1-x432.google.com with SMTP id w138so627563pfc.10
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1j65v4Vz+Z/8W42L91XnaCjj59+D2gtD2u2SeMTM3YY=;
 b=dBGYmKyHh3jZt5Ye8Yhs6jz6ivhi4x2lFj29m9BldJsvZevd0qAFzhm2FXY0je122Y
 DsboMbnCae63DDiLSTBaQsZ6mraAk2OG5+j9lbtz0LbWlWzAAY5kazwf8wkxhPrA5SwY
 sOcIuJVBuBKe2NXk2VRjfb5UIjAM+5GcHI/GcTV6sMsSs5fX4K5A8B9tI9zo6nUJIHXX
 V2u4zXoL1CoBOzjcARmvHIIsyMNiU+0qPrOIyEcxbbYQMgEKXxz6rjfdyXEkvvbII2Eh
 JA0nlWKsRztJP/3+cwUGm6gZHqGucCUj1olqTWdGVNyHY+wR49ueVPeW/9V2pNcpl2LZ
 cDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1j65v4Vz+Z/8W42L91XnaCjj59+D2gtD2u2SeMTM3YY=;
 b=JcFMHhNln1gewMIhyDe0PF+Vo9ZBA1YXkyESAHwy/2pWi5gVrOYji4i5cron3MxUDz
 7K9qf0ieY9aQRIjZSLiYY5PiGNktUsQDrYCMNVYNbS5lK7hhBQjgGjXnJ4PvIJSZTU8I
 qBoJJJIQiVytbrzzQVtVxWZAIOemezqpFBBgEZjkyrr8WShLuCbO2d/PuwelDGwrX3hF
 WRtX4ZdFk+DUX+Kn4K5tPOJd6bSJ8KbgSOcJ8Ch34x6VgyU/bZNYOa/lazaP2mA1Z7nD
 kOzAJTjceo/ZSKwJKXXSC00uY3l6q+gUMc2JwT5s3Hy8AIRwGeA52Jj4XuHGgeJFq7eA
 gcZw==
X-Gm-Message-State: ACgBeo37gJYc7v5T6U9dT8WOjt0dF786YVDAem2nrsdVwUFCPpkZIjwY
 GZrFk/D2a7fNmH1IW1ombZvGQdg7jfuumA==
X-Google-Smtp-Source: AA6agR6EMNarzqc3PdWmfLBrGTf1nW6CGaYJdLJyJNMNJLnrPz/YzZS+KwB7DpNGvbC5+y13U2dYOQ==
X-Received: by 2002:a63:ee49:0:b0:428:8e10:200a with SMTP id
 n9-20020a63ee49000000b004288e10200amr4723798pgk.453.1660879593082; 
 Thu, 18 Aug 2022 20:26:33 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 14/21] accel/tcg: Raise PROT_EXEC exception early
Date: Thu, 18 Aug 2022 20:26:08 -0700
Message-Id: <20220819032615.884847-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We currently ignore PROT_EXEC on the initial lookup, and
defer raising the exception until cpu_ld*_code().
It makes more sense to raise the exception early.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/translate-all.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7887af6f45..7b8977a0a4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,7 +222,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.cflags = cflags;
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
+    phys_pc = get_page_addr_code_hostp(desc.env, pc, false, NULL);
     if (phys_pc == -1) {
         return NULL;
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b83161a081..069ed67bac 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1396,7 +1396,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     assert_memory_lock();
     qemu_thread_jit_write();
 
-    phys_pc = get_page_addr_code(env, pc);
+    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
 
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
-- 
2.34.1


