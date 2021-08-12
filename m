Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723803EA0E6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:46:07 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6Lm-00058P-Fo
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hv-0004rA-AE
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Ht-0004mp-T7
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7S+dVRLRYRgDvxuwxAh3DcEbKw8yOyiatCNle4QV3C8=;
 b=a5vuSgGqmmxbkUst6ZAlo+0ZYxIUchO1UT9To6LW/OacU3/sbYOc94Ix0oDx1unWfkQVLj
 eL6lVHcbR+q+mrfl+NndLA9l68quH7EG0wNmt4sn30ht4IMs3YKaFTzUug/dWbrAGs39Ev
 csuBrcCrLzjtYkjAjDKzURQOu745Pd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-Tx3BMwJvPKuNFymRm8Tj5w-1; Thu, 12 Aug 2021 04:42:04 -0400
X-MC-Unique: Tx3BMwJvPKuNFymRm8Tj5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11D1780124F;
 Thu, 12 Aug 2021 08:42:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5F25D740;
 Thu, 12 Aug 2021 08:42:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 6/6] block/iscsi: Do not force-cap *pnum
Date: Thu, 12 Aug 2021 10:41:48 +0200
Message-Id: <20210812084148.14458-7-hreitz@redhat.com>
In-Reply-To: <20210812084148.14458-1-hreitz@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_block_status() does it for us, we do not need to do it here.

The advantage of not capping *pnum is that bdrv_co_block_status() can
cache larger data regions than requested by its caller.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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


