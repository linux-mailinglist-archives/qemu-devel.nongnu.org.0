Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4F47E68A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:55:05 +0100 (CET)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0RMu-000490-Dd
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:55:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0RLG-0003Hf-Dw
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0RLC-00084S-Jg
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640278398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2FuEl2IoJqVy/Jvq0eLfAkrFF9++SfgoRFpX5Fm0grs=;
 b=iGBNe1AEDjvCjmWtMQQVvn7o04Mf4HVAInlMsEhl8ebXrut/Ls0xqWH/Cy70jk8Wt3RoKB
 2+2i56RZA/9ZdY/k58fJ8QDWgAZoQqkxhNsdmp3Vumner3PnvPA/33l4/QVegI5Z9Mwaz5
 KUoj6q9CZu7ErtZP4k0b+01a5qCOeak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-v7Ik-akjOA2yftUdSVu9hQ-1; Thu, 23 Dec 2021 11:53:14 -0500
X-MC-Unique: v7Ik-akjOA2yftUdSVu9hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F41218397BE;
 Thu, 23 Dec 2021 16:53:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA34961096;
 Thu, 23 Dec 2021 16:53:09 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/MRCE: Write data to source
Date: Thu, 23 Dec 2021 17:53:08 +0100
Message-Id: <20211223165308.103793-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test assumes that mirror flushes the source when entering the READY
state, and that the format level will pass that flush on to the protocol
level (where we intercept it with blkdebug).

However, apparently that does not happen when using a VMDK image with
zeroed_grain=on, which actually is the default set by testenv.py.  Right
now, Python tests ignore IMGOPTS, though, so this has no effect; but
Vladimir has a series that will change this, so we need to fix this test
before that series lands.

We can fix it by writing data to the source before we start the mirror
job; apparently that makes the (VMDK) format layer change its mind and
pass on the pre-READY flush to the protocol level, so the test passes
again.  (I presume, without any data written, mirror just does a 64M
zero write on the target, which VMDK with zeroed_grain=on basically just
ignores.)

Without this, we do not get a flush, and so blkdebug only sees a single
flush at the end of the job instead of two, and therefore does not
inject an error, which makes the block job complete instead of raising
an error.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
As hinted at above, I think this should be merged before Vladimir's
"iotests: support zstd" series, or said test fails for me with VMDK.
(At least on one system, not the other...  Would be too easy otherwise,
obviously.)
---
 tests/qemu-iotests/tests/mirror-ready-cancel-error | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
index f2dc88881f..770ffca379 100755
--- a/tests/qemu-iotests/tests/mirror-ready-cancel-error
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
@@ -36,6 +36,11 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
         assert iotests.qemu_img_create('-f', iotests.imgfmt, target,
                                        str(image_size)) == 0
 
+        # Ensure that mirror will copy something before READY so the
+        # target format layer will forward the pre-READY flush to its
+        # file child
+        assert iotests.qemu_io_silent('-c', 'write -P 1 0 64k', source) == 0
+
         self.vm = iotests.VM()
         self.vm.launch()
 
@@ -97,7 +102,7 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
         # Write something so will not leave the job immediately, but
         # flush first (which will fail, thanks to blkdebug)
         res = self.vm.qmp('human-monitor-command',
-                          command_line='qemu-io mirror-top "write 0 64k"')
+                          command_line='qemu-io mirror-top "write -P 2 0 64k"')
         self.assert_qmp(res, 'return', '')
 
         # Drain status change events
-- 
2.33.1


