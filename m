Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD492F82EB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:50:21 +0100 (CET)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TEq-0001F9-LS
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8c-0003p9-RK
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8Y-0001U1-HF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610732618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4wueHsFBE7jWeZlGn5kl5fl8z2uFey1fDpAm+u3DFQ=;
 b=gbEXh8ZsJEajMKMBlw6T0k81pHy7RrhJQxWwSD2gbBsx4m+6RKip6aDQdNpicyZc2gONJa
 Nczk6/EjJtg+Wt1GzgSHi6wZRjdwIELDB0637uDx9gds4/dTopL2HZ5pVwZXLbmnudS6fo
 VHIrx5+laIRzgK/rdU+VFNFpdXWXdqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-pZxUm3CtOUipFT1a1aX9Dw-1; Fri, 15 Jan 2021 12:43:34 -0500
X-MC-Unique: pZxUm3CtOUipFT1a1aX9Dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B041DB8100;
 Fri, 15 Jan 2021 17:43:33 +0000 (UTC)
Received: from localhost (ovpn-114-144.ams2.redhat.com [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D0010016FF;
 Fri, 15 Jan 2021 17:43:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/10] iotests/129: Actually test a commit job
Date: Fri, 15 Jan 2021 18:43:12 +0100
Message-Id: <20210115174315.30949-8-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-1-mreitz@redhat.com>
References: <20210115174315.30949-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before this patch, test_block_commit() performs an active commit, which
under the hood is a mirror job.  If we want to test various different
block jobs, we should perhaps run an actual commit job instead.

Doing so requires adding an overlay above the source node before the
commit is done (and then specifying the source node as the top node for
the commit job).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/129 | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index d40e2db24e..104be6dded 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -26,6 +26,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
     test_img = os.path.join(iotests.test_dir, 'test.img')
     target_img = os.path.join(iotests.test_dir, 'target.img')
     base_img = os.path.join(iotests.test_dir, 'base.img')
+    overlay_img = os.path.join(iotests.test_dir, 'overlay.img')
 
     def setUp(self):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_img, "1G")
@@ -36,6 +37,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
 
         source_drive = 'driver=throttle,' \
+                       'node-name=source,' \
                        'throttle-group=tg0,' \
                        f'file.driver={iotests.imgfmt},' \
                        f'file.file.filename={self.test_img}'
@@ -45,7 +47,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
 
     def tearDown(self):
         self.vm.shutdown()
-        for img in (self.test_img, self.target_img, self.base_img):
+        for img in (self.test_img, self.target_img, self.base_img,
+                    self.overlay_img):
             iotests.try_remove(img)
 
     def do_test_stop(self, cmd, **args):
@@ -72,7 +75,27 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
                           sync="full")
 
     def test_block_commit(self):
-        self.do_test_stop("block-commit", device="drive0")
+        # Add overlay above the source node so that we actually use a
+        # commit job instead of a mirror job
+
+        iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
+                         '1G')
+
+        result = self.vm.qmp('blockdev-add', **{
+                                 'node-name': 'overlay',
+                                 'driver': iotests.imgfmt,
+                                 'file': {
+                                     'driver': 'file',
+                                     'filename': self.overlay_img
+                                 }
+                             })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-snapshot',
+                             node='source', overlay='overlay')
+        self.assert_qmp(result, 'return', {})
+
+        self.do_test_stop('block-commit', device='drive0', top_node='source')
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=["qcow2"],
-- 
2.29.2


