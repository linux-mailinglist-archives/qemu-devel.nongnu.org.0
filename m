Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0C6F6A5E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:46:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXOY-0004kG-HJ; Thu, 04 May 2023 07:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXOK-0004hX-E6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXOH-0004kz-Io
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMqgmGPC+Ly6hqQPKjkFgC6O1yvDeEvTc+sJp5y5Lts=;
 b=jV3DMwjbbyal6BWFW2VKzjOGvYAtA0zGdBmRnd6XCgHtVaS2/PpIzFtqXLVu9FyrIT4gwI
 MvS+YZbItRBR/OmGVeAk13CJjcWLNXWqxJCr8djPGY0BuLl7HGwGQf3oWNJXJPFrn4O8KS
 Lm5tm4/dgGc6tBF+BRaepXzEJ3Pcs/I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-qWEPhhGJMYy_fdaD5rYThw-1; Thu, 04 May 2023 07:44:47 -0400
X-MC-Unique: qWEPhhGJMYy_fdaD5rYThw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E9B1C04337
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 11:44:46 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3883A2026D16;
 Thu,  4 May 2023 11:44:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 2/5] migration/rdma: simplify ram_control_load_hook()
Date: Thu,  4 May 2023 13:44:40 +0200
Message-Id: <20230504114443.23891-3-quintela@redhat.com>
In-Reply-To: <20230504114443.23891-1-quintela@redhat.com>
References: <20230504114443.23891-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 309b4c56f4..112ba742fd 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -338,10 +338,8 @@ void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
 
 void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
 {
-    int ret = -EINVAL;
-
     if (f->hooks && f->hooks->hook_ram_load) {
-        ret = f->hooks->hook_ram_load(f, flags, data);
+        int ret = f->hooks->hook_ram_load(f, flags, data);
         if (ret < 0) {
             qemu_file_set_error(f, ret);
         }
@@ -351,7 +349,7 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
          * that expects there to be a hook on the destination.
          */
         if (flags == RAM_CONTROL_HOOK) {
-            qemu_file_set_error(f, ret);
+            qemu_file_set_error(f, -EINVAL);
         }
     }
 }
-- 
2.40.0


