Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069FBAF7C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:27:54 +0200 (CEST)
Received: from localhost ([::1]:53572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJhJ-0003Ca-1H
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJNt-00022p-Py
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJNs-00047k-N4
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJNs-00047N-Hn; Mon, 23 Sep 2019 04:07:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB47273A63;
 Mon, 23 Sep 2019 08:07:47 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 274AA19C78;
 Mon, 23 Sep 2019 08:07:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/30] s390x/tcg: MVST: Check for specification exceptions
Date: Mon, 23 Sep 2019 10:06:55 +0200
Message-Id: <20190923080712.23951-14-david@redhat.com>
In-Reply-To: <20190923080712.23951-1-david@redhat.com>
References: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 23 Sep 2019 08:07:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bit position 32-55 of general register 0 must be zero.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 41d7336a1a..ec27be174b 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -706,6 +706,9 @@ uint64_t HELPER(mvst)(CPUS390XState *env, uint64_t c,=
 uint64_t d, uint64_t s)
     uintptr_t ra =3D GETPC();
     uint32_t len;
=20
+    if (c & 0xffffff00ull) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ILEN_AUTO, ra);
+    }
     c =3D c & 0xff;
     d =3D wrap_address(env, d);
     s =3D wrap_address(env, s);
--=20
2.21.0


