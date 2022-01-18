Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE0492BE3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:07:32 +0100 (CET)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rxD-0007ul-KS
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUt-0006Pd-MU
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUo-000614-Qd
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57igYvlsN0D5JR36F1J5QcRbp3wZctA3qP6mPCCwrn8=;
 b=i0jd7eR3Dak2p/73LH3Mh5QFYh34G7+uvLpKYJrmjlfsIsAPsdRa7q3zYoGb99DMDzs76F
 sdnh64D08cBbusRf4kLfBYIKNhMXqnPngYb3GLbjfhA8fvLqBvj6QTdU9Axq98KkYJ3WW2
 r1ZOSl6PumXwm7wpr0Ov6Q9kGgpj9Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-g3buZYuNP-i67QEuNKxS5A-1; Tue, 18 Jan 2022 11:37:59 -0500
X-MC-Unique: g3buZYuNP-i67QEuNKxS5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5426214453B;
 Tue, 18 Jan 2022 16:28:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D237348F8;
 Tue, 18 Jan 2022 16:28:29 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 12/12] block.c: additional assert qemu in main tread
Date: Tue, 18 Jan 2022 11:27:38 -0500
Message-Id: <20220118162738.1366281-13-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some missing assertion in static functions of block.c

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c               | 2 ++
 block/block-backend.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/block.c b/block.c
index 6196c95aae..7961f5a984 100644
--- a/block.c
+++ b/block.c
@@ -5227,6 +5227,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
     BdrvChild *c, *next;
 
     assert(to != NULL);
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
@@ -6767,6 +6768,7 @@ void bdrv_invalidate_cache_all(Error **errp)
 static bool bdrv_has_bds_parent(BlockDriverState *bs, bool only_active)
 {
     BdrvChild *parent;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(parent, &bs->parents, next_parent) {
         if (parent->klass->parent_is_bds) {
diff --git a/block/block-backend.c b/block/block-backend.c
index 9229ff7ca7..048ba83f37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -754,6 +754,9 @@ BlockDriverState *blk_bs(BlockBackend *blk)
 static BlockBackend *bdrv_first_blk(BlockDriverState *bs)
 {
     BdrvChild *child;
+
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(child, &bs->parents, next_parent) {
         if (child->klass == &child_root) {
             return child->opaque;
-- 
2.31.1


