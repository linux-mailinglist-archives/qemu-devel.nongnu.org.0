Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C1522724
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 00:47:01 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noYdA-0007Sa-FH
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 18:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaK-0004cW-I0
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaH-0006JG-P4
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652222641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vs8n8rfHPzW28VW8OO5SR80yoUi9AvYtSnpc5snK8dk=;
 b=YuQqtJoDUZnMl8gAQXrGNaFMhlIVc3D4a528x/6g2Ukz9gLjREsWYjvXOHMd+Q9OQKU2V2
 6QRzVgo9fNQneJ05TFeD6ycsU3rh+vjV4w6RFHLuqj+ku8Y1OQWtzQTWLM7UsA2hxzeCZl
 2CXMxcubb3SeJ7lnJSFsjK990jviXJs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-mDlWBoM4PUuyVG5Wo6598w-1; Tue, 10 May 2022 18:42:39 -0400
X-MC-Unique: mDlWBoM4PUuyVG5Wo6598w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 249BA1C05AA8;
 Tue, 10 May 2022 22:42:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93EAB40CFD25;
 Tue, 10 May 2022 22:42:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 08/13] multifd: Prepare to send a packet without the mutex
 held
Date: Wed, 11 May 2022 00:42:15 +0200
Message-Id: <20220510224220.5912-9-quintela@redhat.com>
In-Reply-To: <20220510224220.5912-1-quintela@redhat.com>
References: <20220510224220.5912-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do the send_prepare() and the fill of the head packet without the
mutex held.  It will help a lot for compression and later in the
series for zero pages.

Notice that we can use p->pages without holding p->mutex because
p->pending_job == 1.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h |  2 ++
 migration/multifd.c | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index ecf5a8e868..ed81f249d7 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -107,7 +107,9 @@ typedef struct {
     /* array of pages to sent.
      * The owner of 'pages' depends of 'pending_job' value:
      * pending_job == 0 -> migration_thread can use it.
+     *                     No need for mutex lock.
      * pending_job != 0 -> multifd_channel can use it.
+     *                     No need for mutex lock.
      */
     MultiFDPages_t *pages;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 3f9d9e3a56..c8f2caa2ae 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -632,6 +632,8 @@ static void *multifd_send_thread(void *opaque)
                 p->flags |= MULTIFD_FLAG_SYNC;
                 p->sync_needed = false;
             }
+            qemu_mutex_unlock(&p->mutex);
+
             p->iovs_num = 1;
             p->normal_num = 0;
 
@@ -648,11 +650,6 @@ static void *multifd_send_thread(void *opaque)
                 }
             }
             multifd_send_fill_packet(p);
-            p->num_packets++;
-            p->total_normal_pages += p->normal_num;
-            p->pages->num = 0;
-            p->pages->block = NULL;
-            qemu_mutex_unlock(&p->mutex);
 
             trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
                                p->next_packet_size);
@@ -667,6 +664,10 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
+            p->num_packets++;
+            p->total_normal_pages += p->normal_num;
+            p->pages->num = 0;
+            p->pages->block = NULL;
             p->sent_bytes += p->packet_len;;
             p->sent_bytes += p->next_packet_size;
             p->pending_job--;
-- 
2.35.1


