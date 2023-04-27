Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE76F0832
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:25:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3UL-0002S3-4p; Thu, 27 Apr 2023 11:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3UI-0002RO-06
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3UD-0000Wd-FH
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQpgk7lNqT3xVM6FKBaQC1Fxp7Zpv/+jZrQHV2ROIbc=;
 b=Ksin7jvi2Z05RKqzaWRMQub/E6qx6xM3Ytg1MxHKAWkFtNbToM/ljLxmOpNUh9g1nhvHMQ
 2n+l28QjiOUdG+hAhtIiSD8oWFQ01R7a9KufbZZ1RD4uSQZgTh50BnREv05aDA2qLaUgs/
 geTs1MDtW9YSydUt6UTz+po4VLyRrpo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-8sK5Gs-AMnm3E2Y3QNShFQ-1; Thu, 27 Apr 2023 11:24:30 -0400
X-MC-Unique: 8sK5Gs-AMnm3E2Y3QNShFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F88A88FBC3;
 Thu, 27 Apr 2023 15:22:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3AC40C2064;
 Thu, 27 Apr 2023 15:22:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PULL 01/18] multifd: Fix the number of channels ready
Date: Thu, 27 Apr 2023 17:22:17 +0200
Message-Id: <20230427152234.25400-2-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

We don't wait in the sem when we are doing a sync_main.  Make it wait
there.  To make things clearer, we mark the channel ready at the
begining of the thread loop.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cce3ad6988..6a59c03dd2 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -635,6 +635,7 @@ int multifd_send_sync_main(QEMUFile *f)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
+        qemu_sem_wait(&multifd_send_state->channels_ready);
         trace_multifd_send_sync_main_wait(p->id);
         qemu_sem_wait(&p->sem_sync);
 
@@ -668,6 +669,7 @@ static void *multifd_send_thread(void *opaque)
     p->num_packets = 1;
 
     while (true) {
+        qemu_sem_post(&multifd_send_state->channels_ready);
         qemu_sem_wait(&p->sem);
 
         if (qatomic_read(&multifd_send_state->exiting)) {
@@ -736,7 +738,6 @@ static void *multifd_send_thread(void *opaque)
             if (flags & MULTIFD_FLAG_SYNC) {
                 qemu_sem_post(&p->sem_sync);
             }
-            qemu_sem_post(&multifd_send_state->channels_ready);
         } else if (p->quit) {
             qemu_mutex_unlock(&p->mutex);
             break;
-- 
2.40.0


