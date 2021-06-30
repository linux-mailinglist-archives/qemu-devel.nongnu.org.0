Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372F3B86E8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:14:02 +0200 (CEST)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycqf-0006BR-25
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfj-0002vS-PN
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfT-00071q-7l
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBl2DzOdzlR78uhIEDr+i4e/y0olLuP4GBtsWtC9/0Y=;
 b=R82x5D1C1Bi2QcjqcIL8zCrkTeLEYaNmCUpVFxeL5mA5vCPXLT1F6ujGunmMieYbcH87md
 Rcx1fcF9bwygnFW+11mF4jmZHyrobLLZmB95w8+CQsLTGPiZweztG0R8UM9FLlzx5w9KoG
 MhZcfxpfiYCU97R/2ELDJ0LaJXJJhT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-L-dMBxQnOQ2BuNWc7AeOHw-1; Wed, 30 Jun 2021 12:02:24 -0400
X-MC-Unique: L-dMBxQnOQ2BuNWc7AeOHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1D78804141;
 Wed, 30 Jun 2021 16:02:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF0F6189C7;
 Wed, 30 Jun 2021 16:02:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/24] block: bdrv_reopen_parse_backing(): don't check frozen
 child
Date: Wed, 30 Jun 2021 18:01:51 +0200
Message-Id: <20210630160206.276439-10-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bdrv_set_backing_noperm() takes care of it (actual check is in
bdrv_set_file_or_backing_noperm()), so we don't need to check it here.

While being here, improve error message a bit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                | 14 +-------------
 tests/qemu-iotests/245 |  8 ++++----
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 69dc9d188d..6472866283 100644
--- a/block.c
+++ b/block.c
@@ -4308,19 +4308,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
                        "an implicit backing file", bs->node_name);
             return -EPERM;
         }
-        /*
-         * Check if the backing link that we want to replace is frozen.
-         * Note that
-         * bdrv_filter_or_cow_child(overlay_bs) == overlay_bs->backing,
-         * because we know that overlay_bs == bs, and that @bs
-         * either is a filter that uses ->backing or a COW format BDS
-         * with bs->drv->supports_backing == true.
-         */
-        if (bdrv_is_backing_chain_frozen(overlay_bs,
-                                         child_bs(overlay_bs->backing), errp))
-        {
-            return -EPERM;
-        }
+
         reopen_state->replace_backing_bs = true;
         reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
         ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index fc5297e268..c7d671366a 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -878,7 +878,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the stream job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd0' to 'hd1'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd0' to 'hd1'")
 
         self.vm.run_job('stream0', auto_finalize = False, auto_dismiss = True)
 
@@ -910,7 +910,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
         self.reopen(opts['backing'], {'read-only': False},
-                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
+                    "Cannot change frozen 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
         opts['backing'] = None
@@ -933,11 +933,11 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd2 while the commit job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd1' to 'hd2'")
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd0' to 'hd1'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd0' to 'hd1'")
 
         event = self.vm.event_wait(name='BLOCK_JOB_READY')
         self.assert_qmp(event, 'data/device', 'commit0')
-- 
2.31.1


