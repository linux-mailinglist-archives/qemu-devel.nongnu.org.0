Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F39587F96
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:59:11 +0200 (CEST)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIuIY-0001UI-C7
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuEV-00046d-Ty
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuET-000240-0S
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659455696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcMsBDLIY06iYQJ5LPagbf0qdnKRRsXCWhMQWT1UEQA=;
 b=dJ9mBZHtacJCGfIglcfXze4x0chDdBF/4AAwsqubvgtsR+OKXszrsJkVSVr1+OunCs2QTu
 G0isNJd3rTKMq5E5GXddStmZbLA+GlPIpS7XRuHAbuPReyVir5tV0k4VBQ3cBtRManOVto
 7q8WOc0VzgNPU7gR6dcS9GI7olGY/bE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-agwwrK7ZMPiXaV-WlhNweA-1; Tue, 02 Aug 2022 11:54:55 -0400
X-MC-Unique: agwwrK7ZMPiXaV-WlhNweA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1CAF3C1014B;
 Tue,  2 Aug 2022 15:54:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE173141DC28;
 Tue,  2 Aug 2022 15:54:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, thuth@redhat.com,
 peter.maydell@linaro.org, vgoyal@redhat.com
Cc: peterx@redhat.com,
	quintela@redhat.com
Subject: [PULL 1/5] migration: add remaining params->has_* = true in
 migration_instance_init()
Date: Tue,  2 Aug 2022 16:54:43 +0100
Message-Id: <20220802155447.216018-2-dgilbert@redhat.com>
In-Reply-To: <20220802155447.216018-1-dgilbert@redhat.com>
References: <20220802155447.216018-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

Some of params->has_* = true are missing in migration_instance_init, this
causes migrate_params_check() to skip some tests, allowing some
unsupported scenarios.

Fix this by adding all missing params->has_* = true in
migration_instance_init().

Fixes: 69ef1f36b0 ("migration: define 'tls-creds' and 'tls-hostname' migration parameters")
Fixes: 1d58872a91 ("migration: do not wait for free thread")
Fixes: d2f1d29b95 ("migration: add support for a "tls-authz" migration parameter")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Message-Id: <20220726010235.342927-1-leobras@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e03f698a3c..82fbe0cf55 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4451,6 +4451,7 @@ static void migration_instance_init(Object *obj)
     /* Set has_* up only for parameter checks */
     params->has_compress_level = true;
     params->has_compress_threads = true;
+    params->has_compress_wait_thread = true;
     params->has_decompress_threads = true;
     params->has_throttle_trigger_threshold = true;
     params->has_cpu_throttle_initial = true;
@@ -4471,6 +4472,9 @@ static void migration_instance_init(Object *obj)
     params->has_announce_max = true;
     params->has_announce_rounds = true;
     params->has_announce_step = true;
+    params->has_tls_creds = true;
+    params->has_tls_hostname = true;
+    params->has_tls_authz = true;
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
-- 
2.37.1


