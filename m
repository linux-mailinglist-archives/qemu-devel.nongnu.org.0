Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B117C40488B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:36:03 +0200 (CEST)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHPW-0005dy-Ju
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNX-0002wi-JN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNQ-0002qy-GV
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOX7nqARL3VBZUhOlMwCyMghOR6R49bsh/b43icc/og=;
 b=Z1Km5uEAhFU9ukgRJsbRE/H8kY6p8XhtAlirn1e1qWzMU3DqKu26NQ+BEqAT7GhH7jL+ho
 PhktXro71DIh3K4AdTh7DthbKk+3XjZ2NLujM8u3s1j+F4srDGsZ8dTSaviNQiu+i135+c
 +fpqSboSaZbcGNvcsk8c/KdPBe/SZQE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-n9AFm4JMMf6zIm7ZuOygJQ-1; Thu, 09 Sep 2021 06:33:50 -0400
X-MC-Unique: n9AFm4JMMf6zIm7ZuOygJQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so589052wmc.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOX7nqARL3VBZUhOlMwCyMghOR6R49bsh/b43icc/og=;
 b=I4C3RPSW1XtJhPdtQG0e3fmzITUfsGYrXpj5dpbnZgZU+siQhwBfmfQ0IG/95xlJz3
 yBJe69jS0mAfZD9Ez88bLJN2t+D4PUifOHvIf7ORxwIg4mZ+Pse6Z1uacM9lSlvLFkaL
 yW5C/WjFAZFY1IB2kjhWq73Tzrwslwyc3q5gseIKYzC1tzLDa0vlnXuh37KkS21HBoB1
 HEFx3c3q4kyTFKGzzDxY6FhqsugJOrM7/mA9YmhD6JPLTg6UIccV3lJb3QWpYQZGE8fu
 Ftv03jG3gV1Pmj0nTXbvPW+isaH6YJ4ZOfIP7t6KGdoqFAkhD4n1Bv9Cd1n3RCQI7gmT
 DOnA==
X-Gm-Message-State: AOAM533KxkOv9l4IIKXSGMSMgiX5vXdY6Rp80+D4mvPisSNgR6HH/rr7
 8zwlEGSBz2mK0kGksO3Tx6Prx5cYx53yVIBnEIDSQG3SGqQ/6+c+bh32KdX7MONlg9Z2FeuiUGx
 KEPujUd3eQOHsPQvklKk1W1X6uxA3qGqj42DmvBKeULGU1YUIvAC2H+sthEGjbvhicgw=
X-Received: by 2002:adf:c54a:: with SMTP id s10mr2703911wrf.405.1631183629438; 
 Thu, 09 Sep 2021 03:33:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7RCa0i+nu4fk4GP9gNy06w6r/32Un8INqkE2PhvfPb03Pw3XFV532QwKvZtdclpO/HWUeWg==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr2703890wrf.405.1631183629198; 
 Thu, 09 Sep 2021 03:33:49 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id i20sm1250030wml.37.2021.09.09.03.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] multifd: Implement yank for multifd send side
Date: Thu,  9 Sep 2021 12:33:40 +0200
Message-Id: <20210909103346.1990-2-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


