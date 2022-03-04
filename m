Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CD4CDD23
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:08:05 +0100 (CET)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDHY-00036A-Rn
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:08:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQD8h-0003EF-Av
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQD8f-0000Zq-QH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t86bccOVtEpw6MmKbqJmKinH/oQE3vItiuLzBh8t+Uw=;
 b=dB9PmeYxx8Q78asKf4vybW5HwXjNrlfAurI1meyNN6WT2Ofy3Sh1bzBJYP0BNSwVf8byOG
 R3KS3lPWE31ATWkhBEAEcPrIjL+FjH/RMi2HzSHykjm06WC2AJtUAbbqJOn7amIrIQypmr
 DJCAcTGpkv0W/Fg9NsnOdxEEybWtJvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-hffc7ThDOfyhot1pGPgraQ-1; Fri, 04 Mar 2022 13:58:50 -0500
X-MC-Unique: hffc7ThDOfyhot1pGPgraQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CEC1006AA7;
 Fri,  4 Mar 2022 18:58:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E85287B87;
 Fri,  4 Mar 2022 18:58:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] os-posix: refactor code handling the -chroot argument
Date: Fri,  4 Mar 2022 18:56:15 +0000
Message-Id: <20220304185620.3272401-4-berrange@redhat.com>
In-Reply-To: <20220304185620.3272401-1-berrange@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the change_root() function so that it takes its input as
parameters instead of relying on static global variables.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 os-posix.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 5a127feee2..30da1a1491 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -188,19 +188,16 @@ static void change_process_uid(uid_t uid, gid_t gid, const char *name)
     }
 }
 
-static void change_root(void)
+static void change_root(const char *root)
 {
-    if (chroot_dir) {
-        if (chroot(chroot_dir) < 0) {
-            error_report("chroot failed");
-            exit(1);
-        }
-        if (chdir("/")) {
-            error_report("not able to chdir to /: %s", strerror(errno));
-            exit(1);
-        }
+    if (chroot(root) < 0) {
+        error_report("chroot failed");
+        exit(1);
+    }
+    if (chdir("/")) {
+        error_report("not able to chdir to /: %s", strerror(errno));
+        exit(1);
     }
-
 }
 
 void os_daemonize(void)
@@ -267,7 +264,9 @@ void os_setup_post(void)
         }
     }
 
-    change_root();
+    if (chroot_dir) {
+        change_root(chroot_dir);
+    }
     if (user_uid != -1 && user_gid != -1) {
         change_process_uid(user_uid, user_gid, user_name);
     }
-- 
2.34.1


