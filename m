Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A492453B15A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:55:09 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwa3I-0000eP-FE
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjL-0002hS-CD
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjI-0005I5-QG
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:31 -0400
Received: by mail-pg1-x533.google.com with SMTP id 137so3447489pgb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhaQ71DRJcMZN5BIZLMGgAqxrNC/+qcBfUUjhN0p2Oc=;
 b=MLxIj7UCop7tmozUI/E/nJgf6qyEoDRj9zVIEVoiuIDG/yjFvn82q/TpDPq23giZN5
 E0simAANAPuaIsymD3XbZZ/ym0n/8mN351qpe28LL9IpwNVNOGn1uCfCg/PJOcCLoKE/
 C8kpX0lFOYRnb4gYroFwhpiCqyoUJHHjeMjqofygEQ24qqR0ZNt6wAdDIeiTDCf8Mstn
 ZIJJT238puHyzP7aZoZDwKl/imu7n9N8UtvjPDx2FEQq84AYCkd6P976BKrGQXsn62c/
 m0i4PoUjgn3KYQcQ2PkPWsofb2/vdOe+smjWYIwRG/8SB7Wp8bUMDNxaf5QSQUGCNW+1
 Huhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhaQ71DRJcMZN5BIZLMGgAqxrNC/+qcBfUUjhN0p2Oc=;
 b=k2UsEXPMba+NvdIusc7OAUXOBtQ6iItGW4eN3N9v7xib8XlHHg+czEOHi7N7Cbwm31
 7TwXJ4FUoSiNdvzLSiqjMEOLnYJDdiRU99ZNIAe33BJPsfwQWcqk0jGdWspIuQUXTmre
 H3rUblnxF60fF/0G+o3rbL5mEDtPewKE5EtgpYXeAMjM7LL85IdAe8MnXd2cmFhu/KgN
 iX/HHQ+ppFgxaeKaBQVFcVIzs3J5HgF6nW4oq6t5lbdsuUgnvA17i4MKDExHDKAnbKBu
 upNP8Hoya7CU+tbSoTb/wGusoDBFOQkvNx8PML3rjoY7jBShYmelyZJDj6QJFhmhpXUK
 382A==
X-Gm-Message-State: AOAM531ZXzhk9uVVUUQ2xBIz6xxQ9XcQZ5lPjM2E/+FmsJ6o8LEv5ZrL
 VF16swhsBoBz7jEMlUNkvJiG/6iEzE+/GQ==
X-Google-Smtp-Source: ABdhPJwUjGCb0GKVtMaAbHfVLFblJs+tUrV7M/s5eFjEBEzKrJd2l374RQ5gKDYbV2bi+zFJu3AzJg==
X-Received: by 2002:a63:85c2:0:b0:3fc:94a8:d350 with SMTP id
 u185-20020a6385c2000000b003fc94a8d350mr1981427pgd.454.1654133659983; 
 Wed, 01 Jun 2022 18:34:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 13/17] target/m68k: Implement FTRAPcc
Date: Wed,  1 Jun 2022 18:33:57 -0700
Message-Id: <20220602013401.303699-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index fa704e0c25..cc3bd4dd2b 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5566,6 +5566,34 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* ftrapcc registered with only valid opmodes */
+        g_assert_not_reached();
+    }
+
+    gen_fcc_cond(&c, s, cond);
+    do_trapcc(s, &c);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6191,6 +6219,8 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f27a, fffe, FPU);       /* opmode 010, 011 */
+    INSN(ftrapcc,   f27c, ffff, FPU);       /* opmode 100 */
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.34.1


