Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D62FE9CD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:18:39 +0100 (CET)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Yv8-0001oP-5L
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2YtP-0008J9-1x
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2YtN-0005TN-5i
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611231408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtHK3wGUYWsSY+8/YWukyjX9VnmfGuKaUOfGKjxyBk8=;
 b=Z3hgaanIDHRInFup7YRqpJWgYxN6OQBVPjcFBvF8xtqUajo+Ujf7M2ejcetKcyVKt0Z20b
 20kw4dOza8fWPJzWimcUoGgtfTI5rHwqgYFJzcW5DzL9N6UdJglu0ZwaJfi5zcD/XssmrR
 RvEPh6Q3FhR/OHoOFaLbbI+H1f7c/UM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-WcQPH3kaOSGU0zWWkLbvlg-1; Thu, 21 Jan 2021 07:16:45 -0500
X-MC-Unique: WcQPH3kaOSGU0zWWkLbvlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE57EC1AC;
 Thu, 21 Jan 2021 12:16:43 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC236100AE3F;
 Thu, 21 Jan 2021 12:16:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/9] s390x/tcg: Don't ignore content in r0 when not specified
 via "b" or "x"
Date: Thu, 21 Jan 2021 13:16:23 +0100
Message-Id: <20210121121629.530506-4-cohuck@redhat.com>
In-Reply-To: <20210121121629.530506-1-cohuck@redhat.com>
References: <20210121121629.530506-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Using get_address() with register identifiers comming from an "r" field
is wrong: if the "r" field designates "r0", we don't read the content
and instead assume 0 - which should only be applied when the register
was specified via "b" or "x".

PoP 5-11 "Operand-Address Generation":
  "A zero in any of the B1, B2, X2, B3, or B4 fields indicates the absence
   of the corresponding address component. For the absent component, a zero
   is used in forming the intermediate sum, regardless of the contents of
   general register 0. A displacement of zero has no special significance."

This BUG became visible for CSPG as generated by LLVM-12 in the upstream
Linux kernel (v5.11-rc2), used while creating the linear mapping in
vmem_map_init(): Trying to store to address 0 results in a Low Address
Protection exception.

Debugging this was more complicated than it could have been: The program
interrupt handler in the kernel will try to crash the kernel: doing so, it
will enable DAT. As the linear mapping is not created yet (asce=0), we run
into an addressing exception while tring to walk non-existant DAT tables,
resulting in a program exception loop.

This allows for booting upstream Linux kernels compiled by clang-12. Most
of these cases seem to be broken forever.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210111163845.18148-4-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/insn-data.def |  8 ++++----
 target/s390x/translate.c   | 15 +++++++++------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index eac5136ee539..e5b6efabf323 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1290,8 +1290,8 @@
     F(0xe313, LRAY,    RXY_a, LD,  0, a2, r1, 0, lra, 0, IF_PRIV)
     F(0xe303, LRAG,    RXY_a, Z,   0, a2, r1, 0, lra, 0, IF_PRIV)
 /* LOAD USING REAL ADDRESS */
-    E(0xb24b, LURA,    RRE,   Z,   0, 0, new, r1_32, lura, 0, MO_TEUL, IF_PRIV)
-    E(0xb905, LURAG,   RRE,   Z,   0, 0, r1, 0, lura, 0, MO_TEQ, IF_PRIV)
+    E(0xb24b, LURA,    RRE,   Z,   0, ra2, new, r1_32, lura, 0, MO_TEUL, IF_PRIV)
+    E(0xb905, LURAG,   RRE,   Z,   0, ra2, r1, 0, lura, 0, MO_TEQ, IF_PRIV)
 /* MOVE TO PRIMARY */
     F(0xda00, MVCP,    SS_d,  Z,   la1, a2, 0, 0, mvcp, 0, IF_PRIV)
 /* MOVE TO SECONDARY */
@@ -1344,8 +1344,8 @@
 /* STORE THEN OR SYSTEM MASK */
     F(0xad00, STOSM,   SI,    Z,   la1, 0, 0, 0, stnosm, 0, IF_PRIV)
 /* STORE USING REAL ADDRESS */
-    E(0xb246, STURA,   RRE,   Z,   r1_o, 0, 0, 0, stura, 0, MO_TEUL, IF_PRIV)
-    E(0xb925, STURG,   RRE,   Z,   r1_o, 0, 0, 0, stura, 0, MO_TEQ, IF_PRIV)
+    E(0xb246, STURA,   RRE,   Z,   r1_o, ra2, 0, 0, stura, 0, MO_TEUL, IF_PRIV)
+    E(0xb925, STURG,   RRE,   Z,   r1_o, ra2, 0, 0, stura, 0, MO_TEQ, IF_PRIV)
 /* TEST BLOCK */
     F(0xb22c, TB,      RRE,   Z,   0, r2_o, 0, 0, testblock, 0, IF_PRIV)
 /* TEST PROTECTION */
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 39e33eeb67f0..61dd0341e477 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -3285,8 +3285,7 @@ static DisasJumpType op_lpq(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_lura(DisasContext *s, DisasOps *o)
 {
-    o->addr1 = get_address(s, 0, get_field(s, r2), 0);
-    tcg_gen_qemu_ld_tl(o->out, o->addr1, MMU_REAL_IDX, s->insn->data);
+    tcg_gen_qemu_ld_tl(o->out, o->in2, MMU_REAL_IDX, s->insn->data);
     return DISAS_NEXT;
 }
 #endif
@@ -4234,7 +4233,8 @@ static DisasJumpType op_ectg(DisasContext *s, DisasOps *o)
     tcg_gen_addi_i64(o->in1, regs[b1], d1);
     o->in2 = tcg_temp_new_i64();
     tcg_gen_addi_i64(o->in2, regs[b2], d2);
-    o->addr1 = get_address(s, 0, r3, 0);
+    o->addr1 = tcg_temp_new_i64();
+    gen_addi_and_wrap_i64(s, o->addr1, regs[r3], 0);
 
     /* load the third operand into r3 before modifying anything */
     tcg_gen_qemu_ld64(regs[r3], o->addr1, get_mem_index(s));
@@ -4539,8 +4539,7 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
 {
-    o->addr1 = get_address(s, 0, get_field(s, r2), 0);
-    tcg_gen_qemu_st_tl(o->in1, o->addr1, MMU_REAL_IDX, s->insn->data);
+    tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
         update_psw_addr(s);
@@ -5923,7 +5922,11 @@ static void in2_x2l(DisasContext *s, DisasOps *o)
 
 static void in2_ra2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = get_address(s, 0, get_field(s, r2), 0);
+    int r2 = get_field(s, r2);
+
+    /* Note: *don't* treat !r2 as 0, use the reg value. */
+    o->in2 = tcg_temp_new_i64();
+    gen_addi_and_wrap_i64(s, o->in2, regs[r2], 0);
 }
 #define SPEC_in2_ra2 0
 
-- 
2.26.2


