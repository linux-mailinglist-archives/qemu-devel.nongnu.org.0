Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE36EDAAE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 05:36:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr9Rl-000783-W6; Mon, 24 Apr 2023 23:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pr9Rf-00074t-9L
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 23:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pr9Ra-0000ZP-Fw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 23:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682393656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ml2zmFL1Fb1Yb0klJhmBURQBgb7Btb7D0qsdDV0M7w=;
 b=Y2NM6hzqVTOV9N3Opoekhpv97dQMaSYPZWVuZzhd1od2yPDoEX76gRiCzxb1uuaSKuQ83R
 n0L/HWWeXsHA2nZRxvIE6KqqFuAsUahF9rnqd+2uQyVOod2ZbMQ8NFONup6kf8X+3EdQ2r
 imZV2cGM3FxJctxdBTMWPHFAsWM9VFw=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-yHnqbuawNQqIrxQXeoeAuw-1; Mon, 24 Apr 2023 23:34:14 -0400
X-MC-Unique: yHnqbuawNQqIrxQXeoeAuw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1878471366eso1214523fac.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 20:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682393654; x=1684985654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ml2zmFL1Fb1Yb0klJhmBURQBgb7Btb7D0qsdDV0M7w=;
 b=I/WjHOsOa/5je4tePGc/f1y1UjtaOrddAjP4B1kYTJqtutQGigbzIUdvJJg+li4Q8L
 7ksDhM1/hvYIcRqlhp1BmJCn4ncZQBKZTKZdGoRW7tnG0towyH81pUjMA++pJ3j7rDch
 JquSXpeK/g3nGfPhhFdjsQZ62B13V8jNVDwLs2yz3rmhJZc2j7Z3zdtQEPPZF98n7GKd
 U/j38F7A88sJy+g4sQx8l5r6IlZj+zybxFuLWPUyqWgT3En5AJj2fEUjI4eOp8IvWSj9
 0tk84lLJ2PJt1Fh4OhBLpqOXp6DxQ72WWtId96OQeEdejxbDtQn3OA7l5C4m7SsUofEp
 Sojg==
X-Gm-Message-State: AAQBX9cWnC26fOrm1884g6bBNmfXZDKEb/B0xTAQpl38qppA2oC0Oa4f
 BYD83MyWRZZKeeY5YkybU4lI5FiSuxoLb6QdCNEBJtBNGyUqtWwOJ5q0/PVd3BmaI3zwCOyXmyT
 QzWvU56n0rEpaFzM=
X-Received: by 2002:a05:6870:3412:b0:184:433c:a175 with SMTP id
 g18-20020a056870341200b00184433ca175mr10028258oah.22.1682393653736; 
 Mon, 24 Apr 2023 20:34:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350axh4mUXvXX01+9VkB0W7sR5c2J+ugPgiwXHKi67Mzhea8nLsqvtRas6vxJFaRcaR9eGKQFqQ==
X-Received: by 2002:a05:6870:3412:b0:184:433c:a175 with SMTP id
 g18-20020a056870341200b00184433ca175mr10028255oah.22.1682393653479; 
 Mon, 24 Apr 2023 20:34:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:bb4a:9464:1a83:87df:7229])
 by smtp.gmail.com with ESMTPSA id
 26-20020a056870135a00b001765b2f6c53sm5174475oac.9.2023.04.24.20.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 20:34:12 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 1/1] migration: Disable postcopy + multifd migration
Date: Tue, 25 Apr 2023 00:33:08 -0300
Message-Id: <20230425033307.484921-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the introduction of multifd, it's possible to perform a multifd
migration and finish it using postcopy.

A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
a successful use of this migration scenario, and now thing should be
working on most scenarios.

But since there is not enough testing/support nor any reported users for
this scenario, we should disable this combination before it may cause any
problems for users.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
Changes since RFC:
- Updated to latest master branch
- Included Acks and Reviews

 migration/options.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/options.c b/migration/options.c
index 8e8753d9be..b0fc0aa60c 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -322,6 +322,11 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Postcopy is not yet compatible with multifd");
+            return false;
+        }
     }
 
     if (new_caps[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
-- 
2.40.0


