Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B5552F35
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:55:50 +0200 (CEST)
Received: from localhost ([::1]:49026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3abt-0008AQ-Jx
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQi-0007X9-Gu; Tue, 21 Jun 2022 05:44:16 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQg-0007MB-P2; Tue, 21 Jun 2022 05:44:16 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101d96fe0a5so8193214fac.2; 
 Tue, 21 Jun 2022 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NnuoROyHKu2bv6b6bZ7glEpm6RtuZ7ViLbUXr26vFr0=;
 b=C7h5SAQb3Erc1JJ/ehbqaO1IFgpItB3dxQAiqTcyj1jbf+Q9niE4lZXLlkaGZ1lqOu
 kyeapBlbq86x5A/gJ1w3w9kt+K71eBZiGUqfovQ50OhAhJ7AhgttfraJa+Cq8mJP9/+n
 EjIcYu1fN9JUf573vE5SPBpvoMnX7MtSScBqp3Ltw4aHjr+sKkkse9YtEW64K1EObhXw
 zZsghVZl7jtDLQWFg9b56gbHxDIxakKRZLXEU4fZRCQnwMqSJUbCLciuzq388aS9z8T0
 iUFf2xxoo3zoe6yo5E70TF/a506hNR467Z4z3H9zFd1F+FcgLykaNPCAobWcG0EOUWsL
 DzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NnuoROyHKu2bv6b6bZ7glEpm6RtuZ7ViLbUXr26vFr0=;
 b=DUeVv32FnY91V2MT4Ef0FMn/4Zt1i2N87G37qowzNGc+uUqigdfglsUY4awAGvWGtt
 vgj12ZfrPhB2Q3dzNwPGwojJCLFpvw/cIB/qiZmskAa1bYBcAnaxw2s/UDiKFZRJECA8
 w2lvGBbWDCUIW71LXNLWGh9lr8ySzg+++YdlbRjwm6q70sV1b9NCftHHf1G5uxZ0HJ6B
 04znqISOQjOMg2e2XYnaqTUKvTjJLKIWWcYa0qTtvxqO8Fp8O0C+iAWR8cHCLODCjOiW
 ECcjKZZKqrPuxTB4YGY3kIRDcPolJIDN/NR1s0PGUkNKf3ynJNqmOov1AHz5wNYT36KP
 kHjA==
X-Gm-Message-State: AJIora/HxQivWMvjv3SYvGmxNSOqtwBvaqf2gHMQqrpjiMGzc0g/J3BK
 aBxMjnmVFqXGUrpkptT/8mPamiI8pAHaqA==
X-Google-Smtp-Source: AGRyM1toDcngmxa6/jKXdQkNkG5Hax27h2BOS/jqhQOlJufHY/b34GdJGiRH+AIUm1Fm4ux8X2xV4Q==
X-Received: by 2002:a05:6870:b605:b0:f3:375:fdba with SMTP id
 cm5-20020a056870b60500b000f30375fdbamr15346665oab.123.1655804653151; 
 Tue, 21 Jun 2022 02:44:13 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 03/15] target/ppc: Implemented vector divide extended word
Date: Tue, 21 Jun 2022 06:43:48 -0300
Message-Id: <20220621094400.122800-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vdivesw: Vector Divide Extended Signed Word
vdiveuw: Vector Divide Extended Unsigned Word

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-4-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode            |  3 ++
 target/ppc/translate/vmx-impl.c.inc | 48 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 01bfde8c5e..f6d2d4b257 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -795,3 +795,6 @@ VDIVSD          000100 ..... ..... ..... 00111001011    @VX
 VDIVUD          000100 ..... ..... ..... 00011001011    @VX
 VDIVSQ          000100 ..... ..... ..... 00100001011    @VX
 VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
+
+VDIVESW         000100 ..... ..... ..... 01110001011    @VX
+VDIVEUW         000100 ..... ..... ..... 01010001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 22572e6a79..8c542bcb29 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3320,6 +3320,54 @@ TRANS_FLAGS2(ISA310, VDIVUD, do_vdiv_vmod, MO_64, NULL, do_divud)
 TRANS_FLAGS2(ISA310, VDIVSQ, do_vx_helper, gen_helper_VDIVSQ)
 TRANS_FLAGS2(ISA310, VDIVUQ, do_vx_helper, gen_helper_VDIVUQ)
 
+static void do_dives_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 val1, val2;
+
+    val1 = tcg_temp_new_i64();
+    val2 = tcg_temp_new_i64();
+
+    tcg_gen_ext_i32_i64(val1, a);
+    tcg_gen_ext_i32_i64(val2, b);
+
+    /* (a << 32)/b */
+    tcg_gen_shli_i64(val1, val1, 32);
+    tcg_gen_div_i64(val1, val1, val2);
+
+    /* if quotient doesn't fit in 32 bits the result is undefined */
+    tcg_gen_extrl_i64_i32(t, val1);
+
+    tcg_temp_free_i64(val1);
+    tcg_temp_free_i64(val2);
+}
+
+static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 val1, val2;
+
+    val1 = tcg_temp_new_i64();
+    val2 = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(val1, a);
+    tcg_gen_extu_i32_i64(val2, b);
+
+    /* (a << 32)/b */
+    tcg_gen_shli_i64(val1, val1, 32);
+    tcg_gen_divu_i64(val1, val1, val2);
+
+    /* if quotient doesn't fit in 32 bits the result is undefined */
+    tcg_gen_extrl_i64_i32(t, val1);
+
+    tcg_temp_free_i64(val1);
+    tcg_temp_free_i64(val2);
+}
+
+DIVS32(do_divesw, do_dives_i32)
+DIVU32(do_diveuw, do_diveu_i32)
+
+TRANS_FLAGS2(ISA310, VDIVESW, do_vdiv_vmod, MO_32, do_divesw, NULL)
+TRANS_FLAGS2(ISA310, VDIVEUW, do_vdiv_vmod, MO_32, do_diveuw, NULL)
+
 #undef DIVS32
 #undef DIVU32
 #undef DIVS64
-- 
2.36.1


