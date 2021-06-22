Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849753AFB6F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 05:39:39 +0200 (CEST)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvXGE-0000hY-Gw
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 23:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lvXFR-0008SW-5U
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 23:38:49 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lvXFP-0006vd-GC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 23:38:48 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id y4so722673qvs.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 20:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bgHyMr/4sufs/u7gJ0MixUqZkROR0DVyOZiBPUGUjxo=;
 b=JdBoyKNWQK8demiedJ+pXH8UBn0ppy/0ol4CLE38bT5U/0ctqb9K+5e4UeR2bisBsK
 LeoEy+AY4O2qqjChi7Wb8O7X5FyzNbKTw2au1r3ZGzSLcdSI6AYmqiMXBuHvHNY8rKEH
 AtOdY7NhCNutzB7MLsrFnQbeXZ2Rv/p0yWZCFp++h1XhZRn559AqtWQucaTbLkULcKvd
 aljJqi7qsDVYaesL2WadVqw2tBqGHGuT1w8JwmBxjL2ZAhV0UEW7kkxrrLIBkbB28wbA
 TLYq6pObElgea4ndWfO8mIyZ4GXUjZgXwnzTskI30OeNEBjS4NUPUeyynhtiM1TCZKhw
 hTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bgHyMr/4sufs/u7gJ0MixUqZkROR0DVyOZiBPUGUjxo=;
 b=cq+OW/3K3SJ7KWU9Y66JpR0EqWHm1G8xi/078TUJG244QRQDRMbx2CVq+bw1ATin9Z
 B+bi18Vv4vTMbm+Xu8nppNUhBf6SENeH2LHBQxdwkIm5C22/h6YOxz15cbXjKV99gjXh
 DRxvq06Ltac+7pL/FnzyADmdfPrCB3C/vLU/H9IwgyN2S/3+UFPU9HR8MKj+JfRefBo3
 7ZtGbKlbNZVP1bfAm8dibsurkumfcP4zqO72H5bX+rbyTyZhU2d1Pfq3OdVXA2DxFGHP
 Cp8CkT5R+Ab8WN/KELfpXfS35kxVOgPBWKn4xWah8FDjDCy/sqJbnWeoSI/84WU+QAKe
 iZeA==
X-Gm-Message-State: AOAM530zgkDWA9Wnfgln0vvAL+yz3G3Qj5eeheqfa053CJW775AKAtLH
 m+S+vCjEYO8ze9hr9TFXRPo=
X-Google-Smtp-Source: ABdhPJx1wbiAu7xvqtBz7lxwCHmhl1CtH//5QcGIaEKtzgY4bIvV8/eC6RjBYViVS1GoxN6bzDRNrA==
X-Received: by 2002:a0c:80c1:: with SMTP id 59mr23544984qvb.31.1624333125957; 
 Mon, 21 Jun 2021 20:38:45 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:87bb::1001])
 by smtp.gmail.com with ESMTPSA id k7sm11669905qke.65.2021.06.21.20.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 20:38:45 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 1/1] migration: Unregister yank if migration setup fails
Date: Tue, 22 Jun 2021 00:38:46 -0300
Message-Id: <20210622033845.603512-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=leobras.c@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras.c@gmail.com>, qemu-devel@nongnu.org
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
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

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


