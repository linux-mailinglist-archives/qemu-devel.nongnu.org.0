Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F841569DF6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:49:37 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NCZ-0001dB-V0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9Md9-00073x-Gu
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:12:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9Md7-0007mh-6Q
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657181576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeBTMnW6x9bRaOSbJPDaYLuExUX3ZycHGAAA/UaTC6g=;
 b=YNnDxYQmcqGWdZenX6MA4V6r2FXPbrzMy2L7UcNGopoKiicepa9NKhXXxcKv6we2Gj+RLw
 tU0C5A/Wen5E7kFqSeBNDWq1qp4T+0hUSR4nQYQKwMxklSOpLPE6Y5EDjwa+QPqm3hLNhK
 eu2gSkxrnTBHlspLkDbfbVfSna9gv+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-kq8dt6QqMUKZXNj_4JQgJQ-1; Thu, 07 Jul 2022 04:12:53 -0400
X-MC-Unique: kq8dt6QqMUKZXNj_4JQgJQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D25D43826A41;
 Thu,  7 Jul 2022 08:12:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F755401E6B;
 Thu,  7 Jul 2022 08:12:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PULL 2/2] block/io_uring: clarify that short reads can happen
Date: Thu,  7 Jul 2022 09:12:47 +0100
Message-Id: <20220707081247.1416955-3-stefanha@redhat.com>
In-Reply-To: <20220707081247.1416955-1-stefanha@redhat.com>
References: <20220707081247.1416955-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Jens Axboe has confirmed that short reads are rare but can happen:
https://lore.kernel.org/io-uring/YsU%2FCGkl9ZXUI+Tj@stefanha-x1.localdomain/T/#m729963dc577d709b709c191922e98ec79d7eef54

The luring_resubmit_short_read() comment claimed they were only due to a
specific io_uring bug that was fixed in Linux commit 9d93a3f5a0c
("io_uring: punt short reads to async context"), which is wrong.
Dominique Martinet found that a btrfs bug also causes short reads. There
may be more kernel code paths that result in short reads.

Let's consider short reads fair game.

Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>
Based-on: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20220706080341.1206476-1-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io_uring.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index b238661740..f8a19fd97f 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -73,12 +73,8 @@ static void luring_resubmit(LuringState *s, LuringAIOCB *luringcb)
 /**
  * luring_resubmit_short_read:
  *
- * Before Linux commit 9d93a3f5a0c ("io_uring: punt short reads to async
- * context") a buffered I/O request with the start of the file range in the
- * page cache could result in a short read.  Applications need to resubmit the
- * remaining read request.
- *
- * This is a slow path but recent kernels never take it.
+ * Short reads are rare but may occur. The remaining read request needs to be
+ * resubmitted.
  */
 static void luring_resubmit_short_read(LuringState *s, LuringAIOCB *luringcb,
                                        int nread)
-- 
2.36.1


