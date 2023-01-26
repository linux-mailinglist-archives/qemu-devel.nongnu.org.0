Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491DB67D31D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL604-00069w-SR; Thu, 26 Jan 2023 12:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zr-0005jZ-Rg
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zq-0006Zx-DC
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674753909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhEybkrbUgQ5HiBZ7r8DUZDuVdgjg3n60Pfh0j6VRA4=;
 b=BzOns6ko0KTgFB93LW3MLuN0Sxegrm4609OCJcYGMesO431oREweXQTj+9RAxe9NXl76PM
 qWKnEy7+h6+jMwEDayHV0kmrWVuDXLoe5gI2WsJuT6MtwY+L65SKtMPm6vX59f6i4aZF51
 qWBpFQjuUzWLrGD7nPmX76RKdh3dfBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-v0m7S5eOO2-GEkN02eNi_g-1; Thu, 26 Jan 2023 12:25:05 -0500
X-MC-Unique: v0m7S5eOO2-GEkN02eNi_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EACC183B3CF;
 Thu, 26 Jan 2023 17:25:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47FA0492C14;
 Thu, 26 Jan 2023 17:25:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 13/13] block: Assert non-coroutine context for
 bdrv_open_inherit()
Date: Thu, 26 Jan 2023 18:24:32 +0100
Message-Id: <20230126172432.436111-14-kwolf@redhat.com>
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
References: <20230126172432.436111-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 6eac16eac5..122aa9a9ac 100644
--- a/block.c
+++ b/block.c
@@ -3807,13 +3807,11 @@ out:
  * function eventually calls bdrv_refresh_total_sectors() which polls
  * when called from non-coroutine context.
  */
-static BlockDriverState *bdrv_open_inherit(const char *filename,
-                                           const char *reference,
-                                           QDict *options, int flags,
-                                           BlockDriverState *parent,
-                                           const BdrvChildClass *child_class,
-                                           BdrvChildRole child_role,
-                                           Error **errp)
+static BlockDriverState * no_coroutine_fn
+bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
+                  int flags, BlockDriverState *parent,
+                  const BdrvChildClass *child_class, BdrvChildRole child_role,
+                  Error **errp)
 {
     int ret;
     BlockBackend *file = NULL;
@@ -3829,6 +3827,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     assert(!child_class || !flags);
     assert(!child_class == !parent);
     GLOBAL_STATE_CODE();
+    assert(!qemu_in_coroutine());
 
     if (reference) {
         bool options_non_empty = options ? qdict_size(options) : false;
-- 
2.38.1


