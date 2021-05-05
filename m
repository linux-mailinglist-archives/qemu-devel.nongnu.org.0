Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BD373AF6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:18:17 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGTm-0007G0-Vi
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leGOW-0004lH-Mi
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leGOT-0003es-N4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620216765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GXqylJnNq57AGchGlafIrxhk2gns7BoOXwNDgEbIeI=;
 b=IV5bRqVy9HxwE47eAY8p5+Ej3oiH2IlBEp43M2Ne1zn5ZS4T+a8y5PQg7QIZP7xPg7w2L0
 Pl4nXkt58nwUvoYh1b+e1OYxqhF4pGt2ICGLhCi0VPo+MMAmbBJZ5a1szDYM9Exmcwc3Ra
 CzthHQLj/h+P1NGYZ+oiyF7GnxvUUG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-yJGM_paxNKGO007JtB9hWA-1; Wed, 05 May 2021 08:12:40 -0400
X-MC-Unique: yJGM_paxNKGO007JtB9hWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAB651009628
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 12:12:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6F926062C;
 Wed,  5 May 2021 12:12:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] net/tap: fix FreeBSD portability problem receiving TAP FD
Date: Wed,  5 May 2021 13:12:35 +0100
Message-Id: <20210505121236.532755-2-berrange@redhat.com>
In-Reply-To: <20210505121236.532755-1-berrange@redhat.com>
References: <20210505121236.532755-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Jason Wang <jasowang@redhat.com>,
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


