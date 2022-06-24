Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C6559DB8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:55:23 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4leU-0006w6-BT
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR3-00068h-18
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lQx-0000pW-MS
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CriZ0ti06dDP+qppflQjeyfKuVpeOf5E4VoqyKBJYc=;
 b=F/TSrRE8s5jvxb8UPRwDqAorfu5DUL4w22mbiM+OA/FMa9eNV2xvbRSRCU2rDdajAqhb8X
 nvl85J2cmcXzgGc1menjMEXB8QrytuB+7/Nea9TUTh2Dova60ZcwavOVa8tYjlikrbPkJt
 AqZRJRZCiZrZP1S6E4Sko84MTVn1EAc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-FKhNraOUOXexpU1YvEGwnw-1; Fri, 24 Jun 2022 11:41:20 -0400
X-MC-Unique: FKhNraOUOXexpU1YvEGwnw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1B5B1818801;
 Fri, 24 Jun 2022 15:41:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08F45492CA5;
 Fri, 24 Jun 2022 15:41:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 06/20] block: Support passing NULL ops to blk_set_dev_ops()
Date: Fri, 24 Jun 2022 17:40:49 +0200
Message-Id: <20220624154103.185902-7-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Xie Yongji <xieyongji@bytedance.com>

This supports passing NULL ops to blk_set_dev_ops()
so that we can remove stale ops in some cases.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220523084611.91-2-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d4abdf8faa..f425b00793 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1058,7 +1058,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_opaque = opaque;
 
     /* Are we currently quiesced? Should we enforce this right now? */
-    if (blk->quiesce_counter && ops->drained_begin) {
+    if (blk->quiesce_counter && ops && ops->drained_begin) {
         ops->drained_begin(opaque);
     }
 }
-- 
2.35.3


