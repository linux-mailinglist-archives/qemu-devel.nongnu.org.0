Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF64C6BF4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:19:37 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOf03-0000yF-Jh
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:19:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOeoj-0005Dl-Kh
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOeoi-00051O-3p
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646050071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3b2uimjXAVTPAoqIZYxGYu9kRa0KLxOyHa019XEA9I=;
 b=ADE5VcvhW1opgTGDKy2dfTj8OC2SQChcSTxQWXzHW6NrXxvq4mUpaDVIQfUjl4lTlcSukG
 MT9flponvO9eocA51boECRIZ2ssNs8OGekUiOcAAPi9NFhmV4id5hHft3VClAqZPXfsjiz
 iHeK8fvVhRFcOzdqvbqGmgyAwg9FYoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-TJCGVG47Piq1AkE-RvVRTA-1; Mon, 28 Feb 2022 07:07:48 -0500
X-MC-Unique: TJCGVG47Piq1AkE-RvVRTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353D51006AA7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:07:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C25C78AA6;
 Mon, 28 Feb 2022 12:07:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] meson: fix CONFIG_ATOMIC128 check
Date: Mon, 28 Feb 2022 16:07:20 +0400
Message-Id: <20220228120720.722632-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220228120720.722632-1-marcandre.lureau@redhat.com>
References: <20220228120720.722632-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

testfile.c: In function 'main':
testfile.c:5:11: error: incorrect number of arguments to function '__atomic_load'
    5 |       y = __atomic_load(&x, 0);
      |           ^~~~~~~~~~~~~
testfile.c:6:7: error: argument 2 of '__atomic_store' must be a pointer type
    6 |       __atomic_store(&x, y, 0);
      |       ^~~~~~~~~~~~~~
testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must be a pointer type
    7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~

And it must be linked with -latomic.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index a9ec3974bc67..a3d8af7a501b 100644
--- a/meson.build
+++ b/meson.build
@@ -1841,13 +1841,17 @@ if has_int128
     int main(void)
     {
       unsigned __int128 x = 0, y = 0;
-      y = __atomic_load(&x, 0);
-      __atomic_store(&x, y, 0);
-      __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
+      __atomic_load(&x, &y, 0);
+      __atomic_store(&x, &y, 0);
+      __atomic_compare_exchange(&x, &y, &x, 0, 0, 0);
       return 0;
-    }''')
+    }''', args: ['-latomic'])
 
   config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
+  if has_atomic128
+    add_global_link_arguments('-latomic',
+                              native: false, language: ['c', 'cpp', 'objc'])
+  endif
 
   if not has_atomic128
     has_cmpxchg128 = cc.links('''
-- 
2.35.1.273.ge6ebfd0e8cbb


