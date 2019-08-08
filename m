Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3191B85AE4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 08:36:56 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvc2h-0005AD-DJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 02:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45626)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hvc1b-0004P4-TZ
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 02:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hvc1a-0003tU-Qx
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 02:35:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hvc1a-0003pj-LK
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 02:35:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 554AB30FB8C8;
 Thu,  8 Aug 2019 06:35:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.65.150.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 189155D9DC;
 Thu,  8 Aug 2019 06:35:42 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu,  8 Aug 2019 12:03:40 +0530
Message-Id: <20190808063340.23833-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 08 Aug 2019 06:35:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] scsi: lsi: exit infinite loop while executing
 script (CVE-2019-12068)
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bugs SysSec <bugs-syssec@rub.de>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

When executing script in lsi_execute_script(), the LSI scsi
adapter emulator advances 's->dsp' index to read next opcode.
This can lead to an infinite loop if the next opcode is empty.
Exit such loop after reading 10k empty opcodes.

Reported-by: Bugs SysSec <bugs-syssec@rub.de>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/scsi/lsi53c895a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 10468c1ec1..c23a40525e 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1132,7 +1132,10 @@ static void lsi_execute_script(LSIState *s)
=20
     s->istat1 |=3D LSI_ISTAT1_SRUN;
 again:
-    insn_processed++;
+    if (++insn_processed > 10000) {
+        s->waiting =3D LSI_NOWAIT;
+        goto exitloop;
+    }
     insn =3D read_dword(s, s->dsp);
     if (!insn) {
         /* If we receive an empty opcode increment the DSP by 4 bytes
@@ -1569,6 +1572,7 @@ again:
             }
         }
     }
+exitloop:
     if (insn_processed > 10000 && s->waiting =3D=3D LSI_NOWAIT) {
         /* Some windows drivers make the device spin waiting for a memor=
y
            location to change.  If we have been executed a lot of code t=
hen
--=20
2.21.0


