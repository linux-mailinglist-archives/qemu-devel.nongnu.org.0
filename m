Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA4F3B4627
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:54:21 +0200 (CEST)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwnDo-0005Ry-Tg
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmk3-0006Y5-S2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmk1-0005WW-IZ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624631012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9/cXoibLTevUNYcVXXi9IVhytwoHM4upp4siqv3Otk=;
 b=WKGQZpxWvO0b3ybnV+BIaPfzTGZJolFun2V6ehKpWDDM8qJvVNSvFXJMb01LF2kk00InJh
 Uxmmht2/QDwgU5OjgsO1Q7itc6GbvdmETGVO3M/zgF1BYlykWdpe+O/nRFMQewsoaniz7i
 f7C5qcObHoc9QWcQFvM0kNHdyBMn15k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-RM60CpKYO--AGTq9Bt2chA-1; Fri, 25 Jun 2021 10:23:31 -0400
X-MC-Unique: RM60CpKYO--AGTq9Bt2chA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A716C804300;
 Fri, 25 Jun 2021 14:23:30 +0000 (UTC)
Received: from localhost (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC7C26E7F;
 Fri, 25 Jun 2021 14:23:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 5/6] iotests/308: Test +w on read-only FUSE exports
Date: Fri, 25 Jun 2021 16:23:16 +0200
Message-Id: <20210625142317.271673-6-mreitz@redhat.com>
In-Reply-To: <20210625142317.271673-1-mreitz@redhat.com>
References: <20210625142317.271673-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test that +w on read-only FUSE exports returns an EROFS error.  u+x on
the other hand should work.  (There is no special reason to choose u+x
here, it simply is like +w another flag that is not set by default.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/308     | 11 +++++++++++
 tests/qemu-iotests/308.out |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index d13a9a969c..6b386bd523 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -170,6 +170,17 @@ fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP'"
 # Check that the export presents the same data as the original image
 $QEMU_IMG compare -f raw -F $IMGFMT -U "$EXT_MP" "$TEST_IMG"
 
+# Some quick chmod tests
+stat -c 'Permissions pre-chmod: %a' "$EXT_MP"
+
+# Verify that we cannot set +w
+chmod u+w "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+stat -c 'Permissions post-+w: %a' "$EXT_MP"
+
+# But that we can set, say, +x (if we are so inclined)
+chmod u+x "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+stat -c 'Permissions post-+x: %a' "$EXT_MP"
+
 echo
 echo '=== Mount over existing file ==='
 
diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
index 0e9420645f..fc47bb11a2 100644
--- a/tests/qemu-iotests/308.out
+++ b/tests/qemu-iotests/308.out
@@ -50,6 +50,10 @@ wrote 67108864/67108864 bytes at offset 0
           } }
 {"return": {}}
 Images are identical.
+Permissions pre-chmod: 400
+chmod: changing permissions of 'TEST_DIR/t.IMGFMT.fuse': Read-only file system
+Permissions post-+w: 400
+Permissions post-+x: 500
 
 === Mount over existing file ===
 {'execute': 'block-export-add',
-- 
2.31.1


