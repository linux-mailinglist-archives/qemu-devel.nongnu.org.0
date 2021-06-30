Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB83B86CC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:08:49 +0200 (CEST)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyclc-0003Ep-4A
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfN-0002W8-8z
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfL-0006vq-8R
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBILtnV+Iorzg0Zv7PpW1VkAYlsKaI1ABjB/gmvTi/g=;
 b=b1cUdNClEoniplGhXII6JPXl9sEptPpU4/a8qUnpgpIcew/PI4EcYdoyU37Q36LHV/n8kO
 vGJiKjJeeYwWFEr2f9j3yGQ9ZV0K/oUb3mXDfque+esqZxkIG4cM1vbNeF3fSqoN/FC7YT
 ASe05u1Zt3nwZrzDzLKWzUqGePAc6Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454--QfmdSGsO32_9yGFqngiNQ-1; Wed, 30 Jun 2021 12:02:16 -0400
X-MC-Unique: -QfmdSGsO32_9yGFqngiNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35971A40C8;
 Wed, 30 Jun 2021 16:02:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4042E179E6;
 Wed, 30 Jun 2021 16:02:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/24] block: BDRV_O_NO_IO for backing file on creation
Date: Wed, 30 Jun 2021 18:01:45 +0200
Message-Id: <20210630160206.276439-4-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When creating an image file with a backing file, we generally try to
open the backing file (unless -u was specified), mostly to verify that
it is there, but also to get the file size if none was specified for the
new image.

For neither of these things do we need data I/O, and so we can pass
BDRV_O_NO_IO when opening the backing file.  This allows us to open even
encrypted backing images without requiring the user to provide a secret.

This makes the -u switch in iotests 189 and 198 unnecessary (and the
$size parameter), so drop it, because this way we get regression tests
for this patch here.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/441
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210622140030.212487-1-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                | 6 +++++-
 tests/qemu-iotests/189 | 2 +-
 tests/qemu-iotests/198 | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 3e277855e7..a2a4a0dd80 100644
--- a/block.c
+++ b/block.c
@@ -6553,9 +6553,13 @@ void bdrv_img_create(const char *filename, const char *fmt,
         }
         assert(full_backing);
 
-        /* backing files always opened read-only */
+        /*
+         * No need to do I/O here, which allows us to open encrypted
+         * backing images without needing the secret
+         */
         back_flags = flags;
         back_flags &= ~(BDRV_O_RDWR | BDRV_O_SNAPSHOT | BDRV_O_NO_BACKING);
+        back_flags |= BDRV_O_NO_IO;
 
         backing_options = qdict_new();
         if (backing_fmt) {
diff --git a/tests/qemu-iotests/189 b/tests/qemu-iotests/189
index 4e463385b2..801494c6b9 100755
--- a/tests/qemu-iotests/189
+++ b/tests/qemu-iotests/189
@@ -67,7 +67,7 @@ echo "== verify pattern =="
 $QEMU_IO --object $SECRET0 -c "read -P 0xa 0 $size" --image-opts $IMGSPECBASE | _filter_qemu_io | _filter_testdir
 
 echo "== create overlay =="
-_make_test_img --object $SECRET1 -o "encrypt.format=luks,encrypt.key-secret=sec1,encrypt.iter-time=10" -u -b "$TEST_IMG_BASE" -F $IMGFMT $size
+_make_test_img --object $SECRET1 -o "encrypt.format=luks,encrypt.key-secret=sec1,encrypt.iter-time=10" -b "$TEST_IMG_BASE" -F $IMGFMT
 
 echo
 echo "== writing part of a cluster =="
diff --git a/tests/qemu-iotests/198 b/tests/qemu-iotests/198
index b333a8f281..1c93dea1f7 100755
--- a/tests/qemu-iotests/198
+++ b/tests/qemu-iotests/198
@@ -64,7 +64,7 @@ echo "== writing whole image base =="
 $QEMU_IO --object $SECRET0 -c "write -P 0xa 0 $size" --image-opts $IMGSPECBASE | _filter_qemu_io | _filter_testdir
 
 echo "== create overlay =="
-_make_test_img --object $SECRET1 -o "encrypt.format=luks,encrypt.key-secret=sec1,encrypt.iter-time=10" -u -b "$TEST_IMG_BASE" -F $IMGFMT $size
+_make_test_img --object $SECRET1 -o "encrypt.format=luks,encrypt.key-secret=sec1,encrypt.iter-time=10" -b "$TEST_IMG_BASE" -F $IMGFMT
 
 echo
 echo "== writing whole image layer =="
-- 
2.31.1


