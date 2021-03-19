Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2001341E6D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:35:28 +0100 (CET)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFHj-00038K-Os
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8X-0000QE-3J; Fri, 19 Mar 2021 09:25:57 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:47421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8V-0003kF-1Z; Fri, 19 Mar 2021 09:25:56 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHGTI-1lRcr61EfI-00DHN8; Fri, 19 Mar 2021 14:25:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] iotests: iothreads need ioeventfd
Date: Fri, 19 Mar 2021 14:25:37 +0100
Message-Id: <20210319132537.2046339-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319132537.2046339-1-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Fr2ixeMzMpVs/V7RWH/mcZ04B9xZOTcA6DuSqEWYztlRyuxgiBL
 X4pFZcAmdaIMwo8CJ/TwxM1Cc9MkbJRBA1Ged9vppe0Y0O5mzreZXKN6iTCCj3NhBA43nF9
 mjOO4qbqTQXwewZdwX7h5KWt+JcA0zBbiZ785xOGT3FyVrvtraDYQpiJF0Ddwf6rAc5dIb0
 0wi3qsc/bjRg1/qeqVV9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iHkttIqPHlU=:kncGkiF3WtYWbTQQ9aQeRQ
 t/NYEciG6t8uwmzKm62nqT5r6YB+eYd/NWWcrMR6FsnayvzXSTUtAGrCtfqy0pVr2Fi233Kof
 y6Cveau1RmZIH3vemZkJB6xWYG7uAvabhfcmW2QokRjqF1W+0R3g61Wmg1hKOfoGqXehclmeU
 JarjjMJQ1sw2ACSDokzqvBzjzQrb19jZuWoU0daStQGVW/b+Vn2YDANH+GQfdrS8xnFmVwYtg
 L1YdwbRPbDxKUi79SpzOt9sV2ygmuamnvydmN65djJlWN2ZokM2+jll+TB9qeK3yhJnGoMYIp
 sEY7YBMGRnNNDpddTjD3OsVKLZROGwE2Ercm2bA1cekbjtT4ciDQpn9CIXnqbawRy/Wi8k0Um
 tbhQFWHldkRMJYMjYbbRG/KufXOGGoGqBotx2+5obOpXhbz9ZTl1FC1j/XB4BlstVILL9ofDU
 cVPDnQah1w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 tests/qemu-iotests/127        | 3 ++-
 tests/qemu-iotests/256        | 6 ++++--
 tests/qemu-iotests/iotests.py | 5 +++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index 98e8e82a8210..abe24861100d 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 
-_require_devices virtio-scsi scsi-hd
+_require_devices scsi-hd
+_require_devices virtio-scsi-pci || _require_devices virtio-scsi-ccw
 
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
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e9e6a066e90..d3faf96005dd 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1146,6 +1146,11 @@ def _verify_virtio_blk() -> None:
     if 'virtio-blk' not in out:
         notrun('Missing virtio-blk in QEMU binary')
 
+def _verify_virtio_scsi_pci_or_ccw() -> None:
+    out = qemu_pipe('-M', 'none', '-device', 'help')
+    if 'virtio-scsi-pci' not in out and 'virtio-scsi-ccw' not in out:
+        notrun('Missing virtio-scsi-pci and virtio-scsi-ccw in QEMU binary')
+
 
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
-- 
2.30.2


