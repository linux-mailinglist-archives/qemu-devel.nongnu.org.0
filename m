Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED0858A9E9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:06:45 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvAC-0003JP-Hl
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oJuzf-0001Mm-Dj
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oJuzb-0005cO-Ef
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659696946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=knrmDqIOq0JW3OCMs+Nl50ayA7aX4cysKiE5WEqu0wA=;
 b=ZshkAYV/wQbximjwp8ZBUjhmjGzJReT7mdHZJSpGxsQzYNF4irKhyujXDNidgTwZriMK+5
 RZJ/nzyC0L9cXLp9WTAM3rQ3WGrOXpbFk3JbAwGZvshWKNNTW/9KanGdjT3G+h3NjjWbBW
 f1sRWKdO3z6CwPADoTenv87lhfbSScE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-NLDQVwzKP_CtJXzh7tLlig-1; Fri, 05 Aug 2022 06:55:45 -0400
X-MC-Unique: NLDQVwzKP_CtJXzh7tLlig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17D17185A79C
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 10:55:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3FE41121314;
 Fri,  5 Aug 2022 10:55:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] char: open pipe in write-only mode
Date: Fri,  5 Aug 2022 14:55:39 +0400
Message-Id: <20220805105540.143985-1-marcandre.lureau@redhat.com>
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

When not using the "path.in", "path.out", open "path" in read-only mode,
as eating our own output is usually not what we want.

Related to:
https://bugzilla.redhat.com/show_bug.cgi?id=2106975

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-pipe.c |  6 ++++--
 qemu-options.hx     | 15 +++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b85091..f9897a3786 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -138,12 +138,14 @@ static void qemu_chr_open_pipe(Chardev *chr,
     if (fd_in < 0 || fd_out < 0) {
         if (fd_in >= 0) {
             close(fd_in);
+            fd_in = -1;
         }
         if (fd_out >= 0) {
             close(fd_out);
+            fd_out = -1;
         }
-        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
-        if (fd_in < 0) {
+        TFR(fd_out = qemu_open_old(filename, O_WRONLY | O_BINARY));
+        if (fd_out < 0) {
             error_setg_file_open(errp, errno, filename);
             return;
         }
diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..ec99a6db48 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3514,18 +3514,21 @@ The available backends are:
     ``path`` is required.
 
 ``-chardev pipe,id=id,path=path``
-    Create a two-way connection to the guest. The behaviour differs
+    Create a one-way or two-way stream. The behaviour differs
     slightly between Windows hosts and other hosts:
 
-    On Windows, a single duplex pipe will be created at
+    On Windows, a full duplex pipe will be created at
     ``\\.pipe\path``.
 
-    On other hosts, 2 pipes will be created called ``path.in`` and
+    On other hosts, 2 paths will be opened called ``path.in`` and
     ``path.out``. Data written to ``path.in`` will be received by the
-    guest. Data written by the guest can be read from ``path.out``. QEMU
-    will not create these fifos, and requires them to be present.
+    guest. Data written by the guest can be read from ``path.out``.
+    QEMU will not create these fifos, and requires them to be present.
 
-    ``path`` forms part of the pipe path as described above. ``path`` is
+    If ``path.in`` or ``path.out`` are missing, QEMU will open
+    ``path`` for an output-only stream.
+
+    ``path`` forms part of the paths as described above. ``path`` is
     required.
 
 ``-chardev console,id=id``
-- 
2.37.1


