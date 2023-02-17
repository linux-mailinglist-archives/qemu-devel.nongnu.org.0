Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1C69AF35
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:13:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Na-0004v4-OX; Fri, 17 Feb 2023 10:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NU-0004oG-6C
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NS-0007UA-Bl
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+aH8MqCnIwQb+uElbI661uPgyK+H/ifuEKRrNLttPg=;
 b=EFTC/TfhalOYBLcreo7QNyWjC6NHLHjBTToiNVewFHxwSdr8hm3zTogs46E/KJyzHfQjxH
 +cDsVyh/0HSDYIRgHW3BQSS9fQJVv3qOB/DxwU7+YAAPK/ZsjwO6lq/J4cfbOD6/qKWj2Y
 5C8RDSSp3KgC+YSb6jh543Kx7gAFXag=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-psl-4xQxOveDiHCDP44BEA-1; Fri, 17 Feb 2023 10:10:18 -0500
X-MC-Unique: psl-4xQxOveDiHCDP44BEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0EF22807D6E;
 Fri, 17 Feb 2023 15:10:17 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10853492C14;
 Fri, 17 Feb 2023 15:10:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 17/22] block: Assert non-coroutine context for
 bdrv_open_inherit()
Date: Fri, 17 Feb 2023 16:09:49 +0100
Message-Id: <20230217150954.283920-17-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20230126172432.436111-14-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
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
2.39.2


