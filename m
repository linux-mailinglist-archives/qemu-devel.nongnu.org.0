Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F8398B44
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:59:33 +0200 (CEST)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRPA-00069w-8b
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCY-00025X-SP
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCX-0007Qk-2a
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3qJhjfuHd8oHrw6mJz1DwARWVHxy/mLa1EaobjhmGc=;
 b=F+EVjoG8JlKslpM9jnCVgeW8ig+3BH+BhGalC4jRUBHfow+qUT4FFECyvV1tnDxX7C0mCR
 LzqCgf5KRCgeYYYb6107Yyg3oySAYLU8/BFbYZBnn5Lr28ziOWbq8uQAJ/oHh88m50qsen
 Hi9JA98a5j6+pzR5M+LlURu013wCu6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-GMM3kFR8MP-XYeCPCFECIw-1; Wed, 02 Jun 2021 09:46:22 -0400
X-MC-Unique: GMM3kFR8MP-XYeCPCFECIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E44A08B7CC6;
 Wed,  2 Jun 2021 13:45:50 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 005D519CBE;
 Wed,  2 Jun 2021 13:45:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/20] block/vvfat: inherit child_vvfat_qcow from child_of_bds
Date: Wed,  2 Jun 2021 15:45:22 +0200
Message-Id: <20210602134529.231756-14-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

Recently we've fixed a crash by adding .get_parent_aio_context handler
to child_vvfat_qcow. Now we want it to support .get_parent_desc as
well. child_vvfat_qcow wants to implement own .inherit_options, it's
not bad. But omitting all other handlers is a bad idea. Let's inherit
the class from child_of_bds instead, similar to chain_child_class and
detach_by_driver_cb_class in test-bdrv-drain.c.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210601075218.79249-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 86d99c899c..ae9d387da7 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3127,11 +3127,7 @@ static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
     qdict_set_default_str(child_options, BDRV_OPT_CACHE_NO_FLUSH, "on");
 }
 
-static const BdrvChildClass child_vvfat_qcow = {
-    .parent_is_bds      = true,
-    .inherit_options    = vvfat_qcow_options,
-    .get_parent_aio_context = child_of_bds_get_parent_aio_context,
-};
+static BdrvChildClass child_vvfat_qcow;
 
 static int enable_write_target(BlockDriverState *bs, Error **errp)
 {
@@ -3268,6 +3264,8 @@ static BlockDriver bdrv_vvfat = {
 
 static void bdrv_vvfat_init(void)
 {
+    child_vvfat_qcow = child_of_bds;
+    child_vvfat_qcow.inherit_options = vvfat_qcow_options;
     bdrv_register(&bdrv_vvfat);
 }
 
-- 
2.30.2


