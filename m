Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD392C3D54
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:11:56 +0100 (CET)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrmF-0003cC-FT
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khriu-0007MZ-PV
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrit-0003LA-3d
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606298906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6VQ6/DfUhWSynwws5TGz3r8SvlBgX0wp8f5Keo//KQ=;
 b=Bf6zg8ZyLzqOfBQFbWDVfE4qfUOmXz4bmSTnyNLk5xP14kETysvGB0Md8A+N0qALAzE0tZ
 kn9/LmyVaUf0G+j7fICTYY5JmKXlu8M3j3jiAdX9Dth//y5QCv8pbFEJjQ09MQChxHLcYx
 +acZFvkJMc1fm2SDd0KeRuS5z57C/dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-yFD87WaNPTC1Gh1Rh6i1Ug-1; Wed, 25 Nov 2020 05:08:24 -0500
X-MC-Unique: yFD87WaNPTC1Gh1Rh6i1Ug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 699001005D51
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 10:08:23 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3026C5C1B4;
 Wed, 25 Nov 2020 10:08:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] libvhost-user: check memfd API
Date: Wed, 25 Nov 2020 14:06:38 +0400
Message-Id: <20201125100640.366523-7-marcandre.lureau@redhat.com>
In-Reply-To: <20201125100640.366523-1-marcandre.lureau@redhat.com>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Do not compile potentially panicking code, instead check memfd API is
present during configure time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c |  6 ------
 subprojects/libvhost-user/meson.build     | 12 ++++++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee..09741a7b49 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1616,7 +1616,6 @@ vu_inflight_queue_size(uint16_t queue_size)
            sizeof(uint16_t), INFLIGHT_ALIGNMENT);
 }
 
-#ifdef MFD_ALLOW_SEALING
 static void *
 memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
 {
@@ -1648,7 +1647,6 @@ memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
 
     return ptr;
 }
-#endif
 
 static bool
 vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
@@ -1672,13 +1670,9 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 
     mmap_size = vu_inflight_queue_size(queue_size) * num_queues;
 
-#ifdef MFD_ALLOW_SEALING
     addr = memfd_alloc("vhost-inflight", mmap_size,
                        F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
                        &fd);
-#else
-    vu_panic(dev, "Not implemented: memfd support is missing");
-#endif
 
     if (!addr) {
         vu_panic(dev, "Failed to alloc vhost inflight area");
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index f9ecc534cf..ac228b5ba6 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -2,7 +2,19 @@ project('libvhost-user', 'c',
         license: 'GPL-2.0-or-later',
         default_options: ['c_std=gnu99'])
 
+cc = meson.get_compiler('c')
+
 glib = dependency('glib-2.0')
+foreach h, syms: {
+  'sys/mman.h': ['memfd_create', 'MFD_ALLOW_SEALING'],
+  'sys/fcntl.h': ['F_SEAL_GROW', 'F_SEAL_SHRINK', 'F_SEAL_SEAL'] }
+  foreach sym: syms
+    cc.has_header_symbol(h, sym,
+                         args: ['-D_GNU_SOURCE'],
+                         required: true)
+  endforeach
+endforeach
+
 inc = include_directories('../../include', '../../linux-headers')
 
 vhost_user = static_library('vhost-user',
-- 
2.29.0


