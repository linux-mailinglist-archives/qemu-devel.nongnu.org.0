Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADF569D2F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:24:04 +0200 (CEST)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Mnr-0001oE-5o
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9Md8-00070r-5W
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9Md6-0007mW-G6
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657181574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a93GsxKY0muqBL+LWACkxxKWKt6MOUdxYh8WkWccbl0=;
 b=SSJusMyGe3fEyntP7IXAHs96Fb8m/pTXNJUjEP8h8AcsQsFhvps0eA10IFLfr/WL30PHbQ
 UXGwGHCJtmNoukVn6GeequV/DiTJY0HYtAVyme/WFWPVZJZxSzcpGzl7yuWlXOCMzUCMkt
 rb82+eYPYp7Py4WS9E7WdbQhNg0l9mQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-t9TKhChxPEWPLJRC6KU_5A-1; Thu, 07 Jul 2022 04:12:51 -0400
X-MC-Unique: t9TKhChxPEWPLJRC6KU_5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ACCF8339A4;
 Thu,  7 Jul 2022 08:12:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1453C27D9A;
 Thu,  7 Jul 2022 08:12:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PULL 1/2] io_uring: fix short read slow path
Date: Thu,  7 Jul 2022 09:12:46 +0100
Message-Id: <20220707081247.1416955-2-stefanha@redhat.com>
In-Reply-To: <20220707081247.1416955-1-stefanha@redhat.com>
References: <20220707081247.1416955-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Dominique Martinet <dominique.martinet@atmark-techno.com>

sqeq.off here is the offset to read within the disk image, so obviously
not 'nread' (the amount we just read), but as the author meant to write
its current value incremented by the amount we just read.

Normally recent versions of linux will not issue short reads,
but it can happen so we should fix this.

This lead to weird image corruptions when short read happened

Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
Message-Id: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index d48e472e74..b238661740 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -89,7 +89,7 @@ static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
     trace_luring_resubmit_short_read(s, luringcb, nread);
 
     /* Update read position */
-    luringcb->total_read = nread;
+    luringcb->total_read += nread;
     remaining = luringcb->qiov->size - luringcb->total_read;
 
     /* Shorten qiov */
@@ -103,7 +103,7 @@ static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
                       remaining);
 
     /* Update sqe */
-    luringcb->sqeq.off = nread;
+    luringcb->sqeq.off += nread;
     luringcb->sqeq.addr = (__u64)(uintptr_t)luringcb->resubmit_qiov.iov;
     luringcb->sqeq.len = luringcb->resubmit_qiov.niov;
 
-- 
2.36.1


