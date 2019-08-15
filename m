Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153538F14B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:54:58 +0200 (CEST)
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyJ1d-0007qm-1W
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjZ-0002PB-Cj
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIjT-00033D-Qf
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIjT-00031W-Kb
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4DBD309B693;
 Thu, 15 Aug 2019 16:36:10 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71A90BAAC;
 Thu, 15 Aug 2019 16:36:08 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:47 +0100
Message-Id: <20190815163504.18937-17-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 15 Aug 2019 16:36:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 16/33] migration: equation is more proper than
 and to check LOADVM_QUIT
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
Cc: quintela@redhat.com, yury-kotov@yandex-team.ru,
 richardw.yang@linux.intel.com, marcandre.lureau@redhat.com,
 ivanren@tencent.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

LOADVM_QUIT allows a command to quit all layers of nested loadvm loops,
while current return value check is not that proper even it works now.

Current return value check "ret & LOADVM_QUIT" would return true if
bit[0] is 1. This would be true when ret is -1 which is used to indicate
an error of handling a command.

Since there is only one place return LOADVM_QUIT and no other
combination of return value, use "ret =3D=3D LOADVM_QUIT" would be more
proper.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190718064257.29218-1-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index eed5e551da..412768216c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2437,7 +2437,7 @@ retry:
         case QEMU_VM_COMMAND:
             ret =3D loadvm_process_command(f);
             trace_qemu_loadvm_state_section_command(ret);
-            if ((ret < 0) || (ret & LOADVM_QUIT)) {
+            if ((ret < 0) || (ret =3D=3D LOADVM_QUIT)) {
                 goto out;
             }
             break;
--=20
2.21.0


