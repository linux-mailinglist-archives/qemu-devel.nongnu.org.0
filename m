Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB8A5355E4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:00:06 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLWX-0000mL-TU
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCu-0002Tf-Mi; Thu, 26 May 2022 17:39:48 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCs-0008Ez-SE; Thu, 26 May 2022 17:39:48 -0400
Received: by mail-oi1-x235.google.com with SMTP id y66so3687944oia.1;
 Thu, 26 May 2022 14:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1g2vde/eeHSaQeSQvQvM/Cy0WneUG8J0LblIpB+63qs=;
 b=B6apJ7cccxUxNEzncOeaJDe0Yqa3g5uhAKQjSTXp61iyv0SswmoWWy/NFrcSg9nxq8
 l8IJHEwrWJfNsvsOi5E08jcyey6iPSwsv3cpOSA3dNp6+NShC9bsxwMNOXIx5EeNKXgV
 T0SQahmhl23zUkO6EJiFccRy1t3U3jPOHgwNsxn7jpQFErrCJIMZW3t8JGSKc7XQ3/pW
 BhsqDCeENyW3G7oq43Kp6Igi9XiP/EgFUwUJzHtX89BHlooG1ArCUTN7AK9qJuwE/Foo
 NMqr2Cb4uskkL7LtfFKrb2wQGj8gzkRh+M96sgijR9k8U1S18HaiHo0tXwbKjFwHvqkU
 dhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1g2vde/eeHSaQeSQvQvM/Cy0WneUG8J0LblIpB+63qs=;
 b=DX98upu4cOh8wtLMDzt5QIl42hkXEyPN417e5cG1SvKQePh7+HogctYTYWZnyEoodQ
 NOLZDSy2dcE9M8yM42+G9dzyFaPb1kUe1OM4d4qc1BJvLdsHgbuHUHqQn/CyHabZTG0i
 zEDlFjnhxqVBebYSflzjfrnzg9tTnDDYFaNIHCQPH6nB5kcFCxo9a68JRgLr16ObMoZU
 UWRxxu4GxM99JtBe45HRB682RHx46duw5UX2E90L+DFiz4mUKp4d3+16EGtijTUkEVsP
 V9/nN/hoZz/iqtfAYSZU/YX593G6iM8an2OVhQkXdHSnP0I2xZSqpmN2WyBv5LaceVTt
 VWqA==
X-Gm-Message-State: AOAM532hMtlm2qgGeAaFNEKM2XJJajABtDKu1+5loJFz2xDMJlEF/aTd
 12lcVHOU9MqMKJnyU5y1EiQNkg4Rii8=
X-Google-Smtp-Source: ABdhPJwjlp7QOmTw6LGM/l6grxRvonSZjsgRWdL1KCllk4gnbioy8qa8DXiH8F2cSiWmAhDMMgNUEw==
X-Received: by 2002:a05:6808:208c:b0:32b:91e4:32e1 with SMTP id
 s12-20020a056808208c00b0032b91e432e1mr2288801oiw.182.1653601185763; 
 Thu, 26 May 2022 14:39:45 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 27/34] target/ppc: Implement xxm[tf]acc and xxsetaccz
Date: Thu, 26 May 2022 18:38:08 -0300
Message-Id: <20220526213815.92701-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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
xxmfacc: VSX Move From Accumulator
xxmtacc: VSX Move To Accumulator
xxsetaccz: VSX Set Accumulator to Zero

The PowerISA 3.1 mentions that for the current version of the
architecture, "the hardware implementation provides the effect of ACC[i]
and VSRs 4*i to 4*i + 3 logically containing the same data" and "The
Accumulators introduce no new logical state at this time" (page 501).
For now it seems unnecessary to create new structures, so this patch
just uses ACC[i] as VSRs 4*i to 4*i+3 and therefore move to and from
accumulators are no-ops.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                    |  5 +++++
 target/ppc/insn32.decode            |  9 +++++++++
 target/ppc/translate/vsx-impl.c.inc | 31 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index bf8f8aad2c..c865206827 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2663,6 +2663,11 @@ static inline int vsr_full_offset(int i)
     return offsetof(CPUPPCState, vsr[i].u64[0]);
 }
 
+static inline int acc_full_offset(int i)
+{
+    return vsr_full_offset(i * 4);
+}
+
 static inline int fpr_offset(int i)
 {
     return vsr64_offset(i, true);
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f001c02a8c..c0f545ca38 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -154,6 +154,9 @@
 &X_vrt_frbp     vrt frbp
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
 
+&X_a            ra
+@X_a            ...... ra:3 .. ..... ..... .......... .         &X_a
+
 %xx_xt          0:1 21:5
 %xx_xb          1:1 11:5
 %xx_xa          2:1 16:5
@@ -734,3 +737,9 @@ XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
 RFEBB           010011-------------- .   0010010010 -   @XL_s
+
+## Accumulator Instructions
+
+XXMFACC         011111 ... -- 00000 ----- 0010110001 -   @X_a
+XXMTACC         011111 ... -- 00001 ----- 0010110001 -   @X_a
+XXSETACCZ       011111 ... -- 00011 ----- 0010110001 -   @X_a
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 900c1a1ab2..235be360e2 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2816,6 +2816,37 @@ static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)
     return true;
 }
 
+    /*
+     *  The PowerISA 3.1 mentions that for the current version of the
+     *  architecture, "the hardware implementation provides the effect of
+     *  ACC[i] and VSRs 4*i to 4*i + 3 logically containing the same data"
+     *  and "The Accumulators introduce no new logical state at this time"
+     *  (page 501). For now it seems unnecessary to create new structures,
+     *  so ACC[i] is the same as VSRs 4*i to 4*i+3 and therefore
+     *  move to and from accumulators are no-ops.
+     */
+static bool trans_XXMFACC(DisasContext *ctx, arg_X_a *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    return true;
+}
+
+static bool trans_XXMTACC(DisasContext *ctx, arg_X_a *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    return true;
+}
+
+static bool trans_XXSETACCZ(DisasContext *ctx, arg_X_a *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    tcg_gen_gvec_dup_imm(MO_64, acc_full_offset(a->ra), 64, 64, 0);
+    return true;
+}
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.36.1


