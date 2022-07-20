Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1B57B5F5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:53:43 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8Gr-0003Oc-MU
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kW-00059T-9j
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kQ-0000Sa-Cr
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658316008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zcK+6dry+L1L47kPTO8uIkf+ST9oXTYo4lRfB4nReU=;
 b=fd2asyjCjMd2aSTnmoO0sKH80zZkja/OjdfG7li6ksNEBaHuex8bbZGdYA874N1TjLI2DF
 JeHH9ts+5XdY88wUephIwu5WbW6sTedKll7+K0dUzqcH96gZkB+Pd5ZtOKpP6uz/1rxb+r
 4i4U3uecmRO4OPI4yfowhG6WTIyWPvU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-nUBs-C-vPXmHR1GY4Jpv6Q-1; Wed, 20 Jul 2022 07:20:05 -0400
X-MC-Unique: nUBs-C-vPXmHR1GY4Jpv6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8D10296A600;
 Wed, 20 Jul 2022 11:20:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A7E2166B26;
 Wed, 20 Jul 2022 11:20:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 27/30] migration/multifd: Report to user when zerocopy not
 working
Date: Wed, 20 Jul 2022 12:19:23 +0100
Message-Id: <20220720111926.107055-28-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Some errors, like the lack of Scatter-Gather support by the network
interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
zero-copy, which causes it to fall back to the default copying mechanism.

After each full dirty-bitmap scan there should be a zero-copy flush
happening, which checks for errors each of the previous calls to
sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
increment dirty_sync_missed_zero_copy migration stat to let the user know
about it.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220711211112.18951-4-leobras@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 2 ++
 migration/ram.c     | 5 +++++
 migration/ram.h     | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1e49594b02..586ddc9d65 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
             if (ret < 0) {
                 error_report_err(err);
                 return -1;
+            } else if (ret == 1) {
+                dirty_sync_missed_zero_copy();
             }
         }
     }
diff --git a/migration/ram.c b/migration/ram.c
index 4fbad74c6c..b94669ba5d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -434,6 +434,11 @@ static void ram_transferred_add(uint64_t bytes)
     ram_counters.transferred += bytes;
 }
 
+void dirty_sync_missed_zero_copy(void)
+{
+    ram_counters.dirty_sync_missed_zero_copy++;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
diff --git a/migration/ram.h b/migration/ram.h
index 5d90945a6e..c7af65ac74 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -89,4 +89,6 @@ void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
+void dirty_sync_missed_zero_copy(void);
+
 #endif
-- 
2.36.1


