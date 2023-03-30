Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE016D0D5B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd6-0003DH-63; Thu, 30 Mar 2023 14:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd4-0003CT-Am
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:06 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcx-00021x-1b
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4B12219E8;
 Thu, 30 Mar 2023 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMxFafmyez7g9sXkEaSgJKRvOg914CYHM/M+GAElHpQ=;
 b=1Pnf9G9/hku7NMHwGoswjnbWpLz9J17VEbWd4Z+IWLCGVHPvbRwYYWE/B8m5VPqxNGgX6B
 sdDkUqNEpb9dCqSwrCUJbcitSbgICbaKcvF4M+biYnoz8vz16/NOOAkrmRF1Ec4fbdzmEa
 U5JvdiaCatmJV8WZlcIL172TlxVE0MU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMxFafmyez7g9sXkEaSgJKRvOg914CYHM/M+GAElHpQ=;
 b=czxCkFBvWPzPBfYwSs661LS6GlGga6tLdh80I9fcfcAWN5JAu+lYU7NjbFh+4pzuneUXB6
 iRr4du8558DWjXAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 180961348E;
 Thu, 30 Mar 2023 18:03:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2PLnMwnPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:53 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [RFC PATCH v1 05/26] migration: Initial support of fixed-ram feature
 for analyze-migration.py
Date: Thu, 30 Mar 2023 15:03:15 -0300
Message-Id: <20230330180336.2791-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nikolay Borisov <nborisov@suse.com>

In order to allow analyze-migration.py script to work with migration
streams that have the 'fixed-ram' capability, it's required to have
access to the stream's configuration object. This commit enables this
by making migration json writer part of MigrationState struct,
allowing the configuration object be serialized to json.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/migration.c        |  1 +
 migration/savevm.c           | 18 ++++++++++---
 scripts/analyze-migration.py | 51 +++++++++++++++++++++++++++++++++---
 3 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5408d87453..177fb0de0f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2260,6 +2260,7 @@ void migrate_init(MigrationState *s)
     error_free(s->error);
     s->error = NULL;
     s->hostname = NULL;
+    s->vmdesc = NULL;
 
     migrate_set_state(&s->state, MIGRATION_STATUS_NONE, MIGRATION_STATUS_SETUP);
 
diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..92102c1fe5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1206,13 +1206,25 @@ void qemu_savevm_non_migratable_list(strList **reasons)
 
 void qemu_savevm_state_header(QEMUFile *f)
 {
+    MigrationState *s = migrate_get_current();
+
+    s->vmdesc = json_writer_new(false);
+
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
     }
 }
 
@@ -1237,8 +1249,6 @@ void qemu_savevm_state_setup(QEMUFile *f)
     Error *local_err = NULL;
     int ret;
 
-    ms->vmdesc = json_writer_new(false);
-    json_writer_start_object(ms->vmdesc, NULL);
     json_writer_int64(ms->vmdesc, "page_size", qemu_target_page_size());
     json_writer_start_array(ms->vmdesc, "devices");
 
diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index b82a1b0c58..05af9efd2f 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -23,7 +23,7 @@
 import collections
 import struct
 import sys
-
+import math
 
 def mkdir_p(path):
     try:
@@ -119,11 +119,16 @@ def __init__(self, file, version_id, ramargs, section_key):
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
@@ -140,7 +145,13 @@ def __str__(self):
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
@@ -167,7 +178,26 @@ def read(self):
                         f.truncate(0)
                         f.truncate(len)
                         self.files[self.name] = f
+
+                    if self.fixed_ram:
+                        bitmap_len = self.file.read32()
+                        # skip the pages_offset which we don't need
+                        offset = self.file.tell() + 8
+                        self.bitmap_offset[self.name] = offset
+                        offset = ((offset + bitmap_len + self.TARGET_PAGE_SIZE - 1) //
+                                  self.TARGET_PAGE_SIZE) * self.TARGET_PAGE_SIZE
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
+                return
 
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
2.35.3


