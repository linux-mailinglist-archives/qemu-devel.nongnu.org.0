Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AA69D5FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 22:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUE2G-0003Qi-BF; Mon, 20 Feb 2023 16:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2D-0003Pp-3a
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2A-0007wW-KA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQ8M4aX+QWWlZXZZbJUi30Zbn7lBVH74znn3hPM3Y5U=;
 b=Wd+GSy+zHtLcORs2X5k4u/nkTnhUSU/pKUriur2AHdmCE6ZdZ36ba+tmjMkIwslhH/Cxj+
 71NMLp2oqaqR+V6OtLqM78jEumPjTyzRdYLdxaoEl18eulSEtGZobeBC7Oki6ToZ9lLH+N
 7O/QXo490iGQRikEhdpBwmzF7Tjey64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-GBy8pHzSNH-6LjAgvtk2jg-1; Mon, 20 Feb 2023 16:49:12 -0500
X-MC-Unique: GBy8pHzSNH-6LjAgvtk2jg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D0085A588;
 Mon, 20 Feb 2023 21:49:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D542166B26;
 Mon, 20 Feb 2023 21:49:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 02/15] tests: use closesocket()
Date: Tue, 21 Feb 2023 01:48:46 +0400
Message-Id: <20230220214859.3792171-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/socket-helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index eecadf3a3c..914b3aa0cf 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        close(afd);
+        closesocket(afd);
     }
     if (cfd != -1) {
-        close(cfd);
+        closesocket(cfd);
     }
     if (lfd != -1) {
-        close(lfd);
+        closesocket(lfd);
     }
     if (res) {
         freeaddrinfo(res);
-- 
2.39.1


