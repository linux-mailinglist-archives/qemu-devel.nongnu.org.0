Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE843D091
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:20:36 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnXP-0004S7-Hy
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnKv-0003S2-T2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:07:44 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnKt-0003us-6d
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:07:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id u18so5611192wrg.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7XKV6+WQA6BTxZieVUejrAJ7DYt4kC6mGO6YlEwHeg=;
 b=Q9L/M3CeiirQz0e1cJmdH+5oZLz8bEBPeqVEVN5IJS2a/uWeQKn+KYCkXR3A5aLx0s
 kmn435UkAG7yVIzEQ3IAZYn9YH/LH195RbBeLxPnoZALvDynHuDsq10tO9J0NS0JX4w4
 XNnp48vMLhtvEdSEXqGdRCDn/lPgVc62k9Go1fg+/+5JsdFz5R8qcDsuSg+kWqzK1zOW
 lUQ4xPvj9ywI+B9dpGtQOhRlyCKMntBFIl7QXjIOlfaQ4KSH19gWNo9JAsdmZda9K6cP
 mzpFQY0aQIk0ck2gnMWVKJZ6jeK8g9fOHifU6mkvxO0j+zYTd6d/GZpBe/9Au12zGrQP
 Oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P7XKV6+WQA6BTxZieVUejrAJ7DYt4kC6mGO6YlEwHeg=;
 b=HqWsU3fFwyT6ohq8CmCehaH/k8nDE8KZMaDU6K9mgoQcWs8YVZY86oX2YKTAN63PxI
 uCfF/ct2Fsr6ml04GL1lZcrKruaTPMsFeUqyRSAujjwrJbCEohzS7CfIEpf0mhrLqFUl
 Jk7ZumMZSIGTvjD/iFqncqLiYU0/bdHtjH0EQQ57qWmJEw16HoE+EHlfQClQ6XkCoir2
 FWJ7ZVfGd9ENgjgvFJhlez6JJdbEp2J5WJTnz45oM5J7+Rm1BiVN0U4ih30mAks1i8gh
 5Y8kqt9Ql+h1FoFYpPjGaIKPNTkF+qEHXYq2jVYLjcar/XaruIN9EXdlZ2zK+tcK7cG4
 sblg==
X-Gm-Message-State: AOAM531aQPtAA6ggkeuO0uj1w7PnWubtm0O9K2RggH7x8mJH3OxOFx4A
 SbSvRIWfYMVBxHo1G5VAFBT/p5fkdNU=
X-Google-Smtp-Source: ABdhPJwr7lgEx28/KvghTlchswG2YhuS1GZ0QuEvhJ7P2nHeD8l7XNzD+8vCvahXSWXaI279xrD6LA==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr42698494wrz.20.1635358057708; 
 Wed, 27 Oct 2021 11:07:37 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f24sm429060wmb.33.2021.10.27.11.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:07:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/32] target/mips: Fix MSA MADDV.B opcode
Date: Wed, 27 Oct 2021 20:06:59 +0200
Message-Id: <20211027180730.1551932-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result of the 'Vector Multiply and Add' opcode is incorrect
with Byte vectors. Probably due to a copy/paste error, commit
7a7a162adde mistakenly used the $wt (target register) instead
of $wd (destination register) as first operand. Fix that.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Fixes: 7a7a162adde ("target/mips: msa: Split helpers for MADDV.<B|H|W|D>")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_helper.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index e40c1b70575..d978909527f 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -3231,22 +3231,22 @@ void helper_msa_maddv_b(CPUMIPSState *env,
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
 
-    pwd->b[0]  = msa_maddv_df(DF_BYTE, pwt->b[0],  pws->b[0],  pwt->b[0]);
-    pwd->b[1]  = msa_maddv_df(DF_BYTE, pwt->b[1],  pws->b[1],  pwt->b[1]);
-    pwd->b[2]  = msa_maddv_df(DF_BYTE, pwt->b[2],  pws->b[2],  pwt->b[2]);
-    pwd->b[3]  = msa_maddv_df(DF_BYTE, pwt->b[3],  pws->b[3],  pwt->b[3]);
-    pwd->b[4]  = msa_maddv_df(DF_BYTE, pwt->b[4],  pws->b[4],  pwt->b[4]);
-    pwd->b[5]  = msa_maddv_df(DF_BYTE, pwt->b[5],  pws->b[5],  pwt->b[5]);
-    pwd->b[6]  = msa_maddv_df(DF_BYTE, pwt->b[6],  pws->b[6],  pwt->b[6]);
-    pwd->b[7]  = msa_maddv_df(DF_BYTE, pwt->b[7],  pws->b[7],  pwt->b[7]);
-    pwd->b[8]  = msa_maddv_df(DF_BYTE, pwt->b[8],  pws->b[8],  pwt->b[8]);
-    pwd->b[9]  = msa_maddv_df(DF_BYTE, pwt->b[9],  pws->b[9],  pwt->b[9]);
-    pwd->b[10] = msa_maddv_df(DF_BYTE, pwt->b[10], pws->b[10], pwt->b[10]);
-    pwd->b[11] = msa_maddv_df(DF_BYTE, pwt->b[11], pws->b[11], pwt->b[11]);
-    pwd->b[12] = msa_maddv_df(DF_BYTE, pwt->b[12], pws->b[12], pwt->b[12]);
-    pwd->b[13] = msa_maddv_df(DF_BYTE, pwt->b[13], pws->b[13], pwt->b[13]);
-    pwd->b[14] = msa_maddv_df(DF_BYTE, pwt->b[14], pws->b[14], pwt->b[14]);
-    pwd->b[15] = msa_maddv_df(DF_BYTE, pwt->b[15], pws->b[15], pwt->b[15]);
+    pwd->b[0]  = msa_maddv_df(DF_BYTE, pwd->b[0],  pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_maddv_df(DF_BYTE, pwd->b[1],  pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_maddv_df(DF_BYTE, pwd->b[2],  pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_maddv_df(DF_BYTE, pwd->b[3],  pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_maddv_df(DF_BYTE, pwd->b[4],  pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_maddv_df(DF_BYTE, pwd->b[5],  pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_maddv_df(DF_BYTE, pwd->b[6],  pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_maddv_df(DF_BYTE, pwd->b[7],  pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_maddv_df(DF_BYTE, pwd->b[8],  pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_maddv_df(DF_BYTE, pwd->b[9],  pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_maddv_df(DF_BYTE, pwd->b[10], pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_maddv_df(DF_BYTE, pwd->b[11], pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_maddv_df(DF_BYTE, pwd->b[12], pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_maddv_df(DF_BYTE, pwd->b[13], pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_maddv_df(DF_BYTE, pwd->b[14], pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_maddv_df(DF_BYTE, pwd->b[15], pws->b[15], pwt->b[15]);
 }
 
 void helper_msa_maddv_h(CPUMIPSState *env,
-- 
2.31.1


