Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C154DF55
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:43:20 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1my6-0000ob-UG
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjk-0001jt-I7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:28 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjh-0001tn-57
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:27 -0400
Received: by mail-lj1-x243.google.com with SMTP id r24so1014395ljn.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ph3j4rH0WZ7c2HoYuVqV3UOm1O3CpslfaOVdfqGvGvE=;
 b=c90Ma7x1oX3XWMLQ2qlJtb1EvLFpA7NTncR3Qwwhr6Imuwtt88oSJrPVKYx7xN8VU8
 K2pZK/YAIw4iQibQg689Hgvm8VYcRP63Q6egyUED4AEVq3cBrRiTCdOR9UFwe3vv/8wj
 FGSnsv9+harRiwwa24FVc4lehQdmYmyVs+sLcKy5zJTRg051Z8g1dtAoUgbgd8Lcc5X4
 tJ+71hk2yuEnEfd32NIVdZBKDxDTJhFufV6jXHIChmiF8aFJHL5cCukwdlbG7Lm9/nM0
 CTqHIXgp6kcw8PbqR/xHOd/P0YIbNlkHfUdzqA0MmJAySzeqCRI0/QNY2m19b/wK9c14
 xycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ph3j4rH0WZ7c2HoYuVqV3UOm1O3CpslfaOVdfqGvGvE=;
 b=qkk9xDG2tKOLJFDkeaPHzIvxi1Soe2N3MWqha+tb8YEaEqLmIejKtiPv0M6zEBHJfT
 JzliJQN7ZvBLoNH81oW0qbv2P4ctxKJtnz1upmDOBTEEjI2LTHOTTDAP5fCP+1kGN4ms
 AS6ERC3IImokpYVWRwGcEHB12yfOfiJJKs8nwbWVORjUmtIipxrHvT4Dgajns8BA8WzV
 tu0minPA+V3eq33NbjmA+jB/E8KnNnNn2j0vEd8pfRda69B3P3NDP8Z4YX9g1xhdTlqn
 DxppRNKlvNml4Ref69LzWT6CKo1Sm+0uqWhtdnYxm1RFXtBidDJLmHy7bKFMalZFF06f
 fusg==
X-Gm-Message-State: AJIora8Mztd0GooXQ+blYmaEoLxLxd4G1cHwtcz2G85f+gmaFWbZpwFx
 yah6vE7DIpqTTmhmfJT7cKvukXe2fJSnlUAx
X-Google-Smtp-Source: AGRyM1sXSCCpesdK4mmVQrU6dehinhSBueJnJdfzYrTSf3NGgrSYf3GSdJfDQ86DAhdo2lqQuiuu2g==
X-Received: by 2002:a2e:7813:0:b0:255:8e6e:1988 with SMTP id
 t19-20020a2e7813000000b002558e6e1988mr2071442ljc.107.1655375303434; 
 Thu, 16 Jun 2022 03:28:23 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:23 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 07/17] migration: analyze-migration script changed
Date: Thu, 16 Jun 2022 13:28:01 +0300
Message-Id: <20220616102811.219007-8-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x243.google.com
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


