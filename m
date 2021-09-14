Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1640ACD6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:54:07 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ70o-0007mK-Js
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yt-00056b-5l
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yq-0007Il-2r
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631620322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOX7nqARL3VBZUhOlMwCyMghOR6R49bsh/b43icc/og=;
 b=FO2jhGI6QAev+qipzc61heGHxCmr7QZyH9bh7KYtswCo4tSZpNVjL/oXRQ9NA5qAjCCnn0
 Nz7pbtzq6KvdD82QmHUPYQ/MuAtSK6w4Xj8BUcSZ5L+YbH9DQvechcSqVSEHpwvWJUwt2I
 f23iKjFK6D/DM+NOZ33GqHUHL+A3y/c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-9WXFvubJNnuh6dtghVJjeg-1; Tue, 14 Sep 2021 07:52:01 -0400
X-MC-Unique: 9WXFvubJNnuh6dtghVJjeg-1
Received: by mail-wr1-f72.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso3870627wrt.11
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOX7nqARL3VBZUhOlMwCyMghOR6R49bsh/b43icc/og=;
 b=3TDecWegOFkyDn/UUmyPNjYgIet9vh/zOf4HlNlAQHTChYt/jgYRP53iAHgvbG9xuQ
 Y+S1x82+TJqS/znaROsYd4xDqpYUSXeVjHvj3u9r3fClbdKBpYxHrl2HabFqRBBMexbb
 E1WxAJ9MyAMEgJLobpzkl+0Q7hgF3Esiv+NWIcSuIdnhwzlxxoKd2adRc8oYjPAE1BQb
 xZakHTRlUZI5minPCKM/xKf6KIzcDrH+biMITo64XHyDzmV7j+TMbJeCtFVgtHuKnRKT
 QuCyauwcgPGtpw5WMCeMdwxRJlvUkG0uqUR8zYHkZgNeNzx1Oam5FJ8QN7WZJ8ZcuHz+
 qUQQ==
X-Gm-Message-State: AOAM530HbdraBPeLLa0MvtpwsFdS9GySgCgbGUKoqFlR4AvAEF8vX/ca
 gWt78PbzOQcLoZ/s6V03cqW7ao76kDAy05J+dUowa5dQgfVuG2OwXokOeOX55o4ToS74ZgLLUJ3
 KntzDrzsGKyxcgNxvtkS0o27VeOXaWy4psxR6o74HzhUZ/ZJfBv8nCpQHW15VTLoehIo=
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr18186011wrm.198.1631620320181; 
 Tue, 14 Sep 2021 04:52:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF21barUPbmILrJ+4JME+ZAp6+Upic0FLfc+kiRnIapqDXufRZzQXBxsW2Pb1Ag2Dh/DqNGg==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr18185990wrm.198.1631620319943; 
 Tue, 14 Sep 2021 04:51:59 -0700 (PDT)
Received: from localhost (static-109-144-85-188.ipcom.comunitel.net.
 [188.85.144.109])
 by smtp.gmail.com with ESMTPSA id a25sm918041wmj.34.2021.09.14.04.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:51:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] multifd: Implement yank for multifd send side
Date: Tue, 14 Sep 2021 13:51:53 +0200
Message-Id: <20210914115157.35868-2-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914115157.35868-1-quintela@redhat.com>
References: <20210914115157.35868-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Date: Wed, 1 Sep 2021 17:58:57 +0200 (1 week, 15 hours, 17 minutes ago)

[[PGP Signed Part:No public key for 35AB0B289C5DB258 created at 2021-09-01T17:58:57+0200 using RSA]]
When introducing yank functionality in the migration code I forgot
to cover the multifd send side.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h | 2 ++
 migration/multifd.c | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed..16c4d112d1 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -85,6 +85,8 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
+    /* is the yank function registered */
+    bool registered_yank;
     /* thread has work to do */
     int pending_job;
     /* array of pages to sent */
diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..5a4f158f3c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -546,6 +546,9 @@ void multifd_save_cleanup(void)
         MultiFDSendParams *p = &multifd_send_state->params[i];
         Error *local_err = NULL;
 
+        if (p->registered_yank) {
+            migration_ioc_unregister_yank(p->c);
+        }
         socket_send_channel_destroy(p->c);
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
@@ -813,7 +816,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                 return false;
             }
         } else {
-            /* update for tls qio channel */
+            migration_ioc_register_yank(ioc);
+            p->registered_yank = true;
             p->c = ioc;
             qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                                    QEMU_THREAD_JOINABLE);
-- 
2.31.1


