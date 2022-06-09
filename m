Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64954548B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:00:16 +0200 (CEST)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNOB-0000Zh-0k
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzLJk-0000s1-5Q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzLJV-0006UR-V1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654793237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bQ8effnjIEoV/FflvyQHU5ECeV5iaJvsuveUZtQFyw=;
 b=RhF6KrdMTd2rbKqZeqqtPN5LFQd9+KUbflwavGEWkcQ/gfNfl6LNsOUAvNa16EFG7NSfQy
 XGIzoDYot4RDcZnfs6PPwXE5F8zxf69rYycuBIhuYThRYA/ezHwasH0zTYs1+ZMIdxb8Xq
 ArfvyyNTFWOB7hBIj9uvvIdZWatH3Ss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-aWbcqH1iPCOlAV3E_K5BWw-1; Thu, 09 Jun 2022 12:47:16 -0400
X-MC-Unique: aWbcqH1iPCOlAV3E_K5BWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B25F9294EDDB;
 Thu,  9 Jun 2022 16:47:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C7202166B26;
 Thu,  9 Jun 2022 16:47:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-stable@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 2/2] linux-aio: explain why max batch is checked in
 laio_io_unplug()
Date: Thu,  9 Jun 2022 17:47:12 +0100
Message-Id: <20220609164712.1539045-3-stefanha@redhat.com>
In-Reply-To: <20220609164712.1539045-1-stefanha@redhat.com>
References: <20220609164712.1539045-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It may not be obvious why laio_io_unplug() checks max batch. I discussed
this with Stefano and have added a comment summarizing the reason.

Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/linux-aio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/linux-aio.c b/block/linux-aio.c
index 6078da7e42..9c2393a2f7 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -365,6 +365,12 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
     assert(s->io_q.plugged);
     s->io_q.plugged--;
 
+    /*
+     * Why max batch checking is performed here:
+     * Another BDS may have queued requests with a higher dev_max_batch and
+     * therefore in_queue could now exceed our dev_max_batch. Re-check the max
+     * batch so we can honor our device's dev_max_batch.
+     */
     if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
         (!s->io_q.plugged &&
          !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
-- 
2.36.1


