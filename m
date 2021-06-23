Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9C3B1D29
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:07:05 +0200 (CEST)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4T2-0004ge-Tv
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4OC-0004sq-AP
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4OA-0004pd-Lj
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLlgEwGs3wFc2fWw/ZUQ2Xt60BMDTlCGNENWiWHUo2Q=;
 b=LpOeuwISb/o441WHkZ+yBiWPxr3WgsB5X7pREzAIFFJy39JUME4AdjYakcLFg7S5TT2bTx
 mVPtIOFT960Zmvcfhuj5sZcuAuammuJ/4UlPqhsvS/BCFkV9SZI6OV7beroE8VO4duSMsv
 cENbtntJNbqC8aTI2EvcKtfBvQ66a2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-_sMG7D_uPWStOIRREW1w8Q-1; Wed, 23 Jun 2021 11:01:59 -0400
X-MC-Unique: _sMG7D_uPWStOIRREW1w8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0152B804B83;
 Wed, 23 Jun 2021 15:01:59 +0000 (UTC)
Received: from localhost (ovpn-113-73.ams2.redhat.com [10.36.113.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9873C6090F;
 Wed, 23 Jun 2021 15:01:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 6/6] block/iscsi: Do not force-cap *pnum
Date: Wed, 23 Jun 2021 17:01:43 +0200
Message-Id: <20210623150143.188184-7-mreitz@redhat.com>
In-Reply-To: <20210623150143.188184-1-mreitz@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_block_status() does it for us, we do not need to do it here.

The advantage of not capping *pnum is that bdrv_co_block_status() can
cache larger data regions than requested by its caller.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/iscsi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 4d2a416ce7..852384086b 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -781,9 +781,6 @@ retry:
         iscsi_allocmap_set_allocated(iscsilun, offset, *pnum);
     }
 
-    if (*pnum > bytes) {
-        *pnum = bytes;
-    }
 out_unlock:
     qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
-- 
2.31.1


