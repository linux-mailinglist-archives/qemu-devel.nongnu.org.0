Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1103EDED3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:53:40 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjc3-00029A-KX
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZy-00080k-V9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZw-0002sT-5J
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso318517wmg.4
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GtKKMYiZbBb9B3CylCfPpnK/bsEC2eXZoeUds5kPPEs=;
 b=mdj5qPW1/dEQUec6bVB0rjczF78LNA/K07l7+/Nqf9SaeMNAJyj9wxBXcuDQfw9VJC
 sem2FN2hkINWqy6Ya3JIS5W7Pqfjn45EqCX6sfdkRsvYrGx/Q4s+OFu3YXUZhybfZnWK
 WhfohftUuVovNnXSouhS0Yjz7Zusdy2oyZKIZZ7mWCoxPpfjfQl5L9f3AxIRbGrsvtMQ
 mp+IunZARl1H4d3ojuyQKcaMSB1wj40JnWtXV13KnntVSwpbX6D4L7x28OerLw/F72kd
 Mb94DagYGVomTX25A6WYorn2q3IZPdKOfxD1yO/6XJUoN2Jw6dcnWauPGaf3PKtJpldo
 UTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GtKKMYiZbBb9B3CylCfPpnK/bsEC2eXZoeUds5kPPEs=;
 b=LwMI0//hP6BubaMdkSUt+EyqzKPXynof7lMr+4JGFmDMvNIfooyT2pOTGls92d5ke+
 dHfe0DYHNkNa7AjluHMhoEAR5Jh+p4pyz0Kj2NrQqD+FE7ykZz5LNujiKX2WnH7pXzqb
 +4jpBsHDU8cuRDI2CM6Ml5rgXUE4Iz7lFfrYuhXlrybR3zUKf6LSLddsrwpS4S88btme
 9L9Ys1tOP0B5AeJnT8myE2x0336vVVJYCRL7DX903NFOGlqO/j8SMh20fBSAZTUZWrhH
 jSNzd/llBRNVMQf3JGuypGoLZDkG8l7JBpdk9sDK+BUfbvMDPuMnhb8TLtWxAtr7vi/P
 /yXw==
X-Gm-Message-State: AOAM531Us0nwawvr9nc1j8VdjTTn3iw7vPwBu6u4sTqL1oV1wwfrjg/9
 nH+CusLEblUULtF9/uHRm+RpZS/hiwY=
X-Google-Smtp-Source: ABdhPJzR3pC6gm6J0esrQx1eKv7x1As0QoJkpsH+H49Rh0EEblmMWBpECglh6JTQRHVFLE0T/safZA==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr116452wmj.30.1629147086646;
 Mon, 16 Aug 2021 13:51:26 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u23sm248143wmc.24.2021.08.16.13.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] target/mips: Use tcg_constant_i32() in gen_helper_0e2i()
Date: Mon, 16 Aug 2021 22:51:02 +0200
Message-Id: <20210816205107.2051495-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$rt register is used read-only, so we can replace tcg_const_i32()
temporary by tcg_constant_i32().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4b689a54abb..a6df9beb670 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -9072,12 +9072,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
             break;
         case 3:
             /* XXX: For now we support only a single FPU context. */
-            {
-                TCGv_i32 fs_tmp = tcg_const_i32(rd);
-
-                gen_helper_0e2i(ctc1, t0, fs_tmp, rt);
-                tcg_temp_free_i32(fs_tmp);
-            }
+            gen_helper_0e2i(ctc1, t0, tcg_constant_i32(rd), rt);
             /* Stop translation as we may have changed hflags */
             ctx->base.is_jmp = DISAS_STOP;
             break;
@@ -9694,12 +9689,7 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
     case OPC_CTC1:
         gen_load_gpr(t0, rt);
         save_cpu_state(ctx, 0);
-        {
-            TCGv_i32 fs_tmp = tcg_const_i32(fs);
-
-            gen_helper_0e2i(ctc1, t0, fs_tmp, rt);
-            tcg_temp_free_i32(fs_tmp);
-        }
+        gen_helper_0e2i(ctc1, t0, tcg_constant_i32(fs), rt);
         /* Stop translation as we may have changed hflags */
         ctx->base.is_jmp = DISAS_STOP;
         break;
-- 
2.31.1


