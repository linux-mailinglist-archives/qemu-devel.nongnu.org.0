Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C46F09F0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:36:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4aA-00059G-P0; Thu, 27 Apr 2023 12:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4a8-00058i-FT
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:34:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4a7-0006Uu-3s
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v2Kno7+lfPhDpIP/vNNRfOpXUJb0fVL1X2a1vewvbM=;
 b=Mf/RFBkZG61u/roVU1RRyhmsBdcyy86ixKdxmBxMqfXI+r8NvQjUQBMEunYJmphYHJBKx8
 /UWE4Y9+HxfDWMQOtDhxNmsW0yN3qZ0+S++dbzrHwW72hmizVpIjmHzn5HPU5zZEQxjKkZ
 EpTgofSGOXe9Opngv563c2stEBtPHKo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-iZscrFoOPvOo6OJqvHoyOQ-1; Thu, 27 Apr 2023 12:34:52 -0400
X-MC-Unique: iZscrFoOPvOo6OJqvHoyOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 332AB3C1023D
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:34:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68BED10DF8;
 Thu, 27 Apr 2023 16:34:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 01/19] multifd: We already account for this packet on the
 multifd thread
Date: Thu, 27 Apr 2023 18:34:31 +0200
Message-Id: <20230427163449.27473-2-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 6a59c03dd2..6053012ad9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -626,10 +626,7 @@ int multifd_send_sync_main(QEMUFile *f)
         p->packet_num = multifd_send_state->packet_num++;
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
-        qemu_file_acct_rate_limit(f, p->packet_len);
         qemu_mutex_unlock(&p->mutex);
-        stat64_add(&ram_counters.transferred, p->packet_len);
-        stat64_add(&ram_counters.multifd_bytes, p->packet_len);
         qemu_sem_post(&p->sem);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
2.40.0


