Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF348DE754
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 11:02:24 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMTa3-0005Ye-8X
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 05:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iMTVR-0001KT-55
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iMTVQ-0008HM-0x
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:57:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21672)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iMTVN-0008Fs-Nu
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571648251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpzX3vb9RgNNLYiM/JvDGiNB0vNs3Bk5YnPik6Epjvk=;
 b=isEtRAxo4KMFzEdJq6tz24JaGzU/ptwoGqmxcW7KMeAabBVM0tQs5n5kZ6lreJS5040Ez+
 kxIGUILL74sETYhG6BwGMakpcCvDzIpQ6gUeP22zJxYXkUY4+r9TqZJeOK5wwH7tv2NSrW
 o4ZJBjkKQtQyLSNjTh4R2cZqPggYXPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-FpeKXJQZO1OL8ZIwYpVLmA-1; Mon, 21 Oct 2019 04:57:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E349107AD31;
 Mon, 21 Oct 2019 08:57:29 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-198.ams2.redhat.com [10.36.116.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95E955D6B0;
 Mon, 21 Oct 2019 08:57:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] s390x/tcg: Fix VECTOR SUBTRACT COMPUTE BORROW
 INDICATION
Date: Mon, 21 Oct 2019 10:57:13 +0200
Message-Id: <20191021085715.3797-5-david@redhat.com>
In-Reply-To: <20191021085715.3797-1-david@redhat.com>
References: <20191021085715.3797-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FpeKXJQZO1OL8ZIwYpVLmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ivan Warren <ivan@vmfacility.fr>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like my idea of what a "borrow" is was wrong. The PoP says:

 "If the resulting subtraction results in a carry out of bit zero, a value
 of one is placed in the corresponding element of the first operand;
 otherwise, a value of zero is placed in the corresponding element"

As clarified by Richard, all we have to do is invert the result.

Fixes: 1ee2d7ba72f6 ("s390x/tcg: Implement VECTOR SUBTRACT COMPUTE BORROW I=
NDICATION")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/translate_vx.inc.c | 7 ++++---
 target/s390x/vec_int_helper.c   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.in=
c.c
index 5ce7bfb0af..6032021d82 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2132,12 +2132,12 @@ static DisasJumpType op_vs(DisasContext *s, DisasOp=
s *o)
=20
 static void gen_scbi_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    tcg_gen_setcond_i32(TCG_COND_LTU, d, a, b);
+    tcg_gen_setcond_i32(TCG_COND_GEU, d, a, b);
 }
=20
 static void gen_scbi_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    tcg_gen_setcond_i64(TCG_COND_LTU, d, a, b);
+    tcg_gen_setcond_i64(TCG_COND_GEU, d, a, b);
 }
=20
 static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
@@ -2151,7 +2151,8 @@ static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, T=
CGv_i64 al,
     tcg_gen_andi_i64(th, th, 1);
     tcg_gen_sub2_i64(tl, th, ah, zero, th, zero);
     tcg_gen_sub2_i64(tl, th, tl, th, bh, zero);
-    tcg_gen_andi_i64(dl, th, 1);
+    /* "invert" the result: -1 -> 0; 0 -> 1 */
+    tcg_gen_addi_i64(dl, th, 1);
     tcg_gen_mov_i64(dh, zero);
=20
     tcg_temp_free_i64(th);
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.c
index d38405848f..0d6bc13dd6 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -593,7 +593,7 @@ void HELPER(gvec_vscbi##BITS)(void *v1, const void *v2,=
 const void *v3,        \
         const uint##BITS##_t a =3D s390_vec_read_element##BITS(v2, i);    =
       \
         const uint##BITS##_t b =3D s390_vec_read_element##BITS(v3, i);    =
       \
                                                                           =
     \
-        s390_vec_write_element##BITS(v1, i, a < b);                       =
     \
+        s390_vec_write_element##BITS(v1, i, a >=3D b);                    =
       \
     }                                                                     =
     \
 }
 DEF_VSCBI(8)
--=20
2.21.0


