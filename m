Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CF3A3BA1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:04:56 +0200 (CEST)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraHo-00035T-1p
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDz-00048R-5J
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDx-0002FC-3s
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PrL8tItNxXFB0YZ42PPVCXAMvUuDuF/tSYL4nE/lm0=;
 b=Ih3TNOUsLGVy3NMbPQBVO+KL2Gu4xnUMgE7Ouf9ZBt+1YAcZh+uvHm4g+5EBmAQvFqCtjj
 C8IHxXM134otNq7XfTCzuJtz79SIlVvsH+jmzcFOyv5azgyqbqZyXnH7J0I/rI9mk1OVTU
 DAf7jkTnz/L+unhQRfU2PjKwvjBIV1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-LzgUbhfNPzW9QtF_RHFr4Q-1; Fri, 11 Jun 2021 02:00:54 -0400
X-MC-Unique: LzgUbhfNPzW9QtF_RHFr4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86324100C612;
 Fri, 11 Jun 2021 06:00:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD5D560917;
 Fri, 11 Jun 2021 06:00:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 09/12] Remove migrate_set_block_enabled in checkpoint
Date: Fri, 11 Jun 2021 14:00:21 +0800
Message-Id: <20210611060024.46763-10-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>,
 Lukas Straub <lukasstraub2@web.de>, Jason Wang <jasowang@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

We can detect disk migration in migrate_prepare, if disk migration
is enabled in COLO mode, we can directly report an error.and there
is no need to disable block migration at every checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 migration/colo.c      | 6 ------
 migration/migration.c | 4 ++++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index e498fdb..79fa1f6 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -435,12 +435,6 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
     if (failover_get_state() != FAILOVER_STATUS_NONE) {
         goto out;
     }
-
-    /* Disable block migration */
-    migrate_set_block_enabled(false, &local_err);
-    if (local_err) {
-        goto out;
-    }
     qemu_mutex_lock_iothread();
 
 #ifdef CONFIG_REPLICATION
diff --git a/migration/migration.c b/migration/migration.c
index 393299e..4828997 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2217,6 +2217,10 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     }
 
     if (blk || blk_inc) {
+        if (migrate_colo_enabled()) {
+            error_setg(errp, "No disk migration is required in COLO mode");
+            return false;
+        }
         if (migrate_use_block() || migrate_use_block_incremental()) {
             error_setg(errp, "Command options are incompatible with "
                        "current migration capabilities");
-- 
2.7.4


