Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD61B7A43
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:15:38 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAwHY-0006dB-H2
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvsb-0006KH-1X
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvlI-0000b4-V9
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:42:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3779)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvlI-0000a8-Pt; Thu, 19 Sep 2019 08:42:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 110DA10DCC96;
 Thu, 19 Sep 2019 12:42:16 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 465195D9CC;
 Thu, 19 Sep 2019 12:42:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:40:54 +0200
Message-Id: <20190919124115.11510-14-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 19 Sep 2019 12:42:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/34] s390x/tcg: MVST: Check for specification
 exceptions
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Bit position 32-55 of general register 0 must be zero.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 41d7336a1a7a..ec27be174b20 100644
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
2.20.1


