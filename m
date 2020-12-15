Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A22DA8FC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:08:15 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5NW-0003pl-BU
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kp5JA-0001sF-9l
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kp5J7-0007OG-VV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608019417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bXX6vaja934bK8I4IjmAARmz1+WHpXJIeXNdoQZOK5o=;
 b=OcDjP+Rs7ZNm4lq16UeRWHH8U+MS/oVJu55+D89SclzqIk3F6UbLFGSGIHxKLBTnjeirSh
 RHYDTDeqP4x47oBlbGpTjrBjHFU7rwMQ8snrr9UX3pCwr6iNMcJ8MJyWF02gPXKDNRW5LB
 RpMI92AErrsILI3ZVRCbciQsOeeil7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-L9irSmSgMiegK-BAM_rHuw-1; Tue, 15 Dec 2020 03:03:32 -0500
X-MC-Unique: L9irSmSgMiegK-BAM_rHuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 941BF107AD26;
 Tue, 15 Dec 2020 08:03:31 +0000 (UTC)
Received: from localhost (unknown [10.36.110.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6BB82BCF8;
 Tue, 15 Dec 2020 08:03:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: fix -static linking of libvhost-user
Date: Tue, 15 Dec 2020 12:03:19 +0400
Message-Id: <20201215080319.136228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fix linking vhost-user binaries with with ./configure -static, by
overriding glib-2.0 dependency with configure results.

Fixes: 0df750e9d3a5fea5e1 ("libvhost-user: make it a meson subproject")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 9ea05ab49f..7ecd307952 100644
--- a/meson.build
+++ b/meson.build
@@ -268,7 +268,11 @@ endif
 # grandfathered in from the QEMU Makefiles.
 add_project_arguments(config_host['GLIB_CFLAGS'].split(),
                       native: false, language: ['c', 'cpp', 'objc'])
-glib = declare_dependency(link_args: config_host['GLIB_LIBS'].split())
+glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
+                          link_args: config_host['GLIB_LIBS'].split())
+# override glib dep with the configure results (for subprojects)
+meson.override_dependency('glib-2.0', glib)
+
 gio = not_found
 if 'CONFIG_GIO' in config_host
   gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
-- 
2.29.0


