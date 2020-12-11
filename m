Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C72D7D4D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:52:33 +0100 (CET)
Received: from localhost ([::1]:59164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmal-0005Tu-G1
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlvR-0004by-FF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluh-0002Ke-Rh
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggTN6lCQbe/i02k8oEth+jaxoBl+MComYxqCc7uAS60=;
 b=aF5HpSeT/VAAeWuteClGStvSkJs+3j2eFz+XMn8723BZy3LlAbKWsnXULDWtDtMYwppv2B
 M7enL+m1Cc1yGLOid13N4O8IsUkC5XHIfpm3EJI/bSgfC9edn45WqM2JmhvtIAgvRYCuUi
 Wap2j8KrFsL4NlvcQDckTPQ7n6vhlco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-FmurCA-DNMWBEGJdPJiK5A-1; Fri, 11 Dec 2020 12:08:59 -0500
X-MC-Unique: FmurCA-DNMWBEGJdPJiK5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 613C9107ACE3;
 Fri, 11 Dec 2020 17:08:57 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ECE05D6A8;
 Fri, 11 Dec 2020 17:08:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/34] block/io: bdrv_refresh_limits(): use ERRP_GUARD
Date: Fri, 11 Dec 2020 18:08:07 +0100
Message-Id: <20201211170812.228643-30-kwolf@redhat.com>
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This simplifies following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201203222713.13507-3-vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index ec5e152bb7..3e91074c9f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -135,10 +135,10 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 
 void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
 {
+    ERRP_GUARD();
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     bool have_limits;
-    Error *local_err = NULL;
 
     memset(&bs->bl, 0, sizeof(bs->bl));
 
@@ -156,9 +156,8 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
     QLIST_FOREACH(c, &bs->children, next) {
         if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
         {
-            bdrv_refresh_limits(c->bs, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            bdrv_refresh_limits(c->bs, errp);
+            if (*errp) {
                 return;
             }
             bdrv_merge_limits(&bs->bl, &c->bs->bl);
-- 
2.29.2


