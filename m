Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FE4DCBF6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:01:41 +0100 (CET)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtVM-0006Q4-CM
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:01:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUtRi-0004IE-5V
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUtRf-0000q2-B4
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647536269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuTpc9wzUaRM469hcdVPxCZidnrCgKErNtY85S6pxq0=;
 b=TSh7Z+yR90xUyorhNNXxfgSBpncJ7yMOWiOpXGdy9iqp8NLVN9HIktu66EHf6y1RrN3lGT
 9RQuZ0nS3W/YNRCs74favq6fq9pYso41PoCPtbZ/ycYIXXAI59WbByivHKxl2gpZV/jgka
 Ucz74RpLOdPtwcArZY0eNICXDO6qPQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-5Gu3OrgyNGWtzG447oSBpg-1; Thu, 17 Mar 2022 12:57:47 -0400
X-MC-Unique: 5Gu3OrgyNGWtzG447oSBpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E766C18A6582;
 Thu, 17 Mar 2022 16:57:46 +0000 (UTC)
Received: from localhost (unknown [10.39.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA84C33AE3;
 Thu, 17 Mar 2022 16:57:46 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-7.0 1/2] aio-posix: fix build failure io_uring 2.2
Date: Thu, 17 Mar 2022 16:57:42 +0000
Message-Id: <20220317165743.238662-2-stefanha@redhat.com>
In-Reply-To: <20220317165743.238662-1-stefanha@redhat.com>
References: <20220317165743.238662-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Haiyue Wang <haiyue.wang@intel.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Haiyue Wang <haiyue.wang@intel.com>

The io_uring fixed "Don't truncate addr fields to 32-bit on 32-bit":
https://git.kernel.dk/cgit/liburing/commit/?id=d84c29b19ed0b130000619cff40141bb1fc3615b

This leads to build failure:
../util/fdmon-io_uring.c: In function ‘add_poll_remove_sqe’:
../util/fdmon-io_uring.c:182:36: error: passing argument 2 of ‘io_uring_prep_poll_remove’ makes integer from pointer without a cast [-Werror=int-conversion]
  182 |     io_uring_prep_poll_remove(sqe, node);
      |                                    ^~~~
      |                                    |
      |                                    AioHandler *
In file included from /root/io/qemu/include/block/aio.h:18,
                 from ../util/aio-posix.h:20,
                 from ../util/fdmon-io_uring.c:49:
/usr/include/liburing.h:415:17: note: expected ‘__u64’ {aka ‘long long unsigned int’} but argument is of type ‘AioHandler *’
  415 |           __u64 user_data)
      |           ~~~~~~^~~~~~~~~
cc1: all warnings being treated as errors

Use LIBURING_HAVE_DATA64 to check whether the io_uring supports 64-bit
variants of the get/set userdata, to convert the paramter to the right
data type.

Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
Message-Id: <20220221162401.45415-1-haiyue.wang@intel.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/fdmon-io_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
index 1461dfa407..ab43052dd7 100644
--- a/util/fdmon-io_uring.c
+++ b/util/fdmon-io_uring.c
@@ -179,7 +179,11 @@ static void add_poll_remove_sqe(AioContext *ctx, AioHandler *node)
 {
     struct io_uring_sqe *sqe = get_sqe(ctx);
 
+#ifdef LIBURING_HAVE_DATA64
+    io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)node);
+#else
     io_uring_prep_poll_remove(sqe, node);
+#endif
 }
 
 /* Add a timeout that self-cancels when another cqe becomes ready */
-- 
2.35.1


