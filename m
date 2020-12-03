Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA72CDC51
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:26:21 +0100 (CET)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksN2-0000Vv-TL
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKH-0006gb-Dl
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKF-0003Rc-Kb
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WFvJcaC3EqpqiHgXJzqCNHaLxRITJyMEzdiPt+ayJw=;
 b=IzvIu4ArGtyglOryTFcC6fTx+Olj1cjHX/hoR3yTaAjJK6PN/vNcjCHvxM+gyAuZ9gihVn
 ZTrJh2EJwoHwE8aDm1w+lfabcGHU30h8Nw3ghM6360c7HIqUtxgHJ7QAzqrtDKI0YKe8Us
 mhu43zgcIHPtQi/BNNfdSP7H2l5lw98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-rK4mZqEtMymmVulttgb-7A-1; Thu, 03 Dec 2020 12:23:24 -0500
X-MC-Unique: rK4mZqEtMymmVulttgb-7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD3BBAFA82;
 Thu,  3 Dec 2020 17:23:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3B163BA7;
 Thu,  3 Dec 2020 17:23:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] block: Simplify qmp_block_resize() error paths
Date: Thu,  3 Dec 2020 18:23:09 +0100
Message-Id: <20201203172311.68232-2-kwolf@redhat.com>
In-Reply-To: <20201203172311.68232-1-kwolf@redhat.com>
References: <20201203172311.68232-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only thing that happens after the 'out:' label is blk_unref(blk).
However, blk = NULL in all of the error cases, so instead of jumping to
'out:', we can just return directly.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index fe6fb5dc1d..229d2cce1b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2468,17 +2468,17 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
 
     if (size < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 size");
-        goto out;
+        return;
     }
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
         error_setg(errp, QERR_DEVICE_IN_USE, device);
-        goto out;
+        return;
     }
 
     blk = blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
     if (!blk) {
-        goto out;
+        return;
     }
 
     bdrv_drained_begin(bs);
@@ -2487,7 +2487,6 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
     bdrv_co_leave(bs, old_ctx);
     bdrv_drained_end(bs);
 
-out:
     bdrv_co_lock(bs);
     blk_unref(blk);
     bdrv_co_unlock(bs);
-- 
2.28.0


