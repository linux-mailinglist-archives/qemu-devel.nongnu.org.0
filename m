Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4C14A3C6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 13:25:24 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw3SF-0007E5-KP
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 07:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iw3O4-0000OM-SR
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:21:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iw3O1-0006oz-2o
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:21:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35864
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iw3O0-0006nc-LV
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580127659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdRZXjtBax7a4VpA7IcJM6oOFbH4x95AlCe+l/sRE4o=;
 b=fDUR0CcBYCHiNeYXXtckKJa7ZAvYsNh0oOq5jy1WvNfFptCTjICPxhUOtWO7z1L/H/1ayZ
 h/iwZ5YP3ypw5gEo3LvcGahisxdzcBo8I2IvW3RV7E9E0Usarj9GkhLdVToMG2LPuI/pEJ
 H/luBesJm6vVZmUFfOSkY4Ae4MU4SXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-JVpPhKSANoSfxnpKyKdExQ-1; Mon, 27 Jan 2020 07:20:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 856D71005510;
 Mon, 27 Jan 2020 12:20:55 +0000 (UTC)
Received: from localhost (ovpn-116-220.ams2.redhat.com [10.36.116.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF8D8702E;
 Mon, 27 Jan 2020 12:20:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/15] target/s390x: Remove DisasFields argument from callbacks
Date: Mon, 27 Jan 2020 13:20:11 +0100
Message-Id: <20200127122016.18752-11-cohuck@redhat.com>
In-Reply-To: <20200127122016.18752-1-cohuck@redhat.com>
References: <20200127122016.18752-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: JVpPhKSANoSfxnpKyKdExQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The DisasFields data is available from DisasContext.
We do not need to pass a separate argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200123232248.1800-3-richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/translate.c | 417 ++++++++++++++++++++-------------------
 1 file changed, 210 insertions(+), 207 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 7ef228843aa4..7d3dcc4faba9 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -1223,15 +1223,15 @@ struct DisasInsn {
     const char *name;
=20
     /* Pre-process arguments before HELP_OP.  */
-    void (*help_in1)(DisasContext *, DisasFields *, DisasOps *);
-    void (*help_in2)(DisasContext *, DisasFields *, DisasOps *);
-    void (*help_prep)(DisasContext *, DisasFields *, DisasOps *);
+    void (*help_in1)(DisasContext *, DisasOps *);
+    void (*help_in2)(DisasContext *, DisasOps *);
+    void (*help_prep)(DisasContext *, DisasOps *);
=20
     /*
      * Post-process output after HELP_OP.
      * Note that these are not called if HELP_OP returns DISAS_NORETURN.
      */
-    void (*help_wout)(DisasContext *, DisasFields *, DisasOps *);
+    void (*help_wout)(DisasContext *, DisasOps *);
     void (*help_cout)(DisasContext *, DisasOps *);
=20
     /* Implement the operation itself.  */
@@ -1243,11 +1243,10 @@ struct DisasInsn {
 /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
 /* Miscellaneous helpers, used by several operations.  */
=20
-static void help_l2_shift(DisasContext *s, DisasFields *f,
-                          DisasOps *o, int mask)
+static void help_l2_shift(DisasContext *s, DisasOps *o, int mask)
 {
-    int b2 =3D get_field(f, b2);
-    int d2 =3D get_field(f, d2);
+    int b2 =3D get_field(s->fields, b2);
+    int d2 =3D get_field(s->fields, d2);
=20
     if (b2 =3D=3D 0) {
         o->in2 =3D tcg_const_i64(d2 & mask);
@@ -5290,29 +5289,29 @@ static void cout_tm64(DisasContext *s, DisasOps *o)
    the "wout" generators, in some cases we need a new temporary, and in
    some cases we can write to a TCG global.  */
=20
-static void prep_new(DisasContext *s, DisasFields *f, DisasOps *o)
+static void prep_new(DisasContext *s, DisasOps *o)
 {
     o->out =3D tcg_temp_new_i64();
 }
 #define SPEC_prep_new 0
=20
-static void prep_new_P(DisasContext *s, DisasFields *f, DisasOps *o)
+static void prep_new_P(DisasContext *s, DisasOps *o)
 {
     o->out =3D tcg_temp_new_i64();
     o->out2 =3D tcg_temp_new_i64();
 }
 #define SPEC_prep_new_P 0
=20
-static void prep_r1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void prep_r1(DisasContext *s, DisasOps *o)
 {
-    o->out =3D regs[get_field(f, r1)];
+    o->out =3D regs[get_field(s->fields, r1)];
     o->g_out =3D true;
 }
 #define SPEC_prep_r1 0
=20
-static void prep_r1_P(DisasContext *s, DisasFields *f, DisasOps *o)
+static void prep_r1_P(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     o->out =3D regs[r1];
     o->out2 =3D regs[r1 + 1];
     o->g_out =3D o->g_out2 =3D true;
@@ -5320,10 +5319,10 @@ static void prep_r1_P(DisasContext *s, DisasFields =
*f, DisasOps *o)
 #define SPEC_prep_r1_P SPEC_r1_even
=20
 /* Whenever we need x1 in addition to other inputs, we'll load it to out/o=
ut2 */
-static void prep_x1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void prep_x1(DisasContext *s, DisasOps *o)
 {
-    o->out =3D load_freg(get_field(f, r1));
-    o->out2 =3D load_freg(get_field(f, r1) + 2);
+    o->out =3D load_freg(get_field(s->fields, r1));
+    o->out2 =3D load_freg(get_field(s->fields, r1) + 2);
 }
 #define SPEC_prep_x1 SPEC_r1_f128
=20
@@ -5333,84 +5332,84 @@ static void prep_x1(DisasContext *s, DisasFields *f=
, DisasOps *o)
    generally handled by having a "prep" generator install the TCG global
    as the destination of the operation.  */
=20
-static void wout_r1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1(DisasContext *s, DisasOps *o)
 {
-    store_reg(get_field(f, r1), o->out);
+    store_reg(get_field(s->fields, r1), o->out);
 }
 #define SPEC_wout_r1 0
=20
-static void wout_r1_8(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1_8(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     tcg_gen_deposit_i64(regs[r1], regs[r1], o->out, 0, 8);
 }
 #define SPEC_wout_r1_8 0
=20
-static void wout_r1_16(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1_16(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     tcg_gen_deposit_i64(regs[r1], regs[r1], o->out, 0, 16);
 }
 #define SPEC_wout_r1_16 0
=20
-static void wout_r1_32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1_32(DisasContext *s, DisasOps *o)
 {
-    store_reg32_i64(get_field(f, r1), o->out);
+    store_reg32_i64(get_field(s->fields, r1), o->out);
 }
 #define SPEC_wout_r1_32 0
=20
-static void wout_r1_32h(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1_32h(DisasContext *s, DisasOps *o)
 {
-    store_reg32h_i64(get_field(f, r1), o->out);
+    store_reg32h_i64(get_field(s->fields, r1), o->out);
 }
 #define SPEC_wout_r1_32h 0
=20
-static void wout_r1_P32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1_P32(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     store_reg32_i64(r1, o->out);
     store_reg32_i64(r1 + 1, o->out2);
 }
 #define SPEC_wout_r1_P32 SPEC_r1_even
=20
-static void wout_r1_D32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r1_D32(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     store_reg32_i64(r1 + 1, o->out);
     tcg_gen_shri_i64(o->out, o->out, 32);
     store_reg32_i64(r1, o->out);
 }
 #define SPEC_wout_r1_D32 SPEC_r1_even
=20
-static void wout_r3_P32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r3_P32(DisasContext *s, DisasOps *o)
 {
-    int r3 =3D get_field(f, r3);
+    int r3 =3D get_field(s->fields, r3);
     store_reg32_i64(r3, o->out);
     store_reg32_i64(r3 + 1, o->out2);
 }
 #define SPEC_wout_r3_P32 SPEC_r3_even
=20
-static void wout_r3_P64(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_r3_P64(DisasContext *s, DisasOps *o)
 {
-    int r3 =3D get_field(f, r3);
+    int r3 =3D get_field(s->fields, r3);
     store_reg(r3, o->out);
     store_reg(r3 + 1, o->out2);
 }
 #define SPEC_wout_r3_P64 SPEC_r3_even
=20
-static void wout_e1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_e1(DisasContext *s, DisasOps *o)
 {
-    store_freg32_i64(get_field(f, r1), o->out);
+    store_freg32_i64(get_field(s->fields, r1), o->out);
 }
 #define SPEC_wout_e1 0
=20
-static void wout_f1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_f1(DisasContext *s, DisasOps *o)
 {
-    store_freg(get_field(f, r1), o->out);
+    store_freg(get_field(s->fields, r1), o->out);
 }
 #define SPEC_wout_f1 0
=20
-static void wout_x1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_x1(DisasContext *s, DisasOps *o)
 {
     int f1 =3D get_field(s->fields, r1);
     store_freg(f1, o->out);
@@ -5418,282 +5417,284 @@ static void wout_x1(DisasContext *s, DisasFields =
*f, DisasOps *o)
 }
 #define SPEC_wout_x1 SPEC_r1_f128
=20
-static void wout_cond_r1r2_32(DisasContext *s, DisasFields *f, DisasOps *o=
)
+static void wout_cond_r1r2_32(DisasContext *s, DisasOps *o)
 {
-    if (get_field(f, r1) !=3D get_field(f, r2)) {
-        store_reg32_i64(get_field(f, r1), o->out);
+    if (get_field(s->fields, r1) !=3D get_field(s->fields, r2)) {
+        store_reg32_i64(get_field(s->fields, r1), o->out);
     }
 }
 #define SPEC_wout_cond_r1r2_32 0
=20
-static void wout_cond_e1e2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_cond_e1e2(DisasContext *s, DisasOps *o)
 {
-    if (get_field(f, r1) !=3D get_field(f, r2)) {
-        store_freg32_i64(get_field(f, r1), o->out);
+    if (get_field(s->fields, r1) !=3D get_field(s->fields, r2)) {
+        store_freg32_i64(get_field(s->fields, r1), o->out);
     }
 }
 #define SPEC_wout_cond_e1e2 0
=20
-static void wout_m1_8(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_8(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st8(o->out, o->addr1, get_mem_index(s));
 }
 #define SPEC_wout_m1_8 0
=20
-static void wout_m1_16(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_16(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st16(o->out, o->addr1, get_mem_index(s));
 }
 #define SPEC_wout_m1_16 0
=20
 #ifndef CONFIG_USER_ONLY
-static void wout_m1_16a(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_16a(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st_tl(o->out, o->addr1, get_mem_index(s), MO_TEUW | MO_AL=
IGN);
 }
 #define SPEC_wout_m1_16a 0
 #endif
=20
-static void wout_m1_32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_32(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st32(o->out, o->addr1, get_mem_index(s));
 }
 #define SPEC_wout_m1_32 0
=20
 #ifndef CONFIG_USER_ONLY
-static void wout_m1_32a(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_32a(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st_tl(o->out, o->addr1, get_mem_index(s), MO_TEUL | MO_AL=
IGN);
 }
 #define SPEC_wout_m1_32a 0
 #endif
=20
-static void wout_m1_64(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_64(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st64(o->out, o->addr1, get_mem_index(s));
 }
 #define SPEC_wout_m1_64 0
=20
 #ifndef CONFIG_USER_ONLY
-static void wout_m1_64a(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m1_64a(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_TEQ | MO_AL=
IGN);
 }
 #define SPEC_wout_m1_64a 0
 #endif
=20
-static void wout_m2_32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_m2_32(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st32(o->out, o->in2, get_mem_index(s));
 }
 #define SPEC_wout_m2_32 0
=20
-static void wout_in2_r1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_in2_r1(DisasContext *s, DisasOps *o)
 {
-    store_reg(get_field(f, r1), o->in2);
+    store_reg(get_field(s->fields, r1), o->in2);
 }
 #define SPEC_wout_in2_r1 0
=20
-static void wout_in2_r1_32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void wout_in2_r1_32(DisasContext *s, DisasOps *o)
 {
-    store_reg32_i64(get_field(f, r1), o->in2);
+    store_reg32_i64(get_field(s->fields, r1), o->in2);
 }
 #define SPEC_wout_in2_r1_32 0
=20
 /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
 /* The "INput 1" generators.  These load the first operand to an insn.  */
=20
-static void in1_r1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_reg(get_field(f, r1));
+    o->in1 =3D load_reg(get_field(s->fields, r1));
 }
 #define SPEC_in1_r1 0
=20
-static void in1_r1_o(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1_o(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D regs[get_field(f, r1)];
+    o->in1 =3D regs[get_field(s->fields, r1)];
     o->g_in1 =3D true;
 }
 #define SPEC_in1_r1_o 0
=20
-static void in1_r1_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1_32s(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_ext32s_i64(o->in1, regs[get_field(f, r1)]);
+    tcg_gen_ext32s_i64(o->in1, regs[get_field(s->fields, r1)]);
 }
 #define SPEC_in1_r1_32s 0
=20
-static void in1_r1_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1_32u(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_ext32u_i64(o->in1, regs[get_field(f, r1)]);
+    tcg_gen_ext32u_i64(o->in1, regs[get_field(s->fields, r1)]);
 }
 #define SPEC_in1_r1_32u 0
=20
-static void in1_r1_sr32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1_sr32(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_shri_i64(o->in1, regs[get_field(f, r1)], 32);
+    tcg_gen_shri_i64(o->in1, regs[get_field(s->fields, r1)], 32);
 }
 #define SPEC_in1_r1_sr32 0
=20
-static void in1_r1p1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1p1(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_reg(get_field(f, r1) + 1);
+    o->in1 =3D load_reg(get_field(s->fields, r1) + 1);
 }
 #define SPEC_in1_r1p1 SPEC_r1_even
=20
-static void in1_r1p1_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1p1_32s(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_ext32s_i64(o->in1, regs[get_field(f, r1) + 1]);
+    tcg_gen_ext32s_i64(o->in1, regs[get_field(s->fields, r1) + 1]);
 }
 #define SPEC_in1_r1p1_32s SPEC_r1_even
=20
-static void in1_r1p1_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1p1_32u(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_ext32u_i64(o->in1, regs[get_field(f, r1) + 1]);
+    tcg_gen_ext32u_i64(o->in1, regs[get_field(s->fields, r1) + 1]);
 }
 #define SPEC_in1_r1p1_32u SPEC_r1_even
=20
-static void in1_r1_D32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r1_D32(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_concat32_i64(o->in1, regs[r1 + 1], regs[r1]);
 }
 #define SPEC_in1_r1_D32 SPEC_r1_even
=20
-static void in1_r2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r2(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_reg(get_field(f, r2));
+    o->in1 =3D load_reg(get_field(s->fields, r2));
 }
 #define SPEC_in1_r2 0
=20
-static void in1_r2_sr32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r2_sr32(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_shri_i64(o->in1, regs[get_field(f, r2)], 32);
+    tcg_gen_shri_i64(o->in1, regs[get_field(s->fields, r2)], 32);
 }
 #define SPEC_in1_r2_sr32 0
=20
-static void in1_r3(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r3(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_reg(get_field(f, r3));
+    o->in1 =3D load_reg(get_field(s->fields, r3));
 }
 #define SPEC_in1_r3 0
=20
-static void in1_r3_o(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r3_o(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D regs[get_field(f, r3)];
+    o->in1 =3D regs[get_field(s->fields, r3)];
     o->g_in1 =3D true;
 }
 #define SPEC_in1_r3_o 0
=20
-static void in1_r3_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r3_32s(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_ext32s_i64(o->in1, regs[get_field(f, r3)]);
+    tcg_gen_ext32s_i64(o->in1, regs[get_field(s->fields, r3)]);
 }
 #define SPEC_in1_r3_32s 0
=20
-static void in1_r3_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r3_32u(DisasContext *s, DisasOps *o)
 {
     o->in1 =3D tcg_temp_new_i64();
-    tcg_gen_ext32u_i64(o->in1, regs[get_field(f, r3)]);
+    tcg_gen_ext32u_i64(o->in1, regs[get_field(s->fields, r3)]);
 }
 #define SPEC_in1_r3_32u 0
=20
-static void in1_r3_D32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_r3_D32(DisasContext *s, DisasOps *o)
 {
-    int r3 =3D get_field(f, r3);
+    int r3 =3D get_field(s->fields, r3);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_concat32_i64(o->in1, regs[r3 + 1], regs[r3]);
 }
 #define SPEC_in1_r3_D32 SPEC_r3_even
=20
-static void in1_e1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_e1(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_freg32_i64(get_field(f, r1));
+    o->in1 =3D load_freg32_i64(get_field(s->fields, r1));
 }
 #define SPEC_in1_e1 0
=20
-static void in1_f1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_f1(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_freg(get_field(f, r1));
+    o->in1 =3D load_freg(get_field(s->fields, r1));
 }
 #define SPEC_in1_f1 0
=20
 /* Load the high double word of an extended (128-bit) format FP number */
-static void in1_x2h(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_x2h(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_freg(get_field(f, r2));
+    o->in1 =3D load_freg(get_field(s->fields, r2));
 }
 #define SPEC_in1_x2h SPEC_r2_f128
=20
-static void in1_f3(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_f3(DisasContext *s, DisasOps *o)
 {
-    o->in1 =3D load_freg(get_field(f, r3));
+    o->in1 =3D load_freg(get_field(s->fields, r3));
 }
 #define SPEC_in1_f3 0
=20
-static void in1_la1(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_la1(DisasContext *s, DisasOps *o)
 {
-    o->addr1 =3D get_address(s, 0, get_field(f, b1), get_field(f, d1));
+    o->addr1 =3D get_address(s, 0, get_field(s->fields, b1),
+                           get_field(s->fields, d1));
 }
 #define SPEC_in1_la1 0
=20
-static void in1_la2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_la2(DisasContext *s, DisasOps *o)
 {
-    int x2 =3D have_field(f, x2) ? get_field(f, x2) : 0;
-    o->addr1 =3D get_address(s, x2, get_field(f, b2), get_field(f, d2));
+    int x2 =3D have_field(s->fields, x2) ? get_field(s->fields, x2) : 0;
+    o->addr1 =3D get_address(s, x2, get_field(s->fields, b2),
+                           get_field(s->fields, d2));
 }
 #define SPEC_in1_la2 0
=20
-static void in1_m1_8u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_m1_8u(DisasContext *s, DisasOps *o)
 {
-    in1_la1(s, f, o);
+    in1_la1(s, o);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_qemu_ld8u(o->in1, o->addr1, get_mem_index(s));
 }
 #define SPEC_in1_m1_8u 0
=20
-static void in1_m1_16s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_m1_16s(DisasContext *s, DisasOps *o)
 {
-    in1_la1(s, f, o);
+    in1_la1(s, o);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_qemu_ld16s(o->in1, o->addr1, get_mem_index(s));
 }
 #define SPEC_in1_m1_16s 0
=20
-static void in1_m1_16u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_m1_16u(DisasContext *s, DisasOps *o)
 {
-    in1_la1(s, f, o);
+    in1_la1(s, o);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_qemu_ld16u(o->in1, o->addr1, get_mem_index(s));
 }
 #define SPEC_in1_m1_16u 0
=20
-static void in1_m1_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_m1_32s(DisasContext *s, DisasOps *o)
 {
-    in1_la1(s, f, o);
+    in1_la1(s, o);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_qemu_ld32s(o->in1, o->addr1, get_mem_index(s));
 }
 #define SPEC_in1_m1_32s 0
=20
-static void in1_m1_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_m1_32u(DisasContext *s, DisasOps *o)
 {
-    in1_la1(s, f, o);
+    in1_la1(s, o);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_qemu_ld32u(o->in1, o->addr1, get_mem_index(s));
 }
 #define SPEC_in1_m1_32u 0
=20
-static void in1_m1_64(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in1_m1_64(DisasContext *s, DisasOps *o)
 {
-    in1_la1(s, f, o);
+    in1_la1(s, o);
     o->in1 =3D tcg_temp_new_i64();
     tcg_gen_qemu_ld64(o->in1, o->addr1, get_mem_index(s));
 }
@@ -5702,304 +5703,306 @@ static void in1_m1_64(DisasContext *s, DisasField=
s *f, DisasOps *o)
 /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
 /* The "INput 2" generators.  These load the second operand to an insn.  *=
/
=20
-static void in2_r1_o(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r1_o(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D regs[get_field(f, r1)];
+    o->in2 =3D regs[get_field(s->fields, r1)];
     o->g_in2 =3D true;
 }
 #define SPEC_in2_r1_o 0
=20
-static void in2_r1_16u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r1_16u(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext16u_i64(o->in2, regs[get_field(f, r1)]);
+    tcg_gen_ext16u_i64(o->in2, regs[get_field(s->fields, r1)]);
 }
 #define SPEC_in2_r1_16u 0
=20
-static void in2_r1_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r1_32u(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext32u_i64(o->in2, regs[get_field(f, r1)]);
+    tcg_gen_ext32u_i64(o->in2, regs[get_field(s->fields, r1)]);
 }
 #define SPEC_in2_r1_32u 0
=20
-static void in2_r1_D32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r1_D32(DisasContext *s, DisasOps *o)
 {
-    int r1 =3D get_field(f, r1);
+    int r1 =3D get_field(s->fields, r1);
     o->in2 =3D tcg_temp_new_i64();
     tcg_gen_concat32_i64(o->in2, regs[r1 + 1], regs[r1]);
 }
 #define SPEC_in2_r1_D32 SPEC_r1_even
=20
-static void in2_r2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D load_reg(get_field(f, r2));
+    o->in2 =3D load_reg(get_field(s->fields, r2));
 }
 #define SPEC_in2_r2 0
=20
-static void in2_r2_o(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_o(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D regs[get_field(f, r2)];
+    o->in2 =3D regs[get_field(s->fields, r2)];
     o->g_in2 =3D true;
 }
 #define SPEC_in2_r2_o 0
=20
-static void in2_r2_nz(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_nz(DisasContext *s, DisasOps *o)
 {
-    int r2 =3D get_field(f, r2);
+    int r2 =3D get_field(s->fields, r2);
     if (r2 !=3D 0) {
         o->in2 =3D load_reg(r2);
     }
 }
 #define SPEC_in2_r2_nz 0
=20
-static void in2_r2_8s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_8s(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext8s_i64(o->in2, regs[get_field(f, r2)]);
+    tcg_gen_ext8s_i64(o->in2, regs[get_field(s->fields, r2)]);
 }
 #define SPEC_in2_r2_8s 0
=20
-static void in2_r2_8u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_8u(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext8u_i64(o->in2, regs[get_field(f, r2)]);
+    tcg_gen_ext8u_i64(o->in2, regs[get_field(s->fields, r2)]);
 }
 #define SPEC_in2_r2_8u 0
=20
-static void in2_r2_16s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_16s(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext16s_i64(o->in2, regs[get_field(f, r2)]);
+    tcg_gen_ext16s_i64(o->in2, regs[get_field(s->fields, r2)]);
 }
 #define SPEC_in2_r2_16s 0
=20
-static void in2_r2_16u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_16u(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext16u_i64(o->in2, regs[get_field(f, r2)]);
+    tcg_gen_ext16u_i64(o->in2, regs[get_field(s->fields, r2)]);
 }
 #define SPEC_in2_r2_16u 0
=20
-static void in2_r3(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r3(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D load_reg(get_field(f, r3));
+    o->in2 =3D load_reg(get_field(s->fields, r3));
 }
 #define SPEC_in2_r3 0
=20
-static void in2_r3_sr32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r3_sr32(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_shri_i64(o->in2, regs[get_field(f, r3)], 32);
+    tcg_gen_shri_i64(o->in2, regs[get_field(s->fields, r3)], 32);
 }
 #define SPEC_in2_r3_sr32 0
=20
-static void in2_r3_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r3_32u(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext32u_i64(o->in2, regs[get_field(f, r3)]);
+    tcg_gen_ext32u_i64(o->in2, regs[get_field(s->fields, r3)]);
 }
 #define SPEC_in2_r3_32u 0
=20
-static void in2_r2_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_32s(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext32s_i64(o->in2, regs[get_field(f, r2)]);
+    tcg_gen_ext32s_i64(o->in2, regs[get_field(s->fields, r2)]);
 }
 #define SPEC_in2_r2_32s 0
=20
-static void in2_r2_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_32u(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_ext32u_i64(o->in2, regs[get_field(f, r2)]);
+    tcg_gen_ext32u_i64(o->in2, regs[get_field(s->fields, r2)]);
 }
 #define SPEC_in2_r2_32u 0
=20
-static void in2_r2_sr32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_r2_sr32(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_temp_new_i64();
-    tcg_gen_shri_i64(o->in2, regs[get_field(f, r2)], 32);
+    tcg_gen_shri_i64(o->in2, regs[get_field(s->fields, r2)], 32);
 }
 #define SPEC_in2_r2_sr32 0
=20
-static void in2_e2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_e2(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D load_freg32_i64(get_field(f, r2));
+    o->in2 =3D load_freg32_i64(get_field(s->fields, r2));
 }
 #define SPEC_in2_e2 0
=20
-static void in2_f2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_f2(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D load_freg(get_field(f, r2));
+    o->in2 =3D load_freg(get_field(s->fields, r2));
 }
 #define SPEC_in2_f2 0
=20
 /* Load the low double word of an extended (128-bit) format FP number */
-static void in2_x2l(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_x2l(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D load_freg(get_field(f, r2) + 2);
+    o->in2 =3D load_freg(get_field(s->fields, r2) + 2);
 }
 #define SPEC_in2_x2l SPEC_r2_f128
=20
-static void in2_ra2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_ra2(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D get_address(s, 0, get_field(f, r2), 0);
+    o->in2 =3D get_address(s, 0, get_field(s->fields, r2), 0);
 }
 #define SPEC_in2_ra2 0
=20
-static void in2_a2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_a2(DisasContext *s, DisasOps *o)
 {
-    int x2 =3D have_field(f, x2) ? get_field(f, x2) : 0;
-    o->in2 =3D get_address(s, x2, get_field(f, b2), get_field(f, d2));
+    int x2 =3D have_field(s->fields, x2) ? get_field(s->fields, x2) : 0;
+    o->in2 =3D get_address(s, x2, get_field(s->fields, b2),
+                         get_field(s->fields, d2));
 }
 #define SPEC_in2_a2 0
=20
-static void in2_ri2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D tcg_const_i64(s->base.pc_next + (int64_t)get_field(f, i2) *=
 2);
+    o->in2 =3D tcg_const_i64(s->base.pc_next +
+                           (int64_t)get_field(s->fields, i2) * 2);
 }
 #define SPEC_in2_ri2 0
=20
-static void in2_sh32(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_sh32(DisasContext *s, DisasOps *o)
 {
-    help_l2_shift(s, f, o, 31);
+    help_l2_shift(s, o, 31);
 }
 #define SPEC_in2_sh32 0
=20
-static void in2_sh64(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_sh64(DisasContext *s, DisasOps *o)
 {
-    help_l2_shift(s, f, o, 63);
+    help_l2_shift(s, o, 63);
 }
 #define SPEC_in2_sh64 0
=20
-static void in2_m2_8u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_8u(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld8u(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_m2_8u 0
=20
-static void in2_m2_16s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_16s(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld16s(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_m2_16s 0
=20
-static void in2_m2_16u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_16u(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld16u(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_m2_16u 0
=20
-static void in2_m2_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_32s(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld32s(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_m2_32s 0
=20
-static void in2_m2_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_32u(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld32u(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_m2_32u 0
=20
 #ifndef CONFIG_USER_ONLY
-static void in2_m2_32ua(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_32ua(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld_tl(o->in2, o->in2, get_mem_index(s), MO_TEUL | MO_ALIG=
N);
 }
 #define SPEC_in2_m2_32ua 0
 #endif
=20
-static void in2_m2_64(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_64(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_m2_64 0
=20
 #ifndef CONFIG_USER_ONLY
-static void in2_m2_64a(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_m2_64a(DisasContext *s, DisasOps *o)
 {
-    in2_a2(s, f, o);
+    in2_a2(s, o);
     tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEQ | MO_ALIG=
N);
 }
 #define SPEC_in2_m2_64a 0
 #endif
=20
-static void in2_mri2_16u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, f, o);
+    in2_ri2(s, o);
     tcg_gen_qemu_ld16u(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_mri2_16u 0
=20
-static void in2_mri2_32s(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_mri2_32s(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, f, o);
+    in2_ri2(s, o);
     tcg_gen_qemu_ld32s(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_mri2_32s 0
=20
-static void in2_mri2_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_mri2_32u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, f, o);
+    in2_ri2(s, o);
     tcg_gen_qemu_ld32u(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_mri2_32u 0
=20
-static void in2_mri2_64(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_mri2_64(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, f, o);
+    in2_ri2(s, o);
     tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
 }
 #define SPEC_in2_mri2_64 0
=20
-static void in2_i2(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_i2(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D tcg_const_i64(get_field(f, i2));
+    o->in2 =3D tcg_const_i64(get_field(s->fields, i2));
 }
 #define SPEC_in2_i2 0
=20
-static void in2_i2_8u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_i2_8u(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D tcg_const_i64((uint8_t)get_field(f, i2));
+    o->in2 =3D tcg_const_i64((uint8_t)get_field(s->fields, i2));
 }
 #define SPEC_in2_i2_8u 0
=20
-static void in2_i2_16u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_i2_16u(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D tcg_const_i64((uint16_t)get_field(f, i2));
+    o->in2 =3D tcg_const_i64((uint16_t)get_field(s->fields, i2));
 }
 #define SPEC_in2_i2_16u 0
=20
-static void in2_i2_32u(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_i2_32u(DisasContext *s, DisasOps *o)
 {
-    o->in2 =3D tcg_const_i64((uint32_t)get_field(f, i2));
+    o->in2 =3D tcg_const_i64((uint32_t)get_field(s->fields, i2));
 }
 #define SPEC_in2_i2_32u 0
=20
-static void in2_i2_16u_shl(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_i2_16u_shl(DisasContext *s, DisasOps *o)
 {
-    uint64_t i2 =3D (uint16_t)get_field(f, i2);
+    uint64_t i2 =3D (uint16_t)get_field(s->fields, i2);
     o->in2 =3D tcg_const_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_16u_shl 0
=20
-static void in2_i2_32u_shl(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_i2_32u_shl(DisasContext *s, DisasOps *o)
 {
-    uint64_t i2 =3D (uint32_t)get_field(f, i2);
+    uint64_t i2 =3D (uint32_t)get_field(s->fields, i2);
     o->in2 =3D tcg_const_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_32u_shl 0
=20
 #ifndef CONFIG_USER_ONLY
-static void in2_insn(DisasContext *s, DisasFields *f, DisasOps *o)
+static void in2_insn(DisasContext *s, DisasOps *o)
 {
     o->in2 =3D tcg_const_i64(s->fields->raw_insn);
 }
@@ -6388,20 +6391,20 @@ static DisasJumpType translate_one(CPUS390XState *e=
nv, DisasContext *s)
=20
     /* Implement the instruction.  */
     if (insn->help_in1) {
-        insn->help_in1(s, &f, &o);
+        insn->help_in1(s, &o);
     }
     if (insn->help_in2) {
-        insn->help_in2(s, &f, &o);
+        insn->help_in2(s, &o);
     }
     if (insn->help_prep) {
-        insn->help_prep(s, &f, &o);
+        insn->help_prep(s, &o);
     }
     if (insn->help_op) {
         ret =3D insn->help_op(s, &o);
     }
     if (ret !=3D DISAS_NORETURN) {
         if (insn->help_wout) {
-            insn->help_wout(s, &f, &o);
+            insn->help_wout(s, &o);
         }
         if (insn->help_cout) {
             insn->help_cout(s, &o);
--=20
2.21.1


