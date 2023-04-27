Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12D6F0A07
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:38:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4aV-0005Eb-SL; Thu, 27 Apr 2023 12:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aS-0005D2-RN
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aO-0006iJ-GO
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1iUzXgl7Kpiayyw0jRzYGaGGHnXFr89XRU4iycxopk=;
 b=MLnN0BtSCpuCrvTvYsM8pON0c7gUueLG+jjxlQopi4m3n2z9ojo5E/uiccOGFYZ77ncXRo
 qMZJ4jt5kdZw/gq62lzWAuIsTL7jECvi6+H2d+AAu4lA0aQGiML7YEC+ClMQfStU4TNa56
 4oRTi8BE3EHN4m3oyC6hbO/2XqDZZ7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-IvjSvNmdPm-bvU8AKylXSg-1; Thu, 27 Apr 2023 12:35:09 -0400
X-MC-Unique: IvjSvNmdPm-bvU8AKylXSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E3238470BA
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:35:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF15F63F50;
 Thu, 27 Apr 2023 16:35:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 12/19] migration/rdma: It makes no sense to recive that flag
 without RDMA
Date: Thu, 27 Apr 2023 18:34:42 +0200
Message-Id: <20230427163449.27473-13-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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


