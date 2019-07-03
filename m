Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E55EEB7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:43:05 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hin1s-0001Ak-M2
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38510)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1himW6-0006b6-Ih
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1himW4-0007VL-Dg
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1himW4-0007HC-6Q
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 404A730842D1;
 Wed,  3 Jul 2019 21:09:50 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C785C5C29A;
 Wed,  3 Jul 2019 21:09:49 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 18:08:12 -0300
Message-Id: <20190703210821.27550-35-ehabkost@redhat.com>
In-Reply-To: <20190703210821.27550-1-ehabkost@redhat.com>
References: <20190703210821.27550-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 03 Jul 2019 21:09:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v5 34/43] i386: Get model-id from CPU object on
 "-cpu help"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When introducing versioned CPU models, the string at
X86CPUDefinition::model_id might not be the model-id we'll really
use.  Instantiate a CPU object and check the model-id property on
"-cpu help"

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190628002844.24894-4-ehabkost@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8852b57c0b..a0e422adf3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3837,18 +3837,28 @@ static GSList *get_sorted_cpu_model_list(void)
     return list;
 }
=20
+static char *x86_cpu_class_get_model_id(X86CPUClass *xc)
+{
+    Object *obj =3D object_new(object_class_get_name(OBJECT_CLASS(xc)));
+    char *r =3D object_property_get_str(obj, "model-id", &error_abort);
+    object_unref(obj);
+    return r;
+}
+
 static void x86_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc =3D data;
     X86CPUClass *cc =3D X86_CPU_CLASS(oc);
     char *name =3D x86_cpu_class_get_model_name(cc);
-    const char *desc =3D cc->model_description;
-    if (!desc && cc->cpu_def) {
-        desc =3D cc->cpu_def->model_id;
+    char *desc =3D g_strdup(cc->model_description);
+
+    if (!desc) {
+        desc =3D x86_cpu_class_get_model_id(cc);
     }
=20
     qemu_printf("x86 %-20s  %-48s\n", name, desc);
     g_free(name);
+    g_free(desc);
 }
=20
 /* list available CPU models and flags */
--=20
2.18.0.rc1.1.g3f1ff2140


