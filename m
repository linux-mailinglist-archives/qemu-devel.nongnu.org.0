Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DC2D627B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:51:32 +0100 (CET)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPAB-0003ve-BI
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrO-0008Gb-Ot
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrK-0003Rq-MG
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFExlQjclOJQPi9CsfYKEx9DSxVLykp97uzuP1FqE8o=;
 b=Bvjorx+gte8Z3SUSECBMRs4+1tGVzsbWwyMxmSJ91hP7WPFBOr48+egZkWWa5EHp3aoHzR
 8nCIcG1cPSycXydz8OROgE/cpxXKjKZMe0ctkqe0N87ZMOqS//e3C4A5OHccbqjd3WXqDn
 BKMmz9v9+I0m80KqmmpNaPJfAyBzjJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-WgIPKD-YMwaV7Pw_A3zo2w-1; Thu, 10 Dec 2020 11:31:57 -0500
X-MC-Unique: WgIPKD-YMwaV7Pw_A3zo2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD5B1801ABE;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4543E5C6C1;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0E4310FA0B5; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] qapi: Normalize version references x.y.0 to just x.y
Date: Thu, 10 Dec 2020 17:31:31 +0100
Message-Id: <20201210163132.2919935-13-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use x.y most of the time, and x.y.0 sometimes.  Normalize for
consistency.

Reported-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201118064158.3359056-1-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json     | 28 ++++++++++++------------
 qapi/block-export.json   |  6 +++---
 qapi/block.json          |  2 +-
 qapi/char.json           |  4 ++--
 qapi/control.json        | 14 ++++++------
 qapi/machine-target.json | 22 +++++++++----------
 qapi/machine.json        | 46 ++++++++++++++++++++--------------------
 qapi/migration.json      | 16 +++++++-------
 qapi/misc-target.json    |  2 +-
 qapi/misc.json           | 30 +++++++++++++-------------
 qapi/net.json            |  6 +++---
 qapi/pci.json            | 12 +++++------
 qapi/qdev.json           |  2 +-
 qapi/run-state.json      | 16 +++++++-------
 qapi/ui.json             | 40 +++++++++++++++++-----------------
 15 files changed, 123 insertions(+), 123 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04ad80bc1e..04c5196e59 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -302,7 +302,7 @@
 # @ro: true if the backing device was open read-only
 #
 # @drv: the name of the block format used to open the backing device. As of
-#       0.14.0 this can be: 'blkdebug', 'bochs', 'cloop', 'cow', 'dmg',
+#       0.14 this can be: 'blkdebug', 'bochs', 'cloop', 'cow', 'dmg',
 #       'file', 'file', 'ftp', 'ftps', 'host_cdrom', 'host_device',
 #       'http', 'https', 'luks', 'nbd', 'parallels', 'qcow',
 #       'qcow2', 'raw', 'vdi', 'vmdk', 'vpc', 'vvfat'
@@ -389,7 +389,7 @@
 # @deprecated: Member @encryption_key_missing is deprecated.  It is
 #              always false.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 ##
 { 'struct': 'BlockDeviceInfo',
@@ -607,7 +607,7 @@
 # @deprecated: Member @dirty-bitmaps is deprecated.  Use @inserted
 #              member @dirty-bitmaps instead.
 #
-# Since:  0.14.0
+# Since:  0.14
 ##
 { 'struct': 'BlockInfo',
   'data': {'device': 'str', '*qdev': 'str', 'type': 'str', 'removable': 'bool',
@@ -655,7 +655,7 @@
 # Returns: a list of @BlockInfo describing each virtual block device. Filter
 #          nodes that were created implicitly are skipped over.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -812,17 +812,17 @@
 # @wr_operations: The number of write operations performed by the device.
 #
 # @flush_operations: The number of cache flush operations performed by the
-#                    device (since 0.15.0)
+#                    device (since 0.15)
 #
 # @unmap_operations: The number of unmap operations performed by the device
 #                    (Since 4.2)
 #
-# @rd_total_time_ns: Total time spent on reads in nanoseconds (since 0.15.0).
+# @rd_total_time_ns: Total time spent on reads in nanoseconds (since 0.15).
 #
-# @wr_total_time_ns: Total time spent on writes in nanoseconds (since 0.15.0).
+# @wr_total_time_ns: Total time spent on writes in nanoseconds (since 0.15).
 #
 # @flush_total_time_ns: Total time spent on cache flushes in nanoseconds
-#                       (since 0.15.0).
+#                       (since 0.15).
 #
 # @unmap_total_time_ns: Total time spent on unmap operations in nanoseconds
 #                       (Since 4.2)
@@ -884,7 +884,7 @@
 #
 # @flush_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'BlockDeviceStats',
   'data': {'rd_bytes': 'int', 'wr_bytes': 'int', 'unmap_bytes' : 'int',
@@ -987,7 +987,7 @@
 # @backing: This describes the backing block device if it has one.
 #           (Since 2.0)
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'BlockStats',
   'data': {'*device': 'str', '*qdev': 'str', '*node-name': 'str',
@@ -1011,7 +1011,7 @@
 #
 # Returns: A list of @BlockStats for each virtual block devices.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1299,7 +1299,7 @@
 # Returns: - nothing on success
 #          - If @device is not a valid block device, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1484,7 +1484,7 @@
 # Returns: - nothing on success
 #          - If @device is not a valid block device, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -4852,7 +4852,7 @@
 # Note: If action is "stop", a STOP event will eventually follow the
 #       BLOCK_IO_ERROR event
 #
-# Since: 0.13.0
+# Since: 0.13
 #
 # Example:
 #
diff --git a/qapi/block-export.json b/qapi/block-export.json
index a9f488f99c..4eeac7842d 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -54,7 +54,7 @@
 #
 # Returns: error if the server is already running.
 #
-# Since: 1.3.0
+# Since: 1.3
 ##
 { 'command': 'nbd-server-start',
   'data': { 'addr': 'SocketAddressLegacy',
@@ -155,7 +155,7 @@
 # Returns: error if the server is not running, or export with the same name
 #          already exists.
 #
-# Since: 1.3.0
+# Since: 1.3
 ##
 { 'command': 'nbd-server-add',
   'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'] }
@@ -211,7 +211,7 @@
 # Stop QEMU's embedded NBD server, and unregister all devices previously
 # added via @nbd-server-add.
 #
-# Since: 1.3.0
+# Since: 1.3
 ##
 { 'command': 'nbd-server-stop' }
 
diff --git a/qapi/block.json b/qapi/block.json
index a009f7d3a2..82fcf2c914 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -107,7 +107,7 @@
 #          - If @device is not a valid block device, DeviceNotFound
 # Notes:    Ejecting a device with no media results in success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/char.json b/qapi/char.json
index 43486d1daa..58338ed62d 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -24,7 +24,7 @@
 # Notes: @filename is encoded using the QEMU command line character device
 #        encoding.  See the QEMU man page for details.
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'ChardevInfo',
   'data': { 'label': 'str',
@@ -38,7 +38,7 @@
 #
 # Returns: a list of @ChardevInfo
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/control.json b/qapi/control.json
index 134f842baf..9c8a51352d 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -87,7 +87,7 @@
 #           exact format depends on the downstream however it highly
 #           recommended that a unique name is used.
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'VersionInfo',
   'data': {'qemu': 'VersionTriple', 'package': 'str'} }
@@ -99,7 +99,7 @@
 #
 # Returns: A @VersionInfo object describing the current version of QEMU.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -126,7 +126,7 @@
 #
 # @name: The command name
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'CommandInfo', 'data': {'name': 'str'} }
 
@@ -137,7 +137,7 @@
 #
 # Returns: A list of @CommandInfo for all supported commands
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -166,7 +166,7 @@
 #
 # @name: The event name
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'EventInfo', 'data': {'name': 'str'} }
 
@@ -182,7 +182,7 @@
 #
 # Returns: A list of @EventInfo.
 #
-# Since: 1.2.0
+# Since: 1.2
 #
 # Example:
 #
@@ -212,7 +212,7 @@
 # guaranteed.  When using this interface, a premature EOF would not be
 # unexpected.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index fec3bb8679..e7811654b7 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -17,7 +17,7 @@
 # @name: the name of the CPU definition the model is based on
 # @props: a dictionary of QOM properties to be applied
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'struct': 'CpuModelInfo',
   'data': { 'name': 'str',
@@ -49,7 +49,7 @@
 #       version or machine-type, use @static (but keep in mind that some features may
 #       be omitted).
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'enum': 'CpuModelExpansionType',
   'data': [ 'static', 'full' ] }
@@ -73,7 +73,7 @@
 # @subset: If model A is a subset of model B, model A is guaranteed to run
 #          where model B runs. There are no guarantees about the other way.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'enum': 'CpuModelCompareResult',
   'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
@@ -85,7 +85,7 @@
 #
 # @model: the baselined CpuModelInfo.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'struct': 'CpuModelBaselineInfo',
   'data': { 'model': 'CpuModelInfo' },
@@ -107,7 +107,7 @@
 # CPU models identical. If the special property name "type" is included, the
 # models are by definition not identical and cannot be made identical.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'struct': 'CpuModelCompareInfo',
   'data': { 'result': 'CpuModelCompareResult',
@@ -151,7 +151,7 @@
 # Note: this command isn't specific to s390x, but is only implemented
 #       on this architecture currently.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'command': 'query-cpu-model-comparison',
   'data': { 'modela': 'CpuModelInfo', 'modelb': 'CpuModelInfo' },
@@ -194,7 +194,7 @@
 # Note: this command isn't specific to s390x, but is only implemented
 #       on this architecture currently.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'command': 'query-cpu-model-baseline',
   'data': { 'modela': 'CpuModelInfo',
@@ -209,7 +209,7 @@
 #
 # @model: the expanded CpuModelInfo.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
@@ -246,7 +246,7 @@
 #          with a wrong type. Also returns an error if an expansion type is
 #          not supported.
 #
-# Since: 2.8.0
+# Since: 2.8
 ##
 { 'command': 'query-cpu-model-expansion',
   'data': { 'type': 'CpuModelExpansionType',
@@ -306,7 +306,7 @@
 # If @unavailable-features is not present, runnability
 # information for the CPU is not available.
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'CpuDefinitionInfo',
   'data': { 'name': 'str',
@@ -325,7 +325,7 @@
 #
 # Returns: a list of CpuDefInfo
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
diff --git a/qapi/machine.json b/qapi/machine.json
index 7c9a263778..330189efe3 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -71,7 +71,7 @@
 # @arch: architecture of the cpu, which determines which additional fields
 #        will be listed (since 2.6)
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: @halted is a transient state that changes frequently.  By the time the
 #        data is sent to the client, the guest may no longer be halted.
@@ -196,7 +196,7 @@
 #
 # Returns: a list of @CpuInfo for each virtual CPU
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -319,23 +319,23 @@
 # @is-default: whether the machine is default
 #
 # @cpu-max: maximum number of CPUs supported by the machine type
-#           (since 1.5.0)
+#           (since 1.5)
 #
-# @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
+# @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7)
 #
 # @numa-mem-supported: true if '-numa node,mem' option is supported by
 #                      the machine type and false otherwise (since 4.1)
 #
 # @deprecated: if true, the machine type is deprecated and may be removed
 #              in future versions of QEMU according to the QEMU deprecation
-#              policy (since 4.1.0)
+#              policy (since 4.1)
 #
 # @default-cpu-type: default CPU model typename if none is requested via
 #                    the -cpu argument. (since 4.2)
 #
 # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
@@ -351,7 +351,7 @@
 #
 # Returns: a list of MachineInfo
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'command': 'query-machines', 'returns': ['MachineInfo'] }
 
@@ -386,7 +386,7 @@
 #
 # @arch: the target architecture
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'TargetInfo',
   'data': { 'arch': 'SysEmuTarget' } }
@@ -398,7 +398,7 @@
 #
 # Returns: TargetInfo
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'command': 'query-target', 'returns': 'TargetInfo' }
 
@@ -409,7 +409,7 @@
 #
 # @UUID: the UUID of the guest
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: If no UUID was specified for the guest, a null UUID is returned.
 ##
@@ -422,7 +422,7 @@
 #
 # Returns: The @UuidInfo for the guest
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -457,7 +457,7 @@
 #
 # Performs a hard reset of a guest.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -472,7 +472,7 @@
 #
 # Requests that a guest perform a powerdown operation.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: A guest may or may not respond to this command.  This command
 #        returning does not indicate that a guest has accepted the request or
@@ -549,7 +549,7 @@
 #
 # Returns:  If successful, nothing
 #
-# Since:  0.14.0
+# Since:  0.14
 #
 # Note: prior to 2.1, this command was only supported for x86 and s390 VMs
 #
@@ -570,7 +570,7 @@
 #
 # @present: true if KVM acceleration is built into this executable
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
 
@@ -581,7 +581,7 @@
 #
 # Returns: @KvmInfo
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -933,7 +933,7 @@
 #
 # Returns: Nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: Errors were not reliably returned until 1.1
 #
@@ -962,7 +962,7 @@
 #
 # Returns: Nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: Errors were not reliably returned until 1.1
 #
@@ -1185,7 +1185,7 @@
 #        the balloon size may not have changed.  A guest can change the balloon
 #        size independent of this command.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1205,7 +1205,7 @@
 # @actual: the logical size of the VM in bytes
 #          Formula used: logical_vm_size = vm_ram_size - balloon_size
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 ##
 { 'struct': 'BalloonInfo', 'data': {'actual': 'int' } }
@@ -1220,7 +1220,7 @@
 #            kernel module cannot support it, KvmMissingCap
 #          - If no balloon device is present, DeviceNotActive
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1268,7 +1268,7 @@
 #                  is omitted if target doesn't support memory hotplug
 #                  (i.e. CONFIG_MEM_DEVICE not defined at build time).
 #
-# Since: 2.11.0
+# Since: 2.11
 ##
 { 'struct': 'MemoryInfo',
   'data'  : { 'base-memory': 'size', '*plugged-memory': 'size' } }
@@ -1284,7 +1284,7 @@
 # -> { "execute": "query-memory-size-summary" }
 # <- { "return": { "base-memory": 4294967296, "plugged-memory": 0 } }
 #
-# Since: 2.11.0
+# Since: 2.11
 ##
 { 'command': 'query-memory-size-summary', 'returns': 'MemoryInfo' }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index 3c75820527..d1d9632c2a 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -46,7 +46,7 @@
 # @pages-per-second: the number of memory pages transferred per second
 #                    (Since 4.0)
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'MigrationStats',
   'data': {'transferred': 'int', 'remaining': 'int', 'total': 'int' ,
@@ -224,7 +224,7 @@
 #        only returned if VFIO device is present, migration is supported by all
 #        VFIO devices and status is 'active' or 'completed' (since 5.2)
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'MigrationInfo',
   'data': {'*status': 'MigrationStatus', '*ram': 'MigrationStats',
@@ -252,7 +252,7 @@
 #
 # Returns: @MigrationInfo
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1143,7 +1143,7 @@
 # @tls-port:     spice tcp port for tls-secured channels
 # @cert-subject: server certificate subject
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1343,7 +1343,7 @@
 #
 # Notes: This command succeeds even if there is no migration process running.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1383,7 +1383,7 @@
 #
 # Returns: nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1407,7 +1407,7 @@
 #
 # Returns: nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -1486,7 +1486,7 @@
 #
 # Returns: nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes:
 #
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 1e561fa97b..cbe5135264 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -12,7 +12,7 @@
 #
 # Note: This event is rate-limited.
 #
-# Since: 0.13.0
+# Since: 0.13
 #
 # Example:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 40df513856..27ccd7385f 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -27,7 +27,7 @@
 #
 # Returns: nothing on success.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -47,7 +47,7 @@
 #
 # @name: The name of the guest
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'NameInfo', 'data': {'*name': 'str'} }
 
@@ -58,7 +58,7 @@
 #
 # Returns: @NameInfo of the guest
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -132,7 +132,7 @@
 #
 # Stop all guest VCPU execution.
 #
-# Since:  0.14.0
+# Since:  0.14
 #
 # Notes: This function will succeed even if the guest is already in the stopped
 #        state.  In "inmigrate" state, it will ensure that the guest
@@ -152,7 +152,7 @@
 #
 # Resume guest VCPU execution.
 #
-# Since:  0.14.0
+# Since:  0.14
 #
 # Returns:  If successful, nothing
 #
@@ -210,7 +210,7 @@
 #
 # Returns: the output of the command as a string
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: This command only exists as a stop-gap.  Its use is highly
 #        discouraged.  The semantics of this command are not
@@ -264,7 +264,7 @@
 # Returns: - Nothing on success.
 #          - If @device is not a valid block device, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -296,7 +296,7 @@
 #
 # Returns: Nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: If @fdname already exists, the file descriptor assigned to
 #        it will be closed and replaced by the received file
@@ -322,7 +322,7 @@
 #
 # Returns: Nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -342,7 +342,7 @@
 # @fd: The file descriptor that was received via SCM rights and
 #      added to the fd set.
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'AddfdInfo', 'data': {'fdset-id': 'int', 'fd': 'int'} }
 
@@ -363,7 +363,7 @@
 #
 #        If @fdset-id is not specified, a new fd set will be created.
 #
-# Since: 1.2.0
+# Since: 1.2
 #
 # Example:
 #
@@ -388,7 +388,7 @@
 # Returns: - Nothing on success
 #          - If @fdset-id or @fd is not found, FdNotFound
 #
-# Since: 1.2.0
+# Since: 1.2
 #
 # Notes: The list of fd sets is shared by all monitor connections.
 #
@@ -412,7 +412,7 @@
 #
 # @opaque: A free-form string that can be used to describe the fd.
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'FdsetFdInfo',
   'data': {'fd': 'int', '*opaque': 'str'} }
@@ -426,7 +426,7 @@
 #
 # @fds: A list of file descriptors that belong to this fd set.
 #
-# Since: 1.2.0
+# Since: 1.2
 ##
 { 'struct': 'FdsetInfo',
   'data': {'fdset-id': 'int', 'fds': ['FdsetFdInfo']} }
@@ -438,7 +438,7 @@
 #
 # Returns: A list of @FdsetInfo
 #
-# Since: 1.2.0
+# Since: 1.2
 #
 # Note: The list of fd sets is shared by all monitor connections.
 #
diff --git a/qapi/net.json b/qapi/net.json
index a3a1336001..c31748c87f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -20,7 +20,7 @@
 # Returns: Nothing on success
 #          If @name is not a valid network device, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: Not all network adapters support setting link status.  This command
 #        will succeed even if the network adapter does not support link status
@@ -42,7 +42,7 @@
 #
 # Additional arguments depend on the type.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Returns: Nothing on success
 #          If @type is not a valid network backend, DeviceNotFound
@@ -67,7 +67,7 @@
 # Returns: Nothing on success
 #          If @id is not a valid network backend, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/pci.json b/qapi/pci.json
index b79cbd787b..ee7c659fec 100644
--- a/qapi/pci.json
+++ b/qapi/pci.json
@@ -18,7 +18,7 @@
 #
 # @limit: the ending address (guest physical)
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'PciMemoryRange', 'data': {'base': 'int', 'limit': 'int'} }
 
@@ -38,7 +38,7 @@
 #
 # @mem_type_64: if @type is 'memory', true if the BAR is 64-bit
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'PciMemoryRegion',
   'data': {'bar': 'int', 'type': 'str', 'address': 'int', 'size': 'int',
@@ -82,7 +82,7 @@
 #
 # @devices: a list of @PciDeviceInfo for each device on this bridge
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'PciBridgeInfo',
   'data': {'bus': 'PciBusInfo', '*devices': ['PciDeviceInfo']} }
@@ -148,7 +148,7 @@
 # Notes: the contents of @class_info.desc are not stable and should only be
 #        treated as informational.
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'PciDeviceInfo',
   'data': {'bus': 'int', 'slot': 'int', 'function': 'int',
@@ -165,7 +165,7 @@
 #
 # @devices: a list of devices on this bus
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'PciInfo', 'data': {'bus': 'int', 'devices': ['PciDeviceInfo']} }
 
@@ -179,7 +179,7 @@
 #          all PCI devices attached to it. Each device is represented by a
 #          json-object.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 13254529bf..b83178220b 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -86,7 +86,7 @@
 #        DEVICE_DELETED event. Guest reset will automatically complete removal
 #        for all devices.
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 964c8ef391..b2f77cbf3f 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -107,7 +107,7 @@
 #
 # @status: the virtual machine @RunState
 #
-# Since:  0.14.0
+# Since:  0.14
 #
 # Notes: @singlestep is enabled through the GDB stub
 ##
@@ -121,7 +121,7 @@
 #
 # Returns: @StatusInfo reflecting all VCPUs
 #
-# Since:  0.14.0
+# Since:  0.14
 #
 # Example:
 #
@@ -149,7 +149,7 @@
 # Note: If the command-line option "-no-shutdown" has been specified, qemu will
 #       not exit, and a STOP event will eventually follow the SHUTDOWN event
 #
-# Since: 0.12.0
+# Since: 0.12
 #
 # Example:
 #
@@ -165,7 +165,7 @@
 # Emitted when the virtual machine is powered down through the power control
 # system, such as via ACPI.
 #
-# Since: 0.12.0
+# Since: 0.12
 #
 # Example:
 #
@@ -187,7 +187,7 @@
 #
 # @reason: The @ShutdownCause of the RESET. (since 4.0)
 #
-# Since: 0.12.0
+# Since: 0.12
 #
 # Example:
 #
@@ -202,7 +202,7 @@
 #
 # Emitted when the virtual machine is stopped
 #
-# Since: 0.12.0
+# Since: 0.12
 #
 # Example:
 #
@@ -217,7 +217,7 @@
 #
 # Emitted when the virtual machine resumes execution
 #
-# Since: 0.12.0
+# Since: 0.12
 #
 # Example:
 #
@@ -288,7 +288,7 @@
 #
 # Note: This event is rate-limited.
 #
-# Since: 0.13.0
+# Since: 0.13
 #
 # Example:
 #
diff --git a/qapi/ui.json b/qapi/ui.json
index 6c7b33cb72..d08d72b439 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -27,7 +27,7 @@
 # Returns: - Nothing on success
 #          - If Spice is not enabled, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -56,7 +56,7 @@
 # Returns: - Nothing on success
 #          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Notes: Time is relative to the server and currently there is no way to
 #        coordinate server time with client time.  It is not recommended to
@@ -88,7 +88,7 @@
 #
 # Returns: Nothing on success
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -156,7 +156,7 @@
 #
 # @tls: true if the channel is encrypted, false otherwise.
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'SpiceChannel',
   'base': 'SpiceBasicInfo',
@@ -215,7 +215,7 @@
 #
 # @channels: a list of @SpiceChannel for each active spice channel
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'SpiceInfo',
   'data': {'enabled': 'bool', 'migrated': 'bool', '*host': 'str', '*port': 'int',
@@ -230,7 +230,7 @@
 #
 # Returns: @SpiceInfo
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -278,7 +278,7 @@
 #
 # @client: client information
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -305,7 +305,7 @@
 #
 # @client: client information
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -333,7 +333,7 @@
 #
 # @client: client information
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -420,7 +420,7 @@
 # @sasl_username: If SASL authentication is in use, the SASL username
 #                 used for authentication.
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'VncClientInfo',
   'base': 'VncBasicInfo',
@@ -462,7 +462,7 @@
 #
 # @clients: a list of @VncClientInfo of all currently connected clients
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'VncInfo',
   'data': {'enabled': 'bool', '*host': 'str',
@@ -555,7 +555,7 @@
 #
 # Returns: @VncInfo
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -619,7 +619,7 @@
 # Note: This event is emitted before any authentication takes place, thus
 #       the authentication ID is not provided
 #
-# Since: 0.13.0
+# Since: 0.13
 #
 # Example:
 #
@@ -647,7 +647,7 @@
 #
 # @client: client information
 #
-# Since: 0.13.0
+# Since: 0.13
 #
 # Example:
 #
@@ -674,7 +674,7 @@
 #
 # @client: client information
 #
-# Since: 0.13.0
+# Since: 0.13
 #
 # Example:
 #
@@ -709,7 +709,7 @@
 #
 # @absolute: true if this device supports absolute coordinates as input
 #
-# Since: 0.14.0
+# Since: 0.14
 ##
 { 'struct': 'MouseInfo',
   'data': {'name': 'str', 'index': 'int', 'current': 'bool',
@@ -722,7 +722,7 @@
 #
 # Returns: a list of @MouseInfo for each device
 #
-# Since: 0.14.0
+# Since: 0.14
 #
 # Example:
 #
@@ -792,7 +792,7 @@
 # 'sysrq' will be transparently changed to 'print', so they
 # are effectively synonyms.
 #
-# Since: 1.3.0
+# Since: 1.3
 #
 ##
 { 'enum': 'QKeyCode',
@@ -824,7 +824,7 @@
 #
 # Represents a keyboard key.
 #
-# Since: 1.3.0
+# Since: 1.3
 ##
 { 'union': 'KeyValue',
   'data': {
@@ -847,7 +847,7 @@
 # Returns: - Nothing on success
 #          - If key is unknown or redundant, InvalidParameter
 #
-# Since: 1.3.0
+# Since: 1.3
 #
 # Example:
 #
-- 
2.26.2


