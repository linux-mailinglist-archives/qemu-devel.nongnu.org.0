Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBC3C23D9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:58:54 +0200 (CEST)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q5l-00025i-Mb
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyw-0004Ys-KA
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyu-0003bz-9q
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aW2cKAJnQ3lze8efHIix6Hj+piWNWdT+2zgUQLBCJA=;
 b=FAzVCbURqnRXLHGTjJlbE9sUQSg1qub0thrcv+sQg33MkEkde4ctQq/9HPMVCClSUrg5wj
 k1PFx3MUNGlrFX08jUDpcBc3Rxf6maweDrULw/gFOdKzYNm/MuUztzd5aDepuYs8KY/grx
 iOnaSoMzvxZ+ucK4XMzBto5VR0lhu/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-NzP33vCeMkacvAc961Gw_A-1; Fri, 09 Jul 2021 08:51:46 -0400
X-MC-Unique: NzP33vCeMkacvAc961Gw_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47A088015F5;
 Fri,  9 Jul 2021 12:51:45 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A03EE60843;
 Fri,  9 Jul 2021 12:51:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/28] iotests/308: Test +w on read-only FUSE exports
Date: Fri,  9 Jul 2021 14:50:21 +0200
Message-Id: <20210709125035.191321-15-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

Test that +w on read-only FUSE exports returns an EROFS error.  u+x on
the other hand should work.  (There is no special reason to choose u+x
here, it simply is like +w another flag that is not set by default.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210625142317.271673-6-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


