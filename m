Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC9380E4D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:38:15 +0200 (CEST)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhapJ-0007RV-P9
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajT-0000Go-Qe
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajI-0001BF-Kr
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xyBN6Avl+NY+5P953Zq9gdqlSKkLcfRSSJm2IzHNy4=;
 b=RvJve3WWG0LzOC2Wdu6W6vryNWyxqxCrMnyMQZiRvMhOkehnOn3SCsDSeJc5WnPxwb1S69
 FLqFPGprUAoJ3IH2q7e6QcvTfNFMJmzFpb9xrSx+Nue+ibIt2+xKFyB24DT2uvrNkmjOH6
 W5uf6n7J9Jsh+QL94Cm+QpwalxBTCGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-4cfhRFFjO92mxkZ9_lrDdw-1; Fri, 14 May 2021 12:31:57 -0400
X-MC-Unique: 4cfhRFFjO92mxkZ9_lrDdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AF8280ED8B;
 Fri, 14 May 2021 16:31:56 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 866E919D9B;
 Fri, 14 May 2021 16:31:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/14] qcow2: set bdi->is_dirty
Date: Fri, 14 May 2021 18:31:11 +0200
Message-Id: <20210514163124.251741-2-kwolf@redhat.com>
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
References: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Set bdi->is_dirty, so that qemu-img info could show dirty flag.

After this commit the following check will show '"dirty-flag": true':

./build/qemu-img create -f qcow2 -o lazy_refcounts=on x 1M
./build/qemu-io x
qemu-io> write 0 1M

 After "write" command success, kill the qemu-io process:

kill -9 <qemu-io pid>

./build/qemu-img info --output=json x

This will show '"dirty-flag": true' among other things. (before this
commit it shows '"dirty-flag": false')

Note, that qcow2's dirty-bit is not a "dirty bit for the image". It
only protects qcow2 lazy refcounts feature. So, there are a lot of
conditions when qcow2 session may be not closed correctly, but bit is
0. Still, when bit is set, the last session is definitely not finished
correctly and it's better to report it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210504160656.462836-1-vsementsov@virtuozzo.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 9727ae8fe3..39b91ef940 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5089,6 +5089,7 @@ static int qcow2_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     BDRVQcow2State *s = bs->opaque;
     bdi->cluster_size = s->cluster_size;
     bdi->vm_state_offset = qcow2_vm_state_offset(s);
+    bdi->is_dirty = s->incompatible_features & QCOW2_INCOMPAT_DIRTY;
     return 0;
 }
 
-- 
2.30.2


