Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473ED54DED3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:23:57 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mfM-0001Pa-29
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcD-0006vR-It
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:42 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcB-0000WF-Su
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:41 -0400
Received: by mail-lf1-x142.google.com with SMTP id t25so1502069lfg.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ph3j4rH0WZ7c2HoYuVqV3UOm1O3CpslfaOVdfqGvGvE=;
 b=sStIH6rbbvkDtEDz78prr4n0DVqTYw/wTTfCvx06D+557Ok4M6k4DQO1trHsqB1vLi
 evVip2RYfflnzI6kDK4UL2vot5Inls3FCpsijTfSXvVmYjQH6Hns1mmfk4DLBYQ3Kvj0
 h9KOksXnmYLbJghSTCtTrE3kfxIM6M2m5xivu6WK9CDMEkOMDVldfBuCyFnG8rCiRJVj
 Qyl4jMcpSXf+XC02QHDsfwr9H9wIRHqECGmOqtkwf9xbPd4xHf9NI4QXTNOuoWK8sX+X
 b9Wdw5FJzM8V8kHLwp0kZdqtmscTmLc/qrrd+yHoirXdSORZJ5YOgEQtTwOiAfZ2P+3F
 N0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ph3j4rH0WZ7c2HoYuVqV3UOm1O3CpslfaOVdfqGvGvE=;
 b=gEXBbx+SYZClCMohBOADja/truGeO58mhE6jQYCM/nPqiFmzuq5DLyAkWiY4OWrLMX
 qhS52Zlb+Igq35jFhd7OMUNZAMySlSIdpXAETAABQ7MAzNIkFSnSohHcIZicB8dHb+jF
 zPyQTCtVQOKeMbTmXRt1m8LargM0F3Z5PrfpBhDMxstxthxqn18xRFlHP4mCkFZIMkeb
 m/+m+/4br8h32xmwYmNqPwQLyZjtRoCxgHOrKNePJaatk2frfjG16A4W0BCbBEc7leZh
 m9xT1lZLzQn9rkzDOFTfr3Rr9bgz7Sq9J03mF6/3TGDxUdZGQpCqGoWEXP5HokZDzqhM
 r6Bg==
X-Gm-Message-State: AJIora/E+b/gfd/uvJk7cC5gnctvM8JI4HYcZWUWLBgS5txQOmS+fXiX
 rH4dLigfVcEUYcXKiH6375V19kdkXsdFriXF
X-Google-Smtp-Source: AGRyM1tAyzbkc2Mw7c8JUhE3oQ97JKVgnvsGVXpVY0T+csPh2zMTa5cJXr7Y1/eEJoeXpC5r2WkXNw==
X-Received: by 2002:a19:2d18:0:b0:47d:c71c:a88c with SMTP id
 k24-20020a192d18000000b0047dc71ca88cmr2224911lfj.622.1655374837629; 
 Thu, 16 Jun 2022 03:20:37 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:37 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 7/8] migration: analyze-migration script changed
Date: Thu, 16 Jun 2022 13:20:05 +0300
Message-Id: <20220616102006.218693-10-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x142.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

This script is used for RAM capabilities test. But it cannot work
in case of no vm description in migration stream.
So new flag is added to allow work this script with ram-only
migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
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
2.31.1


