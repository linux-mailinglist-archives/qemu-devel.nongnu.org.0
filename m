Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C28177C4D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:48:31 +0100 (CET)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Aic-00040J-Ba
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVy-0004Tm-5T
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVu-00034F-OC
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVu-00033p-Hy
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55JvxPt0KHUT+9UFXjq8IhzL9/3jplVc8pPi6x2GFII=;
 b=J8Kd5MeDy68w2yaPu86w+FikczsTX02VLJ1m76EsG8H68zdStRIx6eBfOwsrqflXTWGU1S
 tx+QvN6veKPyP7NVZi986TKfUI0iRIkNCP5BPrGJ69iWkX/G4aSO6Z5Mnm+gUXB808wFQf
 Hrbf9SCdbJRRjbrA8cf6Ndbn2g0N7xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-gXYbJzKMOqSgsKz7ekC1SA-1; Tue, 03 Mar 2020 11:35:20 -0500
X-MC-Unique: gXYbJzKMOqSgsKz7ekC1SA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731BE18CA24E;
 Tue,  3 Mar 2020 16:35:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D15A25DA7C;
 Tue,  3 Mar 2020 16:35:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 12B26113287B; Tue,  3 Mar 2020 17:35:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/30] qapi: Mark deprecated QMP parts with feature
 'deprecated'
Date: Tue,  3 Mar 2020 17:35:01 +0100
Message-Id: <20200303163505.32041-27-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add feature 'deprecated' to the deprecated QMP commands, so their
deprecation becomes visible in output of query-qmp-schema.  Looks like
this:

    {"name": "query-cpus",
     "ret-type": "[164]",
     "meta-type": "command",
     "arg-type": "0",
---> "features": ["deprecated"]}

Management applications could conceivably use this for static
checking.

The deprecated commands are change, cpu-add, migrate-set-cache-size,
migrate_set_downtime, migrate_set_speed, query-cpus, query-events,
query-migrate-cache-size.

The deprecated command arguments are block-commit arguments @base and
@top, and block_set_io_throttle, blockdev-change-medium,
blockdev-close-tray, blockdev-open-tray, eject argument @device.

The deprecated command results are query-cpus-fast result @arch,
query-block result @dirty-bitmaps, query-named-block-nodes result
@encryption_key_missing and result @dirty-bitmaps's member @status.
Same for query-block result @inserted, which mirrors
query-named-block-nodes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 69 +++++++++++++++++++++++++++++++++-----------
 qapi/block.json      |  9 ++++--
 qapi/control.json    | 11 ++++---
 qapi/machine.json    | 34 ++++++++++++----------
 qapi/migration.json  | 36 +++++++++++++++--------
 qapi/misc.json       | 13 +++++----
 6 files changed, 115 insertions(+), 57 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 85e27bb61f..bade02760c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -297,7 +297,7 @@
 #
 # @encrypted: true if the backing device is encrypted
 #
-# @encryption_key_missing: Deprecated; always false
+# @encryption_key_missing: always false
 #
 # @detect_zeroes: detect and optimize zero writes (Since 2.1)
 #
@@ -363,13 +363,19 @@
 # @dirty-bitmaps: dirty bitmaps information (only present if node
 #                 has one or more dirty bitmaps) (Since 4.2)
 #
+# Features:
+# @deprecated: Member @encryption_key_missing is deprecated.  It is
+#     always false.
+#
 # Since: 0.14.0
 #
 ##
 { 'struct': 'BlockDeviceInfo',
   'data': { 'file': 'str', '*node-name': 'str', 'ro': 'bool', 'drv': 'str'=
,
             '*backing_file': 'str', 'backing_file_depth': 'int',
-            'encrypted': 'bool', 'encryption_key_missing': 'bool',
+            'encrypted': 'bool',
+            'encryption_key_missing': { 'type': 'bool',
+                                        'features': [ 'deprecated' ] },
             'detect_zeroes': 'BlockdevDetectZeroesOptions',
             'bps': 'int', 'bps_rd': 'int', 'bps_wr': 'int',
             'iops': 'int', 'iops_rd': 'int', 'iops_wr': 'int',
@@ -475,7 +481,7 @@
 #
 # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
 #
-# @status: Deprecated in favor of @recording and @locked. (since 2.4)
+# @status: current status of the dirty bitmap (since 2.4)
 #
 # @recording: true if the bitmap is recording new writes from the guest.
 #             Replaces `active` and `disabled` statuses. (since 4.0)
@@ -492,11 +498,17 @@
 #                @busy to be false. This bitmap cannot be used. To remove
 #                it, use @block-dirty-bitmap-remove. (Since 4.0)
 #
+# Features:
+# @deprecated: Member @status is deprecated.  Use @recording and
+#     @locked instead.
+#
 # Since: 1.3
 ##
 { 'struct': 'BlockDirtyInfo',
   'data': {'*name': 'str', 'count': 'int', 'granularity': 'uint32',
-           'recording': 'bool', 'busy': 'bool', 'status': 'DirtyBitmapStat=
us',
+           'recording': 'bool', 'busy': 'bool',
+           'status': { 'type': 'DirtyBitmapStatus',
+                       'features': [ 'deprecated' ] },
            'persistent': 'bool', '*inconsistent': 'bool' } }
=20
 ##
@@ -659,7 +671,6 @@
 #
 # @dirty-bitmaps: dirty bitmaps information (only present if the
 #                 driver has one or more dirty bitmaps) (Since 2.0)
-#                 Deprecated in 4.2; see BlockDeviceInfo instead.
 #
 # @io-status: @BlockDeviceIoStatus. Only present if the device
 #             supports it and the VM is configured to stop on errors
@@ -669,13 +680,18 @@
 # @inserted: @BlockDeviceInfo describing the device if media is
 #            present
 #
+# Features:
+# @deprecated: Member @dirty-bitmaps is deprecated.  Use @inserted
+#     member @dirty-bitmaps instead.
+#
 # Since:  0.14.0
 ##
 { 'struct': 'BlockInfo',
   'data': {'device': 'str', '*qdev': 'str', 'type': 'str', 'removable': 'b=
ool',
            'locked': 'bool', '*inserted': 'BlockDeviceInfo',
            '*tray_open': 'bool', '*io-status': 'BlockDeviceIoStatus',
-           '*dirty-bitmaps': ['BlockDirtyInfo'] } }
+           '*dirty-bitmaps': { 'type': ['BlockDirtyInfo'],
+                               'features': [ 'deprecated' ] } } }
=20
 ##
 # @BlockMeasureInfo:
@@ -1616,7 +1632,7 @@
 # @base: Same as @base-node, except that it is a file name rather than a n=
ode
 #        name. This must be the exact filename string that was used to ope=
n the
 #        node; other strings, even if addressing the same file, are not
-#        accepted (deprecated, use @base-node instead)
+#        accepted
 #
 # @top-node: The node name of the backing image within the image chain
 #            which contains the topmost data to be committed down. If
@@ -1625,7 +1641,7 @@
 # @top: Same as @top-node, except that it is a file name rather than a nod=
e
 #       name. This must be the exact filename string that was used to open=
 the
 #       node; other strings, even if addressing the same file, are not
-#       accepted (deprecated, use @base-node instead)
+#       accepted
 #
 # @backing-file: The backing file string to write into the overlay
 #                image of 'top'.  If 'top' is the active layer,
@@ -1679,6 +1695,10 @@
 #                list without user intervention.
 #                Defaults to true. (Since 3.1)
 #
+# Features:
+# @deprecated: Members @base and @top are deprecated.  Use @base-node
+#     and @top-node instead.
+#
 # Returns: - Nothing on success
 #          - If @device does not exist, DeviceNotFound
 #          - Any other error returns a GenericError.
@@ -1695,7 +1715,9 @@
 ##
 { 'command': 'block-commit',
   'data': { '*job-id': 'str', 'device': 'str', '*base-node': 'str',
-            '*base': 'str', '*top-node': 'str', '*top': 'str',
+            '*base': { 'type': 'str', 'features': [ 'deprecated' ] },
+            '*top-node': 'str',
+            '*top': { 'type': 'str', 'features': [ 'deprecated' ] },
             '*backing-file': 'str', '*speed': 'int',
             '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
@@ -2433,7 +2455,7 @@
 #
 # A set of parameters describing block throttling.
 #
-# @device: Block device name (deprecated, use @id instead)
+# @device: Block device name
 #
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
@@ -2501,10 +2523,14 @@
 #
 # @group: throttle group name (Since 2.4)
 #
+# Features:
+# @deprecated: Member @device is deprecated.  Use @id instead.
+#
 # Since: 1.1
 ##
 { 'struct': 'BlockIOThrottle',
-  'data': { '*device': 'str', '*id': 'str', 'bps': 'int', 'bps_rd': 'int',
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
+            '*id': 'str', 'bps': 'int', 'bps_rd': 'int',
             'bps_wr': 'int', 'iops': 'int', 'iops_rd': 'int', 'iops_wr': '=
int',
             '*bps_max': 'int', '*bps_rd_max': 'int',
             '*bps_wr_max': 'int', '*iops_max': 'int',
@@ -4776,7 +4802,7 @@
 #   to it
 # - if the guest device does not have an actual tray
 #
-# @device: Block device name (deprecated, use @id instead)
+# @device: Block device name
 #
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
@@ -4785,6 +4811,9 @@
 #         immediately); if true, the tray will be opened regardless of whe=
ther
 #         it is locked
 #
+# Features:
+# @deprecated: Member @device is deprecated.  Use @id instead.
+#
 # Since: 2.5
 #
 # Example:
@@ -4803,7 +4832,7 @@
 #
 ##
 { 'command': 'blockdev-open-tray',
-  'data': { '*device': 'str',
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
             '*id': 'str',
             '*force': 'bool' } }
=20
@@ -4816,10 +4845,13 @@
 #
 # If the tray was already closed before, this will be a no-op.
 #
-# @device: Block device name (deprecated, use @id instead)
+# @device: Block device name
 #
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
+# Features:
+# @deprecated: Member @device is deprecated.  Use @id instead.
+#
 # Since: 2.5
 #
 # Example:
@@ -4838,7 +4870,7 @@
 #
 ##
 { 'command': 'blockdev-close-tray',
-  'data': { '*device': 'str',
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
             '*id': 'str' } }
=20
 ##
@@ -4945,7 +4977,7 @@
 # combines blockdev-open-tray, blockdev-remove-medium, blockdev-insert-med=
ium
 # and blockdev-close-tray).
 #
-# @device: Block device name (deprecated, use @id instead)
+# @device: Block device name
 #
 # @id: The name or QOM path of the guest device
 #      (since: 2.8)
@@ -4958,6 +4990,9 @@
 # @read-only-mode: change the read-only mode of the device; defaults
 #                  to 'retain'
 #
+# Features:
+# @deprecated: Member @device is deprecated.  Use @id instead.
+#
 # Since: 2.5
 #
 # Examples:
@@ -4992,7 +5027,7 @@
 #
 ##
 { 'command': 'blockdev-change-medium',
-  'data': { '*device': 'str',
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
             '*id': 'str',
             'filename': 'str',
             '*format': 'str',
diff --git a/qapi/block.json b/qapi/block.json
index da19834db4..8314ef21d1 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -185,15 +185,18 @@
 ##
 # @eject:
 #
-# Ejects a device from a removable drive.
+# Ejects the medium from a removable block device.
 #
-# @device: Block device name (deprecated, use @id instead)
+# @device: Block device name
 #
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
 # @force: If true, eject regardless of whether the drive is locked.
 #         If not specified, the default value is false.
 #
+# Features:
+# @deprecated: Member @device is deprecated.  Use @id instead.
+#
 # Returns: - Nothing on success
 #          - If @device is not a valid block device, DeviceNotFound
 # Notes:    Ejecting a device with no media results in success
@@ -206,7 +209,7 @@
 # <- { "return": {} }
 ##
 { 'command': 'eject',
-  'data': { '*device': 'str',
+  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
             '*id': 'str',
             '*force': 'bool' } }
=20
diff --git a/qapi/control.json b/qapi/control.json
index 759c20e76f..cdb058eca0 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -174,13 +174,15 @@
 #
 # Return information on QMP events.
 #
+# Features:
+# @deprecated: This command is deprecated, because its output doesn't
+#     reflect compile-time configuration.  Use 'query-qmp-schema'
+#     instead.
+#
 # Returns: A list of @EventInfo.
 #
 # Since: 1.2.0
 #
-# Note: This command is deprecated, because its output doesn't reflect
-#       compile-time configuration.  Use query-qmp-schema instead.
-#
 # Example:
 #
 # -> { "execute": "query-events" }
@@ -198,7 +200,8 @@
 # Note: This example has been shortened as the real response is too long.
 #
 ##
-{ 'command': 'query-events', 'returns': ['EventInfo'] }
+{ 'command': 'query-events', 'returns': ['EventInfo'],
+  'features': [ 'deprecated' ] }
=20
 ##
 # @quit:
diff --git a/qapi/machine.json b/qapi/machine.json
index 6c11e3cf3a..0da3f3adc4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -184,8 +184,11 @@
 # This command causes vCPU threads to exit to userspace, which causes
 # a small interruption to guest CPU execution. This will have a negative
 # impact on realtime guests and other latency sensitive guest workloads.
-# It is recommended to use @query-cpus-fast instead of this command to
-# avoid the vCPU interruption.
+#
+# Features:
+# @deprecated: This command is deprecated, because it interferes with
+#     the guest.  Use 'query-cpus-fast' instead to avoid the vCPU
+#     interruption.
 #
 # Returns: a list of @CpuInfo for each virtual CPU
 #
@@ -216,12 +219,9 @@
 #       ]
 #    }
 #
-# Notes: This interface is deprecated (since 2.12.0), and it is strongly
-#        recommended that you avoid using it. Use @query-cpus-fast to
-#        obtain information about virtual CPUs.
-#
 ##
-{ 'command': 'query-cpus', 'returns': ['CpuInfo'] }
+{ 'command': 'query-cpus', 'returns': ['CpuInfo'],
+  'features': [ 'deprecated' ] }
=20
 ##
 # @CpuInfoFast:
@@ -237,12 +237,14 @@
 # @props: properties describing to which node/socket/core/thread
 #         virtual CPU belongs to, provided if supported by board
 #
-# @arch: base architecture of the cpu; deprecated since 3.0.0 in favor
-#        of @target
+# @arch: base architecture of the cpu
 #
 # @target: the QEMU system emulation target, which determines which
 #          additional fields will be listed (since 3.0)
 #
+# Features:
+# @deprecated: Member @arch is deprecated.  Use @target instead.
+#
 # Since: 2.12
 #
 ##
@@ -251,7 +253,8 @@
                       'qom-path'     : 'str',
                       'thread-id'    : 'int',
                       '*props'       : 'CpuInstanceProperties',
-                      'arch'         : 'CpuInfoArch',
+                      'arch'         : { 'type': 'CpuInfoArch',
+                                         'features': [ 'deprecated' ] },
                       'target'       : 'SysEmuTarget' },
   'discriminator' : 'target',
   'data'          : { 's390x'        : 'CpuInfoS390' } }
@@ -307,21 +310,22 @@
 #
 # @id: ID of CPU to be created, valid values [0..max_cpus)
 #
+# Features:
+# @deprecated: This command is deprecated.  Use `device_add` instead.
+#     See the `query-hotpluggable-cpus` command for details.
+#
 # Returns: Nothing on success
 #
 # Since: 1.5
 #
-# Note: This command is deprecated.  The `device_add` command should be
-#       used instead.  See the `query-hotpluggable-cpus` command for
-#       details.
-#
 # Example:
 #
 # -> { "execute": "cpu-add", "arguments": { "id": 2 } }
 # <- { "return": {} }
 #
 ##
-{ 'command': 'cpu-add', 'data': {'id': 'int'} }
+{ 'command': 'cpu-add', 'data': {'id': 'int'},
+  'features': [ 'deprecated' ] }
=20
 ##
 # @MachineInfo:
diff --git a/qapi/migration.json b/qapi/migration.json
index d44d99cd78..b8b5eb195f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1196,9 +1196,11 @@
 #
 # @value: maximum downtime in seconds
 #
-# Returns: nothing on success
+# Features:
+# @deprecated: This command is deprecated.  Use
+#     'migrate-set-parameters' instead.
 #
-# Notes: This command is deprecated in favor of 'migrate-set-parameters'
+# Returns: nothing on success
 #
 # Since: 0.14.0
 #
@@ -1208,7 +1210,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'migrate_set_downtime', 'data': {'value': 'number'} }
+{ 'command': 'migrate_set_downtime', 'data': {'value': 'number'},
+  'features': [ 'deprecated' ] }
=20
 ##
 # @migrate_set_speed:
@@ -1217,9 +1220,11 @@
 #
 # @value: maximum speed in bytes per second.
 #
-# Returns: nothing on success
+# Features:
+# @deprecated: This command is deprecated.  Use
+#     'migrate-set-parameters' instead.
 #
-# Notes: This command is deprecated in favor of 'migrate-set-parameters'
+# Returns: nothing on success
 #
 # Since: 0.14.0
 #
@@ -1229,7 +1234,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'migrate_set_speed', 'data': {'value': 'int'} }
+{ 'command': 'migrate_set_speed', 'data': {'value': 'int'},
+  'features': [ 'deprecated' ] }
=20
 ##
 # @migrate-set-cache-size:
@@ -1238,13 +1244,15 @@
 #
 # @value: cache size in bytes
 #
+# Features:
+# @deprecated: This command is deprecated.  Use
+#     'migrate-set-parameters' instead.
+#
 # The size will be rounded down to the nearest power of 2.
 # The cache size can be modified before and during ongoing migration
 #
 # Returns: nothing on success
 #
-# Notes: This command is deprecated in favor of 'migrate-set-parameters'
-#
 # Since: 1.2
 #
 # Example:
@@ -1254,17 +1262,20 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'migrate-set-cache-size', 'data': {'value': 'int'} }
+{ 'command': 'migrate-set-cache-size', 'data': {'value': 'int'},
+  'features': [ 'deprecated' ] }
=20
 ##
 # @query-migrate-cache-size:
 #
 # Query migration XBZRLE cache size
 #
+# Features:
+# @deprecated: This command is deprecated.  Use
+#     'query-migrate-parameters' instead.
+#
 # Returns: XBZRLE cache size in bytes
 #
-# Notes: This command is deprecated in favor of 'query-migrate-parameters'
-#
 # Since: 1.2
 #
 # Example:
@@ -1273,7 +1284,8 @@
 # <- { "return": 67108864 }
 #
 ##
-{ 'command': 'query-migrate-cache-size', 'returns': 'int' }
+{ 'command': 'query-migrate-cache-size', 'returns': 'int',
+  'features': [ 'deprecated' ] }
=20
 ##
 # @migrate:
diff --git a/qapi/misc.json b/qapi/misc.json
index c18fe681fb..99b90ac80b 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -872,14 +872,14 @@
 #       If @device is 'vnc' and @target is 'password', this is the new VNC
 #       password to set.  See change-vnc-password for additional notes.
 #
+# Features:
+# @deprecated: This command is deprecated.  For changing block
+#     devices, use 'blockdev-change-medium' instead; for changing VNC
+#     parameters, use 'change-vnc-password' instead.
+#
 # Returns: - Nothing on success.
 #          - If @device is not a valid block device, DeviceNotFound
 #
-# Notes: This interface is deprecated, and it is strongly recommended that=
 you
-#        avoid using it.  For changing block devices, use
-#        blockdev-change-medium; for changing VNC parameters, use
-#        change-vnc-password.
-#
 # Since: 0.14.0
 #
 # Example:
@@ -900,7 +900,8 @@
 #
 ##
 { 'command': 'change',
-  'data': {'device': 'str', 'target': 'str', '*arg': 'str'} }
+  'data': {'device': 'str', 'target': 'str', '*arg': 'str'},
+  'features': [ 'deprecated' ] }
=20
 ##
 # @xen-set-global-dirty-log:
--=20
2.21.1


