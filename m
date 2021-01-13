Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44D2F5058
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:48:08 +0100 (CET)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjJX-0001u7-Pb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjGY-0008FM-9K
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:45:02 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzjGU-0000A4-Pd
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:45:01 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGg1Dw181831;
 Wed, 13 Jan 2021 16:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=dt/TS1GiJAhO8UC8hTWP6Y+hwenmB8IfNAKIGCJx2n0=;
 b=jKWQjEjvap99PziuwjQOLie4xCGMO00gao93+uscqy21uVSB7x713joIPW2xD4r+C/J1
 rwRqoBdIJyTBN+jGwtJDZJhRm9RGj4kxaNOLkQpKF2+toscwalibrdJqo5r2l3jxf4qL
 kJtVXL7nYnSmNjnebahPlSLxLweT2imxUCeNwRQSgUnC6PDTsgfOgyeCNFVQLU+Ch20u
 yQ5RL41FlF67jr2q7iu2VtA/mVOImRueITFl8U6ofUWJ/moq0dpkGDwb4rKB1mI6u/Qy
 Au2bDe6N6zfBEKVPdv2k2FHdfj+MOJHuddN6nmkclhfsPkKoi0Z5zbRu80fNz/iQQtA9 Hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 360kvk4c3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:44:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGejI6061791;
 Wed, 13 Jan 2021 16:42:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 360kekm1x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:42:50 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DGgmA0028342;
 Wed, 13 Jan 2021 16:42:48 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 08:42:48 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v17 04/20] multi-process: Add config option for multi-process
 QEMU
Date: Wed, 13 Jan 2021 11:42:16 -0500
Message-Id: <b3628c15b980058724cfef1193110a91f301c995.1610556046.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610556046.git.jag.raman@oracle.com>
References: <cover.1610556046.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130100
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


