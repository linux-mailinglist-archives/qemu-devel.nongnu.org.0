Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531536EB85
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:46:54 +0200 (CEST)
Received: from localhost ([::1]:59654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc70H-00021c-L4
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6vd-0005sS-28
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6vY-0002ul-JG
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK5LAVJE2lSL08KWIMnTmLLwjrZq4SLntJO5ytH4hbc=;
 b=NdQlENgj0izopAq2IfYRrhHLhaGeLyV+ZVdEfYFgv4vmUkrl0sEMNB9vrPu4f1GHIbvM8h
 VNVarTORd/pZmMB/iq1fQJh01meVgvx2lLeAYKCWpIxW7riaSDlfxxdYZBomY8XUPmfXhO
 COa4nXiBiHRC7F7woDZRfjmxAy8Z76M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-HzDonAfkN0Gy91XbQCrkUg-1; Thu, 29 Apr 2021 09:41:57 -0400
X-MC-Unique: HzDonAfkN0Gy91XbQCrkUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09E468BEB84
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 13:41:57 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 813F07013D;
 Thu, 29 Apr 2021 13:41:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] qapi: make 'if' condition strings simple identifiers
Date: Thu, 29 Apr 2021 17:40:31 +0400
Message-Id: <20210429134032.1125111-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Change the 'if' condition strings to be C-agnostic and be simple
identifiers.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/qapi-code-gen.txt                  |  8 +--
 qapi/block-core.json                          | 16 ++---
 qapi/block-export.json                        |  6 +-
 qapi/char.json                                |  8 +--
 qapi/machine-target.json                      | 40 ++++++-------
 qapi/migration.json                           | 10 ++--
 qapi/misc-target.json                         | 48 +++++++--------
 qapi/qom.json                                 | 10 ++--
 qapi/sockets.json                             |  4 +-
 qapi/ui.json                                  | 48 +++++++--------
 qga/qapi-schema.json                          |  8 +--
 scripts/qapi/common.py                        |  2 +-
 scripts/qapi/expr.py                          |  4 +-
 .../alternate-branch-if-invalid.err           |  2 +-
 tests/qapi-schema/bad-if-empty.err            |  2 +-
 tests/qapi-schema/bad-if-list.err             |  2 +-
 tests/qapi-schema/bad-if.json                 |  2 +-
 tests/qapi-schema/doc-good.json               |  6 +-
 tests/qapi-schema/doc-good.out                |  6 +-
 tests/qapi-schema/doc-good.txt                |  6 +-
 tests/qapi-schema/features-missing-name.json  |  2 +-
 tests/qapi-schema/qapi-schema-test.json       | 52 ++++++++--------
 tests/qapi-schema/qapi-schema-test.out        | 60 +++++++++----------
 tests/qapi-schema/union-branch-if-invalid.err |  2 +-
 24 files changed, 177 insertions(+), 177 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index c1cb6f987d..edaaf7ec40 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -791,7 +791,7 @@ will then be guarded by #if STRING for each STRING in the COND list.
 Example: a conditional struct
 
  { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
-   'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
+   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
 
 gets its generated code guarded like this:
 
@@ -810,7 +810,7 @@ member 'bar'
 
 { 'struct': 'IfStruct', 'data':
   { 'foo': 'int',
-    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
+    'bar': { 'type': 'int', 'if': 'IFCOND'} } }
 
 A union's discriminator may not be conditional.
 
@@ -822,7 +822,7 @@ value 'bar'
 
 { 'enum': 'IfEnum', 'data':
   [ 'foo',
-    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
+    { 'name' : 'bar', 'if': 'IFCOND' } ] }
 
 Likewise, features can be conditional.  This requires the longhand
 form of FEATURE.
@@ -832,7 +832,7 @@ Example: a struct with conditional feature 'allow-negative-numbers'
 { 'struct': 'TestType',
   'data': { 'number': 'int' },
   'features': [ { 'name': 'allow-negative-numbers',
-                  'if': 'defined(IFCOND)' } ] }
+                  'if': 'IFCOND' } ] }
 
 Please note that you are responsible to ensure that the C code will
 compile with an arbitrary combination of conditions, since the
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d227924d0..82213feb18 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2779,7 +2779,7 @@
 ##
 { 'enum': 'BlockdevAioOptions',
   'data': [ 'threads', 'native',
-            { 'name': 'io_uring', 'if': 'defined(CONFIG_LINUX_IO_URING)' } ] }
+            { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' } ] }
 
 ##
 # @BlockdevCacheOptions:
@@ -2817,7 +2817,7 @@
             'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
-            { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
+            { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
             'sheepdog',
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
 
@@ -2860,10 +2860,10 @@
             '*locking': 'OnOffAuto',
             '*aio': 'BlockdevAioOptions',
             '*drop-cache': {'type': 'bool',
-                            'if': 'defined(CONFIG_LINUX)'},
+                            'if': 'CONFIG_LINUX'},
             '*x-check-cache-dropped': 'bool' },
   'features': [ { 'name': 'dynamic-auto-read-only',
-                  'if': 'defined(CONFIG_POSIX)' } ] }
+                  'if': 'CONFIG_POSIX' } ] }
 
 ##
 # @BlockdevOptionsNull:
@@ -3683,7 +3683,7 @@
 # Since: 2.9
 ##
 { 'enum' : 'ReplicationMode', 'data' : [ 'primary', 'secondary' ],
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @BlockdevOptionsReplication:
@@ -3702,7 +3702,7 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'mode': 'ReplicationMode',
             '*top-id': 'str' },
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @NFSTransport:
@@ -4036,7 +4036,7 @@
       'raw':        'BlockdevOptionsRaw',
       'rbd':        'BlockdevOptionsRbd',
       'replication': { 'type': 'BlockdevOptionsReplication',
-                       'if': 'defined(CONFIG_REPLICATION)' },
+                       'if': 'CONFIG_REPLICATION' },
       'sheepdog':   'BlockdevOptionsSheepdog',
       'ssh':        'BlockdevOptionsSsh',
       'throttle':   'BlockdevOptionsThrottle',
@@ -4338,7 +4338,7 @@
 # Since: 5.1
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
diff --git a/qapi/block-export.json b/qapi/block-export.json
index e819e70cac..319992b1b0 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -137,7 +137,7 @@
 { 'struct': 'BlockExportOptionsFuse',
   'data': { 'mountpoint': 'str',
             '*growable': 'bool' },
-  'if': 'defined(CONFIG_FUSE)' }
+  'if': 'CONFIG_FUSE' }
 
 ##
 # @NbdServerAddOptions:
@@ -247,7 +247,7 @@
 ##
 { 'enum': 'BlockExportType',
   'data': [ 'nbd', 'vhost-user-blk',
-            { 'name': 'fuse', 'if': 'defined(CONFIG_FUSE)' } ] }
+            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
 # @BlockExportOptions:
@@ -290,7 +290,7 @@
       'nbd': 'BlockExportOptionsNbd',
       'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
       'fuse': { 'type': 'BlockExportOptionsFuse',
-                'if': 'defined(CONFIG_FUSE)' }
+                'if': 'CONFIG_FUSE' }
    } }
 
 ##
diff --git a/qapi/char.json b/qapi/char.json
index 6413970fa7..bf3f8d54e5 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -342,7 +342,7 @@
 { 'struct': 'ChardevSpiceChannel',
   'data': { 'type': 'str' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @ChardevSpicePort:
@@ -356,7 +356,7 @@
 { 'struct': 'ChardevSpicePort',
   'data': { 'fqdn': 'str' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @ChardevVC:
@@ -414,9 +414,9 @@
             'stdio': 'ChardevStdio',
             'console': 'ChardevCommon',
             'spicevmc': { 'type': 'ChardevSpiceChannel',
-                          'if': 'defined(CONFIG_SPICE)' },
+                          'if': 'CONFIG_SPICE' },
             'spiceport': { 'type': 'ChardevSpicePort',
-                           'if': 'defined(CONFIG_SPICE)' },
+                           'if': 'CONFIG_SPICE' },
             'vc': 'ChardevVC',
             'ringbuf': 'ChardevRingbuf',
             # next one is just for compatibility
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 9b56b81bea..f5ec4bc172 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -89,7 +89,7 @@
 ##
 { 'struct': 'CpuModelBaselineInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @CpuModelCompareInfo:
@@ -112,7 +112,7 @@
 { 'struct': 'CpuModelCompareInfo',
   'data': { 'result': 'CpuModelCompareResult',
             'responsible-properties': ['str'] },
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @query-cpu-model-comparison:
@@ -156,7 +156,7 @@
 { 'command': 'query-cpu-model-comparison',
   'data': { 'modela': 'CpuModelInfo', 'modelb': 'CpuModelInfo' },
   'returns': 'CpuModelCompareInfo',
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @query-cpu-model-baseline:
@@ -200,7 +200,7 @@
   'data': { 'modela': 'CpuModelInfo',
             'modelb': 'CpuModelInfo' },
   'returns': 'CpuModelBaselineInfo',
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @CpuModelExpansionInfo:
@@ -213,9 +213,9 @@
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': { 'any': [ 'defined(TARGET_S390X)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_ARM)'] } }
+  'if': { 'any': [ 'TARGET_S390X',
+                   'TARGET_I386',
+                   'TARGET_ARM' ] } }
 
 ##
 # @query-cpu-model-expansion:
@@ -254,9 +254,9 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': { 'any': [ 'defined(TARGET_S390X)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_ARM)' ] } }
+  'if': { 'any': [ 'TARGET_S390X',
+                   'TARGET_I386',
+                   'TARGET_ARM' ] } }
 
 ##
 # @CpuDefinitionInfo:
@@ -320,11 +320,11 @@
             'typename': 'str',
             '*alias-of' : 'str',
             'deprecated' : 'bool' },
-  'if': { 'any': [ 'defined(TARGET_PPC)',
-                   'defined(TARGET_ARM)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_S390X)',
-                   'defined(TARGET_MIPS)' ] } }
+  'if': { 'any': [ 'TARGET_PPC',
+                   'TARGET_ARM',
+                   'TARGET_I386',
+                   'TARGET_S390X',
+                   'TARGET_MIPS' ] } }
 
 ##
 # @query-cpu-definitions:
@@ -336,8 +336,8 @@
 # Since: 1.2
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
-  'if': { 'any': [ 'defined(TARGET_PPC)',
-                   'defined(TARGET_ARM)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_S390X)',
-                   'defined(TARGET_MIPS)' ] } }
+  'if': { 'any': [ 'TARGET_PPC',
+                   'TARGET_ARM',
+                   'TARGET_I386',
+                   'TARGET_S390X',
+                   'TARGET_MIPS' ] } }
diff --git a/qapi/migration.json b/qapi/migration.json
index 0b17cce46b..43e7b7620d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -539,7 +539,7 @@
 ##
 { 'enum': 'MultiFDCompression',
   'data': [ 'none', 'zlib',
-            { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
+            { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }
 
 ##
 # @BitmapMigrationBitmapAliasTransform:
@@ -1568,7 +1568,7 @@
 ##
 { 'command': 'xen-set-replication',
   'data': { 'enable': 'bool', 'primary': 'bool', '*failover' : 'bool' },
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @ReplicationStatus:
@@ -1584,7 +1584,7 @@
 ##
 { 'struct': 'ReplicationStatus',
   'data': { 'error': 'bool', '*desc': 'str' },
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @query-xen-replication-status:
@@ -1602,7 +1602,7 @@
 ##
 { 'command': 'query-xen-replication-status',
   'returns': 'ReplicationStatus',
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @xen-colo-do-checkpoint:
@@ -1619,7 +1619,7 @@
 # Since: 2.9
 ##
 { 'command': 'xen-colo-do-checkpoint',
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @COLOStatus:
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 2891df6890..5d3c816eb8 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -23,18 +23,18 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int' },
-  'if': { 'any': [ 'defined(TARGET_ALPHA)',
-                   'defined(TARGET_ARM)',
-                   'defined(TARGET_HPPA)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_MIPS)',
-                   'defined(TARGET_MIPS64)',
-                   'defined(TARGET_MOXIE)',
-                   'defined(TARGET_PPC)',
-                   'defined(TARGET_PPC64)',
-                   'defined(TARGET_S390X)',
-                   'defined(TARGET_SH4)',
-                   'defined(TARGET_SPARC)' ] } }
+  'if': { 'any': [ 'TARGET_ALPHA',
+                   'TARGET_ARM',
+                   'TARGET_HPPA',
+                   'TARGET_I386',
+                   'TARGET_MIPS',
+                   'TARGET_MIPS64',
+                   'TARGET_MOXIE',
+                   'TARGET_PPC',
+                   'TARGET_PPC64',
+                   'TARGET_S390X',
+                   'TARGET_SH4',
+                   'TARGET_SPARC' ] } }
 
 ##
 # @rtc-reset-reinjection:
@@ -53,7 +53,7 @@
 #
 ##
 { 'command': 'rtc-reset-reinjection',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 
 ##
@@ -80,7 +80,7 @@
 { 'enum': 'SevState',
   'data': ['uninit', 'launch-update', 'launch-secret', 'running',
            'send-update', 'receive-update' ],
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @SevInfo:
@@ -112,7 +112,7 @@
               'state' : 'SevState',
               'handle' : 'uint32'
             },
-  'if': 'defined(TARGET_I386)'
+  'if': 'TARGET_I386'
 }
 
 ##
@@ -133,7 +133,7 @@
 #
 ##
 { 'command': 'query-sev', 'returns': 'SevInfo',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 
 ##
@@ -147,7 +147,7 @@
 #
 ##
 { 'struct': 'SevLaunchMeasureInfo', 'data': {'data': 'str'},
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @query-sev-launch-measure:
@@ -165,7 +165,7 @@
 #
 ##
 { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 
 ##
@@ -190,7 +190,7 @@
             'cert-chain': 'str',
             'cbitpos': 'int',
             'reduced-phys-bits': 'int'},
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @query-sev-capabilities:
@@ -210,7 +210,7 @@
 #
 ##
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @sev-inject-launch-secret:
@@ -228,7 +228,7 @@
 ##
 { 'command': 'sev-inject-launch-secret',
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @dump-skeys:
@@ -250,7 +250,7 @@
 ##
 { 'command': 'dump-skeys',
   'data': { 'filename': 'str' },
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @GICCapability:
@@ -275,7 +275,7 @@
   'data': { 'version': 'int',
             'emulated': 'bool',
             'kernel': 'bool' },
-  'if': 'defined(TARGET_ARM)' }
+  'if': 'TARGET_ARM' }
 
 ##
 # @query-gic-capabilities:
@@ -295,4 +295,4 @@
 #
 ##
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
-  'if': 'defined(TARGET_ARM)' }
+  'if': 'TARGET_ARM' }
diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d564..6c41ec61b0 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -603,7 +603,7 @@
   'data': { '*align': 'size',
             '*discard-data': 'bool',
             'mem-path': 'str',
-            '*pmem': { 'type': 'bool', 'if': 'defined(CONFIG_LIBPMEM)' },
+            '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },
             '*readonly': 'bool' } }
 
 ##
@@ -752,7 +752,7 @@
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     { 'name': 'cryptodev-vhost-user',
-      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
+      'if': 'CONFIG_VHOST_CRYPTO' },
     'dbus-vmstate',
     'filter-buffer',
     'filter-dump',
@@ -765,7 +765,7 @@
     'iothread',
     'memory-backend-file',
     { 'name': 'memory-backend-memfd',
-      'if': 'defined(CONFIG_LINUX)' },
+      'if': 'CONFIG_LINUX' },
     'memory-backend-ram',
     'pef-guest',
     'pr-manager-helper',
@@ -809,7 +809,7 @@
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
+                                      'if': 'CONFIG_VHOST_CRYPTO' },
       'dbus-vmstate':               'DBusVMStateProperties',
       'filter-buffer':              'FilterBufferProperties',
       'filter-dump':                'FilterDumpProperties',
@@ -822,7 +822,7 @@
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
-                                      'if': 'defined(CONFIG_LINUX)' },
+                                      'if': 'CONFIG_LINUX' },
       'memory-backend-ram':         'MemoryBackendProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
diff --git a/qapi/sockets.json b/qapi/sockets.json
index 2e83452797..a0c08aa4ba 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -86,8 +86,8 @@
 { 'struct': 'UnixSocketAddress',
   'data': {
     'path': 'str',
-    '*abstract': { 'type': 'bool', 'if': 'defined(CONFIG_LINUX)' },
-    '*tight': { 'type': 'bool', 'if': 'defined(CONFIG_LINUX)' } } }
+    '*abstract': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
+    '*tight': { 'type': 'bool', 'if': 'CONFIG_LINUX' } } }
 
 ##
 # @VsockSocketAddress:
diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..ec29a66c9f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -123,7 +123,7 @@
   'data': { 'host': 'str',
             'port': 'str',
             'family': 'NetworkAddressFamily' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceServerInfo:
@@ -137,7 +137,7 @@
 { 'struct': 'SpiceServerInfo',
   'base': 'SpiceBasicInfo',
   'data': { '*auth': 'str' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceChannel:
@@ -163,7 +163,7 @@
   'base': 'SpiceBasicInfo',
   'data': {'connection-id': 'int', 'channel-type': 'int', 'channel-id': 'int',
            'tls': 'bool'},
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceQueryMouseMode:
@@ -183,7 +183,7 @@
 ##
 { 'enum': 'SpiceQueryMouseMode',
   'data': [ 'client', 'server', 'unknown' ],
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceInfo:
@@ -222,7 +222,7 @@
   'data': {'enabled': 'bool', 'migrated': 'bool', '*host': 'str', '*port': 'int',
            '*tls-port': 'int', '*auth': 'str', '*compiled-version': 'str',
            'mouse-mode': 'SpiceQueryMouseMode', '*channels': ['SpiceChannel']},
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @query-spice:
@@ -268,7 +268,7 @@
 #
 ##
 { 'command': 'query-spice', 'returns': 'SpiceInfo',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_CONNECTED:
@@ -294,7 +294,7 @@
 { 'event': 'SPICE_CONNECTED',
   'data': { 'server': 'SpiceBasicInfo',
             'client': 'SpiceBasicInfo' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_INITIALIZED:
@@ -323,7 +323,7 @@
 { 'event': 'SPICE_INITIALIZED',
   'data': { 'server': 'SpiceServerInfo',
             'client': 'SpiceChannel' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_DISCONNECTED:
@@ -349,7 +349,7 @@
 { 'event': 'SPICE_DISCONNECTED',
   'data': { 'server': 'SpiceBasicInfo',
             'client': 'SpiceBasicInfo' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_MIGRATE_COMPLETED:
@@ -365,7 +365,7 @@
 #
 ##
 { 'event': 'SPICE_MIGRATE_COMPLETED',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # == VNC
@@ -393,7 +393,7 @@
             'service': 'str',
             'family': 'NetworkAddressFamily',
             'websocket': 'bool' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncServerInfo:
@@ -408,7 +408,7 @@
 { 'struct': 'VncServerInfo',
   'base': 'VncBasicInfo',
   'data': { '*auth': 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncClientInfo:
@@ -426,7 +426,7 @@
 { 'struct': 'VncClientInfo',
   'base': 'VncBasicInfo',
   'data': { '*x509_dname': 'str', '*sasl_username': 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncInfo:
@@ -469,7 +469,7 @@
   'data': {'enabled': 'bool', '*host': 'str',
            '*family': 'NetworkAddressFamily',
            '*service': 'str', '*auth': 'str', '*clients': ['VncClientInfo']},
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncPrimaryAuth:
@@ -481,7 +481,7 @@
 { 'enum': 'VncPrimaryAuth',
   'data': [ 'none', 'vnc', 'ra2', 'ra2ne', 'tight', 'ultra',
             'tls', 'vencrypt', 'sasl' ],
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncVencryptSubAuth:
@@ -496,7 +496,7 @@
             'tls-vnc',   'x509-vnc',
             'tls-plain', 'x509-plain',
             'tls-sasl',  'x509-sasl' ],
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncServerInfo2:
@@ -514,7 +514,7 @@
   'base': 'VncBasicInfo',
   'data': { 'auth'      : 'VncPrimaryAuth',
             '*vencrypt' : 'VncVencryptSubAuth' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncInfo2:
@@ -547,7 +547,7 @@
             'auth'      : 'VncPrimaryAuth',
             '*vencrypt' : 'VncVencryptSubAuth',
             '*display'  : 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @query-vnc:
@@ -579,7 +579,7 @@
 #
 ##
 { 'command': 'query-vnc', 'returns': 'VncInfo',
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 ##
 # @query-vnc-servers:
 #
@@ -590,7 +590,7 @@
 # Since: 2.3
 ##
 { 'command': 'query-vnc-servers', 'returns': ['VncInfo2'],
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @change-vnc-password:
@@ -606,7 +606,7 @@
 ##
 { 'command': 'change-vnc-password',
   'data': { 'password': 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VNC_CONNECTED:
@@ -636,7 +636,7 @@
 { 'event': 'VNC_CONNECTED',
   'data': { 'server': 'VncServerInfo',
             'client': 'VncBasicInfo' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VNC_INITIALIZED:
@@ -664,7 +664,7 @@
 { 'event': 'VNC_INITIALIZED',
   'data': { 'server': 'VncServerInfo',
             'client': 'VncClientInfo' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VNC_DISCONNECTED:
@@ -691,7 +691,7 @@
 { 'event': 'VNC_DISCONNECTED',
   'data': { 'server': 'VncServerInfo',
             'client': 'VncClientInfo' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # = Input
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index fb17eebde3..c60f5e669d 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1380,7 +1380,7 @@
   'data': {
       'keys': ['str']
   },
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
 
 
 ##
@@ -1398,7 +1398,7 @@
 { 'command': 'guest-ssh-get-authorized-keys',
   'data': { 'username': 'str' },
   'returns': 'GuestAuthorizedKeys',
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
 
 ##
 # @guest-ssh-add-authorized-keys:
@@ -1416,7 +1416,7 @@
 ##
 { 'command': 'guest-ssh-add-authorized-keys',
   'data': { 'username': 'str', 'keys': ['str'], '*reset': 'bool' },
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
 
 ##
 # @guest-ssh-remove-authorized-keys:
@@ -1434,4 +1434,4 @@
 ##
 { 'command': 'guest-ssh-remove-authorized-keys',
   'data': { 'username': 'str', 'keys': ['str'] },
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 6236bfc457..2a36e0366e 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -210,7 +210,7 @@ def __init__(self, option: str):
         self.option = option
 
     def cgen(self) -> str:
-        return self.option
+        return f"defined({self.option})"
 
     def docgen(self) -> str:
         return self.option
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 0a97a6f020..a605a796db 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -294,10 +294,10 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
     def normalize(cond: Union[str, List[str], object]) -> IfPredicate:
         if isinstance(cond, str):
-            if not cond.strip():
+            if not cond.isidentifier():
                 raise QAPISemError(
                     info,
-                    "'if' condition '%s' of %s makes no sense"
+                    "'if' condition '%s' of %s is not a valid identifier"
                     % (cond, source))
             return IfOption(cond)
         if isinstance(cond, list):
diff --git a/tests/qapi-schema/alternate-branch-if-invalid.err b/tests/qapi-schema/alternate-branch-if-invalid.err
index d384929c51..03bad877a3 100644
--- a/tests/qapi-schema/alternate-branch-if-invalid.err
+++ b/tests/qapi-schema/alternate-branch-if-invalid.err
@@ -1,2 +1,2 @@
 alternate-branch-if-invalid.json: In alternate 'Alt':
-alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member 'branch' makes no sense
+alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member 'branch' is not a valid identifier
diff --git a/tests/qapi-schema/bad-if-empty.err b/tests/qapi-schema/bad-if-empty.err
index a0f3effefb..5208f543ce 100644
--- a/tests/qapi-schema/bad-if-empty.err
+++ b/tests/qapi-schema/bad-if-empty.err
@@ -1,2 +1,2 @@
 bad-if-empty.json: In struct 'TestIfStruct':
-bad-if-empty.json:2: 'if' condition '' of struct makes no sense
+bad-if-empty.json:2: 'if' condition '' of struct is not a valid identifier
diff --git a/tests/qapi-schema/bad-if-list.err b/tests/qapi-schema/bad-if-list.err
index c462f11b90..fa01894d03 100644
--- a/tests/qapi-schema/bad-if-list.err
+++ b/tests/qapi-schema/bad-if-list.err
@@ -1,2 +1,2 @@
 bad-if-list.json: In struct 'TestIfStruct':
-bad-if-list.json:2: 'if' condition ' ' of struct makes no sense
+bad-if-list.json:2: 'if' condition ' ' of struct is not a valid identifier
diff --git a/tests/qapi-schema/bad-if.json b/tests/qapi-schema/bad-if.json
index 3edd1a0bf2..67818888de 100644
--- a/tests/qapi-schema/bad-if.json
+++ b/tests/qapi-schema/bad-if.json
@@ -1,3 +1,3 @@
 # check invalid 'if' type
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': { 'value': 'defined(TEST_IF_STRUCT)' } }
+  'if': { 'value': 'TEST_IF_STRUCT' } }
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 423ea23e07..ae531e89b5 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -61,9 +61,9 @@
 # @two is undocumented
 ##
 { 'enum': 'Enum', 'data':
-  [ { 'name': 'one', 'if': 'defined(IFONE)' }, 'two' ],
+  [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
   'features': [ 'enum-feat' ],
-  'if': 'defined(IFCOND)' }
+  'if': 'IFCOND' }
 
 ##
 # @Base:
@@ -86,7 +86,7 @@
   'features': [ 'variant1-feat' ],
   'data': { 'var1': { 'type': 'str',
                       'features': [ 'member-feat' ],
-                      'if': 'defined(IFSTR)' } } }
+                      'if': 'IFSTR' } } }
 
 ##
 # @Variant2:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index ca7e53f3b5..869d0b8636 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,15 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if 'defined(IFONE)'
+        if 'IFONE'
     member two
-    if 'defined(IFCOND)'
+    if 'IFCOND'
     feature enum-feat
 object Base
     member base1: Enum optional=False
 object Variant1
     member var1: str optional=False
-        if 'defined(IFSTR)'
+        if 'IFSTR'
         feature member-feat
     feature variant1-feat
 object Variant2
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 726727af74..27b7ce8799 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -43,7 +43,7 @@ Example:
 Values
 ~~~~~~
 
-"one" (**If: **"defined(IFONE)")
+"one" (**If: **"IFONE")
    The _one_ {and only}
 
 "two"
@@ -62,7 +62,7 @@ Features
 If
 ~~
 
-"defined(IFCOND)"
+"IFCOND"
 
 
 "Base" (Object)
@@ -87,7 +87,7 @@ Another paragraph (but no "var": line)
 Members
 ~~~~~~~
 
-"var1": "string" (**If: **"defined(IFSTR)")
+"var1": "string" (**If: **"IFSTR")
    Not documented
 
 
diff --git a/tests/qapi-schema/features-missing-name.json b/tests/qapi-schema/features-missing-name.json
index 2314f97c00..8772c8f7b3 100644
--- a/tests/qapi-schema/features-missing-name.json
+++ b/tests/qapi-schema/features-missing-name.json
@@ -1,3 +1,3 @@
 { 'struct': 'FeatureStruct0',
   'data': { 'foo': 'int' },
-  'features': [ { 'if': 'defined(NAMELESS_FEATURES)' } ] }
+  'features': [ { 'if': 'NAMELESS_FEATURES' } ] }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 2d5e480b44..fad64d879f 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -222,43 +222,43 @@
 
 { 'struct': 'TestIfStruct', 'data':
   { 'foo': 'int',
-    'bar': { 'type': 'int', 'if': 'defined(TEST_IF_STRUCT_BAR)'} },
-  'if': 'defined(TEST_IF_STRUCT)' }
+    'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
+  'if': 'TEST_IF_STRUCT' }
 
 { 'enum': 'TestIfEnum', 'data':
-  [ 'foo', { 'name' : 'bar', 'if': 'defined(TEST_IF_ENUM_BAR)' } ],
-  'if': 'defined(TEST_IF_ENUM)' }
+  [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
+  'if': 'TEST_IF_ENUM' }
 
 { 'union': 'TestIfUnion', 'data':
   { 'foo': 'TestStruct',
-    'union-bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
-  'if': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] }
+    'union-bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
+  'if': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] }
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
-  'if': 'defined(TEST_IF_UNION)' }
+  'if': 'TEST_IF_UNION' }
 
 { 'alternate': 'TestIfAlternate', 'data':
   { 'foo': 'int',
-    'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
-  'if': {'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
+    'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
+  'if': {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': {'all': ['defined(TEST_IF_ALT)', {'not': 'defined(TEST_IF_NOT_ALT)'}] } }
+  'if': {'all': ['TEST_IF_ALT', {'not': 'TEST_IF_NOT_ALT'}] } }
 
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
-    'bar': { 'type': 'TestIfEnum', 'if': 'defined(TEST_IF_CMD_BAR)' } },
+    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_BAR' } },
   'returns': 'UserDefThree',
-  'if': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] }
+  'if': ['TEST_IF_CMD', 'TEST_IF_STRUCT'] }
 
 { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
 { 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
-    'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } },
-  'if': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] }
+    'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
+  'if': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] }
 
 # test 'features'
 
@@ -280,19 +280,19 @@
 
 { 'struct': 'CondFeatureStruct1',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'} ] }
 { 'struct': 'CondFeatureStruct2',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'},
-                { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'},
+                { 'name': 'feature2', 'if': 'TEST_IF_FEATURE_2'} ] }
 { 'struct': 'CondFeatureStruct3',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1', 'if': [ 'TEST_IF_COND_1',
+                                              'TEST_IF_COND_2'] } ] }
 { 'struct': 'CondFeatureStruct4',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': {'any': ['defined(TEST_IF_COND_1)',
-                                                     'defined(TEST_IF_COND_2)'] } } ] }
+  'features': [ { 'name': 'feature1', 'if': {'any': ['TEST_IF_COND_1',
+                                                     'TEST_IF_COND_2'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -327,13 +327,13 @@
   'features': [ 'feature1', 'feature2' ] }
 
 { 'command': 'test-command-cond-features1',
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'} ] }
 { 'command': 'test-command-cond-features2',
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'},
-                { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'},
+                { 'name': 'feature2', 'if': 'TEST_IF_FEATURE_2'} ] }
 { 'command': 'test-command-cond-features3',
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1', 'if': [ 'TEST_IF_COND_1',
+                                              'TEST_IF_COND_2' ] } ] }
 
 { 'event': 'TEST_EVENT_FEATURES0',
   'data': 'FeatureStruct1' }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index f859bf648d..95006e60c4 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if 'defined(TEST_IF_STRUCT_BAR)'
-    if 'defined(TEST_IF_STRUCT)'
+        if 'TEST_IF_STRUCT_BAR'
+    if 'TEST_IF_STRUCT'
 enum TestIfEnum
     member foo
     member bar
-        if 'defined(TEST_IF_ENUM_BAR)'
-    if 'defined(TEST_IF_ENUM)'
+        if 'TEST_IF_ENUM_BAR'
+    if 'TEST_IF_ENUM'
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
     member union-bar
-        if 'defined(TEST_IF_UNION_BAR)'
-    if IfAll(['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])
+        if 'TEST_IF_UNION_BAR'
+    if IfAll(['TEST_IF_UNION', 'TEST_IF_STRUCT'])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case union-bar: q_obj_str-wrapper
-        if 'defined(TEST_IF_UNION_BAR)'
-    if IfAll(['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])
+        if 'TEST_IF_UNION_BAR'
+    if IfAll(['TEST_IF_UNION', 'TEST_IF_STRUCT'])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if 'defined(TEST_IF_UNION)'
+    if 'TEST_IF_UNION'
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if 'defined(TEST_IF_UNION)'
+    if 'TEST_IF_UNION'
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if 'defined(TEST_IF_ALT_BAR)'
-    if IfAll(['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])
+        if 'TEST_IF_ALT_BAR'
+    if IfAll(['TEST_IF_ALT', 'TEST_IF_STRUCT'])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if IfAll(['defined(TEST_IF_ALT)', IfNot('defined(TEST_IF_NOT_ALT)')])
+    if IfAll(['TEST_IF_ALT', IfNot('TEST_IF_NOT_ALT')])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if IfAll(['defined(TEST_IF_ALT)', IfNot('defined(TEST_IF_NOT_ALT)')])
+    if IfAll(['TEST_IF_ALT', IfNot('TEST_IF_NOT_ALT')])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if 'defined(TEST_IF_CMD_BAR)'
-    if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
+        if 'TEST_IF_CMD_BAR'
+    if IfAll(['TEST_IF_CMD', 'TEST_IF_STRUCT'])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
+    if IfAll(['TEST_IF_CMD', 'TEST_IF_STRUCT'])
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if 'defined(TEST_IF_ENUM)'
+    if 'TEST_IF_ENUM'
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if 'defined(TEST_IF_EVT_BAR)'
-    if IfAll(['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])
+        if 'TEST_IF_EVT_BAR'
+    if IfAll(['TEST_IF_EVT', 'TEST_IF_STRUCT'])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if IfAll(['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])
+    if IfAll(['TEST_IF_EVT', 'TEST_IF_STRUCT'])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,21 +379,21 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if 'defined(TEST_IF_FEATURE_1)'
+        if 'TEST_IF_FEATURE_1'
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if 'defined(TEST_IF_FEATURE_1)'
+        if 'TEST_IF_FEATURE_1'
     feature feature2
-        if 'defined(TEST_IF_FEATURE_2)'
+        if 'TEST_IF_FEATURE_2'
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
+        if IfAll(['TEST_IF_COND_1', 'TEST_IF_COND_2'])
 object CondFeatureStruct4
     member foo: int optional=False
     feature feature1
-        if IfAny(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
+        if IfAny(['TEST_IF_COND_1', 'TEST_IF_COND_2'])
 enum FeatureEnum1
     member eins
     member zwei
@@ -434,17 +434,17 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if 'defined(TEST_IF_FEATURE_1)'
+        if 'TEST_IF_FEATURE_1'
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if 'defined(TEST_IF_FEATURE_1)'
+        if 'TEST_IF_FEATURE_1'
     feature feature2
-        if 'defined(TEST_IF_FEATURE_2)'
+        if 'TEST_IF_FEATURE_2'
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
+        if IfAll(['TEST_IF_COND_1', 'TEST_IF_COND_2'])
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
diff --git a/tests/qapi-schema/union-branch-if-invalid.err b/tests/qapi-schema/union-branch-if-invalid.err
index dd4518233e..046187a5b9 100644
--- a/tests/qapi-schema/union-branch-if-invalid.err
+++ b/tests/qapi-schema/union-branch-if-invalid.err
@@ -1,2 +1,2 @@
 union-branch-if-invalid.json: In union 'Uni':
-union-branch-if-invalid.json:4: 'if' condition '' of 'data' member 'branch1' makes no sense
+union-branch-if-invalid.json:4: 'if' condition '' of 'data' member 'branch1' is not a valid identifier
-- 
2.29.0


