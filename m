Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FBD3D185F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:48:17 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6J8a-0000An-5X
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6J6q-0007mL-MO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6J6n-0003f7-Jy
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626900384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ISGGcfjPMDfLHObyfUwm/dEmh3X+0sJqLyFfoLkAi3A=;
 b=aP+5kZJh1NEerXZlgdwlSU2AuAm44Z6V4oyUaDoiUyko5HQz2IUAOK+gsBLA76L9VaeLnZ
 N5AlvDqcUNbyGr6ZKr4ulOwCn/RAl0IdkoULdWRXhZuzFHBYSRTzgHMtNkai8B8zzFx7o3
 ZGwoE18T3Fs1yIjmtqMZEHWMUB8WBqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-Nz6HJjSlOq2nr2JZ45WyGw-1; Wed, 21 Jul 2021 16:46:21 -0400
X-MC-Unique: Nz6HJjSlOq2nr2JZ45WyGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D1A1084F54;
 Wed, 21 Jul 2021 20:46:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8686B1970F;
 Wed, 21 Jul 2021 20:46:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1?] iotest: Further enhance qemu-img-bitmaps
Date: Wed, 21 Jul 2021 15:46:16 -0500
Message-Id: <20210721204616.652155-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a regression test to make sure we detect attempts to use 'qemu-img
bitmap' to modify an in-use local file.

Suggested-by: Nir Soffer <nsoffer@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

Sadly, this missed my bitmaps pull request today.  If there's any
reason to respin that pull request, I'm inclined to add this in, as it
just touches the iotests; otherwise, if it slips to 6.2 it's not too
bad.

 tests/qemu-iotests/tests/qemu-img-bitmaps     | 6 ++++++
 tests/qemu-iotests/tests/qemu-img-bitmaps.out | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
index 7a3fe8c3d37a..3b6fade11735 100755
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
@@ -129,6 +129,12 @@ $QEMU_IMG map --output=json --image-opts \
 $QEMU_IMG map --output=json --image-opts \
     "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b3" | _filter_qemu_img_map

+echo
+echo "=== bitmap command fails to modify image already in use ==="
+echo
+
+$QEMU_IMG bitmap --add "$TEST_IMG" b4 2>&1 | _filter_testdir
+
 nbd_server_stop

 echo
diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
index e851f0320ecb..c6e12dd700aa 100644
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -116,6 +116,11 @@ Format specific information:
 { "start": 2097152, "length": 1048576, "depth": 0, "present": false, "zero": false, "data": false},
 { "start": 3145728, "length": 7340032, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]

+=== bitmap command fails to modify image already in use ===
+
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+Is another process using the image [TEST_DIR/t.qcow2]?
+
 === Check handling of inconsistent bitmap ===

 image: TEST_DIR/t.IMGFMT
-- 
2.31.1


