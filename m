Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBC2557F1D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:58:25 +0200 (CEST)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PDs-00057L-Ey
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o4P9C-0005Nm-Ou
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o4P9B-00051T-7A
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655999612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MlTygAlGsJIgiYxXp/eG49Z5SAgVD4PVZHzb4l6wTo=;
 b=CDqzJbRAiBOJSykMsC3j6/Dp6n81ETsFfpw5NVHmgHBciUbcABxQmj4cngc4/BnVBYZxs1
 E+LfPImu1ZzqOCW+4Rnk/BsCQ1btFdPHTGSwKmgOyQLAPim8/YXmxEh8PYj+AqLnL9ErkC
 4OL1bfJhSWfJreTe0LRs3TCd9rWcbd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-hAN11MgtPsq86qG51QIkZw-1; Thu, 23 Jun 2022 11:53:31 -0400
X-MC-Unique: hAN11MgtPsq86qG51QIkZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7C26185A7B2
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 15:53:30 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FB6FC2811A;
 Thu, 23 Jun 2022 15:53:29 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 05/11] net: stream: Don't ignore EINVAL on netdev
 socket connection
Date: Thu, 23 Jun 2022 17:53:11 +0200
Message-Id: <20220623155317.675932-6-lvivier@redhat.com>
In-Reply-To: <20220623155317.675932-1-lvivier@redhat.com>
References: <20220623155317.675932-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Brivio <sbrivio@redhat.com>

Other errors are treated as failure by net_stream_client_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
[lvivier: applied to net/stream.c]
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 net/stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 0d012ed8f785..d991fe3ac2b9 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -366,8 +366,7 @@ static int net_stream_client_init(NetClientState *peer,
                 if (errno == EINTR || errno == EWOULDBLOCK) {
                     /* continue */
                 } else if (errno == EINPROGRESS ||
-                           errno == EALREADY ||
-                           errno == EINVAL) {
+                           errno == EALREADY) {
                     break;
                 } else {
                     error_setg_errno(errp, errno, "can't connect socket");
-- 
2.36.1


