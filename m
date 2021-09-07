Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C040250C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:23:54 +0200 (CEST)
Received: from localhost ([::1]:37842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWOX-0005KE-Ho
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFP-0004s4-7q
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFN-0005nm-5v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Q3OEfmaPDOcp6CCZdLDj/9GuQmW79EFAPMEgAKzZP0=;
 b=agVUaidRZqrnY2W7uVPRYZ9bgwUzIPawSrSsqxPYsvNi0o6Boq0TG4LWJ0eVzZ4hpcGKxj
 U7XnMbrTK5Dw5++QhLWGzSk4XfYV8oB04GiQNY/utYz3T0hOttLA/V7m2g7e+ANm2qj/KY
 gCmNzTjkkAwqHSJgIckXvP+PULy80yA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-lXO7294KO1CVUAxvpzPuFQ-1; Tue, 07 Sep 2021 04:14:22 -0400
X-MC-Unique: lXO7294KO1CVUAxvpzPuFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13C7F89BBA1;
 Tue,  7 Sep 2021 08:14:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A776D177F1;
 Tue,  7 Sep 2021 08:14:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/11] block/nvme: Have nvme_create_queue_pair() report errors
 consistently
Date: Tue,  7 Sep 2021 09:13:57 +0100
Message-Id: <20210907081403.816404-6-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

nvme_create_queue_pair() does not return a boolean value (indicating
eventual error) but a pointer, and is inconsistent in how it fills the
error handler. To fulfill callers expectations, always set an error
message on failure.

Reported-by: Auger Eric <eric.auger@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-6-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nvme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index e8dbbc2317..0786c501e4 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -220,6 +220,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
 
     q = g_try_new0(NVMeQueuePair, 1);
     if (!q) {
+        error_setg(errp, "Cannot allocate queue pair");
         return NULL;
     }
     trace_nvme_create_queue_pair(idx, q, size, aio_context,
@@ -228,6 +229,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
                           qemu_real_host_page_size);
     q->prp_list_pages = qemu_try_memalign(qemu_real_host_page_size, bytes);
     if (!q->prp_list_pages) {
+        error_setg(errp, "Cannot allocate PRP page list");
         goto fail;
     }
     memset(q->prp_list_pages, 0, bytes);
@@ -239,6 +241,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
                           false, &prp_list_iova);
     if (r) {
+        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
         goto fail;
     }
     q->free_req_head = -1;
-- 
2.31.1


