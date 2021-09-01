Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791503FD230
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:25:06 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLHnz-0005OE-Ie
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHiu-0006Eg-KF
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHir-0001eZ-MO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbtFE1NxgKgGemcWGthN5b4eRQIumGWQrfY5YJdVj50=;
 b=Tr4jlwfPDl8bDRweogTCbfPDingjD/pHF6eqUJn+fd00LJRYB5uanfMuro0aJv1rAX9fCa
 jYL0W0d9WDj/4oB5JTwST6KH48WNWv9RMS9qZfMc2/leswWgLtoAv2YPgB5c3q2uLUsJv6
 S/xqRB/GNy1WpZzn/la2SUxr8af52pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Thlk8i8sM5aR31bV0eD7RA-1; Wed, 01 Sep 2021 00:19:35 -0400
X-MC-Unique: Thlk8i8sM5aR31bV0eD7RA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6211294DC1;
 Wed,  1 Sep 2021 04:19:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45866A91F;
 Wed,  1 Sep 2021 04:19:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 521B918007A7; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] ui/console: Restrict udmabuf_fd() to Linux
Date: Wed,  1 Sep 2021 06:19:00 +0200
Message-Id: <20210901041903.3111086-4-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210823100454.615816-3-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h |  2 ++
 ui/udmabuf.c         | 11 -----------
 ui/meson.build       |  6 ++++--
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index b30b63976a5a..3be21497a2e8 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -471,7 +471,9 @@ bool vnc_display_reload_certs(const char *id,  Error **errp);
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
 
+#ifdef CONFIG_LINUX
 /* udmabuf.c */
 int udmabuf_fd(void);
+#endif
 
 #endif
diff --git a/ui/udmabuf.c b/ui/udmabuf.c
index 23abe1e7eb91..cebceb261001 100644
--- a/ui/udmabuf.c
+++ b/ui/udmabuf.c
@@ -8,8 +8,6 @@
 #include "qapi/error.h"
 #include "ui/console.h"
 
-#ifdef CONFIG_LINUX
-
 #include <fcntl.h>
 #include <sys/ioctl.h>
 
@@ -29,12 +27,3 @@ int udmabuf_fd(void)
     }
     return udmabuf;
 }
-
-#else
-
-int udmabuf_fd(void)
-{
-    return -1;
-}
-
-#endif
diff --git a/ui/meson.build b/ui/meson.build
index a3a187d633ab..7d25c1b95b5f 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -12,12 +12,14 @@ softmmu_ss.add(files(
   'kbd-state.c',
   'keymaps.c',
   'qemu-pixman.c',
-  'udmabuf.c',
 ))
 softmmu_ss.add([spice_headers, files('spice-module.c')])
 softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
 
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
+softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files(
+  'input-linux.c',
+  'udmabuf.c',
+))
 softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
 
 vnc_ss = ss.source_set()
-- 
2.31.1


