Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA168E1FC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUj1-0000R2-Hv; Tue, 07 Feb 2023 15:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pPUj0-0000QF-8U
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pPUiy-0004L7-Nn
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675802276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXLS+qlXUGLXaRdiRtwVgo1stC2nNPE+FtrNAVSPfoc=;
 b=VWPB3965mvj9dcoxA6mD0tjNJal10wUz91gzPyftoaja5uj2soGJsmM2zcwb9wAPEITM8L
 tpbw6icDYT75vXaw6fph8fSsJ5E34rUJQmlA5EbZkSu7Dw0hFPb8xPC4qQPbYcXYGoZCNg
 zvd/om6cyCkR8ajV6sCX5NC0EjnbwKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-slhc1KgiN52DBwcUu0Q4Bw-1; Tue, 07 Feb 2023 15:37:53 -0500
X-MC-Unique: slhc1KgiN52DBwcUu0Q4Bw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0197887400;
 Tue,  7 Feb 2023 20:37:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D447140EBF4;
 Tue,  7 Feb 2023 20:37:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fiona Ebner <f.ebner@proxmox.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v4 4/4] iotests/detect-zeroes-registered-buf: add new test
Date: Tue,  7 Feb 2023 15:37:19 -0500
Message-Id: <20230207203719.242926-5-stefanha@redhat.com>
In-Reply-To: <20230207203719.242926-1-stefanha@redhat.com>
References: <20230207203719.242926-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This regression test demonstrates that detect-zeroes works with
registered buffers. Bug details:
https://gitlab.com/qemu-project/qemu/-/issues/1404

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 .../tests/detect-zeroes-registered-buf        | 58 +++++++++++++++++++
 .../tests/detect-zeroes-registered-buf.out    |  7 +++
 2 files changed, 65 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
 create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf.out

diff --git a/tests/qemu-iotests/tests/detect-zeroes-registered-buf b/tests/qemu-iotests/tests/detect-zeroes-registered-buf
new file mode 100755
index 0000000000..edb5f2cee5
--- /dev/null
+++ b/tests/qemu-iotests/tests/detect-zeroes-registered-buf
@@ -0,0 +1,58 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Check that detect-zeroes=unmap works on writes with registered I/O buffers.
+# This is a regression test for
+# https://gitlab.com/qemu-project/qemu/-/issues/1404 where I/O requests failed
+# unexpectedly.
+#
+# Copyright Red Hat
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
+# creator
+owner=stefanha@redhat.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+	_cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+cd ..
+. ./common.rc
+. ./common.filter
+
+_supported_fmt qcow2
+_supported_proto generic
+
+size=128M
+_make_test_img $size
+IMGSPEC="driver=$IMGFMT,file.filename=$TEST_IMG,discard=unmap,detect-zeroes=unmap"
+
+echo
+echo "== writing zero buffer to image =="
+QEMU_IO_OPTIONS="$QEMU_IO_OPTIONS_NO_FMT" $QEMU_IO -c "write -r -P 0 0 4k" --image-opts "$IMGSPEC" | _filter_qemu_io
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/detect-zeroes-registered-buf.out b/tests/qemu-iotests/tests/detect-zeroes-registered-buf.out
new file mode 100644
index 0000000000..42c56fcc8d
--- /dev/null
+++ b/tests/qemu-iotests/tests/detect-zeroes-registered-buf.out
@@ -0,0 +1,7 @@
+QA output created by detect-zeroes-registered-buf
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
+
+== writing zero buffer to image ==
+wrote 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.39.1


