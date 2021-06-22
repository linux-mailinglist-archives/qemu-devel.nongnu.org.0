Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27E3B05A6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:14:22 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgEL-0004vN-6k
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1lvWMZ-000801-Qp
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 22:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1lvWMU-0002te-MD
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 22:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624329719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hVJr9SQTDmHR6djYwZthesP9hgEWA7HdIBLFtYrN2xs=;
 b=aOH4PXpYmrpUBS8lF2f2xB9ru7yJmvCzSzw2htqp6avZFKEXtG1B75Kg6hbvo+OsmpTkoV
 r7gppqViIEZl9QNqRmdozS6w/KUCxOf55zupW/wdf+evrwtmThMovshhLF8NEc+MTIbgx9
 XZ5O8U3TODXYY+XzQ56U1uJBpwFY0mc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-Ck_3BJcRPgiLGfhFjCTDUg-1; Mon, 21 Jun 2021 22:41:58 -0400
X-MC-Unique: Ck_3BJcRPgiLGfhFjCTDUg-1
Received: by mail-qk1-f198.google.com with SMTP id
 81-20020a370e540000b02903aacdbd70b7so16276775qko.23
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 19:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVJr9SQTDmHR6djYwZthesP9hgEWA7HdIBLFtYrN2xs=;
 b=SzNDap/KfIKZPZuhxPwlg3bnRbiCJnHlrSMkd85FwAwH6xr+McQvEiLmWGZf5vAjrx
 ci8yO7CGMYHda+NUQl/r1+HmFX/tjgejTmbwvEIRDU8SaNbH7pS/FD6RqwbRf8siaoy2
 2C6MnpC8bszuJBpKo/p9dI+AUttjO13IIVjX03d5mxSlFyhlcsbJ4ks9TlVqwOvWYu5c
 CgtpIbsKc2mkuU9+8ZAMNZaWDFsXeKwXbyRcOncO7pAVxO708tDnl83Odud1Z75p/FYz
 CbtTI2uWl2nVY1WvR6BfkzD4HSDeftCeIcL1vsIm4lP5g1utcQLA/BatWNUIjlOEfJdf
 mp6A==
X-Gm-Message-State: AOAM533cEsC0Un2l7QXxF8aQjRqtHkYmkZ3LigV+gUu+00dvCKAzr+n+
 1wotMTcJMOHMYErLf+PtYGG0yBsh7Ih25PLsjB9q5CZBje5lqAaRxjXFy0Vk8405LFBkC4vm54Y
 irLUhP/GyxIxPoho=
X-Received: by 2002:a05:6214:4b:: with SMTP id
 c11mr16080213qvr.18.1624329717782; 
 Mon, 21 Jun 2021 19:41:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi+e3Tbbr49IEBDDwwqVzG4zgZJhWbCf2MBFbJgXyWeRdcxVOvYgM/Yho3yKakMrAxJQ1kbA==
X-Received: by 2002:a05:6214:4b:: with SMTP id
 c11mr16080205qvr.18.1624329717643; 
 Mon, 21 Jun 2021 19:41:57 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:87bb::1001])
 by smtp.gmail.com with ESMTPSA id bm15sm10862434qkb.76.2021.06.21.19.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 19:41:57 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 1/1] migration: Unregister yank if migration setup fails
Date: Mon, 21 Jun 2021 23:42:36 -0300
Message-Id: <20210622024236.600347-1-leobras@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Jun 2021 09:12:36 -0400
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, if a qemu instance is started with "-incoming defer" and
an incorect parameter is passed to "migrate_incoming", it will print the
expected error and reply with "duplicate yank instance" for any upcoming
"migrate_incoming" command.

This renders current qemu process unusable, and requires a new qemu
process to be started before accepting a migration.

This is caused by a yank_register_instance() that happens in
qemu_start_incoming_migration() but is never reverted if any error
happens.

Solves this by unregistering the instance if anything goes wrong
in the function, allowing a new "migrate_incoming" command to be
accepted.

Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1974366
Signed-off-by: Leonardo Bras <leobras@redhat.com>

---
 migration/migration.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635d18..ddcf9e1868 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -474,9 +474,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
-        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
+
+    if (*errp) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+    }
+
 }
 
 static void process_incoming_migration_bh(void *opaque)
-- 
2.32.0


