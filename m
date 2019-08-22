Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC29954A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 15:40:02 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nJp-0002rN-Ed
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 09:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i0nIj-00028J-5J
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i0nIi-0008Lp-BV
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:38:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1i0nIe-0008H8-Vp; Thu, 22 Aug 2019 09:38:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA72581F0E;
 Thu, 22 Aug 2019 13:38:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 843955D721;
 Thu, 22 Aug 2019 13:38:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 084F011655EE; Thu, 22 Aug 2019 15:38:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 15:38:46 +0200
Message-Id: <20190822133846.10923-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 22 Aug 2019 13:38:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] pr-manager: Fix invalid g_free() crash bug
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
Cc: fam@euphon.net, pbonzini@redhat.com, kwolf@redhat.com,
 qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pr_manager_worker() passes its @opaque argument to g_free().  Wrong;
it points to pr_manager_worker()'s automatic @data.  Broken when
commit 2f3a7ab39be converted @data from heap- to stack-allocated.  Fix
by deleting the g_free().

Fixes: 2f3a7ab39bec4ba8022dc4d42ea641165b004e3e
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scsi/pr-manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scsi/pr-manager.c b/scsi/pr-manager.c
index ee43663576..0c866e8698 100644
--- a/scsi/pr-manager.c
+++ b/scsi/pr-manager.c
@@ -39,7 +39,6 @@ static int pr_manager_worker(void *opaque)
     int fd =3D data->fd;
     int r;
=20
-    g_free(data);
     trace_pr_manager_run(fd, hdr->cmdp[0], hdr->cmdp[1]);
=20
     /* The reference was taken in pr_manager_execute.  */
--=20
2.21.0


