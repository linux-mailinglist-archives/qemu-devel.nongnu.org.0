Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F736322F2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:01:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6OQ-0001X6-Lg; Mon, 21 Nov 2022 07:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OO-0001WT-4V
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OM-0006O1-9H
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669035557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgY27LzJ2uT9zxS51v2nfe7D++QJeM61SQkE9yjjQQ8=;
 b=JO2Wtx9enwAhuEZQ+OwCRDicSMu8EdkH79Fehi8LEvT8OxwNM+x95pfSSRsTPmlggIKd3n
 LYYErckINJJn2zN9ujBcZOHE70hEqs0c3guKvyXU+M+mu5s28PH/unyXeYtO7vNzPP75e3
 nILoBCiYt2wBy3lKEbD9EQPBDwMOVrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-7CThAzJtMSudgaeBtqyYUA-1; Mon, 21 Nov 2022 07:59:15 -0500
X-MC-Unique: 7CThAzJtMSudgaeBtqyYUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 770A8101A54E;
 Mon, 21 Nov 2022 12:59:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7722BC15BB3;
 Mon, 21 Nov 2022 12:59:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>
Subject: [PULL 1/8] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Date: Mon, 21 Nov 2022 13:59:00 +0100
Message-Id: <20221121125907.62469-2-quintela@redhat.com>
In-Reply-To: <20221121125907.62469-1-quintela@redhat.com>
References: <20221121125907.62469-1-quintela@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Fiona Ebner <f.ebner@proxmox.com>

in the error case. The documentation in include/io/channel.h states
that -1 or QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply
passing along the return value from the bdrv-functions has the
potential to confuse the call sides. Non-blocking mode is not
implemented currently, so -1 it is.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/channel-block.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/channel-block.c b/migration/channel-block.c
index c55c8c93ce..f4ab53acdb 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -62,7 +62,8 @@ qio_channel_block_readv(QIOChannel *ioc,
     qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
     ret = bdrv_readv_vmstate(bioc->bs, &qiov, bioc->offset);
     if (ret < 0) {
-        return ret;
+        error_setg_errno(errp, -ret, "bdrv_readv_vmstate failed");
+        return -1;
     }
 
     bioc->offset += qiov.size;
@@ -86,7 +87,8 @@ qio_channel_block_writev(QIOChannel *ioc,
     qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
     ret = bdrv_writev_vmstate(bioc->bs, &qiov, bioc->offset);
     if (ret < 0) {
-        return ret;
+        error_setg_errno(errp, -ret, "bdrv_writev_vmstate failed");
+        return -1;
     }
 
     bioc->offset += qiov.size;
-- 
2.38.1


