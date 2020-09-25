Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233A278720
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 14:24:26 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLmm1-0005Ai-ER
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 08:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLmWV-0003ps-RL
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLmWP-0004JF-JJ
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:08:22 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601035696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9hQ0hMltJMExf+pAheHArc7xtnUmlp9SNigj7wOqJY=;
 b=XooFcRqmftislbbHpW94NiY9eqTAJOY8/UZnkJGlig5q4z68/x+BVFKTbuxrKhalAbB26J
 DTGyG8cdVRpz483BxKPySOuS4d9ofFm7yz/6aUUJtbY2CbIoRxolkqLAOTFqxJQSZcJqJ3
 u6SIKyXwoyV0J/xz7zMLazX5jR1+y5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-Hpu-5s4KOc22Ys_oujHSHA-1; Fri, 25 Sep 2020 08:08:13 -0400
X-MC-Unique: Hpu-5s4KOc22Ys_oujHSHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61B09802EA3;
 Fri, 25 Sep 2020 12:08:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-177.ams2.redhat.com
 [10.36.114.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AAC973697;
 Fri, 25 Sep 2020 12:08:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, zhengchuan@huawei.com, dovmurik@linux.vnet.ibm.com,
 hgcoin@gmail.com, zhangjiachen.jaycee@bytedance.com, lvivier@redhat.com,
 peterx@redhat.com, stefanha@redhat.com, vgoyal@redhat.com,
 jinyan12@huawei.com, ann.zhuangyanying@huawei.com
Subject: [PULL 19/26] migration/tls: add tls_hostname into MultiFDSendParams
Date: Fri, 25 Sep 2020 13:06:48 +0100
Message-Id: <20200925120655.295142-20-dgilbert@redhat.com>
In-Reply-To: <20200925120655.295142-1-dgilbert@redhat.com>
References: <20200925120655.295142-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Chuan Zheng <zhengchuan@huawei.com>

Since multifd creation is async with migration_channel_connect, we should
pass the hostname from MigrationState to MultiFDSendParams.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Yan Jin <jinyan12@huawei.com>
Message-Id: <1600139042-104593-4-git-send-email-zhengchuan@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 5 +++++
 migration/multifd.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index fd57378db8..de34276c43 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -548,6 +548,8 @@ void multifd_save_cleanup(void)
         qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
+        g_free(p->tls_hostname);
+        p->tls_hostname = NULL;
         multifd_pages_clear(p->pages);
         p->pages = NULL;
         p->packet_len = 0;
@@ -751,10 +753,12 @@ int multifd_save_setup(Error **errp)
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
+    MigrationState *s;
 
     if (!migrate_use_multifd()) {
         return 0;
     }
+    s = migrate_get_current();
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
     multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
@@ -779,6 +783,7 @@ int multifd_save_setup(Error **errp)
         p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
+        p->tls_hostname = g_strdup(s->hostname);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/multifd.h b/migration/multifd.h
index 448a03d89a..8d6751f5ed 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -71,6 +71,8 @@ typedef struct {
     uint8_t id;
     /* channel thread name */
     char *name;
+    /* tls hostname */
+    char *tls_hostname;
     /* channel thread id */
     QemuThread thread;
     /* communication channel */
-- 
2.26.2


