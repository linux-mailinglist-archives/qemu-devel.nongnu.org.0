Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152765E7B7A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:11:41 +0200 (CEST)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiSx-0004KE-Vj
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBx-00040M-Jn
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBu-0004JC-7b
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663937640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nEvWeYCznZKcS4hfRAFfcpNRzaqHk/p4F0V2zWBYds=;
 b=WpsFv+6XDOyyyA54HyA7JhOxtz6yORNyiwVxNDE53neD78xMjJkWJlB3NYrWhh5IZIfl5t
 YLSv3XRHp1ZgL/qyTslQtP7dc/8IdImWWhZIuDSENSRRlyoB0gYS8sCLumUlIweFPwKC9L
 5TKiesy1fw19sdFeDJI9hOyKzg17N74=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-QxhdHYQ9ONKu1xn_A13R9g-1; Fri, 23 Sep 2022 08:52:31 -0400
X-MC-Unique: QxhdHYQ9ONKu1xn_A13R9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D434D1C13951;
 Fri, 23 Sep 2022 12:52:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 790EE1402BDB;
 Fri, 23 Sep 2022 12:52:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/3] block: bdrv_child_get_parent_aio_context is not GS
Date: Fri, 23 Sep 2022 14:52:25 +0200
Message-Id: <20220923125227.300202-2-hreitz@redhat.com>
In-Reply-To: <20220923125227.300202-1-hreitz@redhat.com>
References: <20220923125227.300202-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All implementations of bdrv_child_get_parent_aio_context() are IO_CODE
(or do not mark anything in the case of block jobs), so this too can be
IO_CODE.  By the definition of "I/O API functions" in block-io.h, this
is a strict relaxation, as I/O code can be run from both GS and I/O code
arbitrarily.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index bc85f46eed..7f2a9d4df0 100644
--- a/block.c
+++ b/block.c
@@ -1499,7 +1499,7 @@ const BdrvChildClass child_of_bds = {
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 {
-    GLOBAL_STATE_CODE();
+    IO_CODE();
     return c->klass->get_parent_aio_context(c);
 }
 
-- 
2.36.1


