Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBF24CADBA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:38:27 +0100 (CET)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTrm-0007LF-9x
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:38:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkd-0001Th-D0
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkb-0000KD-LD
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8gHke2pCSAMiwh/6LHB8vvYNMwQN7z8KlGxyLEWOVA=;
 b=PGZ0TAh9Sktfni6jzz/afo1yiaN9MYJto0/w7cnq8fS37iVXNE/mQPx0dqmG0DpRoa2D9x
 rzL7HWqmL2OOoYYm1VeEHpwVUBMeZw8f97kfV/O3KVv4wqPF5caGDb+TECDrGVWuJTMF+1
 7c1up7pYeHRzaua4GT2xOKQcQVCMNFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-5RVStdfBNoqyOClMsgLmQQ-1; Wed, 02 Mar 2022 13:30:57 -0500
X-MC-Unique: 5RVStdfBNoqyOClMsgLmQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2DF384A5F3;
 Wed,  2 Mar 2022 18:30:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC6A0105916D;
 Wed,  2 Mar 2022 18:30:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 14/18] migration: Enlarge postcopy recovery to capture !-EIO too
Date: Wed,  2 Mar 2022 18:29:32 +0000
Message-Id: <20220302182936.227719-15-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

We used to have quite a few places making sure -EIO happened and that's the
only way to trigger postcopy recovery.  That's based on the assumption that
we'll only return -EIO for channel issues.

It'll work in 99.99% cases but logically that won't cover some corner cases.
One example is e.g. ram_block_from_stream() could fail with an interrupted
network, then -EINVAL will be returned instead of -EIO.

I remembered Dave Gilbert pointed that out before, but somehow this is
overlooked.  Neither did I encounter anything outside the -EIO error.

However we'd better touch that up before it triggers a rare VM data loss during
live migrating.

To cover as much those cases as possible, remove the -EIO restriction on
triggering the postcopy recovery, because even if it's not a channel failure,
we can't do anything better than halting QEMU anyway - the corpse of the
process may even be used by a good hand to dig out useful memory regions, or
the admin could simply kill the process later on.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-11-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c    | 4 ++--
 migration/postcopy-ram.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bcc385b94b..306e2ac60e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2865,7 +2865,7 @@ retry:
 out:
     res = qemu_file_get_error(rp);
     if (res) {
-        if (res == -EIO && migration_in_postcopy()) {
+        if (res && migration_in_postcopy()) {
             /*
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
@@ -3466,7 +3466,7 @@ static MigThrError migration_detect_error(MigrationState *s)
         error_free(local_error);
     }
 
-    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
+    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret) {
         /*
          * For postcopy, we allow the network to be down for a
          * while. After that, it can be continued by a
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d08d396c63..b0d12d5053 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1039,7 +1039,7 @@ retry:
                                         msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
-                if (ret == -EIO && postcopy_pause_fault_thread(mis)) {
+                if (postcopy_pause_fault_thread(mis)) {
                     /* We got reconnected somehow, try to continue */
                     goto retry;
                 } else {
-- 
2.35.1


