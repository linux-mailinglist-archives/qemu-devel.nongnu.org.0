Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84C47EE83
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:17:58 +0100 (CET)
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iaD-0000xz-Qa
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUP-00018X-Dx
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:48188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUL-0003OS-OA
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=tCvifQSnLlWrMvmJBaFd5pcx1Ud1JDyXCYHoGHkKti8=; b=sbjo1RF0rdJG
 g/gNAiiMrNvqf1SyBNOnNSL8n7+c2Tbav11SaTIGvQ2myuSiCo7f/L0os56GJ/JnSp+OCuJZ1A0pm
 bpsoJD3uTjLz3XZJOEOE6qRBlkYQqXPTDVQY9Ou6jLH4buR4I3DxCzZnJVv5tSvBI2ZdfLEp+5KND
 eHh40=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUH-004OwN-4E; Fri, 24 Dec 2021 14:11:49 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 5/6] migration: analyze-migration script changed
Date: Fri, 24 Dec 2021 14:11:47 +0300
Message-Id: <20211224111148.345438-6-nikita.lapshin@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=nikita.lapshin@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This script is used for RAM capabilities test. But it cannot work
in case of no vm description in migration stream.
So new flag is added to allow work this script with ram-only
migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 scripts/analyze-migration.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index b82a1b0c58..80077a09bc 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -495,7 +495,7 @@ def __init__(self, filename):
         self.filename = filename
         self.vmsd_desc = None
 
-    def read(self, desc_only = False, dump_memory = False, write_memory = False):
+    def read(self, ram_only, desc_only = False, dump_memory = False, write_memory = False):
         # Read in the whole file
         file = MigrationFile(self.filename)
 
@@ -509,7 +509,8 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
         if data != self.QEMU_VM_FILE_VERSION:
             raise Exception("Invalid version number %d" % data)
 
-        self.load_vmsd_json(file)
+        if not ram_only:
+            self.load_vmsd_json(file)
 
         # Read sections
         self.sections = collections.OrderedDict()
@@ -518,7 +519,10 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
             return
 
         ramargs = {}
-        ramargs['page_size'] = self.vmsd_desc['page_size']
+        if ram_only:
+            ramargs['page_size'] = 4096
+        else:
+            ramargs['page_size'] = self.vmsd_desc['page_size']
         ramargs['dump_memory'] = dump_memory
         ramargs['write_memory'] = write_memory
         self.section_classes[('ram',0)][1] = ramargs
@@ -579,6 +583,7 @@ def default(self, o):
 parser.add_argument("-m", "--memory", help='dump RAM contents as well', action='store_true')
 parser.add_argument("-d", "--dump", help='what to dump ("state" or "desc")', default='state')
 parser.add_argument("-x", "--extract", help='extract contents into individual files', action='store_true')
+parser.add_argument("--ram-only", help='parse migration dump containing only RAM', action='store_true')
 args = parser.parse_args()
 
 jsonenc = JSONEncoder(indent=4, separators=(',', ': '))
@@ -586,14 +591,14 @@ def default(self, o):
 if args.extract:
     dump = MigrationDump(args.file)
 
-    dump.read(desc_only = True)
+    dump.read(desc_only = True, ram_only = args.ram_only)
     print("desc.json")
     f = open("desc.json", "w")
     f.truncate()
     f.write(jsonenc.encode(dump.vmsd_desc))
     f.close()
 
-    dump.read(write_memory = True)
+    dump.read(write_memory = True, ram_only = args.ram_only)
     dict = dump.getDict()
     print("state.json")
     f = open("state.json", "w")
@@ -602,12 +607,12 @@ def default(self, o):
     f.close()
 elif args.dump == "state":
     dump = MigrationDump(args.file)
-    dump.read(dump_memory = args.memory)
+    dump.read(dump_memory = args.memory, ram_only = args.ram_only)
     dict = dump.getDict()
     print(jsonenc.encode(dict))
 elif args.dump == "desc":
     dump = MigrationDump(args.file)
-    dump.read(desc_only = True)
+    dump.read(desc_only = True, ram_only = args.ram_only)
     print(jsonenc.encode(dump.vmsd_desc))
 else:
     raise Exception("Please specify either -x, -d state or -d desc")
-- 
2.27.0


