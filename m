Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B837C537
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:38:58 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqwr-0008Tn-MT
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqv1-0006Me-BB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgquz-0003ZZ-Pb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620833821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWJ5jwhKRKM4dPmzEgfCr0owtOZEAzvwL7BVTs36R7o=;
 b=eK+YHLSrj8wLJt8E62Ar7BmH2MnP215v11Y/eFAeA5EhmO75OMemw9ISCDXVVUzfDMLJ9k
 2tmeD2Hxd5vUoZdJufa+R5UAevbJmQAzBMdVtID6yM7rT9TizV7g6gbOraZfe4Jlu7ro58
 MfbIQ3mNxW33NemDvJKSb0ww3Q0dZ54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-wSLHC3z8NsGXjEE09ofriQ-1; Wed, 12 May 2021 11:36:59 -0400
X-MC-Unique: wSLHC3z8NsGXjEE09ofriQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD5B3107ACCA
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:36:57 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-167.ams2.redhat.com
 [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 948A26091A;
 Wed, 12 May 2021 15:36:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] net/tap: fix FreeBSD portability problem receiving TAP
 FD
Date: Wed, 12 May 2021 16:36:53 +0100
Message-Id: <20210512153654.1178035-2-berrange@redhat.com>
In-Reply-To: <20210512153654.1178035-1-berrange@redhat.com>
References: <20210512153654.1178035-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Connor Kuehl <ckuehl@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CMSG_LEN and CMSG_SPACE macros must not be assumed to return the
same value. The msg_controllen field must be initialized using
CMSG_SPACE when using SCM_RIGHTS.

This ought to fix any FD receive issues users might be hitting on
64-bit FeeBSD / NetBSD platforms. The flaw was noticed first in
GNULIB

   https://lists.gnu.org/archive/html/bug-gnulib/2021-02/msg00066.html

and QEMU's code has the same logic bug.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 net/tap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index bae895e287..276a9077fc 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -467,7 +467,7 @@ static int recv_fd(int c)
     cmsg->cmsg_level = SOL_SOCKET;
     cmsg->cmsg_type = SCM_RIGHTS;
     cmsg->cmsg_len = CMSG_LEN(sizeof(fd));
-    msg.msg_controllen = cmsg->cmsg_len;
+    msg.msg_controllen = CMSG_SPACE(sizeof(fd));
 
     iov.iov_base = req;
     iov.iov_len = sizeof(req);
-- 
2.31.1


