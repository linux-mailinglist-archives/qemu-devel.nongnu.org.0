Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A42E08ED
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:47:37 +0100 (CET)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfCa-0006e3-Et
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAO-0004l0-P2
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAL-00074l-PF
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CA3oPiAdOwhQBnIbfLIkugegws49hMBb8keFvmfvZ4=;
 b=OXDp8TVW7I1sbrFakjYeuc3U5M6oQNICoL4Dm9XQV51hrtGnoQ+mZ+Ucr/h1tDbhnyL9Os
 S2pspvgbD3WETGhVZDpu8uaDuQZr4H9ZuL5HwJ8ax+pb5SqhFxgZUAycygdUYX96GyOAFY
 Eye0bf7ohc0xAyHmOhSQ1WqEwoLqsTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-BGFPNrWMNT-YH4e97xOBoA-1; Tue, 22 Dec 2020 05:45:15 -0500
X-MC-Unique: BGFPNrWMNT-YH4e97xOBoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81B87510A2;
 Tue, 22 Dec 2020 10:45:12 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A7007A319;
 Tue, 22 Dec 2020 10:45:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/14] qga/commands-posix: Send CCW address on s390x with the
 fsinfo data
Date: Tue, 22 Dec 2020 11:44:52 +0100
Message-Id: <20201222104503.224510-4-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We need the CCW address on the libvirt side to correctly identify
the disk, so add this information to the GuestDiskAddress on s390x.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Michael Roth <michael.roth@amd.com>
Message-Id: <20201127082353.448251-1-thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
 qga/qapi-schema.json | 20 +++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e3812006..5aa5eff84ff6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1029,6 +1029,38 @@ static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,
     return true;
 }
 
+/*
+ * Store disk device info for CCW devices (s390x channel I/O devices).
+ * Returns true if information has been stored, or false for failure.
+ */
+static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
+                                           GuestDiskAddress *disk,
+                                           Error **errp)
+{
+    unsigned int cssid, ssid, subchno, devno;
+    char *p;
+
+    p = strstr(syspath, "/devices/css");
+    if (!p || sscanf(p + 12, "%*x/%x.%x.%x/%*x.%*x.%x/",
+                     &cssid, &ssid, &subchno, &devno) < 4) {
+        g_debug("could not parse ccw device sysfs path: %s", syspath);
+        return false;
+    }
+
+    disk->has_ccw_address = true;
+    disk->ccw_address = g_new0(GuestCCWAddress, 1);
+    disk->ccw_address->cssid = cssid;
+    disk->ccw_address->ssid = ssid;
+    disk->ccw_address->subchno = subchno;
+    disk->ccw_address->devno = devno;
+
+    if (strstr(p, "/virtio")) {
+        build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
+    }
+
+    return true;
+}
+
 /* Store disk device info specified by @sysfs into @fs */
 static void build_guest_fsinfo_for_real_device(char const *syspath,
                                                GuestFilesystemInfo *fs,
@@ -1081,6 +1113,8 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
 
     if (strstr(syspath, "/devices/pci")) {
         has_hwinf = build_guest_fsinfo_for_pci_dev(syspath, disk, errp);
+    } else if (strstr(syspath, "/devices/css")) {
+        has_hwinf = build_guest_fsinfo_for_ccw_dev(syspath, disk, errp);
     } else if (strstr(syspath, "/virtio")) {
         has_hwinf = build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
     } else {
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 3b3d1d0bd9d2..9a82b7e952f2 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -846,6 +846,22 @@
   'data': {'domain': 'int', 'bus': 'int',
            'slot': 'int', 'function': 'int'} }
 
+##
+# @GuestCCWAddress:
+#
+# @cssid: channel subsystem image id
+# @ssid: subchannel set id
+# @subchno: subchannel number
+# @devno: device number
+#
+# Since: 6.0
+##
+{ 'struct': 'GuestCCWAddress',
+  'data': {'cssid': 'int',
+           'ssid': 'int',
+           'subchno': 'int',
+           'devno': 'int'} }
+
 ##
 # @GuestDiskAddress:
 #
@@ -856,6 +872,7 @@
 # @unit: unit id
 # @serial: serial number (since: 3.1)
 # @dev: device node (POSIX) or device UNC (Windows) (since: 3.1)
+# @ccw-address: CCW address on s390x (since: 6.0)
 #
 # Since: 2.2
 ##
@@ -863,7 +880,8 @@
   'data': {'pci-controller': 'GuestPCIAddress',
            'bus-type': 'GuestDiskBusType',
            'bus': 'int', 'target': 'int', 'unit': 'int',
-           '*serial': 'str', '*dev': 'str'} }
+           '*serial': 'str', '*dev': 'str',
+           '*ccw-address': 'GuestCCWAddress'} }
 
 ##
 # @GuestDiskInfo:
-- 
2.26.2


