Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3819B8B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 00:55:12 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJmGN-0000wt-0M
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 18:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <j@jannau.net>) id 1jJmFa-0000Wm-Ef
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 18:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <j@jannau.net>) id 1jJmFZ-0001Im-0W
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 18:54:22 -0400
Received: from soltyk.jannau.net ([5.9.120.237]:58604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <j@jannau.net>) id 1jJmFY-0001DS-QJ
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 18:54:20 -0400
Received: from coburn.home.jannau.net (p579AD68C.dip0.t-ipconnect.de
 [87.154.214.140])
 by soltyk.jannau.net (Postfix) with ESMTPSA id DBF023E00B9;
 Thu,  2 Apr 2020 00:54:17 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] target/i386: fix phadd* with identical destination and
 source register
Date: Thu,  2 Apr 2020 00:52:53 +0200
Message-Id: <20200401225253.30745-1-j@jannau.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.9.120.237
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Detected by asm test suite failures in dav1d
(https://code.videolan.org/videolan/dav1d). Can be reproduced by
`qemu-x86_64 -cpu core2duo ./tests/checkasm --test=3Dmc_8bpc 1659890620`.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 target/i386/ops_sse.h | 53 +++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index ec1ec745d0..2f41511aef 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1435,34 +1435,47 @@ void glue(helper_pshufb, SUFFIX)(CPUX86State *env=
, Reg *d, Reg *s)
=20
 void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->W(0) =3D (int16_t)d->W(0) + (int16_t)d->W(1);
-    d->W(1) =3D (int16_t)d->W(2) + (int16_t)d->W(3);
-    XMM_ONLY(d->W(2) =3D (int16_t)d->W(4) + (int16_t)d->W(5));
-    XMM_ONLY(d->W(3) =3D (int16_t)d->W(6) + (int16_t)d->W(7));
-    d->W((2 << SHIFT) + 0) =3D (int16_t)s->W(0) + (int16_t)s->W(1);
-    d->W((2 << SHIFT) + 1) =3D (int16_t)s->W(2) + (int16_t)s->W(3);
-    XMM_ONLY(d->W(6) =3D (int16_t)s->W(4) + (int16_t)s->W(5));
-    XMM_ONLY(d->W(7) =3D (int16_t)s->W(6) + (int16_t)s->W(7));
+
+    Reg r;
+
+    r.W(0) =3D (int16_t)d->W(0) + (int16_t)d->W(1);
+    r.W(1) =3D (int16_t)d->W(2) + (int16_t)d->W(3);
+    XMM_ONLY(r.W(2) =3D (int16_t)d->W(4) + (int16_t)d->W(5));
+    XMM_ONLY(r.W(3) =3D (int16_t)d->W(6) + (int16_t)d->W(7));
+    r.W((2 << SHIFT) + 0) =3D (int16_t)s->W(0) + (int16_t)s->W(1);
+    r.W((2 << SHIFT) + 1) =3D (int16_t)s->W(2) + (int16_t)s->W(3);
+    XMM_ONLY(r.W(6) =3D (int16_t)s->W(4) + (int16_t)s->W(5));
+    XMM_ONLY(r.W(7) =3D (int16_t)s->W(6) + (int16_t)s->W(7));
+
+    *d =3D r;
 }
=20
 void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->L(0) =3D (int32_t)d->L(0) + (int32_t)d->L(1);
-    XMM_ONLY(d->L(1) =3D (int32_t)d->L(2) + (int32_t)d->L(3));
-    d->L((1 << SHIFT) + 0) =3D (int32_t)s->L(0) + (int32_t)s->L(1);
-    XMM_ONLY(d->L(3) =3D (int32_t)s->L(2) + (int32_t)s->L(3));
+    Reg r;
+
+    r.L(0) =3D (int32_t)d->L(0) + (int32_t)d->L(1);
+    XMM_ONLY(r.L(1) =3D (int32_t)d->L(2) + (int32_t)d->L(3));
+    r.L((1 << SHIFT) + 0) =3D (int32_t)s->L(0) + (int32_t)s->L(1);
+    XMM_ONLY(r.L(3) =3D (int32_t)s->L(2) + (int32_t)s->L(3));
+
+    *d =3D r;
 }
=20
 void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->W(0) =3D satsw((int16_t)d->W(0) + (int16_t)d->W(1));
-    d->W(1) =3D satsw((int16_t)d->W(2) + (int16_t)d->W(3));
-    XMM_ONLY(d->W(2) =3D satsw((int16_t)d->W(4) + (int16_t)d->W(5)));
-    XMM_ONLY(d->W(3) =3D satsw((int16_t)d->W(6) + (int16_t)d->W(7)));
-    d->W((2 << SHIFT) + 0) =3D satsw((int16_t)s->W(0) + (int16_t)s->W(1)=
);
-    d->W((2 << SHIFT) + 1) =3D satsw((int16_t)s->W(2) + (int16_t)s->W(3)=
);
-    XMM_ONLY(d->W(6) =3D satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
-    XMM_ONLY(d->W(7) =3D satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
+    Reg r;
+
+    r.W(0) =3D satsw((int16_t)d->W(0) + (int16_t)d->W(1));
+    r.W(1) =3D satsw((int16_t)d->W(2) + (int16_t)d->W(3));
+    XMM_ONLY(r.W(2) =3D satsw((int16_t)d->W(4) + (int16_t)d->W(5)));
+    XMM_ONLY(r.W(3) =3D satsw((int16_t)d->W(6) + (int16_t)d->W(7)));
+    r.W((2 << SHIFT) + 0) =3D satsw((int16_t)s->W(0) + (int16_t)s->W(1))=
;
+    r.W((2 << SHIFT) + 1) =3D satsw((int16_t)s->W(2) + (int16_t)s->W(3))=
;
+    XMM_ONLY(r.W(6) =3D satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
+    XMM_ONLY(r.W(7) =3D satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
+
+    *d =3D r;
 }
=20
 void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
--=20
2.25.1


