Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA9621723
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:46:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPqQ-0002Go-0d; Tue, 08 Nov 2022 09:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1osPqL-0002G8-2E
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1osPqJ-0001Fg-Mv
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667918686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u8iRl1AmMuQqwnkeziVl8ThyZpbpt56rIBC1zkD2vcA=;
 b=MBZbsB+EZxPqInRQpoac3mtGVT9dsZ36KNqoA5lns4g9pUCae8dt7KPusUmneick+Jwk2/
 LGpPN4z1vJf75uuYErw+6wZRT6lM0M9y335AEw6ZV2oBRLuD/pHzjx1sWYVxUpqTBVrw28
 v/AySIKpDK3pXt+GQMSPkHMO/TdPjlo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-D7E_QDQ_MPeeC9ZyjbU5BQ-1; Tue, 08 Nov 2022 09:44:43 -0500
X-MC-Unique: D7E_QDQ_MPeeC9ZyjbU5BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD22C2A2AD47;
 Tue,  8 Nov 2022 14:44:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7099E9E70;
 Tue,  8 Nov 2022 14:44:41 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH for-7.2] block/blkio: Set BlockDriver::has_variable_length to
 false
Date: Tue,  8 Nov 2022 14:44:33 +0000
Message-Id: <20221108144433.1334074-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

Setting it to true can cause the device size to be queried from libblkio
in otherwise fast paths, degrading performance. Set it to false and
require users to refresh the device size explicitly instead.

Fixes: 4c8f4fda0504 ("block/blkio: Tolerate device size changes")
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Alberto Faria <afaria@redhat.com>
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


