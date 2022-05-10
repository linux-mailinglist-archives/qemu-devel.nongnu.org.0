Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC852272D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 00:48:54 +0200 (CEST)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noYez-0004fc-7i
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 18:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaK-0004cw-To
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaH-0006J8-Ow
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652222640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4oF1RhtlZ0gyI5ZLp1fidQR9q4Lxwn6XCwpOR2V/f0=;
 b=FMJGO+teZkt7phM/XoM27e/sdE1cK8+9j36vbJX+0+LYax3o6IcePm3Xsn6SkNmJ6FXDyZ
 CvCNG5xlitZ+jSesC3kh5OB7obOlPH+TQrFJ56nW4bMuq9C04G57x0fjL4+351Ldcyh095
 75hAeajCoqxwdt0zqamEx3RxaVsFe0A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-fickj7YqMouTIUF_t6xVhQ-1; Tue, 10 May 2022 18:42:43 -0400
X-MC-Unique: fickj7YqMouTIUF_t6xVhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7374F29ABA31;
 Tue, 10 May 2022 22:42:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4480540CFD25;
 Tue, 10 May 2022 22:42:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 10/13] migration: Export ram_release_page()
Date: Wed, 11 May 2022 00:42:17 +0200
Message-Id: <20220510224220.5912-11-quintela@redhat.com>
In-Reply-To: <20220510224220.5912-1-quintela@redhat.com>
References: <20220510224220.5912-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h | 1 +
 migration/ram.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index 7b641adc55..aee08de2a5 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -66,6 +66,7 @@ int ram_load_postcopy(QEMUFile *f);
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
 void ram_transferred_add(uint64_t bytes);
+void ram_release_page(const char *rbname, uint64_t offset);
 
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
diff --git a/migration/ram.c b/migration/ram.c
index 14269a2671..34da0d71df 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1182,7 +1182,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
+void ram_release_page(const char *rbname, uint64_t offset)
 {
     if (!migrate_release_ram() || !migration_in_postcopy()) {
         return;
-- 
2.35.1


