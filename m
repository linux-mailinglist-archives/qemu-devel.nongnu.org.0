Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705968F442
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7H-0004Ad-6D; Wed, 08 Feb 2023 12:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo7F-00043p-5c
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo7D-0001I3-7S
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ta/RvWxoi3BYi01guIZtQWyrOdtMvFMGSaAl0lHjLvE=;
 b=C7doRkrObdlForz4bZfVyEW7uj4z0cPt4F1gfTxJ0pc2CkSePIKTHop1ldwJdoy0q7j9oB
 wKVVHk3YLHhLM2yphgrjU3nm34d6h3W8UVDt793/v2qOu58mfzeToLnid9jdzDopItgTsi
 u+7LOLAmuTARxfAdYshX1RQIlWidy/M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-CIaJfLNHPU-iX_20VSUPfQ-1; Wed, 08 Feb 2023 12:20:01 -0500
X-MC-Unique: CIaJfLNHPU-iX_20VSUPfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 s11-20020a056402520b00b004aada311135so2881941edd.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ta/RvWxoi3BYi01guIZtQWyrOdtMvFMGSaAl0lHjLvE=;
 b=ulRYWQaiqVt0tOpgZc2CUk761vaB36cRZcUcz8i9fSLO+xIGcS2aZyk27AnkESHhlP
 KuvrBmd//PknLcXozqn3+5XgB+hU7Qt2XNT9EmnUWbj1U06EPyguPCk1Bz9uuEgeRyHK
 ZLDmVQOx+n05HygyvLLmEjUbDw1bTM9DNZrY5tu0q5Qd7s9aGo2gsHyV5Hjuzc0cySKJ
 x6Z4WkgGE3uKbW2Cy4w5WI5s/XNab/0qQvq4gbZAkilmunFnNSqd6EBqkeTNVDaMo4iG
 JeY7eJNOEykAglVHhWAD+GEzSK1HVSOTa8dD44HsqSfqvb40zc08hpGcPiYnkYI8qweq
 2UXQ==
X-Gm-Message-State: AO0yUKUBYDKYsZGEXAGf4h7Ds8oG5106e7bPaucQU2pYCm25HXqBuH6j
 gLPc+4MNxdpCgEHjceNTxLz/2UHrItIxnLOSpFMz6m4o7gpUsD18J4KMzzWfvHr1eQ2hxR6pjMm
 bOYXMJSrtmUw1/fu8h+FPquVZK1Z1gxq1qFlivOxUjhPgRKcTKESIiIe347S+pFedAAvezuxL
X-Received: by 2002:a17:906:f52:b0:884:ab29:bd0b with SMTP id
 h18-20020a1709060f5200b00884ab29bd0bmr7686062ejj.69.1675876794233; 
 Wed, 08 Feb 2023 09:19:54 -0800 (PST)
X-Google-Smtp-Source: AK7set91NrImlV+C08Q4Nfansegq1e0bkRbKljnBuclyk6towsqF+Pm9+3lG7ca9dB876IkzAFp6Mw==
X-Received: by 2002:a17:906:f52:b0:884:ab29:bd0b with SMTP id
 h18-20020a1709060f5200b00884ab29bd0bmr7686051ejj.69.1675876794037; 
 Wed, 08 Feb 2023 09:19:54 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a170906a21000b00883ec4c63ddsm8589732ejy.146.2023.02.08.09.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PULL 09/11] target/i386: Fix BEXTR instruction
Date: Wed,  8 Feb 2023 18:19:20 +0100
Message-Id: <20230208171922.95048-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

There were two problems here: not limiting the input to operand bits,
and not correctly handling large extraction length.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1372
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114230542.3116013-3-richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org
Fixes: 1d0b926150e5 ("target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder", 2022-10-18)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc      | 22 +++++++++++-----------
 tests/tcg/i386/test-i386-bmi2.c | 12 ++++++++++++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 7037ff91c612..99f6ba6e19a2 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1078,30 +1078,30 @@ static void gen_ANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 static void gen_BEXTR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
-    TCGv bound, zero;
+    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv mone = tcg_constant_tl(-1);
 
     /*
      * Extract START, and shift the operand.
      * Shifts larger than operand size get zeros.
      */
     tcg_gen_ext8u_tl(s->A0, s->T1);
+    if (TARGET_LONG_BITS == 64 && ot == MO_32) {
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+    }
     tcg_gen_shr_tl(s->T0, s->T0, s->A0);
 
-    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
-    zero = tcg_constant_tl(0);
     tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound, s->T0, zero);
 
     /*
-     * Extract the LEN into a mask.  Lengths larger than
-     * operand size get all ones.
+     * Extract the LEN into an inverse mask.  Lengths larger than
+     * operand size get all zeros, length 0 gets all ones.
      */
     tcg_gen_extract_tl(s->A0, s->T1, 8, 8);
-    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound, s->A0, bound);
-
-    tcg_gen_movi_tl(s->T1, 1);
-    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
-    tcg_gen_subi_tl(s->T1, s->T1, 1);
-    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+    tcg_gen_shl_tl(s->T1, mone, s->A0);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->T1, s->A0, bound, s->T1, zero);
+    tcg_gen_andc_tl(s->T0, s->T0, s->T1);
 
     gen_op_update1_cc(s);
     set_cc_op(s, CC_OP_LOGICB + ot);
diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 3c3ef85513e1..982d4abda455 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -99,6 +99,9 @@ int main(int argc, char *argv[]) {
     result = bextrq(mask, 0x10f8);
     assert(result == 0);
 
+    result = bextrq(0xfedcba9876543210ull, 0x7f00);
+    assert(result == 0xfedcba9876543210ull);
+
     result = blsiq(0x30);
     assert(result == 0x10);
 
@@ -164,6 +167,15 @@ int main(int argc, char *argv[]) {
     result = bextrl(mask, 0x1038);
     assert(result == 0);
 
+    result = bextrl((reg_t)0x8f635a775ad3b9b4ull, 0x3018);
+    assert(result == 0x5a);
+
+    result = bextrl((reg_t)0xfedcba9876543210ull, 0x7f00);
+    assert(result == 0x76543210u);
+
+    result = bextrl(-1, 0);
+    assert(result == 0);
+
     result = blsil(0xffff);
     assert(result == 1);
 
-- 
2.39.1


