Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8965468035
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:18:49 +0100 (CET)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHpI-0001hF-Nz
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmg-0007HM-Fs
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmc-00034D-TL
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjYgrIAEtIty4X+aptzEXKj4wdU3TPHUuNxJCtjWAdU=;
 b=M2oL+2db6MCJBMyeko1oe64MGPJfHGlLw7eWmwdU30/qVC2I5qjCPXpLPTmPs7tizw2rIp
 a1javQVngMBAyy3oKm+0dPqwnxmbcZV2RU72Uf6O96wvIhBJ8LIRKusPmCHYMK8hss6Ko6
 IaKMP6TFWdctUZtRtu/LUEcQaQKea8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-ImXpeQSlP8yuRF2XULVQ-Q-1; Fri, 03 Dec 2021 18:15:59 -0500
X-MC-Unique: ImXpeQSlP8yuRF2XULVQ-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F8F801B01;
 Fri,  3 Dec 2021 23:15:58 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 061D95D9D5;
 Fri,  3 Dec 2021 23:15:56 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/14] qemu-io: Utilize 64-bit status during map
Date: Fri,  3 Dec 2021 17:15:27 -0600
Message-Id: <20211203231539.3900865-3-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, nbd@other.debian.org, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The block layer has supported 64-bit block status from drivers since
commit 86a3d5c688 ("block: Add .bdrv_co_block_status() callback",
v2.12) and friends, with individual driver callbacks responsible for
capping things where necessary.  Artificially capping things below 2G
in the qemu-io 'map' command, added in commit d6a644bbfe ("block: Make
bdrv_is_allocated() byte-based", v2.10) is thus no longer necessary.

One way to test this is with qemu-nbd as server on a raw file larger
than 4G (the entire file should show as allocated), plus 'qemu-io -f
raw -c map nbd://localhost --trace=nbd_\*' as client.  Prior to this
patch, the NBD_CMD_BLOCK_STATUS requests are fragmented at 0x7ffffe00
distances; with this patch, the fragmenting changes to 0x7fffffff
(since the NBD protocol is currently still limited to 32-bit
transactions - see block/nbd.c:nbd_client_co_block_status).  Then in
later patches, once I add an NBD extension for a 64-bit block status,
the same map command completes with just one NBD_CMD_BLOCK_STATUS.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-io-cmds.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 46593d632d8f..954955c12fb9 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1993,11 +1993,9 @@ static int map_is_allocated(BlockDriverState *bs, int64_t offset,
                             int64_t bytes, int64_t *pnum)
 {
     int64_t num;
-    int num_checked;
     int ret, firstret;

-    num_checked = MIN(bytes, BDRV_REQUEST_MAX_BYTES);
-    ret = bdrv_is_allocated(bs, offset, num_checked, &num);
+    ret = bdrv_is_allocated(bs, offset, bytes, &num);
     if (ret < 0) {
         return ret;
     }
@@ -2009,8 +2007,7 @@ static int map_is_allocated(BlockDriverState *bs, int64_t offset,
         offset += num;
         bytes -= num;

-        num_checked = MIN(bytes, BDRV_REQUEST_MAX_BYTES);
-        ret = bdrv_is_allocated(bs, offset, num_checked, &num);
+        ret = bdrv_is_allocated(bs, offset, bytes, &num);
         if (ret == firstret && num) {
             *pnum += num;
         } else {
-- 
2.33.1


