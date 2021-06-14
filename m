Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058523A68E8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:23:46 +0200 (CEST)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnVB-00016v-0h
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOL-0004Ya-Mz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOK-0007zT-0W
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geXi8qDIkkDRtRvIJ5HX1P7UezLG2lTDG/gfnIaJFpQ=;
 b=dOrs1bbs4qf+1Qy42FWWLpr4192vqTEYGtqSXjt34aAs9ttE4GExsUG+Xst1x7kJgSii/v
 q5m5UvA0XiP62QLJ/9Eip24S9qlXAoLGE/Lx4q30Rrjm8ZlV/Nty+UJNF9wJRdnWd/WbGc
 lqYXL2sKDWy0pkw6FKz70lxBNQDYXuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-NrjRtcUTNqWxIvKgSP6-RQ-1; Mon, 14 Jun 2021 10:16:36 -0400
X-MC-Unique: NrjRtcUTNqWxIvKgSP6-RQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4AAA193F560;
 Mon, 14 Jun 2021 14:16:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D593F19C46;
 Mon, 14 Jun 2021 14:16:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] migration: add trace point when vm_stop_force_state fails
Date: Mon, 14 Jun 2021 15:15:42 +0100
Message-Id: <20210614141549.100410-7-berrange@redhat.com>
In-Reply-To: <20210614141549.100410-1-berrange@redhat.com>
References: <20210614141549.100410-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a critical failure scenario for migration that is hard to
diagnose from existing probes. Most likely it is caused by an error
from bdrv_flush(), but we're not logging the errno anywhere, hence
this new probe.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c  | 1 +
 migration/trace-events | 1 +
 2 files changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 4828997f63..4228635d18 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3115,6 +3115,7 @@ static void migration_completion(MigrationState *s)
         if (!ret) {
             bool inactivate = !migrate_colo_enabled();
             ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
+            trace_migration_completion_vm_stop(ret);
             if (ret >= 0) {
                 ret = migration_maybe_pause(s, &current_active_state,
                                             MIGRATION_STATUS_DEVICE);
diff --git a/migration/trace-events b/migration/trace-events
index 860c4f4025..a1c0f034ab 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -149,6 +149,7 @@ migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
+migration_completion_vm_stop(int ret) "ret %d"
 migration_completion_postcopy_end(void) ""
 migration_completion_postcopy_end_after_complete(void) ""
 migration_rate_limit_pre(int ms) "%d ms"
-- 
2.31.1


