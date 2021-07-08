Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA63C19B8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:19:04 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZY7-0003vt-3H
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMl-0000E0-Pz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMX-0003xN-I6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BRbjQuT8HNr96LXHFpVqSFo2IEK25bz2jMcYUh5Y74=;
 b=X3wNC/Uxk81A55s037aY/gmd33nD89RIKYx18rw/rMwHCF7RG1ugZDrk4eMgdZjnraNFQc
 Gd67h1S2cPm76zJUXhGAtHYW6B05huCG3lBjI0Z/mh07VrzexDB6mzsQuI5rWMGjGI2IV+
 A2UsBF4Qfo86/wTApBUaK9dXMnT1qKs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-LX6spscpMBqZOE3V-bKlUA-1; Thu, 08 Jul 2021 15:07:02 -0400
X-MC-Unique: LX6spscpMBqZOE3V-bKlUA-1
Received: by mail-qk1-f199.google.com with SMTP id
 a6-20020a37b1060000b02903b488f9d348so4546747qkf.20
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BRbjQuT8HNr96LXHFpVqSFo2IEK25bz2jMcYUh5Y74=;
 b=rtq3QNeS4H5Eqp5CO8WODr1Z6GeCjtcI1t1dK0EXQ82pdATZVdwsIoIsLE0N3oDY7F
 w2jTHtCQ/LboaijDtkqBECQUK9eJ+q9lUAlVp4/992f1lX3MCMWZ2rbwPYh8fZAXinqV
 KrLJMnfbR/kcuI+bmj+yK/MKjlPGm7jZv8wdOWNSLPJ+DmbhJ/o6AKvPvVi0FulVmKuq
 Re+XCgRfP/p06/4ZZ7RrFUJA9bPBagXhb2K9R+hzCT8nJeo4W63kG9ZmHsWaWXysog4b
 Op6tSJdSjI50T7fPWhJHenrZTBq0TtTnY2sA6oULIkRqLqivjFpiwBSKWKtOEgZFtCWA
 +LuA==
X-Gm-Message-State: AOAM532XxgsJbYowHiGg9S/RrX3iKlUlVcgmY3nwPy0RrbtQ+ZBgK4dQ
 MXqrgQBQfegz/axlTpediWO4+lwrMiDwKmd9Eb1VYBSO7jAOFOlOfbKL49M016oi+U7zQ6AGGhj
 PZlC/HfGjLZcKRrI1yqnImVP8SkGLwoT51Frbvxi/wCegD5674Dp5EmPGXCCXO00z
X-Received: by 2002:ad4:4150:: with SMTP id z16mr7558652qvp.39.1625771222010; 
 Thu, 08 Jul 2021 12:07:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywgXhywl2J2ZjDzq1orYnVuO0VR2RJKIt1R8olDfdvqhEaMEiLYKZn7CnRh0MaX/P+findAw==
X-Received: by 2002:ad4:4150:: with SMTP id z16mr7558628qvp.39.1625771221762; 
 Thu, 08 Jul 2021 12:07:01 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v15sm1430976qkp.96.2021.07.08.12.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:07:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] migration: Clear error at entry of migrate_fd_connect()
Date: Thu,  8 Jul 2021 15:06:53 -0400
Message-Id: <20210708190653.252961-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708190653.252961-1-peterx@redhat.com>
References: <20210708190653.252961-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For each "migrate" command, remember to clear the s->error before going on.
For one reason, when there's a new error it'll be still remembered; see
migrate_set_error() who only sets the error if error==NULL.  Meanwhile if a
failed migration completes (e.g., postcopy recovered and finished), we
shouldn't dump an error when calling migrate_fd_cleanup() at last.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index bb1edf862a..338df01e97 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1855,6 +1855,15 @@ void migrate_set_error(MigrationState *s, const Error *error)
     }
 }
 
+static void migrate_error_free(MigrationState *s)
+{
+    QEMU_LOCK_GUARD(&s->error_mutex);
+    if (s->error) {
+        error_free(s->error);
+        s->error = NULL;
+    }
+}
+
 void migrate_fd_error(MigrationState *s, const Error *error)
 {
     trace_migrate_fd_error(error_get_pretty(error));
@@ -3966,6 +3975,13 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     int64_t rate_limit;
     bool resume = s->state == MIGRATION_STATUS_POSTCOPY_PAUSED;
 
+    /*
+     * If there's a previous error, free it and prepare for another one.
+     * Meanwhile if migration completes successfully, there won't have an error
+     * dumped when calling migrate_fd_cleanup().
+     */
+    migrate_error_free(s);
+
     s->expected_downtime = s->parameters.downtime_limit;
     if (resume) {
         assert(s->cleanup_bh);
-- 
2.31.1


