Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738A41B16A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:58:39 +0200 (CEST)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDd0-000152-45
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY8-0003DN-5w
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY6-0004bo-JI
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:35 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b26so35363422edt.0
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOPI/djqKYjPQXTHJfdqx0D8MPqvpJzkEAEUycpoQkc=;
 b=olDeXsstxdJRYtxZToGZATDvISf412WeD+UmgnV3O38AyqmuDs6O/sszwBx8ing2LT
 PayCaehaWBPdPLmAgUo26VPJE/Oxm6ggB0EJC9QZ/jcAxgQ0D4y3y0/L9vWhEb/lr6DK
 irq2tnksIsInSzbLZadlPzxvo3U8CK6lfgzdmi4YjPtVzjnu2JEyIx6Ntzg2V/r5eH44
 HcvORLrErpXIEJh/vbM2nJosPOXc3Jfb1O2JzADzerLEAXRNaSjpDfEDlUYUItVOiIAh
 fDykylttoZD4dMitwC1JcR+QzphO0DCyBi4PVpy7yytRHWxMBLoFYFwNIASiYfEApLeD
 ebNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BOPI/djqKYjPQXTHJfdqx0D8MPqvpJzkEAEUycpoQkc=;
 b=jlavmDKT/fKX4bdpMdoc5J+BzhSIgLR8Pde0jQ7gSLX9o/J/7sOXUxziMv/V3LPNjN
 3v03c2wCR+4xz8oQVmvOc5FemV1HKyePWmoNEfAvYfJDRkglHi0fFxX0SbyySvHasbRr
 aibT5RLEm1TXa/+TB8wrLil4pfw8x2f9qmn+S63pBewJ89c09xYkm2/yBYucbxB+OR23
 7eCQ5KkvYkf8QkaXjizcPiG/syb6gTcsUIKi4N6vMyakaLorfgmZbV75bADfOQCyMC+w
 rfianYalWZ5XZqzoY9kAAI89aPQ41ESlmEdLVHfhTPP7xJeBNpxu1KfkssKUWNbITEXw
 nhuw==
X-Gm-Message-State: AOAM53285v7Gb8M1rpKxhmqvcdhwZBAsHXC/FYq5UF8X78r4s2JoPM3w
 vBYRu2WkkTJEsV7C913FDG6NYhQtf4g=
X-Google-Smtp-Source: ABdhPJy7a6dCXdsefg3XFuD80iEHnZ2fxA7S8ZqWpZlWWA8l4O8tDokc6X1Ghgma0E0YXf8z7gUmWw==
X-Received: by 2002:a17:906:2441:: with SMTP id
 a1mr3184782ejb.414.1632837193030; 
 Tue, 28 Sep 2021 06:53:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm10373247ejh.62.2021.09.28.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:53:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] python: raise OSError from send_fd_scm
Date: Tue, 28 Sep 2021 15:53:08 +0200
Message-Id: <20210928135309.199796-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928135309.199796-1-pbonzini@redhat.com>
References: <20210928135309.199796-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous weird calling convention was a consequence of using
socket_scm_helper.  Just use exceptions now that it is gone.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/machine/machine.py | 11 ++---------
 tests/qemu-iotests/045         |  3 +--
 tests/qemu-iotests/147         |  3 +--
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index d230915fbf..813ccb17c2 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -208,7 +208,7 @@ def add_fd(self: _T, fd: int, fdset: int,
         return self
 
     def send_fd_scm(self, fd: Optional[int] = None,
-                    file_path: Optional[str] = None) -> int:
+                    file_path: Optional[str] = None) -> None:
         """
         Send an fd or file_path via QMP.
 
@@ -225,19 +225,12 @@ def send_fd_scm(self, fd: Optional[int] = None,
             try:
                 fd = os.open(file_path, os.O_RDONLY)
                 self._qmp.send_fd(fd)
-            except OSError:
-                return 1
             finally:
                 if fd != -1:
                     os.close(fd)
         else:
             assert fd is not None
-            try:
-                self._qmp.send_fd(fd)
-            except OSError:
-                return 1
-
-        return 0
+            self._qmp.send_fd(fd)
 
     @staticmethod
     def _remove_if_exists(path: str) -> None:
diff --git a/tests/qemu-iotests/045 b/tests/qemu-iotests/045
index 45eb239baa..3e6d42010e 100755
--- a/tests/qemu-iotests/045
+++ b/tests/qemu-iotests/045
@@ -141,8 +141,7 @@ class TestSCMFd(iotests.QMPTestCase):
         os.remove(image0)
 
     def _send_fd_by_SCM(self):
-        ret = self.vm.send_fd_scm(file_path=image0)
-        self.assertEqual(ret, 0, 'Failed to send fd with UNIX SCM')
+        self.vm.send_fd_scm(file_path=image0)
 
     def test_add_fd(self):
         self._send_fd_by_SCM()
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 47dfa62e6b..58de6db52e 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -269,8 +269,7 @@ class BuiltinNBD(NBDBlockdevAddBase):
         sockfd = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
         sockfd.connect(unix_socket)
 
-        result = self.vm.send_fd_scm(fd=sockfd.fileno())
-        self.assertEqual(result, 0, 'Failed to send socket FD')
+        self.vm.send_fd_scm(fd=sockfd.fileno())
 
         result = self.vm.qmp('getfd', fdname='nbd-fifo')
         self.assert_qmp(result, 'return', {})
-- 
2.31.1



