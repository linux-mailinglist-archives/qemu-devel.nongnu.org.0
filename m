Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB255476FE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 23:39:43 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hccsJ-0000rT-53
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 17:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hccox-0006bT-AW
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 17:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hccov-0006RN-DF
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 17:36:15 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:46222)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hccou-0006KP-73
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 17:36:13 -0400
Received: by mail-qt1-f177.google.com with SMTP id h21so8524712qtn.13
 for <qemu-devel@nongnu.org>; Sun, 16 Jun 2019 14:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=00yzs/UwVMBqV92C7ahHjaCs0pzMzmJtSS1nb+Ejwpo=;
 b=k9P9vIRWWzyKunmyD6YfANKTJh5SW04AsEWOzIEZpH2RSq3+VDCq7FysgO1lwPh1ht
 1VB0HjRCAsp+DiI6FvjTAkaULW7NIlw+IrDfHaKEvoqXpGb34QizEL+NKH6Ry/fCaOWa
 IUlbgFy4dx8ht3et8SHP88VwJ2EqV4szVCBCP6LJ9rmTqyv8s7QwavRpoPlXKXm9uq//
 xIsCcsSaSCkgraZYk+ZzUTYtT/9LE3Txptji3DAY5COjeJivVyykOgTS4EJNzBbfFKIH
 xj4ejfciAkrzrbcVcPZwhvKte/k95kTT1DUt/niJ4c8z9OSCDJ9YaL6M0SSLDZX/yeDo
 vBJw==
X-Gm-Message-State: APjAAAX7DLG67GqvXosllxrVHgWju+e5tFJ7uJVqm1W/8b18ExWwCNPy
 7Au7HgmEN+dpN6FlpnF2l5OaBBnbcDc=
X-Google-Smtp-Source: APXvYqzsLqFj6gjzOfBCgZmrmeP+ykJ9UyAaSwvvOVXoYl/XIMlSj6BpUwvk0vJDttXkv6wUsnNAkQ==
X-Received: by 2002:a0c:d0ab:: with SMTP id z40mr18638665qvg.216.1560720968880; 
 Sun, 16 Jun 2019 14:36:08 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
 [100.0.197.103])
 by smtp.gmail.com with ESMTPSA id g53sm5547091qtk.65.2019.06.16.14.36.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 14:36:08 -0700 (PDT)
Date: Sun, 16 Jun 2019 17:36:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190605145829.7674-3-marcandre.lureau@redhat.com>
References: <20190616213540.20430-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190616213540.20430-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.177
Subject: [Qemu-devel] [PULL 02/11] vhost-user: check unix_listen() return
 value
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This check shouldn't be necessary, since &error_fatal is given as
argument and will exit() on failure. However, this change should
silence coverity CID 1401761 & 1401705.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20190605145829.7674-3-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-gpu/main.c   | 4 ++++
 contrib/vhost-user-input/main.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/contrib/vhost-user-gpu/main.c b/contrib/vhost-user-gpu/main.c
index 9614c9422c..e0b6df5b4d 100644
--- a/contrib/vhost-user-gpu/main.c
+++ b/contrib/vhost-user-gpu/main.c
@@ -1160,6 +1160,10 @@ main(int argc, char *argv[])
 
     if (opt_socket_path) {
         int lsock = unix_listen(opt_socket_path, &error_fatal);
+        if (lsock < 0) {
+            g_printerr("Failed to listen on %s.\n", opt_socket_path);
+            exit(EXIT_FAILURE);
+        }
         fd = accept(lsock, NULL, NULL);
         close(lsock);
     } else {
diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 8d493f598e..8b854117f5 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -367,6 +367,10 @@ main(int argc, char *argv[])
 
     if (opt_socket_path) {
         int lsock = unix_listen(opt_socket_path, &error_fatal);
+        if (lsock < 0) {
+            g_printerr("Failed to listen on %s.\n", opt_socket_path);
+            exit(EXIT_FAILURE);
+        }
         fd = accept(lsock, NULL, NULL);
         close(lsock);
     } else {
-- 
MST


