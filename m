Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E13122FAC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 16:07:45 +0100 (CET)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihERs-0004IU-T1
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 10:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihER2-0003sG-9n
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 10:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihER1-0005hE-6j
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 10:06:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27255
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihER1-0005gr-3d
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 10:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576595210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w1NTDSSbVt0UV5fVN8/Oq8z3wDEy4qKOZPHKybkPFO4=;
 b=OwkiPiFZfEXrfrLVoUIY5l7+D26gbPRxfmKm5yVF03bIQB6dlFQ3+lGwSku8ZkDbJfeXcc
 S61+cYPYZzcnJQtnuRt2S/+zMwOb84QhLN+8CZsTU8yZdNyKXr0G/JdKqZoBo5HnNQcmlZ
 1DIwfdsoEAy4tL30zomiPFbeAU58514=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Rgi8LtcLPNaM-I3MQO1g1g-1; Tue, 17 Dec 2019 10:06:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4458E800D4E;
 Tue, 17 Dec 2019 15:06:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-149.ams2.redhat.com [10.36.116.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05C1610016DA;
 Tue, 17 Dec 2019 15:06:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] tests/boot-sector: Fix the bad s390x assembler code
Date: Tue, 17 Dec 2019 16:06:42 +0100
Message-Id: <20191217150642.27946-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Rgi8LtcLPNaM-I3MQO1g1g-1
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
Cc: qemu-s390x@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are currently two bugs in s390x_code[]: First, the initial jump
uses the wrong offset, so it was jumping to 0x1014 instead of 0x1010.
Second, LHI only loads the lower 32-bit of the register.

Everything worked fine as long as the s390-ccw bios code was jumping
here with r3 containing zeroes in the uppermost 48 bit - which just
happened to be the case so far by accident. But we can not rely on this
fact, and indeed one of the recent suggested patches to jump2ipl.c cause
the newer GCCs to put different values into r3. In that case the code
from s390x_code[] crashes very ungracefully.

Thus let's make sure to jump to the right instruction, and use LGHI
instead of LHI to make sure that we always zero out the upper bits
of the register.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/boot-sector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/boot-sector.c b/tests/boot-sector.c
index 7824286b9a..9e66c6d013 100644
--- a/tests/boot-sector.c
+++ b/tests/boot-sector.c
@@ -75,11 +75,11 @@ static const uint8_t s390x_psw_and_magic[] =3D {
     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40   /* in the s390-ccw bi=
os */
 };
 static const uint8_t s390x_code[] =3D {
-    0xa7, 0xf4, 0x00, 0x0a,                                /* j 0x10010 */
+    0xa7, 0xf4, 0x00, 0x08,                                /* j 0x10010 */
     0x00, 0x00, 0x00, 0x00,
     'S', '3', '9', '0',
     'E', 'P', 0x00, 0x01,
-    0xa7, 0x38, HIGH(SIGNATURE_ADDR), LOW(SIGNATURE_ADDR), /* lhi r3,0x7c1=
0 */
+    0xa7, 0x39, HIGH(SIGNATURE_ADDR), LOW(SIGNATURE_ADDR), /* lghi r3,0x7c=
10 */
     0xa7, 0x48, LOW(SIGNATURE), HIGH(SIGNATURE),           /* lhi r4,0xadd=
e */
     0x40, 0x40, 0x30, 0x00,                                /* sth r4,0(r3)=
 */
     0xa7, 0xf4, 0xff, 0xfa                                 /* j 0x10010 */
--=20
2.18.1


