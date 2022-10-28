Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2835610ED2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMlr-0002DJ-1N; Fri, 28 Oct 2022 06:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMln-0002B6-80
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlk-000209-7H
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27803219E7;
 Fri, 28 Oct 2022 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9C8PwvMRsKBk9X4GsBVDxHxTD4+h+6VD+DfPcJyROrs=;
 b=RIJRSs4smUf8oWEBlbh7mC+40jN5y8ULQxTekA5fCyV0DSUTGmUdYLh1KvoDEMj5xh4sSx
 iht9hn/VfH6C6BLx+Y+T4585OuR58vg0fp9wQzLb58nuRNRJ4jEoOvKPO/sUAE33PosIsN
 fSeHSALefeTvceyxghJZWGRFymsVwc0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3A0513A6E;
 Fri, 28 Oct 2022 10:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4LlVKVWxW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:17 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 03/14] migration: Initial support of fixed-ram feature for
 analyze-migration.py
Date: Fri, 28 Oct 2022 13:39:03 +0300
Message-Id: <20221028103914.908728-4-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
References: <20221028103914.908728-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=nborisov@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to allow analyze-migration.py script to work with migration
streams that have the 'fixed-ram' capability set it's required to have
access to the stream's configuration object. This commit enables this
by making migration json writer part of MigrationState struct, allowing
the configuration object be serialized to json.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/migration.c        |  5 ++++
 migration/migration.h        |  3 +++
 migration/savevm.c           | 47 ++++++++++++++++++++++------------
 scripts/analyze-migration.py | 49 +++++++++++++++++++++++++++++++++---
 4 files changed, 85 insertions(+), 19 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index eafd887254dd..11ceea340702 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1897,6 +1897,8 @@ static void migrate_fd_cleanup(MigrationState *s)
     g_free(s->hostname);
     s->hostname = NULL;
 
+    json_writer_free(s->vmdesc);
+
     qemu_savevm_state_cleanup();
 
     if (s->to_dst_file) {
@@ -2155,6 +2157,7 @@ void migrate_init(MigrationState *s)
     error_free(s->error);
     s->error = NULL;
     s->hostname = NULL;
+    s->vmdesc = NULL;
 
     migrate_set_state(&s->state, MIGRATION_STATUS_NONE, MIGRATION_STATUS_SETUP);
 
@@ -4270,6 +4273,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         return;
     }
 
+    s->vmdesc = json_writer_new(false);
+
     if (multifd_save_setup(&local_err) != 0) {
         error_report_err(local_err);
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaaab..96f27aba2210 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -17,6 +17,7 @@
 #include "exec/cpu-common.h"
 #include "hw/qdev-core.h"
 #include "qapi/qapi-types-migration.h"
+#include "qapi/qmp/json-writer.h"
 #include "qemu/thread.h"
 #include "qemu/coroutine_int.h"
 #include "io/channel.h"
@@ -261,6 +262,8 @@ struct MigrationState {
 
     int state;
 
+    JSONWriter *vmdesc;
+
     /* State related to return path */
     struct {
         /* Protected by qemu_file_lock */
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c2c..44a222888306 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1137,13 +1137,23 @@ void qemu_savevm_non_migratable_list(strList **reasons)
 
 void qemu_savevm_state_header(QEMUFile *f)
 {
+    MigrationState *s = migrate_get_current();
     trace_savevm_state_header();
     qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
     qemu_put_be32(f, QEMU_VM_FILE_VERSION);
 
-    if (migrate_get_current()->send_configuration) {
+    if (s->send_configuration) {
         qemu_put_byte(f, QEMU_VM_CONFIGURATION);
-        vmstate_save_state(f, &vmstate_configuration, &savevm_state, 0);
+        /*
+         * This starts the main json object and is paired with the
+         * json_writer_end_object in
+         * qemu_savevm_state_complete_precopy_non_iterable
+         */
+        json_writer_start_object(s->vmdesc, NULL);
+        json_writer_start_object(s->vmdesc, "configuration");
+        vmstate_save_state(f, &vmstate_configuration, &savevm_state, s->vmdesc);
+        json_writer_end_object(s->vmdesc);
+
     }
 }
 
@@ -1364,15 +1374,16 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                     bool in_postcopy,
                                                     bool inactivate_disks)
 {
-    g_autoptr(JSONWriter) vmdesc = NULL;
+    MigrationState *s = migrate_get_current();
     int vmdesc_len;
     SaveStateEntry *se;
     int ret;
 
-    vmdesc = json_writer_new(false);
-    json_writer_start_object(vmdesc, NULL);
-    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
-    json_writer_start_array(vmdesc, "devices");
+    if (!s->send_configuration) {
+        json_writer_start_object(s->vmdesc, NULL);
+    }
+    json_writer_int64(s->vmdesc, "page_size", qemu_target_page_size());
+    json_writer_start_array(s->vmdesc, "devices");
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
 
         if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
@@ -1385,12 +1396,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 
         trace_savevm_section_start(se->idstr, se->section_id);
 
-        json_writer_start_object(vmdesc, NULL);
-        json_writer_str(vmdesc, "name", se->idstr);
-        json_writer_int64(vmdesc, "instance_id", se->instance_id);
+        json_writer_start_object(s->vmdesc, NULL);
+        json_writer_str(s->vmdesc, "name", se->idstr);
+        json_writer_int64(s->vmdesc, "instance_id", se->instance_id);
 
         save_section_header(f, se, QEMU_VM_SECTION_FULL);
-        ret = vmstate_save(f, se, vmdesc);
+        ret = vmstate_save(f, se, s->vmdesc);
         if (ret) {
             qemu_file_set_error(f, ret);
             return ret;
@@ -1398,7 +1409,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         trace_savevm_section_end(se->idstr, se->section_id, 0);
         save_section_footer(f, se);
 
-        json_writer_end_object(vmdesc);
+        json_writer_end_object(s->vmdesc);
     }
 
     if (inactivate_disks) {
@@ -1417,14 +1428,18 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         qemu_put_byte(f, QEMU_VM_EOF);
     }
 
-    json_writer_end_array(vmdesc);
-    json_writer_end_object(vmdesc);
-    vmdesc_len = strlen(json_writer_get(vmdesc));
+    json_writer_end_array(s->vmdesc);
+    /*
+     * This finishes the top level json object, its opoening counter part
+     * is either in this function or in qemu_savevm_state_header
+     */
+    json_writer_end_object(s->vmdesc);
+    vmdesc_len = strlen(json_writer_get(s->vmdesc));
 
     if (should_send_vmdesc()) {
         qemu_put_byte(f, QEMU_VM_VMDESCRIPTION);
         qemu_put_be32(f, vmdesc_len);
-        qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
+        qemu_put_buffer(f, (uint8_t *)json_writer_get(s->vmdesc), vmdesc_len);
     }
 
     return 0;
diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index b82a1b0c58c4..9785a640fbf8 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -23,6 +23,7 @@
 import collections
 import struct
 import sys
+import math
 
 
 def mkdir_p(path):
@@ -119,11 +120,16 @@ def __init__(self, file, version_id, ramargs, section_key):
         self.file = file
         self.section_key = section_key
         self.TARGET_PAGE_SIZE = ramargs['page_size']
+        self.TARGET_PAGE_BITS = math.log2(self.TARGET_PAGE_SIZE)
         self.dump_memory = ramargs['dump_memory']
         self.write_memory = ramargs['write_memory']
+        self.fixed_ram = ramargs['fixed-ram']
         self.sizeinfo = collections.OrderedDict()
+        self.bitmap_offset = collections.OrderedDict()
+        self.pages_offset = collections.OrderedDict()
         self.data = collections.OrderedDict()
         self.data['section sizes'] = self.sizeinfo
+        self.ram_read = False
         self.name = ''
         if self.write_memory:
             self.files = { }
@@ -140,7 +146,13 @@ def __str__(self):
     def getDict(self):
         return self.data
 
+    def write_or_dump_fixed_ram(self):
+        pass
+
     def read(self):
+        if self.fixed_ram and self.ram_read:
+            return
+
         # Read all RAM sections
         while True:
             addr = self.file.read64()
@@ -167,7 +179,25 @@ def read(self):
                         f.truncate(0)
                         f.truncate(len)
                         self.files[self.name] = f
+
+                    if self.fixed_ram:
+                        bitmap_len = self.file.read32()
+                        # skip the pages_offset which we don't need
+                        offset = self.file.tell() + 8
+                        self.bitmap_offset[self.name] = offset
+                        offset = ((offset + bitmap_len + self.TARGET_PAGE_SIZE - 1) // self.TARGET_PAGE_SIZE) * self.TARGET_PAGE_SIZE
+                        self.pages_offset[self.name] = offset
+                        self.file.file.seek(offset + len)
+
                 flags &= ~self.RAM_SAVE_FLAG_MEM_SIZE
+                if self.fixed_ram:
+                    self.ram_read = True
+                # now we should rewind to the ram page offset of the first
+                # ram section
+                if self.fixed_ram:
+                    if self.write_memory or self.dump_memory:
+                        self.write_or_dump_fixed_ram()
+                        return
 
             if flags & self.RAM_SAVE_FLAG_COMPRESS:
                 if flags & self.RAM_SAVE_FLAG_CONTINUE:
@@ -208,7 +238,7 @@ def read(self):
 
             # End of RAM section
             if flags & self.RAM_SAVE_FLAG_EOS:
-                break
+               return
 
             if flags != 0:
                 raise Exception("Unknown RAM flags: %x" % flags)
@@ -521,6 +551,7 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
         ramargs['page_size'] = self.vmsd_desc['page_size']
         ramargs['dump_memory'] = dump_memory
         ramargs['write_memory'] = write_memory
+        ramargs['fixed-ram'] = False
         self.section_classes[('ram',0)][1] = ramargs
 
         while True:
@@ -528,8 +559,20 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
             if section_type == self.QEMU_VM_EOF:
                 break
             elif section_type == self.QEMU_VM_CONFIGURATION:
-                section = ConfigurationSection(file)
-                section.read()
+                config_desc = self.vmsd_desc.get('configuration')
+                if config_desc is not None:
+                    config = VMSDSection(file, 1, config_desc, 'configuration')
+                    config.read()
+                    caps = config.data.get("configuration/capabilities")
+                    if caps is not None:
+                        caps = caps.data["capabilities"]
+                        if type(caps) != list:
+                            caps = [caps]
+                        for i in caps:
+                            # chomp out string length
+                            cap = i.data[1:].decode("utf8")
+                            if cap == "fixed-ram":
+                                ramargs['fixed-ram'] = True
             elif section_type == self.QEMU_VM_SECTION_START or section_type == self.QEMU_VM_SECTION_FULL:
                 section_id = file.read32()
                 name = file.readstr()
-- 
2.34.1


