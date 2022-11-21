Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989D63237A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6rO-0000da-TP; Mon, 21 Nov 2022 08:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6qX-0000PV-0R
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6py-0004og-Jq
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669037260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82n06ypGY49Plz4M2tcMx6flFk5mja5S3ptKNYMoHNk=;
 b=gI/n7I4r1KXSO/AWI9cCTPlgzpHvZ8dc2LWsnZRsoYKCquHJjXio4SQE7i65alEAioIqxf
 YQemIpQlNdWNWClAu7vLt+f+BLGoWDZpww5mBW7OsHj1XVoyBhVkElZ+Eg02VOTLUlaUOE
 UGTZ5t/UPQXceHu+GyWbFYNbsyC0FVQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-_tyt2sCmPPmgn2blQFtoWg-1; Mon, 21 Nov 2022 08:27:37 -0500
X-MC-Unique: _tyt2sCmPPmgn2blQFtoWg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F700101A52A;
 Mon, 21 Nov 2022 13:27:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AFCF4B3FC6;
 Mon, 21 Nov 2022 13:27:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 04/19] migration: Export ram_release_page()
Date: Mon, 21 Nov 2022 14:27:02 +0100
Message-Id: <20221121132717.63070-5-quintela@redhat.com>
In-Reply-To: <20221121132717.63070-1-quintela@redhat.com>
References: <20221121132717.63070-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Leonardo Bras <leobras@redhat.com>
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
index 2cbe707bfc..8aad17c429 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1234,7 +1234,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
+void ram_release_page(const char *rbname, uint64_t offset)
 {
     if (!migrate_release_ram() || !migration_in_postcopy()) {
         return;
-- 
2.38.1


