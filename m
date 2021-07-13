Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246F3C7320
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:25:56 +0200 (CEST)
Received: from localhost ([::1]:55968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KIE-0004yS-VX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGM-0002Or-Ci
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGK-0001nS-TV
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYeaLDFCI+qBQWjEoAPvCNuevMUuWd8mkDHFtWClOn8=;
 b=OP7l12stm0E3NTYYlJEUq1rF5/pQsSZJjD/SGvRD84ahQmjq1J4fI1bYkbwWBNMu5ZjcVc
 2cjnPdXpipsCeNTeZ3YzxhvomXb07oeOTfoUm5x4+38B9Xwi5agPNe+Y0qHKP0U2We74/I
 pxRSrHgtVdOy0GQtuPZg4GZ+ywvy5mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-2Nhl2Y6xMB-RHG5JXaDpuw-1; Tue, 13 Jul 2021 11:23:52 -0400
X-MC-Unique: 2Nhl2Y6xMB-RHG5JXaDpuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B50A80414A;
 Tue, 13 Jul 2021 15:23:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD1FC5DF21;
 Tue, 13 Jul 2021 15:23:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 1/6] migration/rdma: prevent from double free the same mr
Date: Tue, 13 Jul 2021 16:23:19 +0100
Message-Id: <20210713152324.217255-2-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
References: <20210713152324.217255-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

backtrace:
'0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
478             void *addr              = mr->addr;
(gdb) bt
 #0  0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
 #1  0x0000555555891fcc in rdma_delete_block (block=<optimized out>, rdma=0x7fff38176010) at ../migration/rdma.c:691
 #2  qemu_rdma_cleanup (rdma=0x7fff38176010) at ../migration/rdma.c:2365
 #3  0x00005555558925b0 in qio_channel_rdma_close_rcu (rcu=0x555556b8b6c0) at ../migration/rdma.c:3073
 #4  0x0000555555d652a3 in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:281
 #5  0x0000555555d5edf9 in qemu_thread_start (args=0x7fffe88bb4d0) at ../util/qemu-thread-posix.c:541
 #6  0x00007ffff54c73f9 in start_thread () at /lib64/libpthread.so.0
 #7  0x00007ffff53f3b03 in clone () at /lib64/libc.so.6 '

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index 38a099f7ee..5c2d113aa9 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1143,6 +1143,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 
     for (i--; i >= 0; i--) {
         ibv_dereg_mr(local->block[i].mr);
+        local->block[i].mr = NULL;
         rdma->total_registrations--;
     }
 
-- 
2.31.1


