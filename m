Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D63669F6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:35:09 +0200 (CEST)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZB8O-0000oL-KY
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB36-0004OA-Eb
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB32-0000Xg-Dm
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619004575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5VL2YPbY2EtEXByGnh80RXTV+u6r2Sjz3BJ3ZT9dJE=;
 b=hJBUFoZIVQtEWcAj3kHtjkPTl7noJUXMkMorrcWdAcuBCzNzJsBGN3tSs483jlDj0RD3sE
 +bkknDSt5BhF6Rs3KsgReCqwWhWa+7SHW7RW/vHAnIqC+c9/cTwevABLRA804NQFzLBMkU
 uBZAhca+/pWFZ/wQ4UyVV/8UIzTYbME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-AIkPoacUNumzqrVrvfJsug-1; Wed, 21 Apr 2021 07:29:33 -0400
X-MC-Unique: AIkPoacUNumzqrVrvfJsug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FAA108BD0B
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 11:28:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-29.ams2.redhat.com
 [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAD53629DA;
 Wed, 21 Apr 2021 11:28:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [PATCH v2 3/5] migration: Add cleanup hook for inwards migration
Date: Wed, 21 Apr 2021 12:28:32 +0100
Message-Id: <20210421112834.107651-4-dgilbert@redhat.com>
In-Reply-To: <20210421112834.107651-1-dgilbert@redhat.com>
References: <20210421112834.107651-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add a cleanup hook for incoming migration that gets called
at the end as a way for a transport to allow cleanup.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c | 3 +++
 migration/migration.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 8ca034136b..d48986fbbb 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -279,6 +279,9 @@ void migration_incoming_state_destroy(void)
         g_array_free(mis->postcopy_remote_fds, TRUE);
         mis->postcopy_remote_fds = NULL;
     }
+    if (mis->transport_cleanup) {
+        mis->transport_cleanup(mis->transport_data);
+    }
 
     qemu_event_reset(&mis->main_thread_load_event);
 
diff --git a/migration/migration.h b/migration/migration.h
index db6708326b..1b4c5da917 100644
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


