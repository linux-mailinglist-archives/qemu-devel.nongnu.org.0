Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB42DDE30
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:49:08 +0100 (CET)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8dX-0006Bi-Hu
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Vv-0000BF-Fe
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:15 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Vt-0003sy-2g
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:14 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5Y0qR147957;
 Fri, 18 Dec 2020 05:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=EXjSV+6gYy9MAKGASrCpGN7WtD4i8ls4lidDVmJ5RiU=;
 b=pgT4t702vggGTOqIlPwBipX791btUjb5fovb/lNf0VKUNa+4ilNNNJ52QTORgZZU+T+7
 +/yMmBlf9gZIliaYjwkgO0E+9YgMYKg1X/xdUWqWzF0YY7MWW0d95VzI5RYTp2ivZJ3K
 VtBggJ+Yx/uys8Fi1EdYXh0NGkwVkQUCRdaIpCpkpTN0d6GGWcx4hDiahNUgObplgvlp
 zOpOqw0jrE0/ZpV/ro8aLdo0JhlnIW86dr/G2VZM8LBAq7A0D3t8NFS5ExfnzsdvzmFP
 kDJuGONcx613XgwrlTrYEHRMghaUFzMm6vcU2TcK8jRQcjpTc761zslVOpJkJ+3veVey 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcbrw3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:40:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5ZJ0W042223;
 Fri, 18 Dec 2020 05:40:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35g3rfptd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:40:57 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5etXv009755;
 Fri, 18 Dec 2020 05:40:55 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:40:54 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 05/21] multi-process: Add config option for
 multi-process QEMU
Date: Thu, 17 Dec 2020 21:40:35 -0800
Message-Id: <2d3d49762902c17d62d27f0c65cc3eb60611e3c8.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180040
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Jagannathan Raman <jag.raman@oracle.com>

Add configuration options to enable or disable multiprocess QEMU code

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 configure         | 10 ++++++++++
 meson.build       |  2 ++
 Kconfig.host      |  4 ++++
 hw/Kconfig        |  1 +
 hw/remote/Kconfig |  3 +++
 5 files changed, 20 insertions(+)
 create mode 100644 hw/remote/Kconfig

diff --git a/configure b/configure
index c228f7c21e..9c14c482ac 100755
--- a/configure
+++ b/configure
@@ -451,6 +451,7 @@ skip_meson=no
 gettext=""
 fuse="auto"
 fuse_lseek="auto"
+multiprocess="no"
 
 bogus_os="no"
 malloc_trim="auto"
@@ -799,6 +800,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   vhost_user="yes"
+  multiprocess="yes"
 ;;
 esac
 
@@ -1535,6 +1537,10 @@ for opt do
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
@@ -1862,6 +1868,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+  multiprocess    Multiprocess QEMU support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6644,6 +6651,9 @@ fi
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
index fba6413056..39df2337d3 100644
--- a/meson.build
+++ b/meson.build
@@ -925,6 +925,7 @@ kconfig_external_symbols = [
   'CONFIG_VIRTFS',
   'CONFIG_LINUX',
   'CONFIG_PVRDMA',
+  'CONFIG_MULTIPROCESS_ALLOWED',
 ]
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2239,6 +2240,7 @@ summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'Multiprocess QEMU': config_host.has_key('CONFIG_MULTIPROCESS_ALLOWED')}
 summary(summary_info, bool_yn: true)
 
 if not supported_cpus.contains(cpu)
diff --git a/Kconfig.host b/Kconfig.host
index a9a55a9c31..24255ef441 100644
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
index 5ad3c6b5a4..525fb52506 100644
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
index 0000000000..54844467a0
--- /dev/null
+++ b/hw/remote/Kconfig
@@ -0,0 +1,3 @@
+config MULTIPROCESS
+    bool
+    depends on PCI && KVM
-- 
2.25.GIT


