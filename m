Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C693B3C732B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:28:31 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KKk-0002ZH-R4
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGW-000316-Sv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGV-0001uN-7L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0snJlGCX5abLMsB6dvL+8UI1xERqaWyAo489B2AWz0I=;
 b=d5W9CAwvUu9+E29xGlvGkM/vBQFUk66x6mv7ATBntrIqFWzokGUS4mEygWqOtY0tPmNqfQ
 17kHhj2UIhIAcMcAJKvyLURHg9AJQqRUHPK8uXgAW79G53IgN3Rpp870/44SZL8TaYczNA
 1/Slmb+39S8g3kPAxtYEy5FeTdylUa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-J4ydi55hPUiRdT5Ulap2CQ-1; Tue, 13 Jul 2021 11:24:04 -0400
X-MC-Unique: J4ydi55hPUiRdT5Ulap2CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A12804140;
 Tue, 13 Jul 2021 15:24:03 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EBDE5D9CA;
 Tue, 13 Jul 2021 15:24:02 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 3/6] migration: Release return path early for paused postcopy
Date: Tue, 13 Jul 2021 16:23:21 +0100
Message-Id: <20210713152324.217255-4-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
References: <20210713152324.217255-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

When postcopy pause triggered, we rely on the migration thread to cleanup the
to_dst_file handle, and the return path thread to cleanup the from_dst_file
handle (which is stored in the local variable "rp").

Within the process, from_dst_file cleanup (qemu_fclose) is postponed until it's
setup again due to a postcopy recovery.

It used to work before yank was born; after yank is introduced we rely on the
refcount of IOC to correctly unregister yank function in channel_close().  If
without the early and on-time release of from_dst_file handle the yank function
will be leftover during paused postcopy.

Without this patch, below steps (quoted from Xiaohui) could trigger qemu src
crash:

  1.Boot vm on src host
  2.Boot vm on dst host
  3.Enable postcopy on src&dst host
  4.Load stressapptest in vm and set postcopy speed to 50M
  5.Start migration from src to dst host, change into postcopy mode when migration is active.
  6.When postcopy is active, down the network card(do migration via this network) on dst host.
  7.Wait untill postcopy is paused on src&dst host.
  8.Before up network card, recover migration on dst host, will get error like following.
  9.Ignore the error of step 8, go on recovering migration on src host:

  After step 9, qemu on src host will core dump after some seconds:
  qemu-kvm: ../util/yank.c:107: yank_unregister_instance: Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
  1.sh: line 38: 44662 Aborted                 (core dumped)

Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210708190653.252961-2-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d717cd089a..38ebc6c1ab 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2818,12 +2818,12 @@ out:
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
              */
+            qemu_fclose(rp);
+            ms->rp_state.from_dst_file = NULL;
+            rp = NULL;
             if (postcopy_pause_return_path_thread(ms)) {
                 /* Reload rp, reset the rest */
-                if (rp != ms->rp_state.from_dst_file) {
-                    qemu_fclose(rp);
-                    rp = ms->rp_state.from_dst_file;
-                }
+                rp = ms->rp_state.from_dst_file;
                 ms->rp_state.error = false;
                 goto retry;
             }
-- 
2.31.1


