Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0F14287E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:52:20 +0100 (CET)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUfK-0001aq-Nb
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUR4-00088K-SD
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUR1-0003Gv-6d
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57896
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUR1-0003Gc-2E
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsd8GjCW5JufmDMdCUSgML54euu3q/B4ZPKHuX8cV3A=;
 b=Kp1n5WbjfrVOOSw+bozn+7PZ72v+h6ph6DYNAXFAgpK5wZVwjPyqWxflFdhXX5mVWphGN5
 vYCbcFRBt4lHQbLLTlhF+bmvNMk0+44tLjIQ+6UpLY6MpjAhJDUY8MKmIExFxKaspEQZjp
 OS/aiE3OVgw0XdPvChRYM+8iMQsxJdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-mciNwnduMQyJgNsyRARJ1w-1; Mon, 20 Jan 2020 05:37:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AAF31B18BC0;
 Mon, 20 Jan 2020 10:37:27 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C50A1BC6D;
 Mon, 20 Jan 2020 10:37:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/29] migration: Change SaveStateEntry.instance_id into
 uint32_t
Date: Mon, 20 Jan 2020 11:33:37 +0100
Message-Id: <20200120103340.25118-27-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mciNwnduMQyJgNsyRARJ1w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

It was always used as 32bit, so define it as used to be clear.
Instead of using -1 as the auto-gen magic value, we switch to
UINT32_MAX.  We also make sure that we don't auto-gen this value to
avoid overflowed instance IDs without being noticed.

Suggested-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/intc/apic_common.c        |  2 +-
 include/migration/register.h |  2 +-
 include/migration/vmstate.h  |  2 +-
 migration/savevm.c           | 18 ++++++++++--------
 stubs/vmstate.c              |  2 +-
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index f2c3a7f309..54b8731fca 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -268,7 +268,7 @@ static void apic_common_realize(DeviceState *dev, Error=
 **errp)
     APICCommonState *s =3D APIC_COMMON(dev);
     APICCommonClass *info;
     static DeviceState *vapic;
-    int instance_id =3D s->id;
+    uint32_t instance_id =3D s->id;
=20
     info =3D APIC_COMMON_GET_CLASS(s);
     info->realize(dev, errp);
diff --git a/include/migration/register.h b/include/migration/register.h
index 00c38ebe9f..c1dcff0f90 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -71,7 +71,7 @@ typedef struct SaveVMHandlers {
 } SaveVMHandlers;
=20
 int register_savevm_live(const char *idstr,
-                         int instance_id,
+                         uint32_t instance_id,
                          int version_id,
                          const SaveVMHandlers *ops,
                          void *opaque);
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ed74dd5624..01790b8d9b 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -1160,7 +1160,7 @@ bool vmstate_save_needed(const VMStateDescription *vm=
sd, void *opaque);
 #define  VMSTATE_INSTANCE_ID_ANY  -1
=20
 /* Returns: 0 on success, -1 on failure */
-int vmstate_register_with_alias_id(VMStateIf *obj, int instance_id,
+int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
                                    const VMStateDescription *vmsd,
                                    void *base, int alias_id,
                                    int required_for_version,
diff --git a/migration/savevm.c b/migration/savevm.c
index 8dab99efc4..adfdca26ac 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -233,7 +233,7 @@ typedef struct CompatEntry {
 typedef struct SaveStateEntry {
     QTAILQ_ENTRY(SaveStateEntry) entry;
     char idstr[256];
-    int instance_id;
+    uint32_t instance_id;
     int alias_id;
     int version_id;
     /* version id read from the stream */
@@ -667,10 +667,10 @@ void dump_vmstate_json_to_file(FILE *out_file)
     fclose(out_file);
 }
=20
-static int calculate_new_instance_id(const char *idstr)
+static uint32_t calculate_new_instance_id(const char *idstr)
 {
     SaveStateEntry *se;
-    int instance_id =3D 0;
+    uint32_t instance_id =3D 0;
=20
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (strcmp(idstr, se->idstr) =3D=3D 0
@@ -678,6 +678,8 @@ static int calculate_new_instance_id(const char *idstr)
             instance_id =3D se->instance_id + 1;
         }
     }
+    /* Make sure we never loop over without being noticed */
+    assert(instance_id !=3D VMSTATE_INSTANCE_ID_ANY);
     return instance_id;
 }
=20
@@ -755,7 +757,7 @@ static void savevm_state_handler_remove(SaveStateEntry =
*se)
    Meanwhile pass -1 as instance_id if you do not already have a clearly
    distinguishing id for all instances of your device class. */
 int register_savevm_live(const char *idstr,
-                         int instance_id,
+                         uint32_t instance_id,
                          int version_id,
                          const SaveVMHandlers *ops,
                          void *opaque)
@@ -809,7 +811,7 @@ void unregister_savevm(VMStateIf *obj, const char *idst=
r, void *opaque)
     }
 }
=20
-int vmstate_register_with_alias_id(VMStateIf *obj, int instance_id,
+int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
                                    const VMStateDescription *vmsd,
                                    void *opaque, int alias_id,
                                    int required_for_version,
@@ -1625,7 +1627,7 @@ int qemu_save_device_state(QEMUFile *f)
     return qemu_file_get_error(f);
 }
=20
-static SaveStateEntry *find_se(const char *idstr, int instance_id)
+static SaveStateEntry *find_se(const char *idstr, uint32_t instance_id)
 {
     SaveStateEntry *se;
=20
@@ -2292,7 +2294,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, Migration=
IncomingState *mis)
     /* Find savevm section */
     se =3D find_se(idstr, instance_id);
     if (se =3D=3D NULL) {
-        error_report("Unknown savevm section or instance '%s' %d. "
+        error_report("Unknown savevm section or instance '%s' %"PRIu32". "
                      "Make sure that your current VM setup matches your "
                      "saved VM setup, including any hotplugged devices",
                      idstr, instance_id);
@@ -2316,7 +2318,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, Migration=
IncomingState *mis)
=20
     ret =3D vmstate_load(f, se);
     if (ret < 0) {
-        error_report("error while loading state for instance 0x%x of"
+        error_report("error while loading state for instance 0x%"PRIx32" o=
f"
                      " device '%s'", instance_id, idstr);
         return ret;
     }
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index 6951d9fdc5..cc4fe41dfc 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -4,7 +4,7 @@
 const VMStateDescription vmstate_dummy =3D {};
=20
 int vmstate_register_with_alias_id(VMStateIf *obj,
-                                   int instance_id,
+                                   uint32_t instance_id,
                                    const VMStateDescription *vmsd,
                                    void *base, int alias_id,
                                    int required_for_version,
--=20
2.24.1


