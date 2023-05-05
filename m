Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29656F7A29
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:50:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujco-0004Dv-AT; Thu, 04 May 2023 20:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcl-0004DO-JE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcj-0001HQ-8E
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqkCIzdJ0odmZAUF7wqjNnZetGlQIu+d7qF0paaVt5Q=;
 b=TWI/Esz7OH3qJWo2Y0HkXNyo7Az8wUgh0ehrEPPuWApKFuyX6gujV6nnDOsP1bNNmxLeAI
 vv76JfJnL/z2q70R5LvgpaKLmh/fZL9EAdO+ZIav+Kfw8Jzhhq+nwh4aq/kbde+lq55Ndk
 lnpkSElj9AtGidNkrVl5UXLw1EyVW9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-ETeIKUFLNFio7JSO2BOgvw-1; Thu, 04 May 2023 20:48:35 -0400
X-MC-Unique: ETeIKUFLNFio7JSO2BOgvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A851785D536;
 Fri,  5 May 2023 00:48:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7558404B24D;
 Fri,  5 May 2023 00:48:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 09/16] migration/rdma: It makes no sense to recive that flag
 without RDMA
Date: Fri,  5 May 2023 02:48:05 +0200
Message-Id: <20230505004812.31583-10-quintela@redhat.com>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

This could only happen if the source sent
RAM_SAVE_FLAG_HOOK (i.e. rdma) and destination don't have CONFIG_RDMA.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230504114443.23891-5-quintela@redhat.com>
---
 migration/qemu-file.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index b7afc8d498..578b6309ba 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -345,14 +345,6 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
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


