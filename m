Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15537EC92
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 00:33:20 +0200 (CEST)
Received: from localhost ([::1]:42904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgxPq-0007XC-QQ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 18:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxOC-0004vK-4k
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:36 -0400
Received: from relay.sw.ru ([185.231.240.75]:55490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO8-0003sV-5E
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=jKIMHQ971fd0/ATRtGq6S+1Upp4MAjJyJ73ggJBuvpM=; b=oUQCtbBDW5Xf
 ogSUohY+52BB8wJrOEm3PVWigKDZckQy1cshOY9f4GUrbxQA59aGYMvrvWf5ExWGJ94wSzhFCQUVD
 2D6sOGtGecaTMCknX47h+V3+NNi/5i6rnyxsD6zX5JUszaT1OxmuhYSlvfx8UcksHl7syyKxEd9wh
 Lzjbs=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO5-002Bd3-A2; Thu, 13 May 2021 01:31:29 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH v2 2/7] migration/snapshot: Introduce qemu_ftell2() routine
Date: Thu, 13 May 2021 01:31:22 +0300
Message-Id: <20210512223127.586885-3-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512223127.586885-1-andrey.gruzdev@virtuozzo.com>
References: <20210512223127.586885-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In qemu-snapshot it is needed to retrieve current QEMUFile offset as a
number of bytes read by qemu_get_byte()/qemu_get_buffer().

The existing qemu_ftell() routine would give read position as a number
of bytes fetched from underlying IOChannel which is not the same.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/qemu-file.c | 6 ++++++
 migration/qemu-file.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d6e03dbc0e..66be5e6460 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -657,6 +657,12 @@ int64_t qemu_ftell(QEMUFile *f)
     return f->pos;
 }
 
+int64_t qemu_ftell2(QEMUFile *f)
+{
+    qemu_fflush(f);
+    return f->pos + f->buf_index - f->buf_size;
+}
+
 int qemu_file_rate_limit(QEMUFile *f)
 {
     if (f->shutdown) {
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index a9b6d6ccb7..bd1a6def02 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -124,6 +124,7 @@ void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
 int64_t qemu_ftell(QEMUFile *f);
+int64_t qemu_ftell2(QEMUFile *f);
 int64_t qemu_ftell_fast(QEMUFile *f);
 /*
  * put_buffer without copying the buffer.
-- 
2.27.0


