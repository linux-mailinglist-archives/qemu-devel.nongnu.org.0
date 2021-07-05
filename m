Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC23BBB27
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:22:21 +0200 (CEST)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Lk4-00038c-Eh
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LTF-0004nq-T6
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LTE-00022O-5G
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Z2948xhR33lh2dPamiqHvKd80y+jfnjQLdjcksrLuU=;
 b=Kg7D9F5n6Oczg526IaO/Y48iTzg19jhdxhLoVGSnQDO35lqhQTyooSz/E8Uyx7DaEpwfLP
 FezefqdvDcBY0TruI3teBKowStO5EGQ6twTtMjZloh0EhVejONdDuNyCCPQ/23oQx/yUvE
 n2VmZH+Y6ZAOboiIygd44wn8d3yn1ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-P5tIli_aP4-o2PAen0IZNQ-1; Mon, 05 Jul 2021 06:04:53 -0400
X-MC-Unique: P5tIli_aP4-o2PAen0IZNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C2401835AC5;
 Mon,  5 Jul 2021 10:04:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D078E60C0F;
 Mon,  5 Jul 2021 10:04:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 19/19] migration/rdma: Use error_report to suppress errno
 message
Date: Mon,  5 Jul 2021 11:02:35 +0100
Message-Id: <20210705100235.157093-20-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Since the prior calls are successful, in this case a errno doesn't
indicate a real error which would just make us confused.

before:
(qemu) migrate -d rdma:192.168.22.23:8888
source_resolve_host RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect: No space left on device

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210628071959.23455-1-lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index d90b29a4b5..b6cc4bef4a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1006,7 +1006,7 @@ route:
     if (cm_event->event != RDMA_CM_EVENT_ADDR_RESOLVED) {
         ERROR(errp, "result not equal to event_addr_resolved %s",
                 rdma_event_str(cm_event->event));
-        perror("rdma_resolve_addr");
+        error_report("rdma_resolve_addr");
         rdma_ack_cm_event(cm_event);
         ret = -EINVAL;
         goto err_resolve_get_addr;
@@ -2544,7 +2544,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
     }
 
     if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
-        perror("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
+        error_report("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
         ERROR(errp, "connecting to destination!");
         rdma_ack_cm_event(cm_event);
         goto err_rdma_source_connect;
-- 
2.31.1


