Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDF4EEC9D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:52:33 +0200 (CEST)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFpQ-0005RB-EA
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:52:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1naFnL-0004dT-Cb
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1naFnE-0007cP-PC
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648813812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TzCXY70kRQWDSj46be26HH9vA/Qm313SZDJIHOT6ntw=;
 b=Key6hMMUGoIusJ1UW69A630RFjTrb7FVA1jlFRKWE3waBPBVDgYMJOxQ7dBC9nlmjIuD/c
 W8ZliOUHUu97QxOzwH4WBBYz1CDB5pnj/+hv9wJCb5W3sV+4bUfwVZBAsTHVky7hCdqIAn
 ZxjPH5ZzBhU3GZFjUzrhXFS2WID7JiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-ySSWvo26Ml-rdzx-fAQxuw-1; Fri, 01 Apr 2022 07:50:09 -0400
X-MC-Unique: ySSWvo26Ml-rdzx-fAQxuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 956F7101A52C;
 Fri,  1 Apr 2022 11:50:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF7091402648;
 Fri,  1 Apr 2022 11:50:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: simplify AF_VSOCK check
Date: Fri,  1 Apr 2022 15:50:05 +0400
Message-Id: <20220401115005.2204000-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: michael.roth@amd.com, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The current test checks more than AF_VSOCK availability, and doesn't
need to be that long.

Since its introduction in Linux in 2013, AF_VSOCK came with
linux/vm_sockets.h for sockaddr_vm, let's check that.

We could even go back to the initial configure-less approach
proposed by Stefan Hajnoczi, since Michael Roth added the configure-time
check back then to satisfy glibc in Ubuntu 14. See:
https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg08208.html

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 46b5e938b196..e8c4f5255a3b 100644
--- a/meson.build
+++ b/meson.build
@@ -1988,25 +1988,10 @@ have_afalg = get_option('crypto_afalg') \
   '''), error_message: 'AF_ALG requested but could not be detected').allowed()
 config_host_data.set('CONFIG_AF_ALG', have_afalg)
 
-config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
-  #include <errno.h>
-  #include <sys/types.h>
-  #include <sys/socket.h>
-  #if !defined(AF_VSOCK)
-  # error missing AF_VSOCK flag
-  #endif
-  #include <linux/vm_sockets.h>
-  int main(void) {
-    int sock, ret;
-    struct sockaddr_vm svm;
-    socklen_t len = sizeof(svm);
-    sock = socket(AF_VSOCK, SOCK_STREAM, 0);
-    ret = getpeername(sock, (struct sockaddr *)&svm, &len);
-    if ((ret == -1) && (errno == ENOTCONN)) {
-        return 0;
-    }
-    return -1;
-  }'''))
+config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
+  'linux/vm_sockets.h', 'AF_VSOCK',
+  prefix: '#include <sys/socket.h>',
+))
 
 have_vss = false
 have_vss_sdk = false # old xp/2003 SDK
-- 
2.35.1.693.g805e0a68082a


