Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FEE2CA37F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:13:05 +0100 (CET)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5Sp-0003eC-VG
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk5RC-0002Ke-GZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:11:22 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:22045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk5R7-0000TE-6t
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:11:22 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-x2NhmYODPkSeqDqqlBpiJA-1; Tue, 01 Dec 2020 08:11:10 -0500
X-MC-Unique: x2NhmYODPkSeqDqqlBpiJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FBDC100C660;
 Tue,  1 Dec 2020 13:11:09 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE6B19C44;
 Tue,  1 Dec 2020 13:11:03 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Remove "compat" property of server class POWER
 CPUs
Date: Tue,  1 Dec 2020 14:11:03 +0100
Message-Id: <20201201131103.897430-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property has been deprecated since QEMU 5.0 by commit 22062e54bb68.
We only kept a legacy hack that internally converts "compat" into the
official "max-cpu-compat" property of the pseries machine type.

According to our deprecation policy, we could have removed it for QEMU 5.2
already. Do it now ; since ppc_cpu_parse_featurestr() now just calls the
generic parent_parse_features handler, drop it as well.

Users are supposed to use the "max-cpu-compat" property of the pseries
machine type instead.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 docs/system/deprecated.rst      |  7 ----
 target/ppc/translate_init.c.inc | 59 ---------------------------------
 2 files changed, 66 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e84..09c8f380bc82 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -281,13 +281,6 @@ a future version of QEMU. It's unclear whether anybody=
 is still using
 CPU emulation in QEMU, and there are no test images available to make
 sure that the code is still working.
=20
-``compat`` property of server class POWER CPUs (since 5.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``compat`` property used to set backwards compatibility modes for
-the processor has been deprecated. The ``max-cpu-compat`` property of
-the ``pseries`` machine type should be used instead.
-
 ``lm32`` CPUs (since 5.2.0)
 '''''''''''''''''''''''''''
=20
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.=
inc
index 78cc8f043b92..e4082cfde746 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10470,63 +10470,6 @@ static ObjectClass *ppc_cpu_class_by_name(const ch=
ar *name)
     return oc;
 }
=20
-static void ppc_cpu_parse_featurestr(const char *type, char *features,
-                                     Error **errp)
-{
-    Object *machine =3D qdev_get_machine();
-    const PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(object_class_by_name(=
type));
-
-    if (!features) {
-        return;
-    }
-
-    if (object_property_find(machine, "max-cpu-compat")) {
-        int i;
-        char **inpieces;
-        char *s =3D features;
-        Error *local_err =3D NULL;
-        char *compat_str =3D NULL;
-
-        /*
-         * Backwards compatibility hack:
-         *
-         *   CPUs had a "compat=3D" property which didn't make sense for
-         *   anything except pseries.  It was replaced by "max-cpu-compat"
-         *   machine option.  This supports old command lines like
-         *       -cpu POWER8,compat=3Dpower7
-         *   By stripping the compat option and applying it to the machine
-         *   before passing it on to the cpu level parser.
-         */
-        inpieces =3D g_strsplit(features, ",", 0);
-        *s =3D '\0';
-        for (i =3D 0; inpieces[i]; i++) {
-            if (g_str_has_prefix(inpieces[i], "compat=3D")) {
-                warn_report_once("CPU 'compat' property is deprecated; "
-                    "use max-cpu-compat machine property instead");
-                compat_str =3D inpieces[i];
-                continue;
-            }
-            if ((i !=3D 0) && (s !=3D features)) {
-                s =3D g_stpcpy(s, ",");
-            }
-            s =3D g_stpcpy(s, inpieces[i]);
-        }
-
-        if (compat_str) {
-            char *v =3D compat_str + strlen("compat=3D");
-            object_property_set_str(machine, "max-cpu-compat", v, &local_e=
rr);
-        }
-        g_strfreev(inpieces);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
-    /* do property processing with generic handler */
-    pcc->parent_parse_features(type, features, errp);
-}
-
 PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc)
 {
     ObjectClass *oc =3D OBJECT_CLASS(pcc);
@@ -10905,8 +10848,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
=20
     cc->class_by_name =3D ppc_cpu_class_by_name;
-    pcc->parent_parse_features =3D cc->parse_features;
-    cc->parse_features =3D ppc_cpu_parse_featurestr;
     cc->has_work =3D ppc_cpu_has_work;
     cc->do_interrupt =3D ppc_cpu_do_interrupt;
     cc->cpu_exec_interrupt =3D ppc_cpu_exec_interrupt;
--=20
2.26.2


