Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115FB528B6A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:58:56 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe3b-0005Bo-6a
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqcnq-0002QB-Ef
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqcno-0008F6-FG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652715511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSTZvulY/dEa/ZlC+jWoPHDZaCAA1l6KJkwIq3W4PuE=;
 b=V645jbF/Yze/3BVvhEFRUGAXEEe7naoQWqEgdGA5cWdtV22Wf74t5JhRrMeeQ5bxowUFhd
 LakE2NjT+uVB0lGcKHDxh1l72diU3G+PBATZCfnOoTxhl/74fnwzU7oy1+8Gr6It0fRBnF
 jsIldOSVYigygX8QMqa4Fegvtt1LmtA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-nU66B_LWPXaj35Z7kdrU0w-1; Mon, 16 May 2022 11:38:30 -0400
X-MC-Unique: nU66B_LWPXaj35Z7kdrU0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E8833C0D1A8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 15:38:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36B2D15215E9;
 Mon, 16 May 2022 15:38:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 10/17] meson.build: Fix docker-test-build@alpine when including
 linux/errqueue.h
Date: Mon, 16 May 2022 16:38:05 +0100
Message-Id: <20220516153812.127155-11-dgilbert@redhat.com>
In-Reply-To: <20220516153812.127155-1-dgilbert@redhat.com>
References: <20220516153812.127155-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Leonardo Bras <leobras@redhat.com>

A build error happens in alpine CI when linux/errqueue.h is included
in io/channel-socket.c, due to redefining of 'struct __kernel_timespec':

===
ninja: job failed: [...]
In file included from /usr/include/linux/errqueue.h:6,
                 from ../io/channel-socket.c:29:
/usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kernel_timespec'
    7 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from /usr/include/liburing.h:19,
                 from /builds/user/qemu/include/block/aio.h:18,
                 from /builds/user/qemu/include/io/channel.h:26,
                 from /builds/user/qemu/include/io/channel-socket.h:24,
                 from ../io/channel-socket.c:24:
/usr/include/liburing/compat.h:9:8: note: originally defined here
    9 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
ninja: subcommand failed
===

As above error message suggests, 'struct __kernel_timespec' was already
defined by liburing/compat.h.

Fix alpine CI by adding test to disable liburing in configure step if a
redefinition happens between linux/errqueue.h and liburing/compat.h.

[dgilbert: This has been fixed in Alpine issue 13813 and liburing]

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Message-Id: <20220513062836.965425-2-leobras@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 meson.build | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meson.build b/meson.build
index 93aa31a9e4..53a4728250 100644
--- a/meson.build
+++ b/meson.build
@@ -515,12 +515,23 @@ if not get_option('linux_aio').auto() or have_block
                            required: get_option('linux_aio'),
                            kwargs: static_kwargs)
 endif
+
+linux_io_uring_test = '''
+  #include <liburing.h>
+  #include <linux/errqueue.h>
+
+  int main(void) { return 0; }'''
+
 linux_io_uring = not_found
 if not get_option('linux_io_uring').auto() or have_block
   linux_io_uring = dependency('liburing', version: '>=0.3',
                               required: get_option('linux_io_uring'),
                               method: 'pkg-config', kwargs: static_kwargs)
+  if not cc.links(linux_io_uring_test)
+    linux_io_uring = not_found
+  endif
 endif
+
 libnfs = not_found
 if not get_option('libnfs').auto() or have_block
   libnfs = dependency('libnfs', version: '>=1.9.3',
-- 
2.36.1


