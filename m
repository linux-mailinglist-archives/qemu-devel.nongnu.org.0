Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD832F0EC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:14:31 +0100 (CET)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE21-0004Bw-Pg
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkZ-0007TC-Pf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007Fj-BF
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cae2kkknNE/C4/3u4UBfwAIUtJ118zHDgw0ox10pAcE=;
 b=XBCWEaEU0Fg5crEZcjLd+ptGGz72qr+H1PqgbokCPWY69KTwtSX92fhlmHFzby+RRtrc4J
 2DdgDilaLIJXxa87QGRq85ez2f6WmzRDVstTP6K3EnchqKvFeyY1V6lAINVUaLQj25W10B
 wJSJS8FqI+UcQ49NDVJY88OgFef5I6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-kmKxu0AUPqCgqbGBIRWt9Q-1; Fri, 05 Mar 2021 11:55:54 -0500
X-MC-Unique: kmKxu0AUPqCgqbGBIRWt9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DE5310A2C73;
 Fri,  5 Mar 2021 16:55:47 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E44C60BF3;
 Fri,  5 Mar 2021 16:55:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/31] iotests: add parallels-read-bitmap test
Date: Fri,  5 Mar 2021 17:54:52 +0100
Message-Id: <20210305165454.356840-30-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Test support for reading bitmap from parallels image format.
parallels-with-bitmap.bz2 is generated on Virtuozzo by
parallels-with-bitmap.sh

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210224104707.88430-7-vsementsov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh    |  51 ++++++++++++++++
 .../qemu-iotests/tests/parallels-read-bitmap  |  55 ++++++++++++++++++
 .../tests/parallels-read-bitmap.out           |   6 ++
 4 files changed, 112 insertions(+)
 create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
 create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
 create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
 create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out

diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2 b/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..54892fd4d01bf743d395bd4f3d896494146ab5a9
GIT binary patch
literal 203
zcmV;+05tzXT4*^jL0KkKS@=;0bpT+Hf7|^?Km<xfFyKQJ7=Y^F-%vt;00~Ysa6|-=
zk&7Szk`SoS002EkfMftPG<ipnsiCK}K_sNmm}me3FiZr%Oaf_u5F8kD;mB_~cxD-r
z5P$(X{&Tq5C`<xK02D?NNdN+t$~z$m00O|zFh^ynq*yaCtkn+NZzWom<#OEoF`?zb
zv(i3x^K~wt!aLPcRBP+PckUsIh6*LgjYSh0`}#7hMC9NR5D)+W0d&8Mxgwk>NPH-R
Fx`3oHQ9u9y

literal 0
HcmV?d00001

diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
new file mode 100755
index 0000000000..30615aa6bd
--- /dev/null
+++ b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+#
+# Test parallels load bitmap
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+CT=parallels-with-bitmap-ct
+DIR=$PWD/parallels-with-bitmap-dir
+IMG=$DIR/root.hds
+XML=$DIR/DiskDescriptor.xml
+TARGET=parallels-with-bitmap.bz2
+
+rm -rf $DIR
+
+prlctl create $CT --vmtype ct
+prlctl set $CT --device-add hdd --image $DIR --recreate --size 2G
+
+# cleanup the image
+qemu-img create -f parallels $IMG 64G
+
+# create bitmap
+prlctl backup $CT
+
+prlctl set $CT --device-del hdd1
+prlctl destroy $CT
+
+dev=$(ploop mount $XML | sed -n 's/^Adding delta dev=\(\/dev\/ploop[0-9]\+\).*/\1/p')
+dd if=/dev/zero of=$dev bs=64K seek=5 count=2 oflag=direct
+dd if=/dev/zero of=$dev bs=64K seek=30 count=1 oflag=direct
+dd if=/dev/zero of=$dev bs=64K seek=10 count=3 oflag=direct
+ploop umount $XML  # bitmap name will be in the output
+
+bzip2 -z $IMG
+
+mv $IMG.bz2 $TARGET
+
+rm -rf $DIR
diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap b/tests/qemu-iotests/tests/parallels-read-bitmap
new file mode 100755
index 0000000000..af6b9c5db3
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-read-bitmap
@@ -0,0 +1,55 @@
+#!/usr/bin/env python3
+#
+# Test parallels load bitmap
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import json
+import iotests
+from iotests import qemu_nbd_popen, qemu_img_pipe, log, file_path
+
+iotests.script_initialize(supported_fmts=['parallels'])
+
+nbd_sock = file_path('nbd-sock', base_dir=iotests.sock_dir)
+disk = iotests.file_path('disk')
+bitmap = 'e4f2eed0-37fe-4539-b50b-85d2e7fd235f'
+nbd_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}' \
+        f',x-dirty-bitmap=qemu:dirty-bitmap:{bitmap}'
+
+
+iotests.unarchive_sample_image('parallels-with-bitmap', disk)
+
+
+with qemu_nbd_popen('--read-only', f'--socket={nbd_sock}',
+                    f'--bitmap={bitmap}', '-f', iotests.imgfmt, disk):
+    out = qemu_img_pipe('map', '--output=json', '--image-opts', nbd_opts)
+    chunks = json.loads(out)
+    cluster = 64 * 1024
+
+    log('dirty clusters (cluster size is 64K):')
+    for c in chunks:
+        assert c['start'] % cluster == 0
+        assert c['length'] % cluster == 0
+        if c['data']:
+            continue
+
+        a = c['start'] // cluster
+        b = (c['start'] + c['length']) // cluster
+        if b - a > 1:
+            log(f'{a}-{b-1}')
+        else:
+            log(a)
diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap.out b/tests/qemu-iotests/tests/parallels-read-bitmap.out
new file mode 100644
index 0000000000..e8f6bc9e96
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-read-bitmap.out
@@ -0,0 +1,6 @@
+Start NBD server
+dirty clusters (cluster size is 64K):
+5-6
+10-12
+30
+Kill NBD server
-- 
2.29.2


