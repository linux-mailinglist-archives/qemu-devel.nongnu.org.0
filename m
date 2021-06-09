Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A83A17E9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:51:18 +0200 (CEST)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzY5-00064s-9E
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSp-0003MV-He
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSn-0005TF-CO
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zk6RO95o0Bz79WNxf9vbWMlU8vKD+fo/Q6+9NzX9c7E=;
 b=Jw3QlM5DsUmfyJQEbIdmvF9skkaTjiprMWDPk7CMudKYUlNaJNvca1lgBI/kOISvKFIVYz
 E95Ok9ZfMPTe8K7sTmELUXS8V/v8nUqvyQuabR6JyYgfMOrXbNXh1HZkDmhyS8Sw64qEvh
 +muXs64zebwg19h76CZCvOvq1u2ee4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-H9ezTp5mPr2dkJTTPurOvg-1; Wed, 09 Jun 2021 10:45:36 -0400
X-MC-Unique: H9ezTp5mPr2dkJTTPurOvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE510803622;
 Wed,  9 Jun 2021 14:45:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F33F101E5AF;
 Wed,  9 Jun 2021 14:45:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 5/9] migration: Add cleanup hook for inwards migration
Date: Wed,  9 Jun 2021 15:45:08 +0100
Message-Id: <20210609144512.211746-6-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add a cleanup hook for incoming migration that gets called
at the end as a way for a transport to allow cleanup.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210421112834.107651-4-dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 3 +++
 migration/migration.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 1885860d7b..393299e150 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -280,6 +280,9 @@ void migration_incoming_state_destroy(void)
         g_array_free(mis->postcopy_remote_fds, TRUE);
         mis->postcopy_remote_fds = NULL;
     }
+    if (mis->transport_cleanup) {
+        mis->transport_cleanup(mis->transport_data);
+    }
 
     qemu_event_reset(&mis->main_thread_load_event);
 
diff --git a/migration/migration.h b/migration/migration.h
index b88bd8fe07..2ebb740dfa 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -49,6 +49,10 @@ struct PostcopyBlocktimeContext;
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
 
+    /* A hook to allow cleanup at the end of incoming migration */
+    void *transport_data;
+    void (*transport_cleanup)(void *data);
+
     /*
      * Free at the start of the main state load, set as the main thread finishes
      * loading state.
-- 
2.31.1


