Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA836F027D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwxO-0001LT-E2; Thu, 27 Apr 2023 04:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwxJ-0001L3-P2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwxH-0001IT-Am
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoK20VJYECljxZGu5SogV8Sm4YAvjCko+hnBoo3d0K8=;
 b=LrzI7qUIjNz+8O5xjm8/WpAfzf4z/MVchPiOmGFKyRxGs9rayLgSSSBJ4tHWReKcams9X0
 QLPAwUqBgX3RwlshM0odHFgHIlKNmUnZWff+RGcxioLwWZhuHX5DeS/6Zzyakw5IXUmmD9
 dNttb3O+ajijaeZan0diTvIhDsx/3fY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-lnEw1GlhPTuoep3JDMpo_A-1; Thu, 27 Apr 2023 04:26:11 -0400
X-MC-Unique: lnEw1GlhPTuoep3JDMpo_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168FA3C10C6F
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:26:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0742C15BA0;
 Thu, 27 Apr 2023 08:26:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 7/7] vmstate-static-checker: Recognize "num" field
Date: Thu, 27 Apr 2023 10:25:57 +0200
Message-Id: <20230427082557.20994-8-quintela@redhat.com>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Peter Xu <peterx@redhat.com>

Recognize this field for VMS_ARRAY typed vmsd fields, then we can do proper
size matching with previous patch.

Note that this is compatible with old -dump-vmstate output, because when
"num" is not there we'll still use the old "size" only.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 scripts/vmstate-static-checker.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
index dfeee8231a..9c0e6b81f2 100755
--- a/scripts/vmstate-static-checker.py
+++ b/scripts/vmstate-static-checker.py
@@ -134,6 +134,11 @@ def exists_in_substruct(fields, item):
     return check_fields_match(fields["Description"]["name"],
                               substruct_fields[0]["field"], item)
 
+def size_total(entry):
+    size = entry["size"]
+    if "num" not in entry:
+        return size
+    return size * entry["num"]
 
 def check_fields(src_fields, dest_fields, desc, sec):
     # This function checks for all the fields in a section.  If some
@@ -249,17 +254,19 @@ def check_fields(src_fields, dest_fields, desc, sec):
                 continue
 
             if s_item["field"] == "unused" or d_item["field"] == "unused":
-                if s_item["size"] == d_item["size"]:
+                s_size = size_total(s_item)
+                d_size = size_total(d_item)
+                if s_size == d_size:
                     continue
 
                 if d_item["field"] == "unused":
                     advance_dest = False
-                    unused_count = d_item["size"] - s_item["size"]
+                    unused_count = d_size - s_size;
                     continue
 
                 if s_item["field"] == "unused":
                     advance_src = False
-                    unused_count = s_item["size"] - d_item["size"]
+                    unused_count = s_size - d_size
                     continue
 
             print("Section \"" + sec + "\",", end=' ')
-- 
2.40.0


