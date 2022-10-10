Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA65F9FA4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:50:54 +0200 (CEST)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtBE-0004Cy-33
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvL-000129-AJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:27 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvJ-0005LR-1k
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BD811F8F4;
 Mon, 10 Oct 2022 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A50mByhzWHrQsuuwumxFXgwiK/RPKzRr2vW+FrGIFeg=;
 b=WEQknGil4c6as8U/TYuG4+STQSZuKcACcuc5LYv7CK/qg+eDRpG4qez80e8rYGT0o0ql4M
 qumPqfQT3q3vBoopNEdRr7jygdkGFiXr7HIc/RXuTSkfG1Cr66LUpaaDgC6GZ0MySh7KPq
 qJ03g5CcTvmZRtBLBanYnmGL0TNa9zo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0710F13479;
 Mon, 10 Oct 2022 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aFt/OlofRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:18 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 11/11] analyze-migration.py: add initial support for fixed
 ram streams
Date: Mon, 10 Oct 2022 16:34:08 +0300
Message-Id: <20221010133408.3214433-12-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010133408.3214433-1-nborisov@suse.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=nborisov@suse.com;
 helo=smtp-out2.suse.de
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit introduces the minimum code necessary to support parsing
migration strems with 'fixed-ram' capability set. The only thing really
missing is the implementation of write_or_dump_fixed_ram() which deals
with '-x'/'-m' options.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 scripts/analyze-migration.py | 49 +++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

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


