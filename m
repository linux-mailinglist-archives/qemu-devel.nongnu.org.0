Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D119E619
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Apr 2020 17:34:48 +0200 (CEST)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKkop-0004Hg-5X
	for lists+qemu-devel@lfdr.de; Sat, 04 Apr 2020 11:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jKko6-0003rH-BJ
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 11:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jKko5-0002p5-6L
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 11:34:02 -0400
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:52403)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jKko5-0002kv-0q
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 11:34:01 -0400
Received: from player716.ha.ovh.net (unknown [10.108.57.14])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 875DF12A117
 for <qemu-devel@nongnu.org>; Sat,  4 Apr 2020 17:33:51 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 28B77110B2C85;
 Sat,  4 Apr 2020 15:33:42 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] qom/object: Fix object_child_foreach_recursive() return value
Date: Sat,  4 Apr 2020 17:33:40 +0200
Message-Id: <20200404153340.164861-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12168444720268086033
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdekgdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.154
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
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When recursing, the return value of do_object_child_foreach() is not
taken into account.

Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Fixes: d714b8de7747 ("qom: Add recursive version of object_child_for_each=
")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 qom/object.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 1812f792247d..b68a707a5e65 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1057,7 +1057,10 @@ static int do_object_child_foreach(Object *obj,
                 break;
             }
             if (recurse) {
-                do_object_child_foreach(child, fn, opaque, true);
+                ret =3D do_object_child_foreach(child, fn, opaque, true)=
;
+                if (ret !=3D 0) {
+                    break;
+                }
             }
         }
     }
--=20
2.25.1


