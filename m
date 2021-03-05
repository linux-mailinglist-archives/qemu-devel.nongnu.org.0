Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733132F111
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:24:54 +0100 (CET)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEC5-0007do-AY
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkX-0007Ob-Tw
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007DW-As
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwpQ4G9rUCVn5Vuq90w3hYXqwNDwbwuvrLwMSwG27LY=;
 b=fpBRJS3EOS9luYFLS+QU+DKnwEt0x9HTVTc0DUd0kNJxd+BWIVOx7+L6cSf+nutcAlpBsS
 2y0yjVdd5ap5JmJS5sQoCtXjo7yv+ZpGdRTn7d6cuextS3B62jMtu7+Dausg8zRZXSeHAd
 vO2GQP4c9dQXXfixqW44MTs860W9Acg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-ESm5hrgaN_eXjfyaoRrBtw-1; Fri, 05 Mar 2021 11:55:55 -0500
X-MC-Unique: ESm5hrgaN_eXjfyaoRrBtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 591471009C55;
 Fri,  5 Mar 2021 16:55:32 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C25360C43;
 Fri,  5 Mar 2021 16:55:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/31] block/export: fix blk_size double byteswap
Date: Fri,  5 Mar 2021 17:54:41 +0100
Message-Id: <20210305165454.356840-19-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Stefan Hajnoczi <stefanha@redhat.com>

The config->blk_size field is little-endian. Use the native-endian
blk_size variable to avoid double byteswapping.

Fixes: 11f60f7eaee2630dd6fa0c3a8c49f792e46c4cf1 ("block/export: make vhost-user-blk config space little-endian")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210223144653.811468-8-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index ab2c4d44c4..7aea132f69 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -356,7 +356,7 @@ vu_blk_initialize_config(BlockDriverState *bs,
     config->num_queues = cpu_to_le16(num_queues);
     config->max_discard_sectors = cpu_to_le32(32768);
     config->max_discard_seg = cpu_to_le32(1);
-    config->discard_sector_alignment = cpu_to_le32(config->blk_size >> 9);
+    config->discard_sector_alignment = cpu_to_le32(blk_size >> 9);
     config->max_write_zeroes_sectors = cpu_to_le32(32768);
     config->max_write_zeroes_seg = cpu_to_le32(1);
 }
-- 
2.29.2


