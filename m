Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EB35A2BC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:11:30 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtjF-0000VD-Ji
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUtbs-0001CU-QS
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:03:52 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:25938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUtbr-0006B7-AK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:03:52 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-YR73Y4-ePRGjhmw8aXBz5A-1; Fri, 09 Apr 2021 12:03:46 -0400
X-MC-Unique: YR73Y4-ePRGjhmw8aXBz5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEDB81883533;
 Fri,  9 Apr 2021 16:03:45 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-173.ams2.redhat.com [10.36.114.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D825C230;
 Fri,  9 Apr 2021 16:03:43 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] cpu/core: Fix "help" of CPU core device types
Date: Fri,  9 Apr 2021 18:03:39 +0200
Message-Id: <20210409160339.500167-3-groug@kaod.org>
In-Reply-To: <20210409160339.500167-1-groug@kaod.org>
References: <20210409160339.500167-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calling qdev_get_machine() from a QOM instance_init function is
fragile because we can't be sure the machine object actually
exists. And this happens to break when passing ",help" on the
command line to get the list of properties for a CPU core
device types :

$ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
qemu-system-ppc64: ../../hw/core/machine.c:1290:
 qdev_get_machine: Assertion `machine !=3D NULL' failed.
Aborted (core dumped)

This used to work before QEMU 5.0, but commit 3df261b6676b
unwillingly introduced a subtle regression : the above command
line needs to create an instance but the instance_init function
of the base class calls qdev_get_machine() before
qemu_create_machine() has been called, which is a programming bug.

Use current_machine instead. It is okay to skip the setting of
nr_thread in this case since only its type is displayed.

Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 3df261b6676b ("softmmu/vl.c: Handle '-cpu help' and '-device help' b=
efore 'no default machine'")
Cc: peter.maydell@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/cpu/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 92d3b2fbad62..987607515574 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -66,10 +66,16 @@ static void core_prop_set_nr_threads(Object *obj, Visit=
or *v, const char *name,
=20
 static void cpu_core_instance_init(Object *obj)
 {
-    MachineState *ms =3D MACHINE(qdev_get_machine());
     CPUCore *core =3D CPU_CORE(obj);
=20
-    core->nr_threads =3D ms->smp.threads;
+    /*
+     * Only '-device something-cpu-core,help' can get us there before
+     * the machine has been created. We don't care to set nr_threads
+     * in this case since it isn't used afterwards.
+     */
+    if (current_machine) {
+        core->nr_threads =3D current_machine->smp.threads;
+    }
 }
=20
 static void cpu_core_class_init(ObjectClass *oc, void *data)
--=20
2.26.3


