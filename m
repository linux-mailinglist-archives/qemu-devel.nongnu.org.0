Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056D2D7CB7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:23:42 +0100 (CET)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm8r-0003Rz-Hv
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluc-0003x6-JH
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluJ-0002AP-3T
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYM+0+uAjliHyr6fIWykWQTbOaWPQVG8yHBkWUuGhMY=;
 b=MjzgYHbsADhoownPxsOsmg/xMPO1AUllIkCSO7WaHsbwb/B4oY5l+LmrXUxgA80p1A2y9Y
 iIOuvT/IovItqakhWd30LGe+X69PdaOmCsd+QphZWD658FsrdsvlI97GTMjx3SQlpYgguC
 tJqLmX+L7FkF0P0qRfbY+LZWYUDAgAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-hbiJOLAPOxGVKufHp9z4FQ-1; Fri, 11 Dec 2020 12:08:35 -0500
X-MC-Unique: hbiJOLAPOxGVKufHp9z4FQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6364180E46E;
 Fri, 11 Dec 2020 17:08:34 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45CC5D731;
 Fri, 11 Dec 2020 17:08:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/34] iotests: Do not pipe _make_test_img
Date: Fri, 11 Dec 2020 18:07:50 +0100
Message-Id: <20201211170812.228643-13-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Max Reitz <mreitz@redhat.com>

Executing _make_test_img as part of a pipe will undo all variable
changes it has done.  As such, this could not work with FUSE (because
we want to remember all of our exports and their qemu instances).

Replace the pipe by a temporary file in 071 and 174 (the two tests that
can run on FUSE).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-9-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/071 | 19 +++++++++++++++----
 tests/qemu-iotests/174 | 10 +++++++++-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index 88faebcc1d..18fe9054b0 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -61,8 +61,17 @@ echo
 echo "=== Testing blkverify through filename ==="
 echo
 
-TEST_IMG="$TEST_IMG.base" IMGFMT="raw" _make_test_img --no-opts $IMG_SIZE |\
-    _filter_imgfmt
+# _make_test_img may set variables that we need to retain.  Everything
+# in a pipe is executed in a subshell, so doing so would throw away
+# all changes.  Therefore, we have to store the output in some temp
+# file and filter that.
+scratch_out="$TEST_DIR/img-create.out"
+
+TEST_IMG="$TEST_IMG.base" IMGFMT="raw" _make_test_img --no-opts $IMG_SIZE \
+    >"$scratch_out"
+_filter_imgfmt <"$scratch_out"
+rm -f "$scratch_out"
+
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=raw,file.driver=blkverify,file.raw.filename=$TEST_IMG.base $TEST_IMG" \
          -c 'read 0 512' -c 'write -P 42 0x38000 512' -c 'read -P 42 0x38000 512' | _filter_qemu_io
@@ -76,8 +85,10 @@ echo
 echo "=== Testing blkverify through file blockref ==="
 echo
 
-TEST_IMG="$TEST_IMG.base" IMGFMT="raw" _make_test_img --no-opts $IMG_SIZE |\
-    _filter_imgfmt
+TEST_IMG="$TEST_IMG.base" IMGFMT="raw" _make_test_img --no-opts $IMG_SIZE \
+    >"$scratch_out"
+_filter_imgfmt <"$scratch_out"
+
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=raw,file.driver=blkverify,file.raw.filename=$TEST_IMG.base,file.test.driver=$IMGFMT,file.test.file.filename=$TEST_IMG" \
          -c 'read 0 512' -c 'write -P 42 0x38000 512' -c 'read -P 42 0x38000 512' | _filter_qemu_io
diff --git a/tests/qemu-iotests/174 b/tests/qemu-iotests/174
index e2f14a38c6..1b0dd2e8b7 100755
--- a/tests/qemu-iotests/174
+++ b/tests/qemu-iotests/174
@@ -40,7 +40,15 @@ _unsupported_fmt raw
 
 
 size=256K
-IMGFMT=raw IMGKEYSECRET= _make_test_img --no-opts $size | _filter_imgfmt
+
+# _make_test_img may set variables that we need to retain.  Everything
+# in a pipe is executed in a subshell, so doing so would throw away
+# all changes.  Therefore, we have to store the output in some temp
+# file and filter that.
+scratch_out="$TEST_DIR/img-create.out"
+IMGFMT=raw IMGKEYSECRET= _make_test_img --no-opts $size >"$scratch_out"
+_filter_imgfmt <"$scratch_out"
+rm -f "$scratch_out"
 
 echo
 echo "== reading wrong format should fail =="
-- 
2.29.2


