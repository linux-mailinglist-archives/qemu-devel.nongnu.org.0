Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF45341071
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:41:46 +0100 (CET)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1Km-0005mk-Le
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ij-00042U-2n; Thu, 18 Mar 2021 18:39:33 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ic-00040I-OI; Thu, 18 Mar 2021 18:39:32 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sUE-1lI3DP14bK-004zRh; Thu, 18 Mar 2021 23:39:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] iotests: iothreads need ioeventfd
Date: Thu, 18 Mar 2021 23:39:07 +0100
Message-Id: <20210318223907.1344870-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318223907.1344870-1-laurent@vivier.eu>
References: <20210318223907.1344870-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bbzX22WuGK9O0KmZrBF4uHkALslmTyPsZ0L/3E1OKGJ6KXO+heg
 n0GBFmKD8ER2YD4392WSZy8mMEFypBlgJoKuL2RpBpXo+GYhP/TINHFeYKBZaAUqe0Hplsy
 4vmxsJtL6L7XfJB5dNik1Mdpne3eKv0uLnFmpRJyWfRjITAWs/K4fK3/hudixNdDrelRnck
 zYOe6FLZFV2OsbVKLqNhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ejs4NeCSYM8=:di9A+qBtT9OloN2rr0dS1+
 rlLjgeC3taUpSmo6EYO89tH0jbBksvUoY4onB4nIQ3OTqmkCS/o6hzKN4lEswkQ3VMaTW1LEx
 JwAozKH6ty2L6p+S8LGxfd2W+mYg13aqSz6x8YtT8zWLfiMZApA6y1+YSIRI2Ono1+jgds2Zs
 9lzppsrBGb9T2zeZgABo0kTO/wCepogNzygq+ITK0KfAqo+jrG6MPdNrO1eoxzqQOaXItcWN/
 iQbzz/QSp5b3/8b1m1MGc21n/DYJ/Ax5F241pvIfxvGk/nBJAgyQmO3lm1F2bRMPLsJBmtY8o
 zJe/uErRZbObsrhWIrumq/AM4DrUS3AY3Y8xDN61Na+l/wI+GWsYSLFkoIf6Z54ot47ymHUjA
 bpYXH0Vjg1kcUdoML7vEYc4oF1QmTZbhQbyjKrSm5mBiuFDqWS0q9R8i+sstk4DLJQOqu3vRm
 4uB4G7LduA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

And ioeventfd are only available with virtio-scsi-pci, so don't use the alias
and add a rule to require virtio-scsi-pci for the tests that use iothreads.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/127        | 4 ++--
 tests/qemu-iotests/256        | 2 ++
 tests/qemu-iotests/iotests.py | 5 +++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index 98e8e82a8210..a3693533685a 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -44,7 +44,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 
-_require_devices virtio-scsi scsi-hd
+_require_devices virtio-scsi-pci scsi-hd
 
 IMG_SIZE=64K
 
@@ -62,7 +62,7 @@ $QEMU_IO -c 'write 0 42' "$TEST_IMG.overlay0" | _filter_qemu_io
 _launch_qemu \
     -object iothread,id=iothr \
     -blockdev node-name=source,driver=$IMGFMT,file.driver=file,file.filename="$TEST_IMG.overlay0" \
-    -device virtio-scsi,id=scsi-bus,iothread=iothr \
+    -device virtio-scsi-pci,id=scsi-bus,iothread=iothr \
     -device scsi-hd,bus=scsi-bus.0,drive=source
 
 _send_qemu_cmd $QEMU_HANDLE \
diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
index 8d82a1dd865f..eb3af0dea80c 100755
--- a/tests/qemu-iotests/256
+++ b/tests/qemu-iotests/256
@@ -24,6 +24,8 @@ import os
 import iotests
 from iotests import log
 
+iotests._verify_virtio_scsi_pci()
+
 iotests.script_initialize(supported_fmts=['qcow2'])
 size = 64 * 1024 * 1024
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e9e6a066e90..3404ed534bb5 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1146,6 +1146,11 @@ def _verify_virtio_blk() -> None:
     if 'virtio-blk' not in out:
         notrun('Missing virtio-blk in QEMU binary')
 
+def _verify_virtio_scsi_pci() -> None:
+    out = qemu_pipe('-M', 'none', '-device', 'help')
+    if 'virtio-scsi-pci' not in out:
+        notrun('Missing virtio-scsi-pci in QEMU binary')
+
 
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
-- 
2.30.2


