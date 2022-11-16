Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274462BDA5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRc-0000lM-2S; Wed, 16 Nov 2022 07:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRR-0000gu-TK
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRJ-0000uZ-Na
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tTnM1xa2SDFzEvr4q6j3hZn+n0IfuXdYw6QCt9sgjc=;
 b=LGIkPRrSOOLRFfTu4Ko3wHEW0DPHqVwJALi3wE9ev9y7hMGBtb2DMC8oTDwrBOv610tUtS
 hHeOF38Yxro0otXWCABU3h9hCDunxNOpzH/SYyAAvKQWvt6bWjNRUV4MyTa+Yz6i+/OM1d
 sSp9Qo9cyp5DlBfbQSeMUGuumplO7k4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-4sfOFVZ_N36gVxRdEaMluw-1; Wed, 16 Nov 2022 07:22:45 -0500
X-MC-Unique: 4sfOFVZ_N36gVxRdEaMluw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 511AC38173CB;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1520D17595;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 05/11] block-coroutine-wrapper.py: default to main loop
 aiocontext if function does not have a BlockDriverState parameter
Date: Wed, 16 Nov 2022 07:22:35 -0500
Message-Id: <20221116122241.2856527-6-eesposit@redhat.com>
In-Reply-To: <20221116122241.2856527-1-eesposit@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
index f88ef53964..0f842386d4 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -152,8 +152,6 @@ def create_coroutine_only(func: FuncDecl) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
-                                 'BlockBackend *']
 
     subsystem, subname = func.name.split('_', 1)
 
@@ -165,8 +163,10 @@ def gen_wrapper(func: FuncDecl) -> str:
         bs = 'bs'
     elif t == 'BdrvChild *':
         bs = 'child->bs'
-    else:
+    elif t == 'BlockBackend *':
         bs = 'blk_bs(blk)'
+    else:
+        bs = 'NULL'
     func.bs = bs
     func.struct_name = snake_to_camel(func.name)
     struct_name = func.struct_name
-- 
2.31.1


