Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF7525BAA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 08:43:00 +0200 (CEST)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npP0t-0006Fz-Us
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 02:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOnc-00078J-Ga
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOna-0000Xk-Q8
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=my0W1CNP7OlIJyRDKwEELR0pplskMGAw7GJim8MHcHM=;
 b=ON5GMZiJvVMSL34vjNnvIlFeeQxuIvJs4XMu3PnAI0PPWu24RB34wLbWzVt//yPdfRRFGP
 Meao4H4Aoj+nUZZl9Itkyd2KbV/SjjXVfEyha3n+T+MkZKAR2dqnrhUJvYBkfdJQyvOXzn
 qQBflSum8JF3gS3EGoEm8/WygCkp154=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Uu1LmPzVMqqnqOYzHdugHQ-1; Fri, 13 May 2022 02:29:12 -0400
X-MC-Unique: Uu1LmPzVMqqnqOYzHdugHQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 f78-20020a9d03d4000000b00606a96c6e5bso2662408otf.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=my0W1CNP7OlIJyRDKwEELR0pplskMGAw7GJim8MHcHM=;
 b=Nmk3i7vMAE/tnWRohjas5x3cxc3hpjxiru4iwEu5F2R6PA7+jne2XPxqne/JgTca1B
 ngkBeAFhcuidw8+zHkvfU99xNXydC9RepYToYFU3rNVuJ6QT1HKDH5bCfqOoMtkUHLCu
 gvSc2rUOzifj4k8Tnc3pDzNj4bBkUEKUDJtwFf6ou8uOmZnqi0xfEwAaINYbwAp1VbHn
 YS/DRoF6EIO9QlMaTrcy1QGUxGuN9sdfAOxZgHzGk+emjqzyZQfah9EFUCnTO0keAwlZ
 t2o2HgMkpRZO3Lf+oEE/mcsENmcMjOVQ9QCyLygL9+5/d6P+USp5EDYGnhtbV4SoOhOa
 3CPg==
X-Gm-Message-State: AOAM533BoMoQ/ha1cvHh2fdMflGMaOTfwAVTstMgUyHxXR2Qe0+Ue6cP
 nbj6uFNYdhlfrSKrAlrxafhSbZqiv4Dl5dRWiURtQl5LnZUAl1ZlD55qr2X9BcSZ/86RK/kaf8U
 sW1zSWhX9i2DonfY=
X-Received: by 2002:a9d:3b5:0:b0:603:f8ac:a780 with SMTP id
 f50-20020a9d03b5000000b00603f8aca780mr1246418otf.26.1652423351451; 
 Thu, 12 May 2022 23:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzyqqKlm2kUJNWXmPcHpHfODcKZOKBsvuuJRmRlDpy7Asa0y1CiBnESAVpsFA9rJp/z5EJLg==
X-Received: by 2002:a9d:3b5:0:b0:603:f8ac:a780 with SMTP id
 f50-20020a9d03b5000000b00603f8aca780mr1246413otf.26.1652423351212; 
 Thu, 12 May 2022 23:29:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05680804ce00b00325cda1ffbasm678341oie.57.2022.05.12.23.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 23:29:10 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v13 1/8] meson.build: Fix docker-test-build@alpine when
 including linux/errqueue.h
Date: Fri, 13 May 2022 03:28:30 -0300
Message-Id: <20220513062836.965425-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513062836.965425-1-leobras@redhat.com>
References: <20220513062836.965425-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 meson.build | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meson.build b/meson.build
index 9b20dcd143..a996690c9b 100644
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


