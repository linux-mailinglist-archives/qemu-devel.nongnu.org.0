Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026A6A75BB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTXI-0003j6-2q; Wed, 01 Mar 2023 15:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTXF-0003ec-Rb
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTXE-00042k-Gr
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQQslyk0CFxJfyjKuK+Q1w9UawRHB447WDiYX7wePso=;
 b=Q7tvNpBJ7hEeyw5CuB1cnpJggMWZS+T4GUIYEDqAk9P5vgirNXHW0W7IiwdRlz4PceCyMU
 5+0nEIdMxlKHKgvEoijMaW3qgsycEgUOgZoO1pnpQxxuJ7d5j35tisWTVWAope68C+VIVV
 n20mQtdVjlZjb7gphRrjy3kj2qImK54=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-WVYR6tm5MxaPEgX7xFwQGA-1; Wed, 01 Mar 2023 15:58:44 -0500
X-MC-Unique: WVYR6tm5MxaPEgX7xFwQGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F40F03C0D181;
 Wed,  1 Mar 2023 20:58:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4107740C6EC4;
 Wed,  1 Mar 2023 20:58:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 4/6] block: convert bdrv_drain_all_begin() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Wed,  1 Mar 2023 15:57:59 -0500
Message-Id: <20230301205801.2453491-5-stefanha@redhat.com>
In-Reply-To: <20230301205801.2453491-1-stefanha@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Since the AioContext argument was already NULL, AIO_WAIT_WHILE() was
never going to unlock the AioContext. Therefore it is possible to
replace AIO_WAIT_WHILE() with AIO_WAIT_WHILE_UNLOCKED().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 8974d46941..db438c7657 100644
--- a/block/io.c
+++ b/block/io.c
@@ -520,7 +520,7 @@ void bdrv_drain_all_begin(void)
     bdrv_drain_all_begin_nopoll();
 
     /* Now poll the in-flight requests */
-    AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
+    AIO_WAIT_WHILE_UNLOCKED(NULL, bdrv_drain_all_poll());
 
     while ((bs = bdrv_next_all_states(bs))) {
         bdrv_drain_assert_idle(bs);
-- 
2.39.2


