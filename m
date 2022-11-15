Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E4629E50
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxyn-0005r9-83; Tue, 15 Nov 2022 10:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyD-0005f5-HN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:35:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyC-0008HD-2U
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgY27LzJ2uT9zxS51v2nfe7D++QJeM61SQkE9yjjQQ8=;
 b=edgrsMRDn2B/9Hun5hHmEPeDcm0Lg7e3yN2vrw7l1tPDfeWZOaEBDK9vmVAQveUJDAGjc9
 Ni6Hoq/xlV/vTvenn2n3F5RhLG9eopa3qmrlAxnX3aQB/KN7uOPSCdYzvwRIGHG0ZlQ2Ph
 +SYpHJteY5JtbygAJ8Umk8iYjD6psss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-sy6U164IPfO3nmut4nREvg-1; Tue, 15 Nov 2022 10:35:24 -0500
X-MC-Unique: sy6U164IPfO3nmut4nREvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA5DA857F92;
 Tue, 15 Nov 2022 15:35:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD0292166B2C;
 Tue, 15 Nov 2022 15:35:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>
Subject: [PULL 01/30] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Date: Tue, 15 Nov 2022 16:34:45 +0100
Message-Id: <20221115153514.28003-2-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


