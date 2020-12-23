Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7442E2267
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:22:19 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCWO-00056v-0j
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCML-0004vE-Lb
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCMC-0001yY-C4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yw32kpNrAM58RhhRY3X7aQP2UjDkMbupIqfd+rZ3llY=;
 b=WZluWD3j9v6Lm2f7P9u7TXOT+CKvljGXxe2CmnAb9BC5LMH5SV+UwwBsAWHJVTCMfP6rmG
 9d66e7PMnIoLgYnaCS0RY/MYMrg2AFEIOtVrHL2dUvhhHVuuN6qHVTXIM5h5JCep4fpgfA
 HrpWtj9Cd4fXRSMw5UkqeX+yLvqasMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-kc6ZalGMNV6WjVJhbFLY6g-1; Wed, 23 Dec 2020 17:11:28 -0500
X-MC-Unique: kc6ZalGMNV6WjVJhbFLY6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC90107ACF6;
 Wed, 23 Dec 2020 22:11:25 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C49E75D747;
 Wed, 23 Dec 2020 22:11:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] qapi: Use QAPI_LIST_PREPEND() where possible
Date: Wed, 23 Dec 2020 16:10:59 -0600
Message-Id: <20201223221102.390740-5-eblake@redhat.com>
In-Reply-To: <20201223221102.390740-1-eblake@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 armbru@redhat.com, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 "open list:S390 KVM CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Anywhere we create a list of just one item or by prepending items
(typically because order doesn't matter), we can use the
QAPI_LIST_PREPEND macro.  But places where we must keep the list in
order by appending remain open-coded until later patches.

Note that as a side effect, this also performs a cleanup of two minor
issues in qga/commands-posix.c: the old code was performing
 new = g_malloc0(sizeof(*ret));
which 1) is confusing because you have to verify whether 'new' and
'ret' are variables with the same type, and 2) would conflict with C++
compilation (not an actual problem for this file, but makes
copy-and-paste harder).

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/writing-qmp-commands.txt |  12 +--
 block/gluster.c                     |   4 +-
 block/qapi.c                        |   7 +-
 chardev/char.c                      |  20 ++---
 hw/core/machine-qmp-cmds.c          |  38 +++-------
 hw/core/machine.c                   |  11 +--
 hw/net/rocker/rocker_of_dpa.c       |  20 ++---
 hw/net/virtio-net.c                 |  21 ++----
 migration/migration.c               |   7 +-
 migration/postcopy-ram.c            |   7 +-
 monitor/hmp-cmds.c                  |  13 ++--
 monitor/misc.c                      |  25 +++---
 monitor/qmp-cmds-control.c          |  10 +--
 qemu-img.c                          |   5 +-
 qga/commands-posix-ssh.c            |   7 +-
 qga/commands-posix.c                |  47 +++---------
 qga/commands-win32.c                |  32 ++------
 qga/commands.c                      |   6 +-
 qom/qom-qmp-cmds.c                  |  29 ++-----
 target/arm/helper.c                 |   6 +-
 target/arm/monitor.c                |  13 +---
 target/i386/cpu.c                   |   6 +-
 target/mips/cpu.c                   |   6 +-
 target/s390x/cpu_models.c           |  12 +--
 tests/test-clone-visitor.c          |   7 +-
 tests/test-qobject-output-visitor.c |  42 +++++------
 tests/test-visitor-serialization.c  | 113 ++++------------------------
 trace/qmp.c                         |  22 +++---
 ui/input.c                          |  16 ++--
 ui/vnc.c                            |  21 ++----
 util/qemu-config.c                  |  14 +---
 target/ppc/translate_init.c.inc     |  12 +--
 32 files changed, 169 insertions(+), 442 deletions(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 28984686c970..258e63bff5ee 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -531,15 +531,11 @@ TimerAlarmMethodList *qmp_query_alarm_methods(Error **errp)
     bool current = true;

     for (p = alarm_timers; p->name; p++) {
-        TimerAlarmMethodList *info = g_malloc0(sizeof(*info));
-        info->value = g_malloc0(sizeof(*info->value));
-        info->value->method_name = g_strdup(p->name);
-        info->value->current = current;
-
+        TimerAlarmMethod *value = g_malloc0(*value);
+        value->method_name = g_strdup(p->name);
+        value->current = current;
+        QAPI_LIST_PREPEND(method_list, value);
         current = false;
-
-        info->next = method_list;
-        method_list = info;
     }

     return method_list;
diff --git a/block/gluster.c b/block/gluster.c
index 4f1448e2bc88..1f8699b93835 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -359,8 +359,8 @@ static int qemu_gluster_parse_uri(BlockdevOptionsGluster *gconf,
         return -EINVAL;
     }

-    gconf->server = g_new0(SocketAddressList, 1);
-    gconf->server->value = gsconf = g_new0(SocketAddress, 1);
+    gsconf = g_new0(SocketAddress, 1);
+    QAPI_LIST_PREPEND(gconf->server, gsconf);

     /* transport */
     if (!uri->scheme || !strcmp(uri->scheme, "gluster")) {
diff --git a/block/qapi.c b/block/qapi.c
index 036da085eea6..0ca206f559fe 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -486,12 +486,7 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
     ds->account_failed = stats->account_failed;

     while ((ts = block_acct_interval_next(stats, ts))) {
-        BlockDeviceTimedStatsList *timed_stats =
-            g_malloc0(sizeof(*timed_stats));
         BlockDeviceTimedStats *dev_stats = g_malloc0(sizeof(*dev_stats));
-        timed_stats->next = ds->timed_stats;
-        timed_stats->value = dev_stats;
-        ds->timed_stats = timed_stats;

         TimedAverage *rd = &ts->latency[BLOCK_ACCT_READ];
         TimedAverage *wr = &ts->latency[BLOCK_ACCT_WRITE];
@@ -515,6 +510,8 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
             block_acct_queue_depth(ts, BLOCK_ACCT_READ);
         dev_stats->avg_wr_queue_depth =
             block_acct_queue_depth(ts, BLOCK_ACCT_WRITE);
+
+        QAPI_LIST_PREPEND(ds->timed_stats, dev_stats);
     }

     bdrv_latency_histogram_stats(&stats->latency_histogram[BLOCK_ACCT_READ],
diff --git a/chardev/char.c b/chardev/char.c
index a9b8c5a9aac6..288efebd1257 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -776,15 +776,13 @@ static int qmp_query_chardev_foreach(Object *obj, void *data)
 {
     Chardev *chr = CHARDEV(obj);
     ChardevInfoList **list = data;
-    ChardevInfoList *info = g_malloc0(sizeof(*info));
+    ChardevInfo *value = g_malloc0(sizeof(*value));

-    info->value = g_malloc0(sizeof(*info->value));
-    info->value->label = g_strdup(chr->label);
-    info->value->filename = g_strdup(chr->filename);
-    info->value->frontend_open = chr->be && chr->be->fe_open;
+    value->label = g_strdup(chr->label);
+    value->filename = g_strdup(chr->filename);
+    value->frontend_open = chr->be && chr->be->fe_open;

-    info->next = *list;
-    *list = info;
+    QAPI_LIST_PREPEND(*list, value);

     return 0;
 }
@@ -803,12 +801,10 @@ static void
 qmp_prepend_backend(const char *name, void *opaque)
 {
     ChardevBackendInfoList **list = opaque;
-    ChardevBackendInfoList *info = g_malloc0(sizeof(*info));
+    ChardevBackendInfo *value = g_new0(ChardevBackendInfo, 1);

-    info->value = g_malloc0(sizeof(*info->value));
-    info->value->name = g_strdup(name);
-    info->next = *list;
-    *list = info;
+    value->name = g_strdup(name);
+    QAPI_LIST_PREPEND(*list, value);
 }

 ChardevBackendInfoList *qmp_query_chardev_backends(Error **errp)
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 87f14140a381..156223a344ed 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -215,7 +215,6 @@ MachineInfoList *qmp_query_machines(Error **errp)

     for (el = machines; el; el = el->next) {
         MachineClass *mc = el->data;
-        MachineInfoList *entry;
         MachineInfo *info;

         info = g_malloc0(sizeof(*info));
@@ -243,10 +242,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
             info->has_default_ram_id = true;
         }

-        entry = g_malloc0(sizeof(*entry));
-        entry->value = info;
-        entry->next = mach_list;
-        mach_list = entry;
+        QAPI_LIST_PREPEND(mach_list, info);
     }

     g_slist_free(machines);
@@ -297,41 +293,31 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 static int query_memdev(Object *obj, void *opaque)
 {
     MemdevList **list = opaque;
-    MemdevList *m = NULL;
+    Memdev *m;
     QObject *host_nodes;
     Visitor *v;

     if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
         m = g_malloc0(sizeof(*m));

-        m->value = g_malloc0(sizeof(*m->value));
+        m->id = g_strdup(object_get_canonical_path_component(obj));
+        m->has_id = !!m->id;

-        m->value->id = g_strdup(object_get_canonical_path_component(obj));
-        m->value->has_id = !!m->value->id;
-
-        m->value->size = object_property_get_uint(obj, "size",
-                                                  &error_abort);
-        m->value->merge = object_property_get_bool(obj, "merge",
-                                                   &error_abort);
-        m->value->dump = object_property_get_bool(obj, "dump",
-                                                  &error_abort);
-        m->value->prealloc = object_property_get_bool(obj,
-                                                      "prealloc",
-                                                      &error_abort);
-        m->value->policy = object_property_get_enum(obj,
-                                                    "policy",
-                                                    "HostMemPolicy",
-                                                    &error_abort);
+        m->size = object_property_get_uint(obj, "size", &error_abort);
+        m->merge = object_property_get_bool(obj, "merge", &error_abort);
+        m->dump = object_property_get_bool(obj, "dump", &error_abort);
+        m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
+        m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
+                                             &error_abort);
         host_nodes = object_property_get_qobject(obj,
                                                  "host-nodes",
                                                  &error_abort);
         v = qobject_input_visitor_new(host_nodes);
-        visit_type_uint16List(v, NULL, &m->value->host_nodes, &error_abort);
+        visit_type_uint16List(v, NULL, &m->host_nodes, &error_abort);
         visit_free(v);
         qobject_unref(host_nodes);

-        m->next = *list;
-        *list = m;
+        QAPI_LIST_PREPEND(*list, m);
     }

     return 0;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 05dcaf09c9e3..de3b8f1b3180 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -504,11 +504,7 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,

 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 {
-    strList *item = g_new0(strList, 1);
-
-    item->value = g_strdup(type);
-    item->next = mc->allowed_dynamic_sysbus_devices;
-    mc->allowed_dynamic_sysbus_devices = item;
+    QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
 }

 static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
@@ -569,7 +565,6 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)

     for (i = 0; i < machine->possible_cpus->len; i++) {
         Object *cpu;
-        HotpluggableCPUList *list_item = g_new0(typeof(*list_item), 1);
         HotpluggableCPU *cpu_item = g_new0(typeof(*cpu_item), 1);

         cpu_item->type = g_strdup(machine->possible_cpus->cpus[i].type);
@@ -582,9 +577,7 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
             cpu_item->has_qom_path = true;
             cpu_item->qom_path = object_get_canonical_path(cpu);
         }
-        list_item->value = cpu_item;
-        list_item->next = head;
-        head = list_item;
+        QAPI_LIST_PREPEND(head, cpu_item);
     }
     return head;
 }
diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index 8e347d1ee4a6..b3b8c5bb6d4b 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -2296,7 +2296,6 @@ static void of_dpa_flow_fill(void *cookie, void *value, void *user_data)
     struct of_dpa_flow_key *key = &flow->key;
     struct of_dpa_flow_key *mask = &flow->mask;
     struct of_dpa_flow_fill_context *flow_context = user_data;
-    RockerOfDpaFlowList *new;
     RockerOfDpaFlow *nflow;
     RockerOfDpaFlowKey *nkey;
     RockerOfDpaFlowMask *nmask;
@@ -2307,8 +2306,7 @@ static void of_dpa_flow_fill(void *cookie, void *value, void *user_data)
         return;
     }

-    new = g_malloc0(sizeof(*new));
-    nflow = new->value = g_malloc0(sizeof(*nflow));
+    nflow = g_malloc0(sizeof(*nflow));
     nkey = nflow->key = g_malloc0(sizeof(*nkey));
     nmask = nflow->mask = g_malloc0(sizeof(*nmask));
     naction = nflow->action = g_malloc0(sizeof(*naction));
@@ -2424,8 +2422,7 @@ static void of_dpa_flow_fill(void *cookie, void *value, void *user_data)
         naction->new_vlan_id = flow->action.apply.new_vlan_id;
     }

-    new->next = flow_context->list;
-    flow_context->list = new;
+    QAPI_LIST_PREPEND(flow_context->list, nflow);
 }

 RockerOfDpaFlowList *qmp_query_rocker_of_dpa_flows(const char *name,
@@ -2469,9 +2466,7 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
 {
     struct of_dpa_group *group = value;
     struct of_dpa_group_fill_context *flow_context = user_data;
-    RockerOfDpaGroupList *new;
     RockerOfDpaGroup *ngroup;
-    struct uint32List *id;
     int i;

     if (flow_context->type != 9 &&
@@ -2479,8 +2474,7 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
         return;
     }

-    new = g_malloc0(sizeof(*new));
-    ngroup = new->value = g_malloc0(sizeof(*ngroup));
+    ngroup = g_malloc0(sizeof(*ngroup));

     ngroup->id = group->id;

@@ -2525,10 +2519,7 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
         ngroup->index = ROCKER_GROUP_INDEX_GET(group->id);
         for (i = 0; i < group->l2_flood.group_count; i++) {
             ngroup->has_group_ids = true;
-            id = g_malloc0(sizeof(*id));
-            id->value = group->l2_flood.group_ids[i];
-            id->next = ngroup->group_ids;
-            ngroup->group_ids = id;
+            QAPI_LIST_PREPEND(ngroup->group_ids, group->l2_flood.group_ids[i]);
         }
         break;
     case ROCKER_OF_DPA_GROUP_TYPE_L3_UCAST:
@@ -2557,8 +2548,7 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
         break;
     }

-    new->next = flow_context->list;
-    flow_context->list = new;
+    QAPI_LIST_PREPEND(flow_context->list, ngroup);
 }

 RockerOfDpaGroupList *qmp_query_rocker_of_dpa_groups(const char *name,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 044ac95f6f28..8356eeec1316 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -437,17 +437,14 @@ static void rxfilter_notify(NetClientState *nc)

 static intList *get_vlan_table(VirtIONet *n)
 {
-    intList *list, *entry;
+    intList *list;
     int i, j;

     list = NULL;
     for (i = 0; i < MAX_VLAN >> 5; i++) {
         for (j = 0; n->vlans[i] && j <= 0x1f; j++) {
             if (n->vlans[i] & (1U << j)) {
-                entry = g_malloc0(sizeof(*entry));
-                entry->value = (i << 5) + j;
-                entry->next = list;
-                list = entry;
+                QAPI_LIST_PREPEND(list, (i << 5) + j);
             }
         }
     }
@@ -460,7 +457,7 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
     VirtIONet *n = qemu_get_nic_opaque(nc);
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     RxFilterInfo *info;
-    strList *str_list, *entry;
+    strList *str_list;
     int i;

     info = g_malloc0(sizeof(*info));
@@ -491,19 +488,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)

     str_list = NULL;
     for (i = 0; i < n->mac_table.first_multi; i++) {
-        entry = g_malloc0(sizeof(*entry));
-        entry->value = qemu_mac_strdup_printf(n->mac_table.macs + i * ETH_ALEN);
-        entry->next = str_list;
-        str_list = entry;
+        QAPI_LIST_PREPEND(str_list,
+                      qemu_mac_strdup_printf(n->mac_table.macs + i * ETH_ALEN));
     }
     info->unicast_table = str_list;

     str_list = NULL;
     for (i = n->mac_table.first_multi; i < n->mac_table.in_use; i++) {
-        entry = g_malloc0(sizeof(*entry));
-        entry->value = qemu_mac_strdup_printf(n->mac_table.macs + i * ETH_ALEN);
-        entry->next = str_list;
-        str_list = entry;
+        QAPI_LIST_PREPEND(str_list,
+                      qemu_mac_strdup_printf(n->mac_table.macs + i * ETH_ALEN));
     }
     info->multicast_table = str_list;
     info->vlan_table = get_vlan_table(n);
diff --git a/migration/migration.c b/migration/migration.c
index bba6e5148138..805712488e4d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -406,12 +406,9 @@ int migration_incoming_enable_colo(void)
 void migrate_add_address(SocketAddress *address)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-    SocketAddressList *addrs;

-    addrs = g_new0(SocketAddressList, 1);
-    addrs->next = mis->socket_address_list;
-    mis->socket_address_list = addrs;
-    addrs->value = QAPI_CLONE(SocketAddress, address);
+    QAPI_LIST_PREPEND(mis->socket_address_list,
+                      QAPI_CLONE(SocketAddress, address));
 }

 static void qemu_start_incoming_migration(const char *uri, Error **errp)
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d99842eb1be8..ab482adef10b 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -145,14 +145,11 @@ static struct PostcopyBlocktimeContext *blocktime_context_new(void)
 static uint32List *get_vcpu_blocktime_list(PostcopyBlocktimeContext *ctx)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    uint32List *list = NULL, *entry = NULL;
+    uint32List *list = NULL;
     int i;

     for (i = ms->smp.cpus - 1; i >= 0; i--) {
-        entry = g_new0(uint32List, 1);
-        entry->value = ctx->vcpu_blocktime[i];
-        entry->next = list;
-        list = entry;
+        QAPI_LIST_PREPEND(list, ctx->vcpu_blocktime[i]);
     }

     return list;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 65d8ff48494b..73b79df7d875 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1255,7 +1255,8 @@ void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
     const char *cap = qdict_get_str(qdict, "capability");
     bool state = qdict_get_bool(qdict, "state");
     Error *err = NULL;
-    MigrationCapabilityStatusList *caps = g_malloc0(sizeof(*caps));
+    MigrationCapabilityStatusList *caps = NULL;
+    MigrationCapabilityStatus *value;
     int val;

     val = qapi_enum_parse(&MigrationCapability_lookup, cap, -1, &err);
@@ -1263,14 +1264,14 @@ void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
         goto end;
     }

-    caps->value = g_malloc0(sizeof(*caps->value));
-    caps->value->capability = val;
-    caps->value->state = state;
-    caps->next = NULL;
+    value = g_malloc0(sizeof(*value));
+    value->capability = val;
+    value->state = state;
+    QAPI_LIST_PREPEND(caps, value);
     qmp_migrate_set_capabilities(caps, &err);
+    qapi_free_MigrationCapabilityStatusList(caps);

 end:
-    qapi_free_MigrationCapabilityStatusList(caps);
     hmp_handle_error(mon, err);
 }

diff --git a/monitor/misc.c b/monitor/misc.c
index fde6e36a0b54..f2ee7cd77a10 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1430,33 +1430,26 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)

     QEMU_LOCK_GUARD(&mon_fdsets_lock);
     QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-        FdsetInfoList *fdset_info = g_malloc0(sizeof(*fdset_info));
-        FdsetFdInfoList *fdsetfd_list = NULL;
+        FdsetInfo *fdset_info = g_malloc0(sizeof(*fdset_info));

-        fdset_info->value = g_malloc0(sizeof(*fdset_info->value));
-        fdset_info->value->fdset_id = mon_fdset->id;
+        fdset_info->fdset_id = mon_fdset->id;

         QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
-            FdsetFdInfoList *fdsetfd_info;
+            FdsetFdInfo *fdsetfd_info;

             fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
-            fdsetfd_info->value = g_malloc0(sizeof(*fdsetfd_info->value));
-            fdsetfd_info->value->fd = mon_fdset_fd->fd;
+            fdsetfd_info->fd = mon_fdset_fd->fd;
             if (mon_fdset_fd->opaque) {
-                fdsetfd_info->value->has_opaque = true;
-                fdsetfd_info->value->opaque = g_strdup(mon_fdset_fd->opaque);
+                fdsetfd_info->has_opaque = true;
+                fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
             } else {
-                fdsetfd_info->value->has_opaque = false;
+                fdsetfd_info->has_opaque = false;
             }

-            fdsetfd_info->next = fdsetfd_list;
-            fdsetfd_list = fdsetfd_info;
+            QAPI_LIST_PREPEND(fdset_info->fds, fdsetfd_info);
         }

-        fdset_info->value->fds = fdsetfd_list;
-
-        fdset_info->next = fdset_list;
-        fdset_list = fdset_info;
+        QAPI_LIST_PREPEND(fdset_list, fdset_info);
     }

     return fdset_list;
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index a456762f6a84..17514f495965 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -138,18 +138,18 @@ EventInfoList *qmp_query_events(Error **errp)
      * QAPIEvent_str() and QAPIEvent_lookup[].  When the command goes,
      * they should go, too.
      */
-    EventInfoList *info, *ev_list = NULL;
+    EventInfoList *ev_list = NULL;
     QAPIEvent e;

     for (e = 0 ; e < QAPI_EVENT__MAX ; e++) {
         const char *event_name = QAPIEvent_str(e);
+        EventInfo *info;
+
         assert(event_name != NULL);
         info = g_malloc0(sizeof(*info));
-        info->value = g_malloc0(sizeof(*info->value));
-        info->value->name = g_strdup(event_name);
+        info->name = g_strdup(event_name);

-        info->next = ev_list;
-        ev_list = info;
+        QAPI_LIST_PREPEND(ev_list, info);
     }

     return ev_list;
diff --git a/qemu-img.c b/qemu-img.c
index 8bdea40b58d1..d599659c7f29 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1652,14 +1652,13 @@ static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
                                   Error **errp)
 {
     BlockDirtyBitmapMergeSource *merge_src;
-    BlockDirtyBitmapMergeSourceList *list;
+    BlockDirtyBitmapMergeSourceList *list = NULL;

     merge_src = g_new0(BlockDirtyBitmapMergeSource, 1);
     merge_src->type = QTYPE_QDICT;
     merge_src->u.external.node = g_strdup(src_node);
     merge_src->u.external.name = g_strdup(src_name);
-    list = g_new0(BlockDirtyBitmapMergeSourceList, 1);
-    list->value = merge_src;
+    QAPI_LIST_PREPEND(list, merge_src);
     qmp_block_dirty_bitmap_merge(dst_node, dst_name, list, errp);
     qapi_free_BlockDirtyBitmapMergeSourceList(list);
 }
diff --git a/qga/commands-posix-ssh.c b/qga/commands-posix-ssh.c
index 749167e82d4f..2dda136d64f3 100644
--- a/qga/commands-posix-ssh.c
+++ b/qga/commands-posix-ssh.c
@@ -293,17 +293,12 @@ qmp_guest_ssh_get_authorized_keys(const char *username, Error **errp)

     ret = g_new0(GuestAuthorizedKeys, 1);
     for (i = 0; authkeys[i] != NULL; i++) {
-        strList *new;
-
         g_strstrip(authkeys[i]);
         if (!authkeys[i][0] || authkeys[i][0] == '#') {
             continue;
         }

-        new = g_new0(strList, 1);
-        new->value = g_strdup(authkeys[i]);
-        new->next = ret->keys;
-        ret->keys = new;
+        QAPI_LIST_PREPEND(ret->keys, g_strdup(authkeys[i]));
     }

     return g_steal_pointer(&ret);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e3812006..849923b260d7 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1036,7 +1036,6 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
 {
     GuestDiskAddress *disk;
     GuestPCIAddress *pciaddr;
-    GuestDiskAddressList *list = NULL;
     bool has_hwinf;
 #ifdef CONFIG_LIBUDEV
     struct udev *udev = NULL;
@@ -1053,9 +1052,6 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
     disk->pci_controller = pciaddr;
     disk->bus_type = GUEST_DISK_BUS_TYPE_UNKNOWN;

-    list = g_new0(GuestDiskAddressList, 1);
-    list->value = disk;
-
 #ifdef CONFIG_LIBUDEV
     udev = udev_new();
     udevice = udev_device_new_from_syspath(udev, syspath);
@@ -1089,10 +1085,9 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
     }

     if (has_hwinf || disk->has_dev || disk->has_serial) {
-        list->next = fs->disk;
-        fs->disk = list;
+        QAPI_LIST_PREPEND(fs->disk, disk);
     } else {
-        qapi_free_GuestDiskAddressList(list);
+        qapi_free_GuestDiskAddress(disk);
     }
 }

@@ -1288,7 +1283,6 @@ static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
     disk->has_dependencies = true;
     while ((dep = g_dir_read_name(dp_deps)) != NULL) {
         g_autofree char *dep_dir = NULL;
-        strList *dep_item = NULL;
         char *dev_name;

         /* Add dependent disks */
@@ -1296,10 +1290,7 @@ static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
         dev_name = get_device_for_syspath(dep_dir);
         if (dev_name != NULL) {
             g_debug("  adding dependent device: %s", dev_name);
-            dep_item = g_new0(strList, 1);
-            dep_item->value = dev_name;
-            dep_item->next = disk->dependencies;
-            disk->dependencies = dep_item;
+            QAPI_LIST_PREPEND(disk->dependencies, dev_name);
         }
     }
     g_dir_close(dp_deps);
@@ -1318,7 +1309,7 @@ static GuestDiskInfoList *get_disk_partitions(
     const char *disk_name, const char *disk_dir,
     const char *disk_dev)
 {
-    GuestDiskInfoList *item, *ret = list;
+    GuestDiskInfoList *ret = list;
     struct dirent *de_disk;
     DIR *dp_disk = NULL;
     size_t len = strlen(disk_name);
@@ -1352,15 +1343,9 @@ static GuestDiskInfoList *get_disk_partitions(
         partition->name = dev_name;
         partition->partition = true;
         /* Add parent disk as dependent for easier tracking of hierarchy */
-        partition->dependencies = g_new0(strList, 1);
-        partition->dependencies->value = g_strdup(disk_dev);
-        partition->has_dependencies = true;
-
-        item = g_new0(GuestDiskInfoList, 1);
-        item->value = partition;
-        item->next = ret;
-        ret = item;
+        QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev));

+        QAPI_LIST_PREPEND(ret, partition);
     }
     closedir(dp_disk);

@@ -1369,7 +1354,7 @@ static GuestDiskInfoList *get_disk_partitions(

 GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 {
-    GuestDiskInfoList *item, *ret = NULL;
+    GuestDiskInfoList *ret = NULL;
     GuestDiskInfo *disk;
     DIR *dp = NULL;
     struct dirent *de = NULL;
@@ -1415,10 +1400,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
         disk->partition = false;
         disk->alias = get_alias_for_syspath(disk_dir);
         disk->has_alias = (disk->alias != NULL);
-        item = g_new0(GuestDiskInfoList, 1);
-        item->value = disk;
-        item->next = ret;
-        ret = item;
+        QAPI_LIST_PREPEND(ret, disk);

         /* Get address for non-virtual devices */
         bool is_virtual = is_disk_virtual(disk_dir, &local_err);
@@ -1495,7 +1477,7 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
 {
     FsMountList mounts;
     struct FsMount *mount;
-    GuestFilesystemInfoList *new, *ret = NULL;
+    GuestFilesystemInfoList *ret = NULL;
     Error *local_err = NULL;

     QTAILQ_INIT(&mounts);
@@ -1508,10 +1490,7 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
     QTAILQ_FOREACH(mount, &mounts, next) {
         g_debug("Building guest fsinfo for '%s'", mount->dirname);

-        new = g_malloc0(sizeof(*ret));
-        new->value = build_guest_fsinfo(mount, &local_err);
-        new->next = ret;
-        ret = new;
+        QAPI_LIST_PREPEND(ret, build_guest_fsinfo(mount, &local_err));
         if (local_err) {
             error_propagate(errp, local_err);
             qapi_free_GuestFilesystemInfoList(ret);
@@ -1777,7 +1756,6 @@ GuestFilesystemTrimResponse *
 qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 {
     GuestFilesystemTrimResponse *response;
-    GuestFilesystemTrimResultList *list;
     GuestFilesystemTrimResult *result;
     int ret = 0;
     FsMountList mounts;
@@ -1801,10 +1779,7 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         result = g_malloc0(sizeof(*result));
         result->path = g_strdup(mount->dirname);

-        list = g_malloc0(sizeof(*list));
-        list->value = result;
-        list->next = response->paths;
-        response->paths = list;
+        QAPI_LIST_PREPEND(response->paths, result);

         fd = qemu_open_old(mount->dirname, O_RDONLY);
         if (fd == -1) {
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index ba1fd07d0625..684639bd131e 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -874,7 +874,7 @@ err_close:
 static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
 {
     Error *local_err = NULL;
-    GuestDiskAddressList *list = NULL, *cur_item = NULL;
+    GuestDiskAddressList *list = NULL;
     GuestDiskAddress *disk = NULL;
     int i;
     HANDLE vol_h;
@@ -926,10 +926,8 @@ static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
                 error_free(local_err);
                 goto out;
             }
-            list = g_malloc0(sizeof(*list));
-            list->value = disk;
+            QAPI_LIST_PREPEND(list, disk);
             disk = NULL;
-            list->next = NULL;
             goto out;
         } else {
             error_setg_win32(errp, GetLastError(),
@@ -960,11 +958,8 @@ static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
             error_propagate(errp, local_err);
             goto out;
         }
-        cur_item = g_malloc0(sizeof(*list));
-        cur_item->value = disk;
+        QAPI_LIST_PREPEND(list, disk);
         disk = NULL;
-        cur_item->next = list;
-        list = cur_item;
     }


@@ -982,7 +977,7 @@ out:
 GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 {
     ERRP_GUARD();
-    GuestDiskInfoList *new = NULL, *ret = NULL;
+    GuestDiskInfoList *ret = NULL;
     HDEVINFO dev_info;
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     int i;
@@ -1064,10 +1059,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
             disk->has_address = true;
         }

-        new = g_malloc0(sizeof(GuestDiskInfoList));
-        new->value = disk;
-        new->next = ret;
-        ret = new;
+        QAPI_LIST_PREPEND(ret, disk);
     }

     SetupDiDestroyDeviceInfoList(dev_info);
@@ -1165,7 +1157,7 @@ free:
 GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
 {
     HANDLE vol_h;
-    GuestFilesystemInfoList *new, *ret = NULL;
+    GuestFilesystemInfoList *ret = NULL;
     char guid[256];

     vol_h = FindFirstVolume(guid, sizeof(guid));
@@ -1183,10 +1175,7 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
             error_free(local_err);
             continue;
         }
-        new = g_malloc(sizeof(*ret));
-        new->value = info;
-        new->next = ret;
-        ret = new;
+        QAPI_LIST_PREPEND(ret, info);
     } while (FindNextVolume(vol_h, guid, sizeof(guid)));

     if (GetLastError() != ERROR_NO_MORE_FILES) {
@@ -1330,7 +1319,6 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)

     do {
         GuestFilesystemTrimResult *res;
-        GuestFilesystemTrimResultList *list;
         PWCHAR uc_path;
         DWORD char_count = 0;
         char *path, *out;
@@ -1369,11 +1357,7 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)

         res->path = path;

-        list = g_new0(GuestFilesystemTrimResultList, 1);
-        list->value = res;
-        list->next = resp->paths;
-
-        resp->paths = list;
+        QAPI_LIST_PREPEND(resp->paths, res);

         memset(argv, 0, sizeof(argv));
         argv[0] = (gchar *)"defrag.exe";
diff --git a/qga/commands.c b/qga/commands.c
index 3dcd5fbe5c4d..e866fc7081bb 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -66,17 +66,13 @@ static void qmp_command_info(const QmpCommand *cmd, void *opaque)
 {
     GuestAgentInfo *info = opaque;
     GuestAgentCommandInfo *cmd_info;
-    GuestAgentCommandInfoList *cmd_info_list;

     cmd_info = g_new0(GuestAgentCommandInfo, 1);
     cmd_info->name = g_strdup(qmp_command_name(cmd));
     cmd_info->enabled = qmp_command_is_enabled(cmd);
     cmd_info->success_response = qmp_has_success_response(cmd);

-    cmd_info_list = g_new0(GuestAgentCommandInfoList, 1);
-    cmd_info_list->value = cmd_info;
-    cmd_info_list->next = info->supported_commands;
-    info->supported_commands = cmd_info_list;
+    QAPI_LIST_PREPEND(info->supported_commands, cmd_info);
 }

 struct GuestAgentInfo *qmp_guest_info(Error **errp)
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 2dd233f293bb..b40ac39f3008 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -46,14 +46,12 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)

     object_property_iter_init(&iter, obj);
     while ((prop = object_property_iter_next(&iter))) {
-        ObjectPropertyInfoList *entry = g_malloc0(sizeof(*entry));
+        ObjectPropertyInfo *value = g_malloc0(sizeof(ObjectPropertyInfo));

-        entry->value = g_malloc0(sizeof(ObjectPropertyInfo));
-        entry->next = props;
-        props = entry;
+        QAPI_LIST_PREPEND(props, value);

-        entry->value->name = g_strdup(prop->name);
-        entry->value->type = g_strdup(prop->type);
+        value->name = g_strdup(prop->name);
+        value->type = g_strdup(prop->type);
     }

     return props;
@@ -90,7 +88,7 @@ QObject *qmp_qom_get(const char *path, const char *property, Error **errp)

 static void qom_list_types_tramp(ObjectClass *klass, void *data)
 {
-    ObjectTypeInfoList *e, **pret = data;
+    ObjectTypeInfoList **pret = data;
     ObjectTypeInfo *info;
     ObjectClass *parent = object_class_get_parent(klass);

@@ -102,10 +100,7 @@ static void qom_list_types_tramp(ObjectClass *klass, void *data)
         info->parent = g_strdup(object_class_get_name(parent));
     }

-    e = g_malloc0(sizeof(*e));
-    e->value = info;
-    e->next = *pret;
-    *pret = e;
+    QAPI_LIST_PREPEND(*pret, info);
 }

 ObjectTypeInfoList *qmp_qom_list_types(bool has_implements,
@@ -150,7 +145,6 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
     object_property_iter_init(&iter, obj);
     while ((prop = object_property_iter_next(&iter))) {
         ObjectPropertyInfo *info;
-        ObjectPropertyInfoList *entry;

         /* Skip Object and DeviceState properties */
         if (strcmp(prop->name, "type") == 0 ||
@@ -176,10 +170,7 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
         info->default_value = qobject_ref(prop->defval);
         info->has_default_value = !!info->default_value;

-        entry = g_malloc0(sizeof(*entry));
-        entry->value = info;
-        entry->next = prop_list;
-        prop_list = entry;
+        QAPI_LIST_PREPEND(prop_list, info);
     }

     object_unref(obj);
@@ -217,7 +208,6 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
     }
     while ((prop = object_property_iter_next(&iter))) {
         ObjectPropertyInfo *info;
-        ObjectPropertyInfoList *entry;

         info = g_malloc0(sizeof(*info));
         info->name = g_strdup(prop->name);
@@ -225,10 +215,7 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         info->has_description = !!prop->description;
         info->description = g_strdup(prop->description);

-        entry = g_malloc0(sizeof(*entry));
-        entry->value = info;
-        entry->next = prop_list;
-        prop_list = entry;
+        QAPI_LIST_PREPEND(prop_list, info);
     }

     object_unref(obj);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b8bcd69030f..2d0d4cd1e102 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8283,7 +8283,6 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfoList *entry;
     CpuDefinitionInfo *info;
     const char *typename;

@@ -8293,10 +8292,7 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
                            strlen(typename) - strlen("-" TYPE_ARM_CPU));
     info->q_typename = g_strdup(typename);

-    entry = g_malloc0(sizeof(*entry));
-    entry->value = info;
-    entry->next = *cpu_list;
-    *cpu_list = entry;
+    QAPI_LIST_PREPEND(*cpu_list, info);
 }

 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 169d8a64b651..198b14e95e2e 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -42,15 +42,6 @@ static GICCapability *gic_cap_new(int version)
     return cap;
 }

-static GICCapabilityList *gic_cap_list_add(GICCapabilityList *head,
-                                           GICCapability *cap)
-{
-    GICCapabilityList *item = g_new0(GICCapabilityList, 1);
-    item->value = cap;
-    item->next = head;
-    return item;
-}
-
 static inline void gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
 {
 #ifdef CONFIG_KVM
@@ -84,8 +75,8 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)

     gic_cap_kvm_probe(v2, v3);

-    head = gic_cap_list_add(head, v2);
-    head = gic_cap_list_add(head, v3);
+    QAPI_LIST_PREPEND(head, v2);
+    QAPI_LIST_PREPEND(head, v3);

     return head;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0d20e156f258..35459a38bb1c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5014,7 +5014,6 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
     ObjectClass *oc = data;
     X86CPUClass *cc = X86_CPU_CLASS(oc);
     CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfoList *entry;
     CpuDefinitionInfo *info;

     info = g_malloc0(sizeof(*info));
@@ -5039,10 +5038,7 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
         info->has_alias_of = !!info->alias_of;
     }

-    entry = g_malloc0(sizeof(*entry));
-    entry->value = info;
-    entry->next = *cpu_list;
-    *cpu_list = entry;
+    QAPI_LIST_PREPEND(*cpu_list, info);
 }

 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index aadc6f8e74d7..b2cd69ff7f9a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -543,7 +543,6 @@ static void mips_cpu_add_definition(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfoList *entry;
     CpuDefinitionInfo *info;
     const char *typename;

@@ -553,10 +552,7 @@ static void mips_cpu_add_definition(gpointer data, gpointer user_data)
                            strlen(typename) - strlen("-" TYPE_MIPS_CPU));
     info->q_typename = g_strdup(typename);

-    entry = g_malloc0(sizeof(*entry));
-    entry->value = info;
-    entry->next = *cpu_list;
-    *cpu_list = entry;
+    QAPI_LIST_PREPEND(*cpu_list, info);
 }

 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index b5abff8befea..a23fd3e32b77 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -427,7 +427,6 @@ static void create_cpu_model_list(ObjectClass *klass, void *opaque)
 {
     struct CpuDefinitionInfoListData *cpu_list_data = opaque;
     CpuDefinitionInfoList **cpu_list = &cpu_list_data->list;
-    CpuDefinitionInfoList *entry;
     CpuDefinitionInfo *info;
     char *name = g_strdup(object_class_get_name(klass));
     S390CPUClass *scc = S390_CPU_CLASS(klass);
@@ -454,10 +453,7 @@ static void create_cpu_model_list(ObjectClass *klass, void *opaque)
         object_unref(obj);
     }

-    entry = g_new0(CpuDefinitionInfoList, 1);
-    entry->value = info;
-    entry->next = *cpu_list;
-    *cpu_list = entry;
+    QAPI_LIST_PREPEND(*cpu_list, info);
 }

 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
@@ -624,12 +620,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 static void list_add_feat(const char *name, void *opaque)
 {
     strList **last = (strList **) opaque;
-    strList *entry;

-    entry = g_new0(strList, 1);
-    entry->value = g_strdup(name);
-    entry->next = *last;
-    *last = entry;
+    QAPI_LIST_PREPEND(*last, g_strdup(name));
 }

 CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
diff --git a/tests/test-clone-visitor.c b/tests/test-clone-visitor.c
index 5e1e8b2f5e8a..4944b3d85734 100644
--- a/tests/test-clone-visitor.c
+++ b/tests/test-clone-visitor.c
@@ -65,16 +65,13 @@ static void test_clone_alternate(void)

 static void test_clone_list_union(void)
 {
-    uint8List *src, *dst;
+    uint8List *src = NULL, *dst;
     uint8List *tmp = NULL;
     int i;

     /* Build list in reverse */
     for (i = 10; i; i--) {
-        src = g_new0(uint8List, 1);
-        src->next = tmp;
-        src->value = i;
-        tmp = src;
+        QAPI_LIST_PREPEND(src, i);
     }

     dst = QAPI_CLONE(uint8List, src);
diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-output-visitor.c
index 1c856d9bd20a..b20ab8b29b85 100644
--- a/tests/test-qobject-output-visitor.c
+++ b/tests/test-qobject-output-visitor.c
@@ -223,7 +223,8 @@ static void test_visitor_out_list(TestOutputVisitorData *data,
                                   const void *unused)
 {
     const char *value_str = "list value";
-    TestStructList *p, *head = NULL;
+    TestStruct *value;
+    TestStructList *head = NULL;
     const int max_items = 10;
     bool value_bool = true;
     int value_int = 10;
@@ -233,14 +234,12 @@ static void test_visitor_out_list(TestOutputVisitorData *data,

     /* Build the list in reverse order... */
     for (i = 0; i < max_items; i++) {
-        p = g_malloc0(sizeof(*p));
-        p->value = g_malloc0(sizeof(*p->value));
-        p->value->integer = value_int + (max_items - i - 1);
-        p->value->boolean = value_bool;
-        p->value->string = g_strdup(value_str);
+        value = g_malloc0(sizeof(*value));
+        value->integer = value_int + (max_items - i - 1);
+        value->boolean = value_bool;
+        value->string = g_strdup(value_str);

-        p->next = head;
-        head = p;
+        QAPI_LIST_PREPEND(head, value);
     }

     visit_type_TestStructList(data->ov, NULL, &head, &error_abort);
@@ -270,26 +269,25 @@ static void test_visitor_out_list(TestOutputVisitorData *data,
 static void test_visitor_out_list_qapi_free(TestOutputVisitorData *data,
                                             const void *unused)
 {
-    UserDefTwoList *p, *head = NULL;
+    UserDefTwo *value;
+    UserDefTwoList *head = NULL;
     const char string[] = "foo bar";
     int i, max_count = 1024;

     for (i = 0; i < max_count; i++) {
-        p = g_malloc0(sizeof(*p));
-        p->value = g_malloc0(sizeof(*p->value));
+        value = g_malloc0(sizeof(*value));

-        p->value->string0 = g_strdup(string);
-        p->value->dict1 = g_new0(UserDefTwoDict, 1);
-        p->value->dict1->string1 = g_strdup(string);
-        p->value->dict1->dict2 = g_new0(UserDefTwoDictDict, 1);
-        p->value->dict1->dict2->userdef = g_new0(UserDefOne, 1);
-        p->value->dict1->dict2->userdef->string = g_strdup(string);
-        p->value->dict1->dict2->userdef->integer = 42;
-        p->value->dict1->dict2->string = g_strdup(string);
-        p->value->dict1->has_dict3 = false;
+        value->string0 = g_strdup(string);
+        value->dict1 = g_new0(UserDefTwoDict, 1);
+        value->dict1->string1 = g_strdup(string);
+        value->dict1->dict2 = g_new0(UserDefTwoDictDict, 1);
+        value->dict1->dict2->userdef = g_new0(UserDefOne, 1);
+        value->dict1->dict2->userdef->string = g_strdup(string);
+        value->dict1->dict2->userdef->integer = 42;
+        value->dict1->dict2->string = g_strdup(string);
+        value->dict1->has_dict3 = false;

-        p->next = head;
-        head = p;
+        QAPI_LIST_PREPEND(head, value);
     }

     qapi_free_UserDefTwoList(head);
diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index 1c5a8b94ea87..12275e56d862 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -351,135 +351,51 @@ static void test_primitive_lists(gconstpointer opaque)
     for (i = 0; i < 32; i++) {
         switch (pl.type) {
         case PTYPE_STRING: {
-            strList *tmp = g_new0(strList, 1);
-            tmp->value = g_strdup(pt->value.string);
-            if (pl.value.strings == NULL) {
-                pl.value.strings = tmp;
-            } else {
-                tmp->next = pl.value.strings;
-                pl.value.strings = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.strings, g_strdup(pt->value.string));
             break;
         }
         case PTYPE_INTEGER: {
-            intList *tmp = g_new0(intList, 1);
-            tmp->value = pt->value.integer;
-            if (pl.value.integers == NULL) {
-                pl.value.integers = tmp;
-            } else {
-                tmp->next = pl.value.integers;
-                pl.value.integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.integers, pt->value.integer);
             break;
         }
         case PTYPE_S8: {
-            int8List *tmp = g_new0(int8List, 1);
-            tmp->value = pt->value.s8;
-            if (pl.value.s8_integers == NULL) {
-                pl.value.s8_integers = tmp;
-            } else {
-                tmp->next = pl.value.s8_integers;
-                pl.value.s8_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.s8_integers, pt->value.s8);
             break;
         }
         case PTYPE_S16: {
-            int16List *tmp = g_new0(int16List, 1);
-            tmp->value = pt->value.s16;
-            if (pl.value.s16_integers == NULL) {
-                pl.value.s16_integers = tmp;
-            } else {
-                tmp->next = pl.value.s16_integers;
-                pl.value.s16_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.s16_integers, pt->value.s16);
             break;
         }
         case PTYPE_S32: {
-            int32List *tmp = g_new0(int32List, 1);
-            tmp->value = pt->value.s32;
-            if (pl.value.s32_integers == NULL) {
-                pl.value.s32_integers = tmp;
-            } else {
-                tmp->next = pl.value.s32_integers;
-                pl.value.s32_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.s32_integers, pt->value.s32);
             break;
         }
         case PTYPE_S64: {
-            int64List *tmp = g_new0(int64List, 1);
-            tmp->value = pt->value.s64;
-            if (pl.value.s64_integers == NULL) {
-                pl.value.s64_integers = tmp;
-            } else {
-                tmp->next = pl.value.s64_integers;
-                pl.value.s64_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.s64_integers, pt->value.s64);
             break;
         }
         case PTYPE_U8: {
-            uint8List *tmp = g_new0(uint8List, 1);
-            tmp->value = pt->value.u8;
-            if (pl.value.u8_integers == NULL) {
-                pl.value.u8_integers = tmp;
-            } else {
-                tmp->next = pl.value.u8_integers;
-                pl.value.u8_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.u8_integers, pt->value.u8);
             break;
         }
         case PTYPE_U16: {
-            uint16List *tmp = g_new0(uint16List, 1);
-            tmp->value = pt->value.u16;
-            if (pl.value.u16_integers == NULL) {
-                pl.value.u16_integers = tmp;
-            } else {
-                tmp->next = pl.value.u16_integers;
-                pl.value.u16_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.u16_integers, pt->value.u16);
             break;
         }
         case PTYPE_U32: {
-            uint32List *tmp = g_new0(uint32List, 1);
-            tmp->value = pt->value.u32;
-            if (pl.value.u32_integers == NULL) {
-                pl.value.u32_integers = tmp;
-            } else {
-                tmp->next = pl.value.u32_integers;
-                pl.value.u32_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.u32_integers, pt->value.u32);
             break;
         }
         case PTYPE_U64: {
-            uint64List *tmp = g_new0(uint64List, 1);
-            tmp->value = pt->value.u64;
-            if (pl.value.u64_integers == NULL) {
-                pl.value.u64_integers = tmp;
-            } else {
-                tmp->next = pl.value.u64_integers;
-                pl.value.u64_integers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.u64_integers, pt->value.u64);
             break;
         }
         case PTYPE_NUMBER: {
-            numberList *tmp = g_new0(numberList, 1);
-            tmp->value = pt->value.number;
-            if (pl.value.numbers == NULL) {
-                pl.value.numbers = tmp;
-            } else {
-                tmp->next = pl.value.numbers;
-                pl.value.numbers = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.numbers, pt->value.number);
             break;
         }
         case PTYPE_BOOLEAN: {
-            boolList *tmp = g_new0(boolList, 1);
-            tmp->value = pt->value.boolean;
-            if (pl.value.booleans == NULL) {
-                pl.value.booleans = tmp;
-            } else {
-                tmp->next = pl.value.booleans;
-                pl.value.booleans = tmp;
-            }
+            QAPI_LIST_PREPEND(pl.value.booleans, pt->value.boolean);
             break;
         }
         default:
@@ -704,10 +620,7 @@ static void test_nested_struct_list(gconstpointer opaque)
     int i = 0;

     for (i = 0; i < 8; i++) {
-        tmp = g_new0(UserDefTwoList, 1);
-        tmp->value = nested_struct_create();
-        tmp->next = listp;
-        listp = tmp;
+        QAPI_LIST_PREPEND(listp, nested_struct_create());
     }

     ops->serialize(listp, &serialize_data, visit_nested_struct_list,
diff --git a/trace/qmp.c b/trace/qmp.c
index 38246e1aa692..85f81e47cc6d 100644
--- a/trace/qmp.c
+++ b/trace/qmp.c
@@ -92,39 +92,37 @@ TraceEventInfoList *qmp_trace_event_get_state(const char *name,
     /* Get states (all errors checked above) */
     trace_event_iter_init(&iter, name);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
-        TraceEventInfoList *elem;
+        TraceEventInfo *value;
         bool is_vcpu = trace_event_is_vcpu(ev);
         if (has_vcpu && !is_vcpu) {
             continue;
         }

-        elem = g_new(TraceEventInfoList, 1);
-        elem->value = g_new(TraceEventInfo, 1);
-        elem->value->vcpu = is_vcpu;
-        elem->value->name = g_strdup(trace_event_get_name(ev));
+        value = g_new(TraceEventInfo, 1);
+        value->vcpu = is_vcpu;
+        value->name = g_strdup(trace_event_get_name(ev));

         if (!trace_event_get_state_static(ev)) {
-            elem->value->state = TRACE_EVENT_STATE_UNAVAILABLE;
+            value->state = TRACE_EVENT_STATE_UNAVAILABLE;
         } else {
             if (has_vcpu) {
                 if (is_vcpu) {
                     if (trace_event_get_vcpu_state_dynamic(cpu, ev)) {
-                        elem->value->state = TRACE_EVENT_STATE_ENABLED;
+                        value->state = TRACE_EVENT_STATE_ENABLED;
                     } else {
-                        elem->value->state = TRACE_EVENT_STATE_DISABLED;
+                        value->state = TRACE_EVENT_STATE_DISABLED;
                     }
                 }
                 /* else: already skipped above */
             } else {
                 if (trace_event_get_state_dynamic(ev)) {
-                    elem->value->state = TRACE_EVENT_STATE_ENABLED;
+                    value->state = TRACE_EVENT_STATE_ENABLED;
                 } else {
-                    elem->value->state = TRACE_EVENT_STATE_DISABLED;
+                    value->state = TRACE_EVENT_STATE_DISABLED;
                 }
             }
         }
-        elem->next = events;
-        events = elem;
+        QAPI_LIST_PREPEND(events, value);
     }

     return events;
diff --git a/ui/input.c b/ui/input.c
index 4791b089c746..8ac407dec485 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -571,7 +571,7 @@ void qemu_remove_mouse_mode_change_notifier(Notifier *notify)
 MouseInfoList *qmp_query_mice(Error **errp)
 {
     MouseInfoList *mice_list = NULL;
-    MouseInfoList *info;
+    MouseInfo *info;
     QemuInputHandlerState *s;
     bool current = true;

@@ -581,16 +581,14 @@ MouseInfoList *qmp_query_mice(Error **errp)
             continue;
         }

-        info = g_new0(MouseInfoList, 1);
-        info->value = g_new0(MouseInfo, 1);
-        info->value->index = s->id;
-        info->value->name = g_strdup(s->handler->name);
-        info->value->absolute = s->handler->mask & INPUT_EVENT_MASK_ABS;
-        info->value->current = current;
+        info = g_new0(MouseInfo, 1);
+        info->index = s->id;
+        info->name = g_strdup(s->handler->name);
+        info->absolute = s->handler->mask & INPUT_EVENT_MASK_ABS;
+        info->current = current;

         current = false;
-        info->next = mice_list;
-        mice_list = info;
+        QAPI_LIST_PREPEND(mice_list, info);
     }

     return mice_list;
diff --git a/ui/vnc.c b/ui/vnc.c
index 34e6dc437c0f..7452ac7df2ce 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -365,14 +365,11 @@ static VncDisplay *vnc_display_find(const char *id)

 static VncClientInfoList *qmp_query_client_list(VncDisplay *vd)
 {
-    VncClientInfoList *cinfo, *prev = NULL;
+    VncClientInfoList *prev = NULL;
     VncState *client;

     QTAILQ_FOREACH(client, &vd->clients, next) {
-        cinfo = g_new0(VncClientInfoList, 1);
-        cinfo->value = qmp_query_vnc_client(client);
-        cinfo->next = prev;
-        prev = cinfo;
+        QAPI_LIST_PREPEND(prev, qmp_query_vnc_client(client));
     }
     return prev;
 }
@@ -453,7 +450,6 @@ static VncServerInfo2List *qmp_query_server_entry(QIOChannelSocket *ioc,
                                                   int subauth,
                                                   VncServerInfo2List *prev)
 {
-    VncServerInfo2List *list;
     VncServerInfo2 *info;
     Error *err = NULL;
     SocketAddress *addr;
@@ -476,10 +472,8 @@ static VncServerInfo2List *qmp_query_server_entry(QIOChannelSocket *ioc,
     qmp_query_auth(auth, subauth, &info->auth,
                    &info->vencrypt, &info->has_vencrypt);

-    list = g_new0(VncServerInfo2List, 1);
-    list->value = info;
-    list->next = prev;
-    return list;
+    QAPI_LIST_PREPEND(prev, info);
+    return prev;
 }

 static void qmp_query_auth(int auth, int subauth,
@@ -554,7 +548,7 @@ static void qmp_query_auth(int auth, int subauth,

 VncInfo2List *qmp_query_vnc_servers(Error **errp)
 {
-    VncInfo2List *item, *prev = NULL;
+    VncInfo2List *prev = NULL;
     VncInfo2 *info;
     VncDisplay *vd;
     DeviceState *dev;
@@ -583,10 +577,7 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
                 vd->ws_subauth, info->server);
         }

-        item = g_new0(VncInfo2List, 1);
-        item->value = info;
-        item->next = prev;
-        prev = item;
+        QAPI_LIST_PREPEND(prev, info);
     }
     return prev;
 }
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 725e3d7e4b13..e2a700b28450 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -55,7 +55,7 @@ QemuOpts *qemu_find_opts_singleton(const char *group)

 static CommandLineParameterInfoList *query_option_descs(const QemuOptDesc *desc)
 {
-    CommandLineParameterInfoList *param_list = NULL, *entry;
+    CommandLineParameterInfoList *param_list = NULL;
     CommandLineParameterInfo *info;
     int i;

@@ -87,10 +87,7 @@ static CommandLineParameterInfoList *query_option_descs(const QemuOptDesc *desc)
             info->q_default = g_strdup(desc[i].def_value_str);
         }

-        entry = g_malloc0(sizeof(*entry));
-        entry->value = info;
-        entry->next = param_list;
-        param_list = entry;
+        QAPI_LIST_PREPEND(param_list, info);
     }

     return param_list;
@@ -246,7 +243,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
                                                           const char *option,
                                                           Error **errp)
 {
-    CommandLineOptionInfoList *conf_list = NULL, *entry;
+    CommandLineOptionInfoList *conf_list = NULL;
     CommandLineOptionInfo *info;
     int i;

@@ -262,10 +259,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
                 info->parameters =
                     query_option_descs(vm_config_groups[i]->desc);
             }
-            entry = g_malloc0(sizeof(*entry));
-            entry->value = info;
-            entry->next = conf_list;
-            conf_list = entry;
+            QAPI_LIST_PREPEND(conf_list, info);
         }
     }

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index a4d0038828d9..3c05a173437d 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10566,7 +10566,6 @@ static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
     ObjectClass *oc = data;
     CpuDefinitionInfoList **first = user_data;
     const char *typename;
-    CpuDefinitionInfoList *entry;
     CpuDefinitionInfo *info;

     typename = object_class_get_name(oc);
@@ -10574,10 +10573,7 @@ static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
     info->name = g_strndup(typename,
                            strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));

-    entry = g_malloc0(sizeof(*entry));
-    entry->value = info;
-    entry->next = *first;
-    *first = entry;
+    QAPI_LIST_PREPEND(*first, info);
 }

 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
@@ -10593,7 +10589,6 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
         PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
         ObjectClass *oc;
-        CpuDefinitionInfoList *entry;
         CpuDefinitionInfo *info;

         oc = ppc_cpu_class_by_name(alias->model);
@@ -10605,10 +10600,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
         info->name = g_strdup(alias->alias);
         info->q_typename = g_strdup(object_class_get_name(oc));

-        entry = g_malloc0(sizeof(*entry));
-        entry->value = info;
-        entry->next = cpu_list;
-        cpu_list = entry;
+        QAPI_LIST_PREPEND(cpu_list, info);
     }

     return cpu_list;
-- 
2.29.2


