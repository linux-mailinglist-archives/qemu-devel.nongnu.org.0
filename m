Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6912D7CF1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:33:50 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmIf-0000mt-08
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlus-00048D-8c
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluN-0002Bs-Nk
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PztFHjihJ/Gl/R6RCt+wOksUHV6+NFI4Cm4G27ZvpfY=;
 b=fxX2otNcvtB1gWP7oC/A5ja4S6uSmMCcQ8+ARW+EPYBNS3t+3X5U5/ZfKVqhA8HUwkzE0E
 Zrn82gW6Fet6mRtlXY3GvaqVs+5k1wHbZGGpaW7GF8xXSurak2TlcW2stm+/s/jHmkmyaP
 4+BOj0ESwdvj9ZISWDuIEY1M9YzLKTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-lNyG-J1HPn6tcZD3-ZPVxg-1; Fri, 11 Dec 2020 12:08:38 -0500
X-MC-Unique: lNyG-J1HPn6tcZD3-ZPVxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AA03801817;
 Fri, 11 Dec 2020 17:08:37 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49E0F5D731;
 Fri, 11 Dec 2020 17:08:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/34] iotests/046: Avoid renaming images
Date: Fri, 11 Dec 2020 18:07:52 +0100
Message-Id: <20201211170812.228643-15-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This generally does not work on non-file protocols.  It is better to
create the image with the final name from the start, and most tests do
this already.  Let 046 follow suit.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-11-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/046     | 5 +++--
 tests/qemu-iotests/046.out | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/046 b/tests/qemu-iotests/046
index 88b3363c19..40a9f30087 100755
--- a/tests/qemu-iotests/046
+++ b/tests/qemu-iotests/046
@@ -47,6 +47,8 @@ size=128M
 echo
 echo "== creating backing file for COW tests =="
 
+TEST_IMG_SAVE=$TEST_IMG
+TEST_IMG="$TEST_IMG.base"
 _make_test_img $size
 
 backing_io()
@@ -67,8 +69,7 @@ backing_io()
 
 backing_io 0 32 write | $QEMU_IO "$TEST_IMG" | _filter_qemu_io
 
-mv "$TEST_IMG" "$TEST_IMG.base"
-
+TEST_IMG=$TEST_IMG_SAVE
 _make_test_img -b "$TEST_IMG.base" -F $IMGFMT 6G
 
 echo
diff --git a/tests/qemu-iotests/046.out b/tests/qemu-iotests/046.out
index b022bcddd5..66ad987ab3 100644
--- a/tests/qemu-iotests/046.out
+++ b/tests/qemu-iotests/046.out
@@ -1,7 +1,7 @@
 QA output created by 046
 
 == creating backing file for COW tests ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 65536
-- 
2.29.2


