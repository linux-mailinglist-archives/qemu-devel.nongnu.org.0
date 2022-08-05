Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F4458AD05
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:25:40 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzCl-0001DQ-EF
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7r-0006cM-0i
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7p-0007g0-EK
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659712832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSMr73zQz43CzVBTEsg8WelO+8OR5Phlmmi7IjJzNKI=;
 b=c/uc4Bz1OGDPD1Y4x+IgjCqkq6ASwdc1ki5jftBek87tEGR8EN6DKvVdFgE3Hegbwkv8mc
 hkhfBFEFMnJzxxvB+HtNWDeP0QfQl/OtcR0ASQ6a6YBnZdXb+X5Xahj7HJPym5pFxZSqJO
 n0vKsXoyaFeNTOeSg3NUz3oT9fGK8WY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-2CBFUhDROhm3e6n657oXfQ-1; Fri, 05 Aug 2022 11:20:30 -0400
X-MC-Unique: 2CBFUhDROhm3e6n657oXfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 470DB3C025CA;
 Fri,  5 Aug 2022 15:20:29 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB592026D07;
 Fri,  5 Aug 2022 15:20:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 2/6] QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6
Date: Fri,  5 Aug 2022 16:20:10 +0100
Message-Id: <20220805152014.135768-3-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

For using MSG_ZEROCOPY, there are two steps:
1 - io_writev() the packet, which enqueues the packet for sending, and
2 - io_flush(), which gets confirmation that all packets got correctly sent

Currently, if MSG_ZEROCOPY is used to send packets over IPV6, no error will
be reported in (1), but it will fail in the first time (2) happens.

This happens because (2) currently checks for cmsg_level & cmsg_type
associated with IPV4 only, before reporting any error.

Add checks for cmsg_level & cmsg_type associated with IPV6, and thus enable
support for MSG_ZEROCOPY + IPV6

Fixes: 2bc58ffc29 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 74a936cc1f..b76dca9cc1 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -746,8 +746,8 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
         }
 
         cm = CMSG_FIRSTHDR(&msg);
-        if (cm->cmsg_level != SOL_IP &&
-            cm->cmsg_type != IP_RECVERR) {
+        if (cm->cmsg_level != SOL_IP   && cm->cmsg_type != IP_RECVERR &&
+            cm->cmsg_level != SOL_IPV6 && cm->cmsg_type != IPV6_RECVERR) {
             error_setg_errno(errp, EPROTOTYPE,
                              "Wrong cmsg in errqueue");
             return -1;
-- 
2.37.1


