Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924D360B44
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:02:09 +0200 (CEST)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX2ZL-0006gU-Vj
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2WR-0005F9-Nd
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2WP-00020h-Ba
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618495144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWl1z60kASrrjV8abgZcQ6LpqRXRU0z0fmYz7/lqzJ0=;
 b=CDpaPEeB3I9EkrahhHJL8ZQ0E6PHEYZGFsCxVrMN9U9afTQ2QaaJrqTvy0SCSJK59+nAKV
 aiTAgjbLR2WleClqK6hV6j4kAXHMpkPRJPH7Jq6o/nNhognH5fe6ccOWNCSf3+EezYGCBt
 kazYzVuiO2D0GmlIcs5wuPyTtO1hQno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-WzaEVOQ-MDajBBLQT6J62Q-1; Thu, 15 Apr 2021 09:59:02 -0400
X-MC-Unique: WzaEVOQ-MDajBBLQT6J62Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C329817473;
 Thu, 15 Apr 2021 13:59:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-159.ams2.redhat.com
 [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 465116A032;
 Thu, 15 Apr 2021 13:58:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] migration: add trace point when vm_stop_force_state fails
Date: Thu, 15 Apr 2021 14:58:47 +0100
Message-Id: <20210415135851.862406-2-berrange@redhat.com>
In-Reply-To: <20210415135851.862406-1-berrange@redhat.com>
References: <20210415135851.862406-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a critical failure scenario for migration that is hard to
diagnose from existing probes. Most likely it is caused by an error
from bdrv_flush(), but we're not logging the errno anywhere, hence
this new probe.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c  | 1 +
 migration/trace-events | 1 +
 2 files changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 8ca034136b..bee0dcd501 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3121,6 +3121,7 @@ static void migration_completion(MigrationState *s)
         if (!ret) {
             bool inactivate = !migrate_colo_enabled();
             ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
+            trace_migration_completion_vm_stop(ret);
             if (ret >= 0) {
                 ret = migration_maybe_pause(s, &current_active_state,
                                             MIGRATION_STATUS_DEVICE);
diff --git a/migration/trace-events b/migration/trace-events
index 668c562fed..8ec28432eb 100644
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
2.30.2


