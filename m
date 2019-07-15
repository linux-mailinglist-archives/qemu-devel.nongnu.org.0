Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCD68CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 15:55:25 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1Rs-000649-Cq
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 09:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hn1Pk-0005LE-Fb
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hn1Pj-0003nQ-7b
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:53:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hn1Pj-0003nA-05
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:53:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 496FC30C2534;
 Mon, 15 Jul 2019 13:53:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04F755B681;
 Mon, 15 Jul 2019 13:53:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 15:51:22 +0200
Message-Id: <20190715135125.17770-19-quintela@redhat.com>
In-Reply-To: <20190715135125.17770-1-quintela@redhat.com>
References: <20190715135125.17770-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 15 Jul 2019 13:53:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 18/21] migration: allow private destination ram
 with x-ignore-shared
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>, Xu Wang <xu@hyper.sh>,
 Jiangshan Lai <laijs@hyper.sh>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Tao <tao.peng@linux.alibaba.com>

By removing the share ram check, qemu is able to migrate
to private destination ram when x-ignore-shared capability
is on. Then we can create multiple destination VMs based
on the same source VM.

This changes the x-ignore-shared migration capability to
work similar to Lai's original bypass-shared-memory
work(https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg00003.html)
which enables kata containers (https://katacontainers.io)
to implement the VM templating feature.

An example usage in kata containers(https://katacontainers.io):
1. Start the source VM:
   qemu-system-x86 -m 2G \
     -object memory-backend-file,id=3Dmem0,size=3D2G,share=3Don,mem-path=3D=
/tmpfs/template-memory \
     -numa node,memdev=3Dmem0
2. Stop the template VM, set migration x-ignore-shared capability,
   migrate "exec:cat>/tmpfs/state", quit it
3. Start target VM:
   qemu-system-x86 -m 2G \
     -object memory-backend-file,id=3Dmem0,size=3D2G,share=3Doff,mem-path=
=3D/tmpfs/template-memory \
     -numa node,memdev=3Dmem0 \
     -incoming defer
4. connect to target VM qmp, set migration x-ignore-shared capability,
migrate_incoming "exec:cat /tmpfs/state"
5. create more target VMs repeating 3 and 4

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Yury Kotov <yury-kotov@yandex-team.ru>
Cc: Jiangshan Lai <laijs@hyper.sh>
Cc: Xu Wang <xu@hyper.sh>
Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <1560494113-1141-1-git-send-email-tao.peng@linux.alibaba.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 8a6ad61d3d..8622b4dc49 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3426,7 +3426,6 @@ static int ram_save_setup(QEMUFile *f, void *opaque=
)
         }
         if (migrate_ignore_shared()) {
             qemu_put_be64(f, block->mr->addr);
-            qemu_put_byte(f, ramblock_is_ignored(block) ? 1 : 0);
         }
     }
=20
@@ -4393,12 +4392,6 @@ static int ram_load(QEMUFile *f, void *opaque, int=
 version_id)
                     }
                     if (migrate_ignore_shared()) {
                         hwaddr addr =3D qemu_get_be64(f);
-                        bool ignored =3D qemu_get_byte(f);
-                        if (ignored !=3D ramblock_is_ignored(block)) {
-                            error_report("RAM block %s should %s be migr=
ated",
-                                         id, ignored ? "" : "not");
-                            ret =3D -EINVAL;
-                        }
                         if (ramblock_is_ignored(block) &&
                             block->mr->addr !=3D addr) {
                             error_report("Mismatched GPAs for block %s "
--=20
2.21.0


