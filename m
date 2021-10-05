Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A33422B85
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:52:56 +0200 (CEST)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXloN-0000gw-1R
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXD-0003MP-7f
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXA-0004oC-H7
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qWsyp3lLuysw6iyyPsNKQfI71P/JOwxvP4eLk3hGwA=;
 b=jNR5aNsbzGfEf7pJVyIR66kHW4SYH0AyLMVdppgZ4J6kOuWqzKITbW/Vkfex+L2G6Tlus8
 zBmjwWarMsoJn3CgEU4/nT9Hcok/0/FZDQ94ntnmBRlTkASRdaisVtQSZrSz2TTfR64COZ
 cULk+2N1gEK/hc3K1CNv1xCBJ5HE5wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-J9z_TsWdPv-RDd1zMFX6Dg-1; Tue, 05 Oct 2021 10:35:06 -0400
X-MC-Unique: J9z_TsWdPv-RDd1zMFX6Dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8C001084681;
 Tue,  5 Oct 2021 14:35:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2EA31002391;
 Tue,  5 Oct 2021 14:35:03 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 13/25] include/systemu/blockdev.h: global state API
Date: Tue,  5 Oct 2021 10:32:03 -0400
Message-Id: <20211005143215.29500-14-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

blockdev functions run always under the BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/sysemu/blockdev.h | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..28233f6b63 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -38,24 +38,49 @@ struct DriveInfo {
     QTAILQ_ENTRY(DriveInfo) next;
 };
 
-DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * If a function modifies the graph, it also uses drain and/or
+ * aio_context_acquire/release to be sure it has unique access.
+ * aio_context locking is needed together with BQL because of
+ * the thread-safe I/O API that concurrently runs and accesses
+ * the graph without the BQL.
+ *
+ * It is important to note that not all of these functions are
+ * necessarily limited to running under the BQL, but they would
+ * require additional auditing and may small thread-safety changes
+ * to move them into the I/O API. Often it's not worth doing that
+ * work since the APIs are only used with the BQL held at the
+ * moment, so they have been placed in the GS API (for now).
+ *
+ * All functions in this header must use this assertion:
+ * g_assert(qemu_in_main_thread());
+ * to catch when they are accidentally called without the BQL.
+ */
+
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo);
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
 
 void override_max_devs(BlockInterfaceType type, int max_devs);
 
 DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
-void drive_mark_claimed_by_board(void);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
-int drive_get_max_devs(BlockInterfaceType type);
 DriveInfo *drive_get_next(BlockInterfaceType type);
 
+DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
+                     Error **errp);
+
+/* Common functions that are neither I/O nor Global State */
+
+DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
+int drive_get_max_devs(BlockInterfaceType type);
+
 QemuOpts *drive_def(const char *optstr);
+
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
                     const char *optstr);
-DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
-                     Error **errp);
 
 #endif
-- 
2.27.0


