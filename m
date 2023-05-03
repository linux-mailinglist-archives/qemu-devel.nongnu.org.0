Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0096F58FC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:23:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCO4-0005TL-In; Wed, 03 May 2023 09:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNo-0005P6-2z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNm-0006kn-N6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1iUzXgl7Kpiayyw0jRzYGaGGHnXFr89XRU4iycxopk=;
 b=TUktmXx9lqHLotAaGJxu5glRcOAcCoKm/1EXWSIO+utF6FAqv+VTWES+gPydJLE2jlHOco
 6Gvh1CatxcyDw/v5FNTnTitaaoyJHBISGFdezi+9hbQL4UpkHl3/kX/UaeLTJJszcptjYR
 clKdNBiQ/VuRo7FsRA6kmL1bxM/Hdoc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-b_tAtNXWMqOEhPEi_Wea8w-1; Wed, 03 May 2023 09:18:56 -0400
X-MC-Unique: b_tAtNXWMqOEhPEi_Wea8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 866411C0A584
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:18:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDBF2C15BAD;
 Wed,  3 May 2023 13:18:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 07/16] migration/rdma: It makes no sense to recive that
 flag without RDMA
Date: Wed,  3 May 2023 15:18:38 +0200
Message-Id: <20230503131847.11603-8-quintela@redhat.com>
In-Reply-To: <20230503131847.11603-1-quintela@redhat.com>
References: <20230503131847.11603-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

This could only happen if the source send
RAM_SAVE_FLAG_HOOK (i.e. rdma) and destination don't have CONFIG_RDMA.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 9b5e14a2ef..014db96984 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -322,14 +322,6 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
         if (ret < 0) {
             qemu_file_set_error(f, ret);
         }
-    } else {
-        /*
-         * Hook is a hook specifically requested by the source sending a flag
-         * that expects there to be a hook on the destination.
-         */
-        if (flags == RAM_CONTROL_HOOK) {
-            qemu_file_set_error(f, -EINVAL);
-        }
     }
 }
 
-- 
2.40.0


