Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A63E0193
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 12:06:50 +0200 (CEST)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMr3x-0000pf-AS
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 06:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iMqsS-0005m9-8p
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iMqsR-0005iJ-4b
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:54:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26457
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iMqsR-0005hy-16
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571738094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGr4dBFYxGHxCcGYusZ15elORtCXZcgN+it4GugZNNg=;
 b=PfmN8UckipHLuW2AVd34Ai6I+OXh7wUBYN2n1m4sYD9/XTEpn3GMy7SXIzlafTFL9uapTa
 GuAl+5rJpHlXPxDO+QcCZblyYRbE4q4ua/Y9Au1mfjo8Zd4+XRoAW/T5ecxIgI6J01iNot
 diwPBXAx+KgHHbS/AOczbIDyo78nVcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-AuyqggneMd6LaexHorMubg-1; Tue, 22 Oct 2019 05:54:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31BA78017D4;
 Tue, 22 Oct 2019 09:54:50 +0000 (UTC)
Received: from localhost (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC3E960C5D;
 Tue, 22 Oct 2019 09:54:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/9] s390x/tcg: Fix VECTOR SHIFT RIGHT ARITHMETIC BY BYTE
Date: Tue, 22 Oct 2019 11:54:24 +0200
Message-Id: <20191022095428.20780-6-cohuck@redhat.com>
In-Reply-To: <20191022095428.20780-1-cohuck@redhat.com>
References: <20191022095428.20780-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: AuyqggneMd6LaexHorMubg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We forgot to propagate the highest bit accross the high doubleword in
two cases (shift >=3D64).

Fixes: 5f724887e3dd ("s390x/tcg: Implement VECTOR SHIFT RIGHT ARITHMETIC")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20191021085715.3797-4-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/vec_int_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.c
index 1b3aaecbdb3d..d38405848fed 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -70,15 +70,17 @@ static void s390_vec_sar(S390Vector *d, const S390Vecto=
r *a, uint64_t count)
         d->doubleword[0] =3D a->doubleword[0];
         d->doubleword[1] =3D a->doubleword[1];
     } else if (count =3D=3D 64) {
+        tmp =3D (int64_t)a->doubleword[0] >> 63;
         d->doubleword[1] =3D a->doubleword[0];
-        d->doubleword[0] =3D 0;
+        d->doubleword[0] =3D tmp;
     } else if (count < 64) {
         tmp =3D a->doubleword[1] >> count;
         d->doubleword[1] =3D deposit64(tmp, 64 - count, count, a->doublewo=
rd[0]);
         d->doubleword[0] =3D (int64_t)a->doubleword[0] >> count;
     } else {
+        tmp =3D (int64_t)a->doubleword[0] >> 63;
         d->doubleword[1] =3D (int64_t)a->doubleword[0] >> (count - 64);
-        d->doubleword[0] =3D 0;
+        d->doubleword[0] =3D tmp;
     }
 }
=20
--=20
2.21.0


