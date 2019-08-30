Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14910A37CE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 15:35:08 +0200 (CEST)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3h3S-0001SK-PF
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 09:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mprivozn@redhat.com>) id 1i3gyb-0007EZ-QN
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1i3gyV-0004W5-W6
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:30:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1i3gyV-0004Mz-Cf
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:29:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0898D7F75F;
 Fri, 30 Aug 2019 13:29:56 +0000 (UTC)
Received: from moe.brq.redhat.com (unknown [10.43.2.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83B6960C80;
 Fri, 30 Aug 2019 13:29:52 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Aug 2019 15:29:45 +0200
Message-Id: <faeb030e6a1044f0fd88208edfdb1c5fafe5def9.1567171655.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 30 Aug 2019 13:29:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] qapi/qmp-dispatch: Fix error class for
 reporting disabled commands
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
Cc: armbru@redhat.com, mdroth@linux.vnet.ibm.com, lcapitulino@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a command is disabled an error is reported. But due to usage
of error_setg() the class of the error is GenericError which does
not help callers in distinguishing this case from a case where a
qmp command fails regularly due to other reasons. Use
CommandNotFound error class which is much closer to the actual
root cause.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---

This is a v2 of:

https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg06327.html

diff to v1:
- Don't introduce new error class (CommandDisabled)
- Use CommandNotFound error class

 qapi/qmp-dispatch.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 3037d353a4..bc264b3c9b 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -104,8 +104,9 @@ static QObject *do_qmp_dispatch(QmpCommandList *cmds,=
 QObject *request,
         return NULL;
     }
     if (!cmd->enabled) {
-        error_setg(errp, "The command %s has been disabled for this inst=
ance",
-                   command);
+        error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+                  "The command %s has been disabled for this instance",
+                  command);
         return NULL;
     }
     if (oob && !(cmd->options & QCO_ALLOW_OOB)) {
--=20
2.21.0


