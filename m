Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226256A48B0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhiw-0003Lw-8w; Mon, 27 Feb 2023 12:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhiq-0003IG-3l
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhio-0004Lj-64
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cKztsXVeRHpYgALmCO8ArSZEBJfh5ujk1+B8eD0HHw=;
 b=e4xQ7KLCM3cik5xiF4k1ADooVX6XKJ0abU6MMukV06jn7hdCC8tEIiV3Fp68J+KebfjwVM
 POwIquA3AxD4ONMYFoskg3OREk0t+KoUzz+smqD2Xnmw3vzCpiSEJzqvqHY5LbHpqpXdmv
 ibZmR7llNL0gU8ql3K0sLG1qPPhPyw0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-fQiaM-1pPk61RgXI02mgzg-1; Mon, 27 Feb 2023 12:55:31 -0500
X-MC-Unique: fQiaM-1pPk61RgXI02mgzg-1
Received: by mail-ed1-f72.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso9672216edb.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cKztsXVeRHpYgALmCO8ArSZEBJfh5ujk1+B8eD0HHw=;
 b=2w/BaXTzuNGDBoNqJhqo5eSVNbZGn8XzHkRWoIy+U+bVP3RxIaHxz+dTXezRDj5Wo0
 NdtCgEeNpdKmIs7Eqca24hlImvGk1AcuRL7lAqXrf4LxyMh8nPMlcm7TRLQXeafQ9Hbp
 IaEA9B9Lzk07g/jw/hprePfqdVUplxa72vO/SaKS6nS3lKsRrjuMOvSWapy1AWTKCjUW
 1BpAVbPe3kQwOvSOEd1+FjLhk5uzQ3orW8K3wX9RANZj6fONvGmSVvqbJVDwXNQHHLEC
 daSCyqaDjjTMEbLf610dDsxRPnVuajnhCvPIM39PKGl2FqmbYY8KF+LoHQIjdTM48ok4
 PO+w==
X-Gm-Message-State: AO0yUKUXyYydYbhjjAnCJKHyqaqBK/1h5oXxJtPHz2/yiqPgHu6n67fj
 PNm0yYyKD43N6m3N2cYiuRzwb7LZFpGMDwgupM3VSh40iyjuzVGpHri0QTEexBxDQepc/KlkZwz
 ny8mYEI2Z+CG4BKrBL4NticZTvQxpXHiYBjKxpxZiAmukn9TtXaF/wBQQZqd/S/ogp18ECZVh
X-Received: by 2002:a17:906:bfcc:b0:87b:7c1d:e02b with SMTP id
 us12-20020a170906bfcc00b0087b7c1de02bmr35438433ejb.36.1677520530395; 
 Mon, 27 Feb 2023 09:55:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/NlB7n9dCiYjeP7heCl7bd+GNGKHvRHoWiw0P2+uq4bc5Gp8pvqYCC4/pSXrCYlVfjCNRIsw==
X-Received: by 2002:a17:906:bfcc:b0:87b:7c1d:e02b with SMTP id
 us12-20020a170906bfcc00b0087b7c1de02bmr35438411ejb.36.1677520529992; 
 Mon, 27 Feb 2023 09:55:29 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a1709064e4f00b008ee64893786sm3522865ejw.99.2023.02.27.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/13] target/i386: Fix BZHI instruction
Date: Mon, 27 Feb 2023 18:55:12 +0100
Message-Id: <20230227175524.710880-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

We did not correctly handle N >= operand size.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1374
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114233206.3118472-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc      | 14 +++++++-------
 tests/tcg/i386/test-i386-bmi2.c |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index e61ae9a2e92d..0d01e13002a6 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1147,20 +1147,20 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 static void gen_BZHI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
-    TCGv bound;
+    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv mone = tcg_constant_tl(-1);
 
-    tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
-    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    tcg_gen_ext8u_tl(s->T1, s->T1);
 
     /*
      * Note that since we're using BMILG (in order to get O
      * cleared) we need to store the inverse into C.
      */
-    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src, s->T1, bound);
-    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1, bound, bound, s->T1);
+    tcg_gen_setcond_tl(TCG_COND_LEU, cpu_cc_src, s->T1, bound);
 
-    tcg_gen_movi_tl(s->A0, -1);
-    tcg_gen_shl_tl(s->A0, s->A0, s->T1);
+    tcg_gen_shl_tl(s->A0, mone, s->T1);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->T1, bound, s->A0, zero);
     tcg_gen_andc_tl(s->T0, s->T0, s->A0);
 
     gen_op_update1_cc(s);
diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 982d4abda455..0244df798778 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -123,6 +123,9 @@ int main(int argc, char *argv[]) {
     result = bzhiq(mask, 0x1f);
     assert(result == (mask & ~(-1 << 30)));
 
+    result = bzhiq(mask, 0x40);
+    assert(result == mask);
+
     result = rorxq(0x2132435465768798, 8);
     assert(result == 0x9821324354657687);
 
-- 
2.39.1


