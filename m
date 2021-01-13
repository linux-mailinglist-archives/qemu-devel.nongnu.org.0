Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96692F5472
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:07:24 +0100 (CET)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznMQ-0005mi-L3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kznBV-0008UP-1g
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:56:05 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kznBS-0001OV-P3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:56:04 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKtC31088799;
 Wed, 13 Jan 2021 20:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=dt/TS1GiJAhO8UC8hTWP6Y+hwenmB8IfNAKIGCJx2n0=;
 b=kt9cHTFrB2eFZR0wDZor5PRSXiYOLzX/TRwg43Kd5/V0xJmZz4P6jlZptRhwLfEhfLlg
 O0u5+NRDLleoVzinXR5wCY8mnNNsvxFiroPoRfkmrdf5RKcPFI/2zsaZefG+d93pyesM
 nP8OQj91w1shFxB3rvERqf68H1MjEmnYP1ImswotP+Q/zs4RCA3BGx911phgivHedVyu
 pNxX+ZSf5w7cPA/imdu6e099YLvk9X8CI1S6N39xLOEKgsgJ7ywKD/JP/Yi2C7hSkuIj
 pd/WOgCzbTKdUn4oLwmH2MhT8Oqq9WCUA+qx6VR3Pt31DjOO6eWWs/DFsAe3gWbG04E6 PA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 360kvk5eve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:55:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKkBvA143158;
 Wed, 13 Jan 2021 20:53:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 360kf17r55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:53:55 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DKrsSS023959;
 Wed, 13 Jan 2021 20:53:54 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 12:53:54 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v18 04/20] multi-process: Add config option for multi-process
 QEMU
Date: Wed, 13 Jan 2021 15:53:23 -0500
Message-Id: <89dda6b83b67f545da770564a274548aa994a567.1610570756.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130127
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configuration options to enable or disable multiprocess QEMU code

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure         | 10 ++++++++++
 meson.build       |  4 +++-
 Kconfig.host      |  4 ++++
 hw/Kconfig        |  1 +
 hw/remote/Kconfig |  3 +++
 5 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 hw/remote/Kconfig

diff --git a/configure b/configure
index 155dda1..357e8ed 100755
--- a/configure
+++ b/configure
@@ -461,6 +461,7 @@ skip_meson=no
 gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
+multiprocess="no"
 
 malloc_trim="auto"
 
@@ -806,6 +807,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
+  multiprocess=${default_feature:-yes}
 ;;
 esac
 
@@ -1558,6 +1560,10 @@ for opt do
   ;;
   --disable-fuse-lseek) fuse_lseek="disabled"
   ;;
+  --enable-multiprocess) multiprocess="yes"
+  ;;
+  --disable-multiprocess) multiprocess="no"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1897,6 +1903,7 @@ disabled with --disable-FEATURE, default is enabled if available
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+  multiprocess    Multiprocess QEMU support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6135,6 +6142,9 @@ fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
+if test "$multiprocess" = "yes" ; then
+  echo "CONFIG_MULTIPROCESS_ALLOWED=y" >> $config_host_mak
+fi
 if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
diff --git a/meson.build b/meson.build
index 3d88985..01e25bc 100644
--- a/meson.build
+++ b/meson.build
@@ -1194,7 +1194,8 @@ host_kconfig = \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
-  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : [])
+  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
+  ('CONFIG_MULTIPROCESS_ALLOWED' in config_host ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2508,6 +2509,7 @@ summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'Multiprocess QEMU': config_host.has_key('CONFIG_MULTIPROCESS_ALLOWED')}
 summary(summary_info, bool_yn: true)
 
 if not supported_cpus.contains(cpu)
diff --git a/Kconfig.host b/Kconfig.host
index a9a55a9..24255ef 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -37,3 +37,7 @@ config VIRTFS
 
 config PVRDMA
     bool
+
+config MULTIPROCESS_ALLOWED
+    bool
+    imply MULTIPROCESS
diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b..525fb52 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -27,6 +27,7 @@ source pci-host/Kconfig
 source pcmcia/Kconfig
 source pci/Kconfig
 source rdma/Kconfig
+source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
new file mode 100644
index 0000000..5484446
--- /dev/null
+++ b/hw/remote/Kconfig
@@ -0,0 +1,3 @@
+config MULTIPROCESS
+    bool
+    depends on PCI && KVM
-- 
1.8.3.1


