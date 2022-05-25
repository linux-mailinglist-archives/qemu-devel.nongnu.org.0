Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C7533F0A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:24:03 +0200 (CEST)
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrve-0000DM-52
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntrgf-0001pk-Go
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntrgc-0007kI-2V
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653487708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iZnmPJue/NmL7md83rqZ3ES1Iqkc+OXj+MVK5QY0Tds=;
 b=Y3lugd+PELzulW9iFGdi1dTwHeyxUj214BFqA6uhSElDVk7d9DhUceN0zoeYK+xaI5RjfT
 YO94TFw6ANjmHPxrF88lUJffU6rBoOAWHDF/uS3IicYuKLlzunbbnuLwfp1PpKeJVR4WMu
 8V0qeE05OXQmfUYE5cNnM9FGn9my5xc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-n9YmAEOmPWWk0xSqBftybg-1; Wed, 25 May 2022 10:08:27 -0400
X-MC-Unique: n9YmAEOmPWWk0xSqBftybg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r14-20020aa7cfce000000b0042bcefd6109so707803edy.13
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 07:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iZnmPJue/NmL7md83rqZ3ES1Iqkc+OXj+MVK5QY0Tds=;
 b=kdO5dZ6zygE4/wBNpPiQtQJSvqEm1vzk7DMuRLkQR4o8Ja3SJsgvQWL/dR8N1iG/9k
 GUbmMPCrIY5ijUAPACA7gQuN8ZZVHtMwTHG5dzrAwymjI750ih+u+J2oDxl1uDXj2kGh
 pqzCWTwF4dWzPDLU36A3k31/VARqVrDZIFYkyB/VfG1ewiWJVLL4VO82U6WLQb8x92FR
 T9Dv3RcfvNQpvdcxx8xmUh/P/YgfvNdmEdGLYgjj3EyEz/cQBG2fwzcXpRgXE+WznzMt
 p3j1OvzvSrE2IdLHR7NzJdq6O86cNQjMooL+/Byjua6X4w54ikfNGHgKchJ3Lz3yeKZ/
 AgsQ==
X-Gm-Message-State: AOAM5320+8WLuMUTwuYugBzy80AsHAdkwiIBro1MJDtdY/1RIPuE9Lzc
 T6lSGG32kGcV4qw2Uy8vYGBdPg7oe2dYMhCxkaXAYYvxO9iI040UCo4PCWbro9G0ZbXRwNtQkLz
 T8h0PkyuMee31D6ipyGgyujiLhUeMNQ3s9hh/YMw1Q+xxitPmt3ZR3EbRWhTBkHkggHw=
X-Received: by 2002:a17:907:9087:b0:6fe:93de:6d64 with SMTP id
 ge7-20020a170907908700b006fe93de6d64mr28804571ejb.597.1653487705799; 
 Wed, 25 May 2022 07:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAI1Mko9K2vjWk+2ukV2z5V5EqUC2ibdawulDVr/0loySjev3fO1CM4p+rPWY75i1+4dE4QA==
X-Received: by 2002:a17:907:9087:b0:6fe:93de:6d64 with SMTP id
 ge7-20020a170907908700b006fe93de6d64mr28804506ejb.597.1653487705062; 
 Wed, 25 May 2022 07:08:25 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a056402231900b0042ad05632a1sm10847335eda.23.2022.05.25.07.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 07:08:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH RESEND] block: add more commands to preconfig mode
Date: Wed, 25 May 2022 16:08:23 +0200
Message-Id: <20220525140823.277217-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Of the block device commands, those that are available outside system
emulators do not require a fully constructed machine by definition.
Allow running them before machine initialization has concluded.

Of the ones that are available inside system emulation, allow querying
the PR managers, and setting up accounting and throttling.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/block-core.json   | 117 +++++++++++++++++++++++++++--------------
 qapi/block-export.json |  21 +++++---
 qapi/block.json        |   6 ++-
 hmp-commands.hx        |  14 +++++
 4 files changed, 110 insertions(+), 48 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index f0383c7925..457df16638 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -737,7 +737,8 @@
 #    }
 #
 ##
-{ 'command': 'query-block', 'returns': ['BlockInfo'] }
+{ 'command': 'query-block', 'returns': ['BlockInfo'],
+  'allow-preconfig': true }
 
 ##
 # @BlockDeviceTimedStats:
@@ -1113,7 +1114,8 @@
 ##
 { 'command': 'query-blockstats',
   'data': { '*query-nodes': 'bool' },
-  'returns': ['BlockStats'] }
+  'returns': ['BlockStats'],
+  'allow-preconfig': true }
 
 ##
 # @BlockdevOnError:
@@ -1262,7 +1264,8 @@
 #
 # Since: 1.1
 ##
-{ 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'] }
+{ 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'],
+  'allow-preconfig': true }
 
 ##
 # @block_resize:
@@ -1293,7 +1296,8 @@
   'data': { '*device': 'str',
             '*node-name': 'str',
             'size': 'int' },
-  'coroutine': true }
+  'coroutine': true,
+  'allow-preconfig': true }
 
 ##
 # @NewImageMode:
@@ -1509,7 +1513,8 @@
 #
 ##
 { 'command': 'blockdev-snapshot-sync',
-  'data': 'BlockdevSnapshotSync' }
+  'data': 'BlockdevSnapshotSync',
+  'allow-preconfig': true }
 
 ##
 # @blockdev-snapshot:
@@ -1550,7 +1555,8 @@
 ##
 { 'command': 'blockdev-snapshot',
   'data': 'BlockdevSnapshot',
-  'features': [ 'allow-write-only-overlay' ] }
+  'features': [ 'allow-write-only-overlay' ],
+  'allow-preconfig': true }
 
 ##
 # @change-backing-file:
@@ -1582,7 +1588,8 @@
 ##
 { 'command': 'change-backing-file',
   'data': { 'device': 'str', 'image-node-name': 'str',
-            'backing-file': 'str' } }
+            'backing-file': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-commit:
@@ -1692,7 +1699,8 @@
             '*backing-file': 'str', '*speed': 'int',
             '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
-            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
+            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @drive-backup:
@@ -1721,7 +1729,8 @@
 #
 ##
 { 'command': 'drive-backup', 'boxed': true,
-  'data': 'DriveBackup', 'features': ['deprecated'] }
+  'data': 'DriveBackup', 'features': ['deprecated'],
+  'allow-preconfig': true }
 
 ##
 # @blockdev-backup:
@@ -1747,7 +1756,8 @@
 #
 ##
 { 'command': 'blockdev-backup', 'boxed': true,
-  'data': 'BlockdevBackup' }
+  'data': 'BlockdevBackup',
+  'allow-preconfig': true }
 
 ##
 # @query-named-block-nodes:
@@ -1813,7 +1823,8 @@
 ##
 { 'command': 'query-named-block-nodes',
   'returns': [ 'BlockDeviceInfo' ],
-  'data': { '*flat': 'bool' } }
+  'data': { '*flat': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @XDbgBlockGraphNodeType:
@@ -1922,7 +1933,8 @@
 # Since: 4.0
 ##
 { 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph',
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @drive-mirror:
@@ -1950,7 +1962,8 @@
 #
 ##
 { 'command': 'drive-mirror', 'boxed': true,
-  'data': 'DriveMirror' }
+  'data': 'DriveMirror',
+  'allow-preconfig': true }
 
 ##
 # @DriveMirror:
@@ -2123,7 +2136,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-add',
-  'data': 'BlockDirtyBitmapAdd' }
+  'data': 'BlockDirtyBitmapAdd',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-remove:
@@ -2147,7 +2161,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-remove',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-clear:
@@ -2170,7 +2185,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-clear',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-enable:
@@ -2191,7 +2207,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-enable',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-disable:
@@ -2212,7 +2229,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-disable',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-merge:
@@ -2244,7 +2262,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-merge',
-  'data': 'BlockDirtyBitmapMerge' }
+  'data': 'BlockDirtyBitmapMerge',
+  'allow-preconfig': true }
 
 ##
 # @BlockDirtyBitmapSha256:
@@ -2275,7 +2294,8 @@
 ##
 { 'command': 'x-debug-block-dirty-bitmap-sha256',
   'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256',
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @blockdev-mirror:
@@ -2361,7 +2381,8 @@
             '*on-target-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
             '*copy-mode': 'MirrorCopyMode',
-            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
+            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @BlockIOThrottle:
@@ -2663,7 +2684,8 @@
             '*base-node': 'str', '*backing-file': 'str', '*bottom': 'str',
             '*speed': 'int', '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
-            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
+            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-set-speed:
@@ -2687,7 +2709,8 @@
 # Since: 1.1
 ##
 { 'command': 'block-job-set-speed',
-  'data': { 'device': 'str', 'speed': 'int' } }
+  'data': { 'device': 'str', 'speed': 'int' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-cancel:
@@ -2726,7 +2749,8 @@
 #
 # Since: 1.1
 ##
-{ 'command': 'block-job-cancel', 'data': { 'device': 'str', '*force': 'bool' } }
+{ 'command': 'block-job-cancel', 'data': { 'device': 'str', '*force': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-pause:
@@ -2750,7 +2774,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'block-job-pause', 'data': { 'device': 'str' } }
+{ 'command': 'block-job-pause', 'data': { 'device': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-resume:
@@ -2772,7 +2797,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'block-job-resume', 'data': { 'device': 'str' } }
+{ 'command': 'block-job-resume', 'data': { 'device': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-complete:
@@ -2800,7 +2826,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'block-job-complete', 'data': { 'device': 'str' } }
+{ 'command': 'block-job-complete', 'data': { 'device': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-dismiss:
@@ -2820,7 +2847,8 @@
 #
 # Since: 2.12
 ##
-{ 'command': 'block-job-dismiss', 'data': { 'id': 'str' } }
+{ 'command': 'block-job-dismiss', 'data': { 'id': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-finalize:
@@ -2838,7 +2866,8 @@
 #
 # Since: 2.12
 ##
-{ 'command': 'block-job-finalize', 'data': { 'id': 'str' } }
+{ 'command': 'block-job-finalize', 'data': { 'id': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @BlockdevDiscardOptions:
@@ -4354,7 +4383,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
+{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @blockdev-reopen:
@@ -4398,7 +4428,8 @@
 # Since: 6.1
 ##
 { 'command': 'blockdev-reopen',
-  'data': { 'options': ['BlockdevOptions'] } }
+  'data': { 'options': ['BlockdevOptions'] },
+  'allow-preconfig': true }
 
 ##
 # @blockdev-del:
@@ -4431,7 +4462,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' } }
+{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @BlockdevCreateOptionsFile:
@@ -4872,7 +4904,8 @@
 ##
 { 'command': 'blockdev-create',
   'data': { 'job-id': 'str',
-            'options': 'BlockdevCreateOptions' } }
+            'options': 'BlockdevCreateOptions' },
+  'allow-preconfig': true }
 
 ##
 # @BlockdevAmendOptionsLUKS:
@@ -4944,7 +4977,8 @@
             'node-name': 'str',
             'options': 'BlockdevAmendOptions',
             '*force': 'bool' },
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @BlockErrorAction:
@@ -5294,7 +5328,8 @@
 #
 ##
 { 'command': 'block-set-write-threshold',
-  'data': { 'node-name': 'str', 'write-threshold': 'uint64' } }
+  'data': { 'node-name': 'str', 'write-threshold': 'uint64' },
+  'allow-preconfig': true }
 
 ##
 # @x-blockdev-change:
@@ -5355,7 +5390,8 @@
   'data' : { 'parent': 'str',
              '*child': 'str',
              '*node': 'str' },
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @x-blockdev-set-iothread:
@@ -5397,7 +5433,8 @@
   'data' : { 'node-name': 'str',
              'iothread': 'StrOrNull',
              '*force': 'bool' },
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @QuorumOpType:
@@ -5529,7 +5566,8 @@
 #
 ##
 { 'command': 'blockdev-snapshot-internal-sync',
-  'data': 'BlockdevSnapshotInternal' }
+  'data': 'BlockdevSnapshotInternal',
+  'allow-preconfig': true }
 
 ##
 # @blockdev-snapshot-delete-internal-sync:
@@ -5576,4 +5614,5 @@
 ##
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
-  'returns': 'SnapshotInfo' }
+  'returns': 'SnapshotInfo',
+  'allow-preconfig': true }
diff --git a/qapi/block-export.json b/qapi/block-export.json
index 0685cb8b9a..8afb1b65b3 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -65,7 +65,8 @@
   'data': { 'addr': 'SocketAddressLegacy',
             '*tls-creds': 'str',
             '*tls-authz': 'str',
-            '*max-connections': 'uint32' } }
+            '*max-connections': 'uint32' },
+  'allow-preconfig': true }
 
 ##
 # @BlockExportOptionsNbdBase:
@@ -215,7 +216,8 @@
 # Since: 1.3
 ##
 { 'command': 'nbd-server-add',
-  'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'] }
+  'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'],
+  'allow-preconfig': true }
 
 ##
 # @BlockExportRemoveMode:
@@ -260,7 +262,8 @@
 ##
 { 'command': 'nbd-server-remove',
   'data': {'name': 'str', '*mode': 'BlockExportRemoveMode'},
-  'features': ['deprecated'] }
+  'features': ['deprecated'],
+  'allow-preconfig': true }
 
 ##
 # @nbd-server-stop:
@@ -270,7 +273,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'nbd-server-stop' }
+{ 'command': 'nbd-server-stop',
+  'allow-preconfig': true }
 
 ##
 # @BlockExportType:
@@ -342,7 +346,8 @@
 # Since: 5.2
 ##
 { 'command': 'block-export-add',
-  'data': 'BlockExportOptions', 'boxed': true }
+  'data': 'BlockExportOptions', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @block-export-del:
@@ -362,7 +367,8 @@
 # Since: 5.2
 ##
 { 'command': 'block-export-del',
-  'data': { 'id': 'str', '*mode': 'BlockExportRemoveMode' } }
+  'data': { 'id': 'str', '*mode': 'BlockExportRemoveMode' },
+  'allow-preconfig': true }
 
 ##
 # @BLOCK_EXPORT_DELETED:
@@ -406,4 +412,5 @@
 #
 # Since: 5.2
 ##
-{ 'command': 'query-block-exports', 'returns': ['BlockExportInfo'] }
+{ 'command': 'query-block-exports', 'returns': ['BlockExportInfo'],
+  'allow-preconfig': true }
diff --git a/qapi/block.json b/qapi/block.json
index 19326641ac..5fe068f903 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -496,7 +496,8 @@
 # <- { "return": {} }
 ##
 { 'command': 'block_set_io_throttle', 'boxed': true,
-  'data': 'BlockIOThrottle' }
+  'data': 'BlockIOThrottle',
+  'allow-preconfig': true }
 
 ##
 # @block-latency-histogram-set:
@@ -572,4 +573,5 @@
            '*boundaries': ['uint64'],
            '*boundaries-read': ['uint64'],
            '*boundaries-write': ['uint64'],
-           '*boundaries-flush': ['uint64'] } }
+           '*boundaries-flush': ['uint64'] },
+  'allow-preconfig': true }
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 564f1de364..c9d465735a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -78,6 +78,7 @@ ERST
         .help       = "resize a block image",
         .cmd        = hmp_block_resize,
         .coroutine  = true,
+        .flags      = "p",
     },
 
 SRST
@@ -94,6 +95,7 @@ ERST
         .params     = "device [speed [base]]",
         .help       = "copy data from a backing file into a block device",
         .cmd        = hmp_block_stream,
+        .flags      = "p",
     },
 
 SRST
@@ -107,6 +109,7 @@ ERST
         .params     = "device speed",
         .help       = "set maximum speed for a background block operation",
         .cmd        = hmp_block_job_set_speed,
+        .flags      = "p",
     },
 
 SRST
@@ -122,6 +125,7 @@ ERST
                       "\n\t\t\t if you want to abort the operation immediately"
                       "\n\t\t\t instead of keep running until data is in sync)",
         .cmd        = hmp_block_job_cancel,
+        .flags      = "p",
     },
 
 SRST
@@ -135,6 +139,7 @@ ERST
         .params     = "device",
         .help       = "stop an active background block operation",
         .cmd        = hmp_block_job_complete,
+        .flags      = "p",
     },
 
 SRST
@@ -149,6 +154,7 @@ ERST
         .params     = "device",
         .help       = "pause an active background block operation",
         .cmd        = hmp_block_job_pause,
+        .flags      = "p",
     },
 
 SRST
@@ -162,6 +168,7 @@ ERST
         .params     = "device",
         .help       = "resume a paused background block operation",
         .cmd        = hmp_block_job_resume,
+        .flags      = "p",
     },
 
 SRST
@@ -1406,6 +1413,7 @@ ERST
         .params     = "nbd_server_start [-a] [-w] host:port",
         .help       = "serve block devices on the given host and port",
         .cmd        = hmp_nbd_server_start,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_start`` *host*:*port*
@@ -1421,6 +1429,7 @@ ERST
         .params     = "nbd_server_add [-w] device [name]",
         .help       = "export a block device via NBD",
         .cmd        = hmp_nbd_server_add,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_add`` *device* [ *name* ]
@@ -1436,6 +1445,7 @@ ERST
         .params     = "nbd_server_remove [-f] name",
         .help       = "remove an export previously exposed via NBD",
         .cmd        = hmp_nbd_server_remove,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_remove [-f]`` *name*
@@ -1452,6 +1462,7 @@ ERST
         .params     = "nbd_server_stop",
         .help       = "stop serving block devices using the NBD protocol",
         .cmd        = hmp_nbd_server_stop,
+        .flags      = "p",
 .help       = "change I/O throttle limits for a block drive",
         .cmd        = hmp_block_set_io_throttle,
+        .flags      = "p",
     },
 
 SRST
-- 
2.36.1


