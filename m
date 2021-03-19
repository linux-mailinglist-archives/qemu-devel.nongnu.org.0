Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505023426DC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:28:58 +0100 (CET)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLjZ-0001jV-Cy
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLf1-0004hj-Fq; Fri, 19 Mar 2021 16:23:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLex-0001PB-5k; Fri, 19 Mar 2021 16:23:55 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MKKIZ-1l7BxG2KbP-00LrCS; Fri, 19 Mar 2021 21:23:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] iotests: iothreads need ioeventfd
Date: Fri, 19 Mar 2021 21:23:35 +0100
Message-Id: <20210319202335.2397060-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319202335.2397060-1-laurent@vivier.eu>
References: <20210319202335.2397060-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bvr2lMNLeWFB6ix2L7INbQjVwPfsB0Cd5IFjUjpHS0KtvsDGMR9
 ZlP4KCWbMBXS6cT1ZONF84AD2WtGoP64I177hZvBcTiji85TRVmGWdyPRsfoP2wfSHxDoep
 mHxplD6vXQuSwIVW64jDsZJOiv0ZKW7cYM9Ih4nH04+Dt42g1FeKQfpb/hSE/Lk5hQ57eN7
 Tu60Me1+7i34V9tyQyIAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lbiQ0Lcfwxo=:3DyiptjdbaIuF0ninv4s4n
 Y7jKE2n6dRWGJmoqAYNPJiJxxide7qfejXySBzt+gpUaX8ekPREy60xC6L4nYdnXTaY+eIB+X
 SrvAX7x0yaPF3gQQNkB8P+OwdUMlDjWclJrR47dUmcDnZRLTUx9LlkBaI4A8G4DBfdH1g/a2y
 s74DX2pGNcvn64/laGVCp+9dmHbXb/n6crfFxXVgNtk7sXOufDGqDhpr94PQZ8AZp+CxxRSOY
 iTHutYOnKBmgEqitzWzyDYR0Q2d9EPxlij21ozogBV1LwUCmDEnTny+bCqiTTl1Yc4H7NZc9S
 lnX1lp+KalxttfV/pCABtKkuzIPzrbUTFa4lPZiIKQskr4SzIfjsbrKATOCBEL6e+CI4+Ibg/
 jq4g2znhe3z5zo7wWU+P4NkSmFyi+zBixAbWym69pxEwxldK1MDGJXJq0AQ78iDE6iHndEMA3
 dSUOYmPfuw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
for the tests that use iothreads.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/127        |  3 ++-
 tests/qemu-iotests/256        |  6 ++++--
 tests/qemu-iotests/common.rc  | 13 +++++++++++++
 tests/qemu-iotests/iotests.py |  5 +++++
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index 98e8e82a8210..32edc3b0685e 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 
-_require_devices virtio-scsi scsi-hd
+_require_devices scsi-hd
+_require_one_device_of virtio-scsi-pci virtio-scsi-ccw
 
 IMG_SIZE=64K
 
diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
index 8d82a1dd865f..13666813bd8f 100755
--- a/tests/qemu-iotests/256
+++ b/tests/qemu-iotests/256
@@ -24,6 +24,8 @@ import os
 import iotests
 from iotests import log
 
+iotests._verify_virtio_scsi_pci_or_ccw()
+
 iotests.script_initialize(supported_fmts=['qcow2'])
 size = 64 * 1024 * 1024
 
@@ -61,8 +63,8 @@ with iotests.FilePath('img0') as img0_path, \
     log('--- Preparing images & VM ---\n')
     vm.add_object('iothread,id=iothread0')
     vm.add_object('iothread,id=iothread1')
-    vm.add_device('virtio-scsi-pci,id=scsi0,iothread=iothread0')
-    vm.add_device('virtio-scsi-pci,id=scsi1,iothread=iothread1')
+    vm.add_device('virtio-scsi,id=scsi0,iothread=iothread0')
+    vm.add_device('virtio-scsi,id=scsi1,iothread=iothread1')
     iotests.qemu_img_create('-f', iotests.imgfmt, img0_path, str(size))
     iotests.qemu_img_create('-f', iotests.imgfmt, img1_path, str(size))
     vm.add_drive(img0_path, interface='none')
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 65cdba5723ba..7f49c9716db7 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -977,5 +977,18 @@ _require_devices()
     done
 }
 
+_require_one_device_of()
+{
+    available=$($QEMU -M none -device help | \
+                grep ^name | sed -e 's/^name "//' -e 's/".*$//')
+    for device
+    do
+        if echo "$available" | grep -q "$device" ; then
+            return
+        fi
+    done
+    _notrun "$* not available"
+}
+
 # make sure this script returns success
 true
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e9e6a066e90..5af01828951e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1146,6 +1146,11 @@ def _verify_virtio_blk() -> None:
     if 'virtio-blk' not in out:
         notrun('Missing virtio-blk in QEMU binary')
 
+def _verify_virtio_scsi_pci_or_ccw() -> None:
+    out = qemu_pipe('-M', 'none', '-device', 'help')
+    if 'virtio-scsi-pci' not in out and 'virtio-scsi-ccw' not in out:
+        notrun('Missing virtio-scsi-pci or virtio-scsi-ccw in QEMU binary')
+
 
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
-- 
2.30.2


