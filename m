Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6BE625E59
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVwr-00086y-1L; Fri, 11 Nov 2022 10:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwo-00085e-8l
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:28:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwm-0000yx-Tt
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668180480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlEcDUS0WtTGCZHMO5KFfRfilwI3+UUzqQZ4dp9KJRQ=;
 b=Rh9zSwsLb/YUkObRygRhdjVDs9tq79uoVRBZKoJxNwoi70P+ZKKtCtBjgK2u759WeLIjX8
 LkcPZ7pl4giKwlHhKZAmVaZx/LTq7/1U9XWAFGgyteCzdlF+OyCl1Pts5hfCfv/uxQ6NJr
 ttSerCaM0L4u9+/6Zy0qk7SW7wOP9NE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-bAJbUYnQM16J9m-gz8FdXw-1; Fri, 11 Nov 2022 10:27:59 -0500
X-MC-Unique: bAJbUYnQM16J9m-gz8FdXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3F43806001;
 Fri, 11 Nov 2022 15:27:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B287CC15BA8;
 Fri, 11 Nov 2022 15:27:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 07/11] block/blkio: Set BlockDriver::has_variable_length to
 false
Date: Fri, 11 Nov 2022 16:27:40 +0100
Message-Id: <20221111152744.261358-8-kwolf@redhat.com>
In-Reply-To: <20221111152744.261358-1-kwolf@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Alberto Faria <afaria@redhat.com>

Setting it to true can cause the device size to be queried from libblkio
in otherwise fast paths, degrading performance. Set it to false and
require users to refresh the device size explicitly instead.

Fixes: 4c8f4fda0504 ("block/blkio: Tolerate device size changes")
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Alberto Faria <afaria@redhat.com>
Message-Id: <20221108144433.1334074-1-afaria@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/blkio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/blkio.c b/block/blkio.c
index 620fab28a7..5eae3adfaf 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -993,7 +993,6 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
     { \
         .format_name             = name, \
         .protocol_name           = name, \
-        .has_variable_length     = true, \
         .instance_size           = sizeof(BDRVBlkioState), \
         .bdrv_file_open          = blkio_file_open, \
         .bdrv_close              = blkio_close, \
-- 
2.38.1


