Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2F6A6C7D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLlK-0006pH-3y; Wed, 01 Mar 2023 07:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXLl5-0006YR-TJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXLl3-0001f3-5Y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677674432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8HM82YRe65i0/IdsxyNvO12YD46DrXHtGvb46IfihI=;
 b=BOP2u/QnlXE/4Pv3zLwa8sbatlOayp1+Iyuy07GRDgXMrmGLUYpnGuI+Ugswg+il33n6tk
 jy33qXzgYer31khFwN9HUcIT+QUeGZvv2rkhhRjX56h5vlnPHPZACyt07RzcLI63Ima8LB
 i2z8yuhrKUb4Zn7+uuLo9eQu//IORFE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-Jj25SScZMSOKCtBP2ZWfAA-1; Wed, 01 Mar 2023 07:40:31 -0500
X-MC-Unique: Jj25SScZMSOKCtBP2ZWfAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A90261C07586
 for <qemu-devel@nongnu.org>; Wed,  1 Mar 2023 12:40:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20AA640CF8EC;
 Wed,  1 Mar 2023 12:40:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 2/3] migration: Update atomic stats out of the mutex
Date: Wed,  1 Mar 2023 13:40:25 +0100
Message-Id: <20230301124026.2930-3-quintela@redhat.com>
In-Reply-To: <20230301124026.2930-1-quintela@redhat.com>
References: <20230301124026.2930-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 migration/multifd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 7cb2326d03..f558169e37 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -433,8 +433,8 @@ static int multifd_send_pages(QEMUFile *f)
     transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
+    qemu_mutex_unlock(&p->mutex);
     stat64_add(&ram_counters.transferred, transferred);
-    qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
     return 1;
@@ -628,8 +628,8 @@ int multifd_send_sync_main(QEMUFile *f)
         p->pending_job++;
         qemu_file_acct_rate_limit(f, p->packet_len);
         ram_counters.multifd_bytes += p->packet_len;
+        qemu_mutex_unlock(&p->mutex);
         stat64_add(&ram_counters.transferred, p->packet_len);
-        qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
2.39.2


