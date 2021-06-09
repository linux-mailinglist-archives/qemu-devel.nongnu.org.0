Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2333A17D5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:49:03 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzVu-0001hX-Te
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSW-0002Nk-0q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSU-0005Cg-GS
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coLvn8Gbts70VrCUBaKn8Pa+hvQ3LAyQfn51EoDvrq0=;
 b=HoaArIrLorAqf7VNNcHh4/fI4wph3My42DMkf2LZ/7StMlOezXM76VyqW42eO8R6jnO70N
 tVzt0lYKjJJm+Dsnqq2A9rxrpSCJK0dY6qfcJWni10+6XWcUOuK5bquK/NgK6lsNr8fnTt
 ICVQSC5Vvm/uzvNaRQdqjMCBQ6zSGxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-uetAHbjaO7akrH7ztaXp2w-1; Wed, 09 Jun 2021 10:45:26 -0400
X-MC-Unique: uetAHbjaO7akrH7ztaXp2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34A9E1934108;
 Wed,  9 Jun 2021 14:45:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D994610023B5;
 Wed,  9 Jun 2021 14:45:23 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 2/9] migration/rdma: Fix cm event use after free
Date: Wed,  9 Jun 2021 15:45:05 +0100
Message-Id: <20210609144512.211746-3-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210602023506.3821293-1-lizhijian@cn.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 1cdb4561f3..d90b29a4b5 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1539,16 +1539,20 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
 
                 if (pfds[1].revents) {
                     ret = rdma_get_cm_event(rdma->channel, &cm_event);
-                    if (!ret) {
-                        rdma_ack_cm_event(cm_event);
+                    if (ret) {
+                        error_report("failed to get cm event while wait "
+                                     "completion channel");
+                        return -EPIPE;
                     }
 
                     error_report("receive cm event while wait comp channel,"
                                  "cm event is %d", cm_event->event);
                     if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
                         cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
+                        rdma_ack_cm_event(cm_event);
                         return -EPIPE;
                     }
+                    rdma_ack_cm_event(cm_event);
                 }
                 break;
 
@@ -3285,7 +3289,6 @@ static void rdma_cm_poll_handler(void *opaque)
         error_report("get_cm_event failed %d", errno);
         return;
     }
-    rdma_ack_cm_event(cm_event);
 
     if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
         cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
@@ -3298,12 +3301,14 @@ static void rdma_cm_poll_handler(void *opaque)
                 rdma->return_path->error_state = -EPIPE;
             }
         }
+        rdma_ack_cm_event(cm_event);
 
         if (mis->migration_incoming_co) {
             qemu_coroutine_enter(mis->migration_incoming_co);
         }
         return;
     }
+    rdma_ack_cm_event(cm_event);
 }
 
 static int qemu_rdma_accept(RDMAContext *rdma)
-- 
2.31.1


