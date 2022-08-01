Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6FD586E54
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:12:05 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIY1J-0004P1-Ip
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlX-0003Ar-1c
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlN-0001NZ-EX
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5TSlU9MKSKAi4SuSRQshrq9zO1FC+f5kFqrYJJnsCE=;
 b=ExTNcMiGPTYPNWrimPKCn1xivhlN755uEUJcDt/GbR0OiLIT679fmSL7erS/GNerzW0J0N
 jRtNeGHmkXiZamJuKTU5ddQrJd5Q7G4VzhRPj2PJYyjHPitXDEN088seJLqj+QHwwF711W
 becx6jDKeTSsFtrNr1J3P/SxfQCzF3g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-0r4TEvHjNBCPy-Q8qqygWg-1; Mon, 01 Aug 2022 11:55:15 -0400
X-MC-Unique: 0r4TEvHjNBCPy-Q8qqygWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C25C3C1023F;
 Mon,  1 Aug 2022 15:55:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 119DB18EA8;
 Mon,  1 Aug 2022 15:55:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 1/7] tests/tcg/linux-test: Fix random hangs in test_socket
Date: Mon,  1 Aug 2022 17:55:00 +0200
Message-Id: <20220801155506.254316-2-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

test_socket hangs randomly in connect(), especially when run without
qemu. Apparently the reason is that linux started treating backlog
value of 0 literally instead of rounding it up since v4.4 (commit
ef547f2ac16b).

So set it to 1 instead.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220725144251.192720-1-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/multiarch/linux/linux-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
index 019d8175ca..5a2a4f2258 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -263,7 +263,7 @@ static int server_socket(void)
     sockaddr.sin_port = htons(0); /* choose random ephemeral port) */
     sockaddr.sin_addr.s_addr = 0;
     chk_error(bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)));
-    chk_error(listen(fd, 0));
+    chk_error(listen(fd, 1));
     return fd;
 
 }
-- 
2.31.1


