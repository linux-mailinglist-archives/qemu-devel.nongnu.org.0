Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C69635C25
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9M-0002iu-Ow; Wed, 23 Nov 2022 06:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9J-0002f8-Vl
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9G-00062I-In
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xkqz3LcAkKkyethGxeDJ0SmaysIFnoHKusFIVKrkQvA=;
 b=S+QNO+Jszg4JCTORTKfEueX1gCRNXlLtBh+L7JoDiV8LA4mK9VI4FiGKTQv3d7LIlWfU/B
 rVEc4Pnmqymd551TnNZwzQfAabSGMaqAdniM+bAp/1eDYsJo2a0q/XMZpqzeEtPxMzwwPF
 vTfsDkrf1lyMx9bSYcdQ2bHwuw2V/X4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-j-i7NZEuMReKZhqDSSbbaQ-1; Wed, 23 Nov 2022 06:42:35 -0500
X-MC-Unique: j-i7NZEuMReKZhqDSSbbaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6569D800B23;
 Wed, 23 Nov 2022 11:42:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E48AC2C8C5;
 Wed, 23 Nov 2022 11:42:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 11/15] block-coroutine-wrapper.py: default to main loop
 aiocontext if function does not have a BlockDriverState parameter
Date: Wed, 23 Nov 2022 06:42:23 -0500
Message-Id: <20221123114227.85757-12-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Basically BdrvPollCo->bs is only used by bdrv_poll_co(), and the
functions that it uses are both using bdrv_get_aio_context, that
defaults to qemu_get_aio_context() if bs is NULL.

Therefore pass NULL to BdrvPollCo to automatically generate a function
that create and runs a coroutine in the main loop.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 2fa3d01898..7e8f2da84b 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -81,8 +81,10 @@ def __init__(self, return_type: str, name: str, args: str,
             bs = 'bs'
         elif t == 'BdrvChild *':
             bs = 'child->bs'
-        else:
+        elif t == 'BlockBackend *':
             bs = 'blk_bs(blk)'
+        else:
+            bs = 'NULL'
         self.bs = bs
 
     def gen_list(self, format: str) -> str:
@@ -165,8 +167,6 @@ def create_coroutine_only(func: FuncDecl) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
-                                 'BlockBackend *']
 
     name = func.co_name
     struct_name = func.struct_name
-- 
2.31.1


