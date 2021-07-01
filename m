Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391133B9359
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:29:05 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxge-0002hw-9H
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUj-0005F2-Ah
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUd-000664-So
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625148998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEQbkL5PEeq7gAgk/MM/YqgfMkjP8R1PG79qBME4fkU=;
 b=AoFlEmIIVGNqnrzbYn2kcguk88IKV/TN6q5mq1NgGJxASi2+P8tXfouJggkVDtpaoPwQQh
 VE0OTEXHj+ZRCRaPZxiPP75kJrqIYkjkNnrwg0Iy/MMh6NzTmQNFIet87nrgdNeyOA+oJs
 Ssso++1UwsVtboQFm8gJBiW1zuUJi/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-D_lta9oZMEy2RhGIpWMDjA-1; Thu, 01 Jul 2021 10:16:36 -0400
X-MC-Unique: D_lta9oZMEy2RhGIpWMDjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5692D9F92A;
 Thu,  1 Jul 2021 14:16:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07B7A60843;
 Thu,  1 Jul 2021 14:16:32 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 07/20] migration: failover: continue to wait card unplug on
 error
Date: Thu,  1 Jul 2021 15:15:32 +0100
Message-Id: <20210701141545.193571-8-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

If the user cancels the migration in the unplug-wait state,
QEMU will try to plug back the card and this fails because the card
is partially unplugged.
To avoid the problem, continue to wait the card unplug, but to
allow the migration to be canceled if the card never finishes to unplug
use a timeout.

Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210629155007.629086-3-lvivier@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index dbc484c802..5ff7ba9d5c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3691,6 +3691,17 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
                qemu_savevm_state_guest_unplug_pending()) {
             qemu_sem_timedwait(&s->wait_unplug_sem, 250);
         }
+        if (s->state != MIGRATION_STATUS_WAIT_UNPLUG) {
+            int timeout = 120; /* 30 seconds */
+            /*
+             * migration has been canceled
+             * but as we have started an unplug we must wait the end
+             * to be able to plug back the card
+             */
+            while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
+                qemu_sem_timedwait(&s->wait_unplug_sem, 250);
+            }
+        }
 
         migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
     } else {
-- 
2.31.1


