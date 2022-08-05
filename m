Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6358AD09
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:27:51 +0200 (CEST)
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzEs-0004LA-IM
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz8M-0008Dr-LX
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz8L-0007ln-2K
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659712864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOT/8lZvPj0pecATGxp5bq0muJCXkI4mu9fSpzeFelo=;
 b=Z4BA34yj8hqkeORq4ScUOK2+tzNwbb7b9EQBYyhYLwTbMPvdIHcbGJUlVnftxMHTM8e1Af
 bpKXmwGNIFvajyyHJJhZYV39JSALE4WoW3XJjK7bKDDD1C0KO8vujeUXrwtogczOSd+m8J
 TTwuYNeBxTiQTdbNS3C4rd7Sj5TyPlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-UAm5Ccq5O1CItd2ymkbADQ-1; Fri, 05 Aug 2022 11:20:44 -0400
X-MC-Unique: UAm5Ccq5O1CItd2ymkbADQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F657801585;
 Fri,  5 Aug 2022 15:20:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B25732026D4C;
 Fri,  5 Aug 2022 15:20:40 +0000 (UTC)
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
 Bin Meng <bin.meng@windriver.com>
Subject: [PULL 6/6] util/qemu-sockets: Replace the call to close a socket with
 closesocket()
Date: Fri,  5 Aug 2022 16:20:14 +0100
Message-Id: <20220805152014.135768-7-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

From: Bin Meng <bin.meng@windriver.com>

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/qemu-sockets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..0e2298278f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-            close(sock);
+            closesocket(sock);
             return -1;
         }
     }
@@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return sock;
 
  err:
-    close(sock);
+    closesocket(sock);
     return -1;
 }
 
-- 
2.37.1


