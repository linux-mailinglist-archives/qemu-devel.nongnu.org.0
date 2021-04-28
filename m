Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660036D9F5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:57:07 +0200 (CEST)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblcg-0008Pj-KG
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblUM-0000SV-QM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblUL-0005OO-2K
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619621308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83Zj+dsuhexjgd/SgHplHVTJG66SKX+lzdg4qh7kEEs=;
 b=U5m2ucg6MFQVbs+a9WgKLwS5rBEkyzg0iU4CspCaZM2P+aNX9Quh4v5XS9sfo9BvjYITrf
 Ai8/kXePynet+YGR2MfwmUsI7tfGv+5jZXxjMApsIcHTXBFsaQmxkXC7ADXuGXEOTV+Gc+
 OtbBWQP4dzCLg9CMnQQsMLY+7+HZuIo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-HGrQ8G_TPbeqDwEtmV3qYw-1; Wed, 28 Apr 2021 10:48:26 -0400
X-MC-Unique: HGrQ8G_TPbeqDwEtmV3qYw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso19009418wrf.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83Zj+dsuhexjgd/SgHplHVTJG66SKX+lzdg4qh7kEEs=;
 b=ackSddVa8t0cUR16uKJFYB7jfNVbjDYemrf5TdNcds6qlim7Tx221N5FVuR5n5AgRB
 MjvOiV8d9gLtzMQttRJsJnFEIoj8VNNGEYz0Bu21icX/bVCEsk1Fb8xqNH2s2q3vKC5M
 OZo8PqnspyrP3v4t61eZoUG0l37Xm7K3n0Z32MFRO0YTE5SshXA7UPfQV7MnUdWQaUFE
 gXUPHNEJ6+ZadzuT/p62qiJ/yNYnB9oP5pN0urx+kT0yyviEKdboge61OOKPLyomcxH9
 vvx+sBaYgmqTWVWb0ljwaLjth+TQZdQ21/IzJYsSlpnM6ZaHnpfQXVlBe8vPs1KfPNmY
 ZDJQ==
X-Gm-Message-State: AOAM532E9AVxsYI/2rfkgd+eVLHXGYOro8zsM7U8EAKmN4er+lOd1omL
 e0RExbaPH2FJ9b95HhIP3VlT3IluveBW5c1znS6x3BJvy0NFZEAiZhwkR/MO88oeutsb2kBqcLO
 d+3D18e014HO3Prn9wFjDsrC/L100R5WvPaoYMeWKkqPFLOY0mDqTEFc/ZHh/j3ED
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr9674144wrs.395.1619621304970; 
 Wed, 28 Apr 2021 07:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEs5bd5RqVL5vd2VlgsEeNXl4a3N3MaBffMj5bJxs65Yuh6F5f9rhRrK7ShwYHY5QYDe/M4w==
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr9674113wrs.395.1619621304790; 
 Wed, 28 Apr 2021 07:48:24 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d22sm229722wrc.50.2021.04.28.07.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:48:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] util/meson: Build iov/hexdump/buffer_is_zero with
 virtiofsd
Date: Wed, 28 Apr 2021 16:48:13 +0200
Message-Id: <20210428144813.417170-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428144813.417170-1-philmd@redhat.com>
References: <20210428144813.417170-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When not explicitly select a sysemu target or the QEMU tools and
building virtiofsd, libqemuutil.a has missing symbols:

  /usr/bin/ld: tools/virtiofsd/virtiofsd.p/fuse_virtio.c.o: in function `virtio_send_msg':
  tools/virtiofsd/fuse_virtio.c:236: undefined reference to `iov_size'

  /usr/bin/ld: libqemuutil.a(util_iov.c.o): in function `iov_hexdump':
  util/iov.c:240: undefined reference to `qemu_hexdump'

  /usr/bin/ld: libqemuutil.a(util_iov.c.o): in function `qemu_iovec_is_zero':
  util/iov.c:494: undefined reference to `buffer_is_zero'

Fix by linking bufferiszero/hexdump/iov objects when building
virtiofsd (regardless of sysemu / tools).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/meson.build | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/meson.build b/util/meson.build
index 510765cde46..c2eda2d1374 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -59,12 +59,10 @@
   util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
   util_ss.add(files('base64.c'))
   util_ss.add(files('buffer.c'))
-  util_ss.add(files('bufferiszero.c'))
   util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
   util_ss.add(files('hbitmap.c'))
-  util_ss.add(files('hexdump.c'))
   util_ss.add(files('iova-tree.c'))
-  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
+  util_ss.add(files('qemu-sockets.c', 'uri.c'))
   util_ss.add(files('lockcnt.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('nvdimm-utils.c'))
@@ -83,3 +81,9 @@
                                         if_false: files('filemonitor-stub.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
 endif
+
+if have_block or config_host.has_key('CONFIG_VHOST_USER_FS')
+  util_ss.add(files('hexdump.c'))
+  util_ss.add(files('bufferiszero.c'))
+  util_ss.add(files('iov.c'))
+endif
-- 
2.26.3


