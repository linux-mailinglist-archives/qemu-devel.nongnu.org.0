Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F91433270
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:37:18 +0200 (CEST)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclYc-00076h-1V
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQx-0003rr-5j
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQu-0005gf-CM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnYbXqplDYjVx6yRtdKoJVb5ZarXQXE39HCFPLbwh08=;
 b=DoySnws2+rprFJo4IEDBDgo0t529t3jr5z4Le0K8UyPsx/QPjiPJyIJPv20Hw56RTQaJJV
 2XqHRRifQdFl+Ee/u43DW2bi5nfRAswsitBtbwUwrmJPxxGlYk7CfReSt4f0plTntvSeNK
 Yw4BfcOFgrfvbX4cUyYjTkivLXo12I8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-jrbas4acO26eja1ImanLog-1; Tue, 19 Oct 2021 05:29:18 -0400
X-MC-Unique: jrbas4acO26eja1ImanLog-1
Received: by mail-wr1-f72.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso9927897wri.17
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnYbXqplDYjVx6yRtdKoJVb5ZarXQXE39HCFPLbwh08=;
 b=e56cXSiQ0sbRZDSyUhlQ/JMbUTJj+qvxmryueTiqplzb2i8cBVi77nzc285sF8ObSK
 1oW2NkdTicmbhF/mAXuZdhZPQVUz3dQfTcAkSMWSFLiwnuAckWzM94WyEdy6ZXwDuGIk
 MXzvdzpGyU7WARRt6uzxsHVEQzZgTzas1mPGwK+3nkNc0ykwTZMKIGaXyvxflQgyUv6A
 XFeyt0p6wiTsgfk+PTjwNRDsnvBdomjKbSZmNBhA++xlIOANZaMO+ILS3wcnbYLo4h6D
 Gl5q16W/tRX8ALmxU/ek+yE2nJdUsbi0Jm0o1xUzhKCQJNWCO8VA0eAyssuH8mGIsjQo
 NAUg==
X-Gm-Message-State: AOAM530SomInWgfZ9rgs7HnMn8D/vuGkAPtl4iUsHVUqTwiIBc4LAUBb
 kpHbYbkZmy4nG4lybgPYQyYU4Sny8Gc4ZnODjvs8WcQxH0m1cbfSnaJh2U0mZAh8F8Gom0JbXza
 P4nNO+h1SpG+AMQXJJChlTQJX5xkvFHi4hVcTdxZhQyAxzRHWLBDYSuHp/lxHkvzNOpg=
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr4802498wmj.76.1634635757175; 
 Tue, 19 Oct 2021 02:29:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi173m8zP0/JWh9prgDMNyOB/wZioFfpobQij7Qz2nyOpWiijbNaV301gA4QGFKpYV8Cc+8w==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr4802468wmj.76.1634635756970; 
 Tue, 19 Oct 2021 02:29:16 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id a16sm14535905wrs.30.2021.10.19.02.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] migration: allow enabling mutilfd for specific protocol
 only
Date: Tue, 19 Oct 2021 11:29:05 +0200
Message-Id: <20211019092907.5255-6-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
References: <20211019092907.5255-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

To: <quintela@redhat.com>, <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
CC: Li Zhijian <lizhijian@cn.fujitsu.com>
Date: Sat, 31 Jul 2021 22:05:52 +0800 (5 weeks, 4 days, 17 hours ago)

And change the default to true so that in '-incoming defer' case, user is able
to change multifd capability.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 8 ++++++++
 migration/multifd.c   | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index f13b07c638..9172686b89 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1237,6 +1237,14 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    /* incoming side only */
+    if (runstate_check(RUN_STATE_INMIGRATE) &&
+        !migrate_multifd_is_allowed() &&
+        cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 283f672bf0..7c9deb1921 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -868,7 +868,7 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
-static bool migrate_allow_multifd;
+static bool migrate_allow_multifd = true;
 void migrate_protocol_allow_multifd(bool allow)
 {
     migrate_allow_multifd = allow;
-- 
2.31.1


