Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972573B6DD7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:14:23 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly64k-0006ZH-95
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1ly63h-0005tV-L0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1ly63d-0000Ua-Vz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624943591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ibmgnjtn7ThaSbwa8fEDVkjmsL+IvYd9N6FqySkPErE=;
 b=POrpbYkwPYFh+YKROPEtxynUTBXH2QBK9mpurvm1U/ZpO9B/HSEn9Cwj4UJ/7MAbC4lu9w
 5L475vN0QD/4TfztARjn4DCGrD3S9xPPuIZ6IBrtclmqCeVfsukMmAHNYuzf0+ERXkTlCO
 stZDUxQrGkqZYY6Kqd2ScK0LYraduAA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-pKojP6LWPXCta071AQu9AQ-1; Tue, 29 Jun 2021 01:13:10 -0400
X-MC-Unique: pKojP6LWPXCta071AQu9AQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 d1-20020a17090ae281b0290170ba1f9948so805845pjz.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 22:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ibmgnjtn7ThaSbwa8fEDVkjmsL+IvYd9N6FqySkPErE=;
 b=E0Lgukx8JwSQE9XwjvnwPq1qz2lbEQS+8zn07FjH/cI+U+w8/ghPIq+4bg0nOvPoTm
 e56jExdfQqwwHb9y4lH554g9RdiRIva0KEeAUexhYoPHDjtygPyf0SS+YVMf7uvbzDhw
 MEkDO4RIq5xNmTnqq/BBugckgii6fPEbBuKDwCi679b1ivuzd+7GMF3iMJxBHHBDw26o
 IwqBbMVfyake5q0CcRZrZ/OEu2W8o4i9MBkSzm5mBXP2Us/fj/BzCBEncaHPH/OC3BFx
 KCJ6KlWA54rFAxcI0ljXaqj8dfbXhtYUqFHxOlPS8t1+TP/tjBLkWVh5VfamrNV9mCS8
 d8yw==
X-Gm-Message-State: AOAM533xEgcjjhS1S1yNLUoIa9b+5UwXZWu2gVsnoxdCkGiIxxw/Wl1k
 RMF+/kkm/m7Zd8tsD79IxDcM3+w71J0o5HHzsZGyZPAjph3AXDzN5MB4cwK8kkzN+AZ/+OXG8Ov
 5BXtrdy3LzX21I8s=
X-Received: by 2002:a62:2646:0:b029:2fe:f613:5e39 with SMTP id
 m67-20020a6226460000b02902fef6135e39mr28092704pfm.78.1624943589060; 
 Mon, 28 Jun 2021 22:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVyReh0o/5MpLkE2aYR/1PhcgjOrZ2tE97XT1oeKG4AV6jgBmm5axriLOSqxeYVLFw7jQYDQ==
X-Received: by 2002:a62:2646:0:b029:2fe:f613:5e39 with SMTP id
 m67-20020a6226460000b02902fef6135e39mr28092685pfm.78.1624943588841; 
 Mon, 28 Jun 2021 22:13:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:87bb::1000])
 by smtp.gmail.com with ESMTPSA id g16sm17107336pgl.22.2021.06.28.22.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 22:13:08 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 1/1] migration: Unregister yank if migration setup fails
Date: Tue, 29 Jun 2021 02:05:23 -0300
Message-Id: <20210629050522.147057-1-leobras@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reviewed-by: Peter Xu <peterx@redhat.com>

---
Changes since v1:
 - Add ERRP_GUARD() at the beginning of the function, so it deals with
   errp passed as NULL, and does correct error propagation.
---
 migration/migration.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635d18..af0c72609f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -454,6 +454,7 @@ void migrate_add_address(SocketAddress *address)
 
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
+    ERRP_GUARD();
     const char *p = NULL;
 
     if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
@@ -474,9 +475,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
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


