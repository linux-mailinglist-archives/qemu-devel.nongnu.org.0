Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A76F09F2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:36:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4aY-0005Fl-Ir; Thu, 27 Apr 2023 12:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aX-0005FG-5a
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aV-0006ko-O8
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFVSz2sLMTWKc6+hkxmZlMqk9lYsjx+Z706drG9kI7I=;
 b=IHnJ+5C6sHMbIWjYb6KYGSOCECM4I8wXX3vGQQP3WqotvxnQEG3TW1wPaSUd14NPyfmwJx
 l6quyt56GW//6ZGnU3yS/oJwtDzNyS8NYqLpGBxPbhOXDaehkzVlhT4Icz/LQWxYvjrvgZ
 RQ+KiDZxg3ESUE58oWHXU+OV1w1GYRM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-gd23lQhFMKa1w-wkylOLGw-1; Thu, 27 Apr 2023 12:35:17 -0400
X-MC-Unique: gd23lQhFMKa1w-wkylOLGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E3A817079
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:35:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B919410DF8;
 Thu, 27 Apr 2023 16:35:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 13/19] migration: Make RAM_SAVE_FLAG_HOOK a normal case entry
Date: Thu, 27 Apr 2023 18:34:43 +0200
Message-Id: <20230427163449.27473-14-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Fixes this commit, clearly a bad merge after a rebase or similar, it
should have been its own case since that point.

commit 5b0e9dd46fbda5152566a4a26fd96bc0d0452bf7
Author: Peter Lieven <pl@kamp.de>
Date:   Tue Jun 24 11:32:36 2014 +0200

    migration: catch unknown flag combinations in ram_load

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a5109a0f77..67ba2d7f7e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4466,14 +4466,12 @@ static int ram_load_precopy(QEMUFile *f)
                 multifd_recv_sync_main();
             }
             break;
+        case RAM_SAVE_FLAG_HOOK:
+            ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
+            break;
         default:
-            if (flags & RAM_SAVE_FLAG_HOOK) {
-                ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
-            } else {
-                error_report("Unknown combination of migration flags: 0x%x",
-                             flags);
-                ret = -EINVAL;
-            }
+            error_report("Unknown combination of migration flags: 0x%x", flags);
+            ret = -EINVAL;
         }
         if (!ret) {
             ret = qemu_file_get_error(f);
-- 
2.40.0


