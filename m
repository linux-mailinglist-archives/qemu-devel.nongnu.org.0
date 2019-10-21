Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE81DE757
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 11:03:27 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMTb4-00075u-A9
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 05:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iMTVO-0001Fv-5U
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iMTVJ-0008F2-Gd
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:57:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37239
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iMTVJ-0008E3-CW
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571648247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ushM5KxVVbNxV6eFVYoiic00qXkoSeU6WKmvD3sd2EQ=;
 b=TM0eYAwsJf+cHt1RoNqHnxfzE2pL52yq5YdPzAiEGvloF5NeC+fXqlI3G3yJHtdOGst4m1
 mNbe2wwMtbfLax2Jbot5XzF/U3PqewslFPygByMCqwvy6pV24OUtk1EWLMyR5zkULwD2HG
 w6eqcNUK/V+R53LsqgmwZOL4xQ7EL+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-j80JIpApPxmn4haWRYqfrg-1; Mon, 21 Oct 2019 04:57:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C69EA1005500;
 Mon, 21 Oct 2019 08:57:23 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-198.ams2.redhat.com [10.36.116.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E015D6B0;
 Mon, 21 Oct 2019 08:57:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] s390x/tcg: Fix VECTOR MULTIPLY AND ADD *
Date: Mon, 21 Oct 2019 10:57:11 +0200
Message-Id: <20191021085715.3797-3-david@redhat.com>
In-Reply-To: <20191021085715.3797-1-david@redhat.com>
References: <20191021085715.3797-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: j80JIpApPxmn4haWRYqfrg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

We missed that we always read a "double-wide even-odd element
pair of the fourth operand". Fix it in all four variants.

Fixes: 1b430aec4157 ("s390x/tcg: Implement VECTOR MULTIPLY AND ADD *")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/vec_int_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.c
index 03ae8631d9..1b3aaecbdb 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -336,7 +336,7 @@ void HELPER(gvec_vmae##BITS)(void *v1, const void *v2, =
const void *v3,         \
     for (i =3D 0, j =3D 0; i < (128 / TBITS); i++, j +=3D 2) {            =
           \
         int##TBITS##_t a =3D (int##BITS##_t)s390_vec_read_element##BITS(v2=
, j);  \
         int##TBITS##_t b =3D (int##BITS##_t)s390_vec_read_element##BITS(v3=
, j);  \
-        int##TBITS##_t c =3D (int##BITS##_t)s390_vec_read_element##BITS(v4=
, j);  \
+        int##TBITS##_t c =3D s390_vec_read_element##TBITS(v4, i);         =
       \
                                                                           =
     \
         s390_vec_write_element##TBITS(v1, i, a * b + c);                  =
     \
     }                                                                     =
     \
@@ -354,7 +354,7 @@ void HELPER(gvec_vmale##BITS)(void *v1, const void *v2,=
 const void *v3,        \
     for (i =3D 0, j =3D 0; i < (128 / TBITS); i++, j +=3D 2) {            =
           \
         uint##TBITS##_t a =3D s390_vec_read_element##BITS(v2, j);         =
       \
         uint##TBITS##_t b =3D s390_vec_read_element##BITS(v3, j);         =
       \
-        uint##TBITS##_t c =3D s390_vec_read_element##BITS(v4, j);         =
       \
+        uint##TBITS##_t c =3D s390_vec_read_element##TBITS(v4, i);        =
       \
                                                                           =
     \
         s390_vec_write_element##TBITS(v1, i, a * b + c);                  =
     \
     }                                                                     =
     \
@@ -372,7 +372,7 @@ void HELPER(gvec_vmao##BITS)(void *v1, const void *v2, =
const void *v3,         \
     for (i =3D 0, j =3D 1; i < (128 / TBITS); i++, j +=3D 2) {            =
           \
         int##TBITS##_t a =3D (int##BITS##_t)s390_vec_read_element##BITS(v2=
, j);  \
         int##TBITS##_t b =3D (int##BITS##_t)s390_vec_read_element##BITS(v3=
, j);  \
-        int##TBITS##_t c =3D (int##BITS##_t)s390_vec_read_element##BITS(v4=
, j);  \
+        int##TBITS##_t c =3D s390_vec_read_element##TBITS(v4, i);         =
       \
                                                                           =
     \
         s390_vec_write_element##TBITS(v1, i, a * b + c);                  =
     \
     }                                                                     =
     \
@@ -390,7 +390,7 @@ void HELPER(gvec_vmalo##BITS)(void *v1, const void *v2,=
 const void *v3,        \
     for (i =3D 0, j =3D 1; i < (128 / TBITS); i++, j +=3D 2) {            =
           \
         uint##TBITS##_t a =3D s390_vec_read_element##BITS(v2, j);         =
       \
         uint##TBITS##_t b =3D s390_vec_read_element##BITS(v3, j);         =
       \
-        uint##TBITS##_t c =3D s390_vec_read_element##BITS(v4, j);         =
       \
+        uint##TBITS##_t c =3D s390_vec_read_element##TBITS(v4, i);        =
       \
                                                                           =
     \
         s390_vec_write_element##TBITS(v1, i, a * b + c);                  =
     \
     }                                                                     =
     \
--=20
2.21.0


