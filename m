Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09095F4AB4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:12:11 +0200 (CEST)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpCz-0000gl-Pc
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofp7b-0002Cj-KD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:06:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofp7Y-0000By-Kb
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:06:35 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294L45PX008396;
 Tue, 4 Oct 2022 21:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=6gScFMAvSRv9nHPLcpCMpkyBZQrcjMNkSmAFY2EFBS8=;
 b=xCtq/ny498KWSuZKHjS7OKfOo2esE1G7qsSBLi8O+x4x/CCa/7RmtqKHY5DJh7PnUtl5
 NJwc0bDunCTeeI/nWkWSGx+wIDLFCM6Ar7jGvVNqddev4que77QL4aNmqJLKiKiClckg
 E0iOOmARdUSFT3XECE0TMxnHk9jvOc81TlNWEDgS0lzVXDwYWQTThwPe6VOR4+Tbfbbp
 HRt5l9A9XwAE1n6SUotNAf/adZfiTzmVg9L8xrKBd7yNrmqJqwUi0YHZ8nnh9Kq+QecP
 mt8WC6oPnesk12WkD98SmqBAgOwgUXwbmANJng8rpigZCKDcYzZWbVsDhmaDSFmVgQb1 cA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxbyn7f36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Oct 2022 21:06:31 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 294IqvOw000622; Tue, 4 Oct 2022 21:06:29 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc0538kr-1; Tue, 04 Oct 2022 21:06:29 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, eblake@redhat.com, armbru@redhat.com
Subject: [PATCH] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Date: Tue,  4 Oct 2022 13:00:57 -0700
Message-Id: <1664913657-3424-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040136
X-Proofpoint-GUID: c_IgGtcoUbbNSmZdNi4hqXX_xJm4BAJx
X-Proofpoint-ORIG-GUID: c_IgGtcoUbbNSmZdNi4hqXX_xJm4BAJx
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
backend as another parameter to instantiate vhost-vdpa net client.
This would benefit the use case where only open fd's, as oppposed to
raw vhost-vdpa device paths, are accessible from the QEMU process.

(qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
 qapi/net.json    |  3 +++
 qemu-options.hx  |  6 ++++--
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 182b3a1..366b070 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
-    if (!opts->vhostdev) {
-        error_setg(errp, "vdpa character device not specified with vhostdev");
+    if (!opts->has_vhostdev && !opts->has_vhostfd) {
+        error_setg(errp,
+                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
         return -1;
     }
 
-    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
-    if (vdpa_device_fd == -1) {
-        return -errno;
+    if (opts->has_vhostdev && opts->has_vhostfd) {
+        error_setg(errp,
+                   "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
+        return -1;
+    }
+
+    if (opts->has_vhostdev) {
+        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
+        if (vdpa_device_fd == -1) {
+            return -errno;
+        }
+    } else if (opts->has_vhostfd) {
+        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
+        if (vdpa_device_fd == -1) {
+            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
+            return -1;
+        }
     }
 
     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
diff --git a/qapi/net.json b/qapi/net.json
index dd088c0..926ecc8 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -442,6 +442,8 @@
 # @vhostdev: path of vhost-vdpa device
 #            (default:'/dev/vhost-vdpa-0')
 #
+# @vhostfd: file descriptor of an already opened vhost vdpa device
+#
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
@@ -456,6 +458,7 @@
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
+    '*vhostfd':      'str',
     '*queues':       'int',
     '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 913c71e..c040f74 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a vhost-user network, backed by a chardev 'dev'\n"
 #endif
 #ifdef __linux__
-    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
+    "-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+    "                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n"
+    "                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n"
 #endif
 #ifdef CONFIG_VMNET
     "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
@@ -3280,7 +3282,7 @@ SRST
              -netdev type=vhost-user,id=net0,chardev=chr0 \
              -device virtio-net-pci,netdev=net0
 
-``-netdev vhost-vdpa,vhostdev=/path/to/dev``
+``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
     Establish a vhost-vdpa netdev.
 
     vDPA device is a device that uses a datapath which complies with
-- 
1.8.3.1


