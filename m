Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51E531196
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:26:50 +0200 (CEST)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9xJ-0007K3-VX
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nt9mW-0007bA-CB
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:15:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nt9mF-0001Kb-0s
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:15:39 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L6LQm3hjtz67qQW;
 Mon, 23 May 2022 23:12:00 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 23 May 2022 17:15:10 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 16:15:09 +0100
Date: Mon, 23 May 2022 16:15:07 +0100
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>, <k.jensen@samsung.com>,
 <dave@stgolabs.net>, Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v10 27/45] hw/cxl/host: Add support for CXL Fixed Memory
 Windows.
Message-ID: <20220523161507.00006a3a@huawei.com>
In-Reply-To: <0c0055ac-8d94-37d9-62c2-58c3da5461d3@redhat.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
 <20220429144110.25167-28-Jonathan.Cameron@huawei.com>
 <0c0055ac-8d94-37d9-62c2-58c3da5461d3@redhat.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml737-chm.china.huawei.com (10.201.108.187) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Sat, 21 May 2022 11:07:13 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 4/29/22 16:40, Jonathan Cameron via wrote:
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> >=20
> > The concept of these is introduced in [1] in terms of the
> > description the CEDT ACPI table. The principal is more general.
> > Unlike once traffic hits the CXL root bridges, the host system
> > memory address routing is implementation defined and effectively
> > static once observable by standard / generic system software.
> > Each CXL Fixed Memory Windows (CFMW) is a region of PA space
> > which has fixed system dependent routing configured so that
> > accesses can be routed to the CXL devices below a set of target
> > root bridges. The accesses may be interleaved across multiple
> > root bridges.
> >=20
> > For QEMU we could have fully specified these regions in terms
> > of a base PA + size, but as the absolute address does not matter
> > it is simpler to let individual platforms place the memory regions.
> >=20
> > ExampleS:
> > -cxl-fixed-memory-window targets.0=3Dcxl.0,size=3D128G
> > -cxl-fixed-memory-window targets.0=3Dcxl.1,size=3D128G
> > -cxl-fixed-memory-window targets.0=3Dcxl0,targets.1=3Dcxl.1,size=3D256G=
,interleave-granularity=3D2k =20
>=20


> Sorry for the late review, but: no more command line options should
> be added to QEMU.  This should be:
>=20
> -M cxl-fmw.0.targets.0=3Dcxl.0,cxl-fmw.0.size=3D128G \
> -M cxl-fmw.1.targets.0=3Dcxl.1,cxl-fmw.1.size=3D128G \
> -M cxl-fmw.2.targets.0=3Dcxl.0,cxl-fmw.2.targets.1=3Dcxl.1,cxl-fmw.2.size=
=3D128G,cxl-fmw.2.interleave-granularity=3D2k
>

Hi Paolo,

I thought I had this working but have run into an issue where the parser
seems not to like multiple parts of cxl-fmw as below being in different
-M entries.  I get

qemu-system-aarch64: -M cxl-fmw.1.targets.0=3Dcxl.1,cxl-fmw.1.size=3D4G,cxl=
-fmw.1.interleave-granularity=3D8k: Parameters 'cxl-fmw.*' used inconsisten=
tly

Seems it doesn't let me have multiple elements of a list in different -M en=
tries.

Not a disaster but it's going to lead to some unreadable command lines.

Very lightly tested patch below.  I've not yet looked at movingstuff
to machine specific callbacks as per your other comment.  I recall that was=
n't
easy to do with an earlier version of the series, but given a lot has chang=
ed
since then it might now easier to accomplish.

Thanks,

Jonathan

> I'm not against adding a shortcut as above, but the implementation should
> be entirely in MachineState using a QOM property.
>=20
> The reason for this is that we're looking into doing machine setup entire=
ly
> via RPC, and any extra option is a new command to be implemented.
>=20
> Would you be able to do the change?  Since you are already using QAPI to
> deserialize the option it should not be hard.  I can promise a quick revi=
ew,
> and I can also provide with an example conversion for -boot at
> https://lore.kernel.org/r/20220414165300.555321-3-pbonzini@redhat.com/.

=46rom d856959a08513b098fda22472f0b870750910543 Mon Sep 17 00:00:00 2001
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Date: Mon, 23 May 2022 16:07:45 +0100
Subject: [PATCH] hw/cxl: Make the CXL fixed memory window setup a machine
 parameter.

Paolo Bonzini requested this change to simplify the ongoing
effort to allow machine setup entirely via RPC.

Includes shortening the command line form cxl-fixed-memory-window
to cxl-fmw as the command lines are extremely long even with this
change.

The json change is needed to ensure that there is
a CXLFixedMemoryWindowOptionsList even though the actual
element in the json is never used.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/core/machine.c   | 33 +++++++++++++++++++++++++++++++
 include/hw/boards.h |  1 +
 qapi/machine.json   | 13 +++++++++++++
 softmmu/vl.c        | 47 ++++-----------------------------------------
 4 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index bb0dc8f6a9..93b3b8d34a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -920,6 +920,33 @@ out_free:
     qapi_free_BootConfiguration(config);
 }
=20
+static void machine_get_cfmw(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+    CXLFixedMemoryWindowOptionsList *list =3D ms->cfmws_list;
+
+    visit_type_CXLFixedMemoryWindowOptionsList(v, name, &list, errp);
+}
+
+static void machine_set_cfmw(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+    CXLFixedMemoryWindowOptionsList *cfmw_list =3D NULL;
+    CXLFixedMemoryWindowOptionsList *it;
+
+    visit_type_CXLFixedMemoryWindowOptionsList(v, name, &cfmw_list, errp);
+    if (!cfmw_list) {
+        return;
+    }
+
+    for (it =3D cfmw_list; it; it =3D it->next) {
+        cxl_fixed_memory_window_config(current_machine, it->value, errp);
+    }
+    ms->cfmws_list =3D cfmw_list;
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -966,6 +993,12 @@ static void machine_class_init(ObjectClass *oc, void *=
data)
     object_class_property_set_description(oc, "boot",
         "Boot configuration");
=20
+    object_class_property_add(oc, "cxl-fmw", "CXLFixedMemoryWindow",
+        machine_get_cfmw, machine_set_cfmw,
+        NULL, NULL);
+    object_class_property_set_description(oc, "cxl-fmw",
+        "CXL Fixed Memory Window");
+
     object_class_property_add(oc, "smp", "SMPConfiguration",
         machine_get_smp, machine_set_smp,
         NULL, NULL);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index fa57bac4fb..dd9fc56df2 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -362,6 +362,7 @@ struct MachineState {
     struct NVDIMMState *nvdimms_state;
     struct CXLState *cxl_devices_state;
     struct NumaState *numa_state;
+    CXLFixedMemoryWindowOptionsList *cfmws_list;
 };
=20
 #define DEFINE_MACHINE(namestr, machine_initfn) \
diff --git a/qapi/machine.json b/qapi/machine.json
index 883ce3f9ea..b17ac79494 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -523,6 +523,19 @@
       '*interleave-granularity': 'size',
       'targets': ['str'] }}
=20
+##
+# @CXLFMWProperties:
+#
+# List of CXL Fixed Memory Windows.
+#
+# @cxl-fmw: List of CXLFixedMemoryWindowOptions
+#
+# Since 7.1
+##
+{ 'struct' : 'CXLFMWProperties',
+  'data': { 'cxl-fmw': ['CXLFixedMemoryWindowOptions'] }
+}
+
 ##
 # @X86CPURegister32:
 #
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 84a31eba76..01997968f5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -147,11 +147,6 @@ typedef struct BlockdevOptionsQueueEntry {
=20
 typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
=20
-typedef struct CXLFMWOptionQueueEntry {
-    CXLFixedMemoryWindowOptions *opts;
-    Location loc;
-    QSIMPLEQ_ENTRY(CXLFMWOptionQueueEntry) entry;
-} CXLFMWOptionQueueEntry;
=20
 typedef struct ObjectOption {
     ObjectOptions *opts;
@@ -179,8 +174,7 @@ static int snapshot;
 static bool preconfig_requested;
 static QemuPluginList plugin_list =3D QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue =3D QSIMPLEQ_HEAD_INITIALIZER(bdo_qu=
eue);
-static QSIMPLEQ_HEAD(, CXLFMWOptionQueueEntry) CXLFMW_opts =3D
-    QSIMPLEQ_HEAD_INITIALIZER(CXLFMW_opts);
+
 static bool nographic =3D false;
 static int mem_prealloc; /* force preallocation of physical target memory =
*/
 static const char *vga_model =3D NULL;
@@ -1165,24 +1159,6 @@ static void parse_display(const char *p)
     }
 }
=20
-static void parse_cxl_fixed_memory_window(const char *optarg)
-{
-    CXLFMWOptionQueueEntry *cfmws_entry;
-    Visitor *v;
-
-    v =3D qobject_input_visitor_new_str(optarg, "cxl-fixed-memory-window",
-                                      &error_fatal);
-    cfmws_entry =3D g_new(CXLFMWOptionQueueEntry, 1);
-    visit_type_CXLFixedMemoryWindowOptions(v, NULL, &cfmws_entry->opts,
-                                           &error_fatal);
-    if (!cfmws_entry->opts) {
-        exit(1);
-    }
-    visit_free(v);
-    loc_save(&cfmws_entry->loc);
-    QSIMPLEQ_INSERT_TAIL(&CXLFMW_opts, cfmws_entry, entry);
-}
-
 static inline bool nonempty_str(const char *str)
 {
     return str && *str;
@@ -2045,20 +2021,6 @@ static void qemu_create_late_backends(void)
     qemu_semihosting_console_init();
 }
=20
-static void cxl_set_opts(void)
-{
-    while (!QSIMPLEQ_EMPTY(&CXLFMW_opts)) {
-        CXLFMWOptionQueueEntry *cfmws_entry =3D QSIMPLEQ_FIRST(&CXLFMW_opt=
s);
-
-        loc_restore(&cfmws_entry->loc);
-        QSIMPLEQ_REMOVE_HEAD(&CXLFMW_opts, entry);
-        cxl_fixed_memory_window_config(current_machine, cfmws_entry->opts,
-                                       &error_fatal);
-        qapi_free_CXLFixedMemoryWindowOptions(cfmws_entry->opts);
-        g_free(cfmws_entry);
-    }
-}
-
 static void qemu_resolve_machine_memdev(void)
 {
     if (ram_memdev_id) {
@@ -2187,6 +2149,7 @@ static bool is_qemuopts_group(const char *group)
         g_str_equal(group, "machine") ||
         g_str_equal(group, "smp-opts") ||
         g_str_equal(group, "boot-opts") ||
+        g_str_equal(group, "cxl-fmw") ||
         g_str_equal(group, "memory")) {
         return false;
     }
@@ -2213,6 +2176,8 @@ static void qemu_record_config_group(const char *grou=
p, QDict *dict,
         machine_merge_property("boot", dict, &error_fatal);
     } else if (g_str_equal(group, "memory")) {
         machine_merge_property("memory", dict, &error_fatal);
+    } else if (g_str_equal(group, "cxl-fmw")) {
+        machine_merge_property("cxl-fmw", dict, &error_fatal);
     } else {
         abort();
     }
@@ -2886,9 +2851,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-            case QEMU_OPTION_cxl_fixed_memory_window:
-                parse_cxl_fixed_memory_window(optarg);
-                break;
             case QEMU_OPTION_display:
                 parse_display(optarg);
                 break;
@@ -3724,7 +3686,6 @@ void qemu_init(int argc, char **argv, char **envp)
=20
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
-    cxl_set_opts();
=20
     if (vmstate_dump_file) {
         /* dump and exit */
--=20
2.32.0



