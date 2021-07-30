Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD23DB4A0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 09:42:49 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9NAN-0007Tq-Ug
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 03:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1m9N9T-0006no-5F
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 03:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1m9N9M-0005FK-Tf
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 03:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627630902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9+/f8vIM4VkxjfOUdaCitH4Bqd1oI9Uz6Mj6sGDOo58=;
 b=SkPbfAEuH0vE6b5an5rJ0ts6R4O2kKk2XtQ00gKtMat3CwWecq8mBK5/YzR7/Hsm9+hY9F
 XqdEZViXR4slvyAcNmHbM+UI97puLh8S6mXOuy96dle9WexE79yJWfvgER3W1np2KJynq3
 /wouQKI/1HLJKO4fqAzTKlCFS4vSYv8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-mnKTHkuKN16xHClkp7yWkQ-1; Fri, 30 Jul 2021 03:41:40 -0400
X-MC-Unique: mnKTHkuKN16xHClkp7yWkQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 p7-20020a170902b087b029012c2879a885so7266961plr.6
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 00:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+/f8vIM4VkxjfOUdaCitH4Bqd1oI9Uz6Mj6sGDOo58=;
 b=rl+cEq+xdtWIbXnQE+eJmJcRxh45Hm0uho+HgWYaNA/BXiDPasE9Z82aYORn2zCcIS
 g6Y/zpkjB5mzueWLCAzSEbsn8+V1lyvpj5708sx7SqgG6+eOVK3239uG1jt58lwUZ5iw
 MBbXl9XgXcgEYDdaVGR5Lq4TjJG6W7HVpsUksDQYcT9meCAeaE9gUg4HJJWA1PLNIKwG
 1XMAA7ZcdGr1blY6QZaPXRhHSItk4VAYcPrkamRr7Lp1pisdv2maOE80AqQ3d0CP3807
 UqnJes5LLIVhEHfzHtCKz8jiuT+5D6tJAbf3RhbBzamk8imEMXQDiErWzaa5exYQCs/+
 AjEQ==
X-Gm-Message-State: AOAM532cv+wjbOfsxdblDBkMDval1pf4PHqC2NkXVhG0Sg/AGJjq6Q5C
 Azl2cLybh5IEaeU2+dPfv59XQBpXn1gpGCE1yQtby2If+pQgvzcQpDR4L3RvbsWvU53VwxWmUaM
 65EBgWjk6KxOQ8O4=
X-Received: by 2002:a63:2152:: with SMTP id s18mr623829pgm.25.1627630899869;
 Fri, 30 Jul 2021 00:41:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjeJzeaZbjT0X9GE1LpvjxpPddhOPwMx5uftfvEphKRtOzG6betisXsLp/jsY7mxFw4wV70A==
X-Received: by 2002:a63:2152:: with SMTP id s18mr623807pgm.25.1627630899563;
 Fri, 30 Jul 2021 00:41:39 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:5f2c:3ab4:a48:5ddf:8053])
 by smtp.gmail.com with ESMTPSA id bg8sm1108296pjb.4.2021.07.30.00.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 00:41:38 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH 1/1] migration: Terminate multifd threads on yank
Date: Fri, 30 Jul 2021 04:40:45 -0300
Message-Id: <20210730074043.54260-1-leobras@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Li Xiaohui <xiaohli@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From source host viewpoint, losing a connection during migration will
cause the sockets to get stuck in sendmsg() syscall, waiting for
the receiving side to reply.

In migration, yank works by shutting-down the migration QIOChannel fd.
This causes a failure in the next sendmsg() for that fd, and the whole
migration gets cancelled.

In multifd, due to having multiple sockets in multiple threads,
on a connection loss there will be extra sockets stuck in sendmsg(),
and because they will be holding their own mutex, there is good chance
the main migration thread can get stuck in multifd_send_pages()
waiting for one of those mutexes.

While it's waiting, the main migration thread can't run sendmsg() on
it's fd, and therefore can't cause the migration to be cancelled, thus
causing yank not to work.

Fixes this by shutting down all migration fds (including multifd ones),
so no thread get's stuck in sendmsg() while holding a lock, and thus
allowing the main migration thread to properly cancel migration when
yank is used.

There is no need to do the same procedure to yank to work in the
receiving host since ops->recv_pages() is kept outside the mutex protected
code in multifd_recv_thread().

Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=1970337
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c        | 11 +++++++++++
 migration/multifd.h        |  1 +
 migration/yank_functions.c |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..744a180dfe 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1040,6 +1040,17 @@ void multifd_recv_sync_main(void)
     trace_multifd_recv_sync_main(multifd_recv_state->packet_num);
 }
 
+void multifd_shutdown(void)
+{
+    if (!migrate_use_multifd()) {
+        return;
+    }
+
+    if (multifd_send_state) {
+        multifd_send_terminate_threads(NULL);
+    }
+}
+
 static void *multifd_recv_thread(void *opaque)
 {
     MultiFDRecvParams *p = opaque;
diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed..0517213bdf 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -22,6 +22,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 void multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
+void multifd_shutdown(void);
 
 /* Multifd Compression flags */
 #define MULTIFD_FLAG_SYNC (1 << 0)
diff --git a/migration/yank_functions.c b/migration/yank_functions.c
index 8c08aef14a..9335a64f00 100644
--- a/migration/yank_functions.c
+++ b/migration/yank_functions.c
@@ -15,12 +15,14 @@
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
 #include "qemu-file.h"
+#include "multifd.h"
 
 void migration_yank_iochannel(void *opaque)
 {
     QIOChannel *ioc = QIO_CHANNEL(opaque);
 
     qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    multifd_shutdown();
 }
 
 /* Return whether yank is supported on this ioc */
-- 
2.32.0


