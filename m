Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDD702CDA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:38:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPs-0006y6-37; Mon, 15 May 2023 08:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOy-0006T4-9n
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOq-0003LK-4G
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6oKoZ4O6uldHm4D+Zo5e6BNr/w9mJRMN8Y/8Eua9Cc=;
 b=FM+0YBOHiZDQSCp5tRzXhHR1nPGHtXP5YpsA72ZEHkPJyJ1S/XM69Xd1q24gVWkCjZwRij
 Tr9xtnAiBFT2wnisX3hsf5qqCR4Es079EwyMGYM6+ZjryS+pZWpd/VmwnXHSwlqo01Ma8O
 fPEqkPPE3cYmedaLAORqmWcu+UTHsKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-yK4NfgRgPMaQ6ymTVpWPrw-1; Mon, 15 May 2023 08:33:53 -0400
X-MC-Unique: yK4NfgRgPMaQ6ymTVpWPrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FE351012BC0;
 Mon, 15 May 2023 12:33:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB14F35453;
 Mon, 15 May 2023 12:33:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/11] migration: A rate limit value of 0 is valid
Date: Mon, 15 May 2023 14:33:30 +0200
Message-Id: <20230515123334.58995-8-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

And it is the best way to not have rate_limit.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230508130909.65420-2-quintela@redhat.com>
---
 migration/migration.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 439e8651df..5636119e8e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2140,12 +2140,7 @@ static int postcopy_start(MigrationState *ms)
      * will notice we're in POSTCOPY_ACTIVE and not actually
      * wrap their state up here
      */
-    /* 0 max-postcopy-bandwidth means unlimited */
-    if (!bandwidth) {
-        qemu_file_set_rate_limit(ms->to_dst_file, INT64_MAX);
-    } else {
-        qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
-    }
+    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
     if (migrate_postcopy_ram()) {
         /* Ping just for debugging, helps line traces up */
         qemu_savevm_send_ping(ms->to_dst_file, 2);
-- 
2.40.1


