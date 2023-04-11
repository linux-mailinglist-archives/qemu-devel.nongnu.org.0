Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D56DDEC8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:04:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWY-0003Wr-KM; Tue, 11 Apr 2023 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWH-0003EP-0P
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW9-00026Y-Kg
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZQMdDVjYK6X9018xClSXdbp52QPfNUd/QAT0sjyncs=;
 b=Hb2j9+ABmNGCuswWhnSy54qrG89Z23fMlbYN/8tMBiF7ZlBpfmZz4a3n09qVVtak3LmxJ7
 PeqRK/iCMMpRYlzJVn4ydVtuvVSkAs2KilUv1XyY19+yp/FoRjgjJdQW/wFM0fCp52/Yxk
 cfm2VMJ8vlPAYNApoQiad3fVyvDpM14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-1yaEIosbMYatNkHtjadGxg-1; Tue, 11 Apr 2023 11:02:06 -0400
X-MC-Unique: 1yaEIosbMYatNkHtjadGxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEA7D8996E4;
 Tue, 11 Apr 2023 15:02:05 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 244E240BC797;
 Tue, 11 Apr 2023 15:02:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/10] iotests: Regression test for vhdx log corruption
Date: Tue, 11 Apr 2023 17:01:39 +0200
Message-Id: <20230411150147.318637-3-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230411115231.90398-1-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/regression-vhdx-log  | 62 +++++++++++++++++++
 .../tests/regression-vhdx-log.out             | 14 +++++
 2 files changed, 76 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/regression-vhdx-log
 create mode 100644 tests/qemu-iotests/tests/regression-vhdx-log.out

diff --git a/tests/qemu-iotests/tests/regression-vhdx-log b/tests/qemu-iotests/tests/regression-vhdx-log
new file mode 100755
index 0000000000..ca264e93d6
--- /dev/null
+++ b/tests/qemu-iotests/tests/regression-vhdx-log
@@ -0,0 +1,62 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# vhdx regression test: Updating the first entry of a BAT sector corrupted the
+# following entries.
+#
+# Copyright (C) 2023 Red Hat, Inc.
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
+owner=kwolf@redhat.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1 # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+cd ..
+. ./common.rc
+. ./common.filter
+
+_supported_fmt generic
+_supported_proto generic
+_unsupported_imgopts "subformat=streamOptimized"
+
+size=64M
+_make_test_img $size
+
+echo
+echo "creating pattern"
+$QEMU_IO -c "write -P 1 32M 4k" "$TEST_IMG" | _filter_qemu_io
+$QEMU_IO -c "write -P 2 0 4k" "$TEST_IMG" | _filter_qemu_io
+$QEMU_IO -c "read -P 1 32M 4k" "$TEST_IMG" | _filter_qemu_io
+
+echo
+echo "checking image for errors"
+_check_test_img
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/regression-vhdx-log.out b/tests/qemu-iotests/tests/regression-vhdx-log.out
new file mode 100644
index 0000000000..350c257354
--- /dev/null
+++ b/tests/qemu-iotests/tests/regression-vhdx-log.out
@@ -0,0 +1,14 @@
+QA output created by regression-vhdx-log
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+
+creating pattern
+wrote 4096/4096 bytes at offset 33554432
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 33554432
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+checking image for errors
+No errors were found on the image.
+*** done
-- 
2.39.2


