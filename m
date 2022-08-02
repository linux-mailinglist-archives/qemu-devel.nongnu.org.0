Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20C587758
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:58:00 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlqp-0002vx-K4
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlZ1-0003nO-Uo
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlYz-0006BD-Cj
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659422372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHrCvCkUm/81My8+ieIfOxeXeHS005XC+7a4UCb0DDM=;
 b=ZBhbfRKfjPpzojeRjbablSM/gyBTsf2Dmakdpy1rsNaAF8QtMgqveTeuK4aCD5x87SMvtZ
 Or7S9EZCDd8RyEeA81RdeC7o7zWEv67YJH5+u85XLlZmXA7N3qwGvwFTfGSzsDrKt+cXW2
 I+SItaXgSYqfuzb5m8K7BVGUdqzdW20=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-Ogy2_OtyOs2qyYE4dpKMMA-1; Tue, 02 Aug 2022 02:39:29 -0400
X-MC-Unique: Ogy2_OtyOs2qyYE4dpKMMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 398F23803909;
 Tue,  2 Aug 2022 06:39:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C297492C3B;
 Tue,  2 Aug 2022 06:39:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 09/12] migration: Export ram_release_page()
Date: Tue,  2 Aug 2022 08:39:04 +0200
Message-Id: <20220802063907.18882-10-quintela@redhat.com>
In-Reply-To: <20220802063907.18882-1-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h | 1 +
 migration/ram.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index e844966f69..038d52f49f 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -66,6 +66,7 @@ int ram_load_postcopy(QEMUFile *f, int channel);
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
 void ram_transferred_add(uint64_t bytes);
+void ram_release_page(const char *rbname, uint64_t offset);
 
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
diff --git a/migration/ram.c b/migration/ram.c
index 499d9b2a90..291ba5c0ed 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1238,7 +1238,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
+void ram_release_page(const char *rbname, uint64_t offset)
 {
     if (!migrate_release_ram() || !migration_in_postcopy()) {
         return;
-- 
2.37.1


