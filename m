Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D996A75A9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:58:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTX1-0003Nq-HR; Wed, 01 Mar 2023 15:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTX0-0003LV-4P
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTWy-0003zZ-OI
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdGb5Ls2u5U36PxIozwXUuHqm0B9xfiL5iWE7YMkha8=;
 b=Tk3mwH7kTvemVHtFR5smjNUCWU4Zb7VsHQiMJAJEmf00I6zwNLfAOjtdXiRh4VONwTUOwg
 o8PnPyWOsDKK6wITEH+UShAL8gCb/aYScuBNTKC7pf5RVP4bY3KhtvUbQoEuIlcgtlC/cf
 gzK9kEwgdUuYsIiciP3/qgGvunSSAXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-rB75_74tPkWgzvltuna-ig-1; Wed, 01 Mar 2023 15:58:29 -0500
X-MC-Unique: rB75_74tPkWgzvltuna-ig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C83D3C0D181;
 Wed,  1 Mar 2023 20:58:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B288492C14;
 Wed,  1 Mar 2023 20:58:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Wed,  1 Mar 2023 15:57:57 -0500
Message-Id: <20230301205801.2453491-3-stefanha@redhat.com>
In-Reply-To: <20230301205801.2453491-1-stefanha@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

There is no change in behavior. Switch to AIO_WAIT_WHILE_UNLOCKED()
instead of AIO_WAIT_WHILE() to document that this code has already been
audited and converted. The AioContext argument is already NULL so
aio_context_release() is never called anyway.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/export.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/export/export.c b/block/export/export.c
index 28a91c9c42..e3fee60611 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -306,7 +306,7 @@ void blk_exp_close_all_type(BlockExportType type)
         blk_exp_request_shutdown(exp);
     }
 
-    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
+    AIO_WAIT_WHILE_UNLOCKED(NULL, blk_exp_has_type(type));
 }
 
 void blk_exp_close_all(void)
-- 
2.39.2


