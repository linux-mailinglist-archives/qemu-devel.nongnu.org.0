Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59637AAB2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:28:25 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUJ6-0000Mq-TT
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1g-0000Dh-0B
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1e-0004rV-7M
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6AzTdnRYxTl7m0CkaAnuyH7/tpU16ehHQFiuHVFeEI=;
 b=haSbWwW6TjlL04Kbrqqy7yrTwu8mzwix9RAZUMI4PvW54mrREfra9d2YDPJM2LuDowi9RV
 wnwa8MYq0YR/Tyd+zzzwvc1FTp1aNwqaZfCD4SOBvYRvxsbfT5s75LyvUk5Xclskq+/C0G
 zsJ3sDQKVezTWv2nrYA1Yv4+XPDj5Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-Yz_QyFlRPAmZoOqeCxuzWg-1; Tue, 11 May 2021 11:09:42 -0400
X-MC-Unique: Yz_QyFlRPAmZoOqeCxuzWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7316F1854E31;
 Tue, 11 May 2021 15:09:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFB44614EB;
 Tue, 11 May 2021 15:09:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 09/17] exec: Relax range check in ram_block_discard_range()
Date: Tue, 11 May 2021 16:08:34 +0100
Message-Id: <20210511150842.207155-10-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We want to make use of ram_block_discard_range() in the RAM block resize
callback when growing a RAM block, *before* used_length is changed.
Let's relax the check. As RAM blocks always mmap the whole max_length area,
we cannot corrupt unrelated data.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-6-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 softmmu/physmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 813a3efe8e..e1da81ed2f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3500,7 +3500,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
         goto err;
     }
 
-    if ((start + length) <= rb->used_length) {
+    if ((start + length) <= rb->max_length) {
         bool need_madvise, need_fallocate;
         if (!QEMU_IS_ALIGNED(length, rb->page_size)) {
             error_report("ram_block_discard_range: Unaligned length: %zx",
@@ -3567,7 +3567,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
     } else {
         error_report("ram_block_discard_range: Overrun block '%s' (%" PRIu64
                      "/%zx/" RAM_ADDR_FMT")",
-                     rb->idstr, start, length, rb->used_length);
+                     rb->idstr, start, length, rb->max_length);
     }
 
 err:
-- 
2.31.1


