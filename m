Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345F580F26
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:35:52 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGG2g-0003qO-KF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oGFzh-0002L5-Pq
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oGFze-0006NY-Lu
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658824361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fNZGipaB6QysJYdVBjCh950CTICNWnOeL8ceIb+BPFI=;
 b=ceTcGcqEjn4biRebntYWtZR0gIE5Xk23ZSiNxQjrC3qkrvEMH9VIaYWCNJzcUH5FOrmYZD
 W2qR3LNwjFstFl0Lpv/DVYuB4BnzhY6w8pqMHt6+b3n+1lXxwdYL3AqM+o+yE/eAp29HdU
 0UZYiBxkTikKBrP3vAYWKBLLXEssE5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-QQ6Yy3sLM1KGsE7OSxVOCg-1; Tue, 26 Jul 2022 04:32:38 -0400
X-MC-Unique: QQ6Yy3sLM1KGsE7OSxVOCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 971E085A585
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:32:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACBB91121314;
 Tue, 26 Jul 2022 08:32:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes)
Subject: [PATCH] RFC: char: deprecate usage of bidirectional pipe
Date: Tue, 26 Jul 2022 12:32:32 +0400
Message-Id: <20220726083232.2567756-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As Ed Swierk explained back in 2006:
https://lists.nongnu.org/archive/html/qemu-devel/2006-12/msg00160.html

"When qemu writes into the pipe, it immediately reads back what it just
wrote and treats it as a monitor command, endlessly breathing its own
exhaust."

This is similarly confusing when using the chardev with a serial device,
as reported in https://bugzilla.redhat.com/show_bug.cgi?id=2106975.

It seems we have kept the support for bidirectional pipes for historical
reasons and odd systems, however it's not documented in qemu -chardev
options. I suggest to stop supporting it, for portability reasons.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/about/deprecated.rst | 6 ++++++
 chardev/char-pipe.c       | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7ee26626d5cf..dd5ca30d527b 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -45,6 +45,12 @@ transmit audio through the VNC protocol.
 ``tty`` and ``parport`` are aliases that will be removed. Instead, the
 actual backend names ``serial`` and ``parallel`` should be used.
 
+``-chardev pipe`` support for bidirectional pipes (since 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+For portability reasons, the support for bidirectional ``pipe`` will
+be removed. Instead, use ``file.in`` & ``file.out`` unidirectional pipes.
+
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b8509183..7db963035e7d 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -27,6 +27,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/error-report.h"
 #include "chardev/char.h"
 
 #ifdef _WIN32
@@ -142,6 +143,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
         if (fd_out >= 0) {
             close(fd_out);
         }
+        warn_report("Support for bidirectional pipe is deprecated,");
+        warn_report("please use portable one-way pipes instead (%s.in & %s.out).",
+                    filename, filename);
         TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
         if (fd_in < 0) {
             error_setg_file_open(errp, errno, filename);
-- 
2.37.0.rc0


