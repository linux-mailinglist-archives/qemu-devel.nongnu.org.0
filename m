Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5771D5CDFE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 12:55:11 +0200 (CEST)
Received: from localhost ([::1]:51566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiGRK-0003YT-Hi
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 06:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50900)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hiGJm-0005nQ-Eb
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hiGJk-0007ex-QM
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:47:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hiGJk-0007bH-Kj
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:47:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 566F3307D85B
 for <qemu-devel@nongnu.org>; Tue,  2 Jul 2019 10:47:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-102.ams2.redhat.com
 [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A9C5C28D;
 Tue,  2 Jul 2019 10:47:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACA3F1132A0B; Tue,  2 Jul 2019 12:47:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 12:47:01 +0200
Message-Id: <20190702104716.9140-4-armbru@redhat.com>
In-Reply-To: <20190702104716.9140-1-armbru@redhat.com>
References: <20190702104716.9140-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 02 Jul 2019 10:47:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/18] Makefile: Don't add monitor/ twice to
 common-obj-y
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both commit f1b3ccfaa68 "monitor: Move {hmp, qmp}.c to monitor/{hmp,
qmp}-cmds.c" and commit 7e3c0deab1b "monitor: Split out monitor/qmp.c"
added monitor/ to common-obj-y ifeq ($(CONFIG_SOFTMMU),y).  Revert the
second addition.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190619201050.19040-3-armbru@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 Makefile.objs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile.objs b/Makefile.objs
index 3b83621f32..fe4f339b7c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -85,7 +85,6 @@ common-obj-$(CONFIG_FDT) +=3D device_tree.o
 # qapi
=20
 common-obj-y +=3D qapi/
-common-obj-y +=3D monitor/
 endif
=20
 #######################################################################
--=20
2.21.0


