Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435D6E95AF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:20:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUBE-0001rX-Rl; Thu, 20 Apr 2023 09:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUB0-0001Zz-AW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAy-0005hK-Ll
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZcCockVh9iyRvZHm9M48mFzVhopmL1Xp8SDzX78a/4=;
 b=iC+8uasozSq680O//iTmFKloBXWFu2i9qrYOxYdEOL5lIGrvH15V8jXJNAZrxp7Wf59d9a
 2A/hcGLQTr9rvukZJ9LaA+QWmCY7ohJGLu46u7BJuqwrULg6SqDaQ7QphRjil9ADCgc5GU
 c5vCjRg860l7fOnbuFOdnbW0eIDrZGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-lushXsBkPSO6gXHOU5oHMA-1; Thu, 20 Apr 2023 09:18:13 -0400
X-MC-Unique: lushXsBkPSO6gXHOU5oHMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AB7E811E7B
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:18:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65B9BC16024;
 Thu, 20 Apr 2023 13:18:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 17/20] vl.c: Create late backends before migration object
Date: Thu, 20 Apr 2023 15:17:48 +0200
Message-Id: <20230420131751.28534-18-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The migration object may want to check against different types of memory
when initialized.  Delay the creation to be after late backends.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 softmmu/vl.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea20b23e4c..ad394b402f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3583,14 +3583,19 @@ void qemu_init(int argc, char **argv)
                      machine_class->name, machine_class->deprecation_reason);
     }
 
+    /*
+     * Create backends before creating migration objects, so that it can
+     * check against compatibilities on the backend memories (e.g. postcopy
+     * over memory-backend-file objects).
+     */
+    qemu_create_late_backends();
+
     /*
      * Note: creates a QOM object, must run only after global and
      * compat properties have been set up.
      */
     migration_object_init();
 
-    qemu_create_late_backends();
-
     /* parse features once if machine provides default cpu_type */
     current_machine->cpu_type = machine_class->default_cpu_type;
     if (cpu_option) {
-- 
2.39.2


