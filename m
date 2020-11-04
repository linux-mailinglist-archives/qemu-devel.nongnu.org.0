Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E22A6707
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 16:03:57 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaKKK-0004j1-A0
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 10:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaKIZ-00030K-6D
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaKIV-00062A-2U
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604502122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9BEGm1Q4og47egWEYDjCc+t61kdD3EHCWAUPII/OKE=;
 b=FZP0UJYW2RWg7bCOGg5yzqpInXJ7U3C07otTLkzcoDw/kFwg8t9vljweJZ/8kR3FiRvBB1
 DbMw01aXxDND2Yokgx5EgIkfd+tVd8SXnVQlY9jN7qfmINRz+TJkVrnzpmt8rN2dWi9Bss
 iO2LIVR2ICo1hjDu18uW36z4bnxzJ3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-GclS-hlAOK2L56vyoRdFJA-1; Wed, 04 Nov 2020 10:02:00 -0500
X-MC-Unique: GclS-hlAOK2L56vyoRdFJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07714801F9A;
 Wed,  4 Nov 2020 15:01:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3111007501;
 Wed,  4 Nov 2020 15:01:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] tests/qtest/libqtest.c: Check for setsockopt() failure
Date: Wed,  4 Nov 2020 10:01:42 -0500
Message-Id: <20201104150153.541326-10-pbonzini@redhat.com>
In-Reply-To: <20201104150153.541326-1-pbonzini@redhat.com>
References: <20201104150153.541326-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In socket_accept() we use setsockopt() to set SO_RCVTIMEO,
but we don't check the return value for failure. Do so.

Fixes: Coverity CID 1432321
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201103115112.19211-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 99deff47ef..be0fb430dd 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -110,8 +110,13 @@ static int socket_accept(int sock)
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
 
-    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (void *)&timeout,
-               sizeof(timeout));
+    if (qemu_setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
+                        (void *)&timeout, sizeof(timeout))) {
+        fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
+                __func__, strerror(errno));
+        close(sock);
+        return -1;
+    }
 
     do {
         addrlen = sizeof(addr);
-- 
2.26.2



