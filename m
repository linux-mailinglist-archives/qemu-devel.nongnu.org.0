Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B542FD5B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:21:24 +0200 (CEST)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUdn-0008Je-JV
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTP-0007dd-DA
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTE-0000gX-NX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVL0+2JXPisVP7jDiei2L/EYA1tutFeMhwM2X6UhX6s=;
 b=PGlLvi3mVPBxR8tfaI6ga2GXDUngLKZkjr+MA5iJLP+06pVatCndrCI2itQB6KZ9fxK+Ct
 2p/n2PuZtLAbPzprNEKhLJU0rnHrb8ighWoOkeMomSqNpki/tMXcLMQy1OIMfwE3ItMCY+
 4RKtI2ZftocR3bGtg55y2iwYiKFzPzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-2_TMAUdMPOGPSVVpITzN4A-1; Fri, 15 Oct 2021 17:10:20 -0400
X-MC-Unique: 2_TMAUdMPOGPSVVpITzN4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 838C918125C0;
 Fri, 15 Oct 2021 21:10:19 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBE0419739;
 Fri, 15 Oct 2021 21:10:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] block-coroutine-wrapper.py: support BlockBackend first
 argument
Date: Fri, 15 Oct 2021 16:10:02 -0500
Message-Id: <20211015211011.1272011-8-eblake@redhat.com>
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
References: <20211015211011.1272011-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-7-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 12 ++++++++++--
 block/coroutines.h                 |  3 +++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 85dbeb9ecf9c..08be813407b6 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -100,12 +100,20 @@ def snake_to_camel(func_name: str) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
+    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
+                                 'BlockBackend *']

     subsystem, subname = func.name.split('_', 1)

     name = f'{subsystem}_co_{subname}'
-    bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
+
+    t = func.args[0].type
+    if t == 'BlockDriverState *':
+        bs = 'bs'
+    elif t == 'BdrvChild *':
+        bs = 'child->bs'
+    else:
+        bs = 'blk_bs(blk)'
     struct_name = snake_to_camel(name)

     return f"""\
diff --git a/block/coroutines.h b/block/coroutines.h
index 514d169d23d6..35a6c4985782 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -27,6 +27,9 @@

 #include "block/block_int.h"

+/* For blk_bs() in generated block/block-gen.c */
+#include "sysemu/block-backend.h"
+
 int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix);
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
-- 
2.31.1


