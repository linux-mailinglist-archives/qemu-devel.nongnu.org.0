Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B529F10B703
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:48:59 +0100 (CET)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia3J4-0000Lq-Qm
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia3Fz-0006oq-Q0
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia3Fy-0006s9-Ie
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:45:47 -0500
Received: from relay.sw.ru ([185.231.240.75]:55318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia3Fy-0006nz-As
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:45:46 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia3Fu-0004Zw-2l; Wed, 27 Nov 2019 22:45:42 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] backends/cryptodev: drop local_err from
 cryptodev_backend_complete()
Date: Wed, 27 Nov 2019 22:45:41 +0300
Message-Id: <20191127194541.24304-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: philmd@redhat.com, arei.gonglei@huawei.com, marcandre.lureau@gmail.com,
 vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason for local_err here, use errp directly instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

v6: add r-b by Philippe and Marc-André

 backends/cryptodev.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 3c071eab95..5a9735684e 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -176,19 +176,10 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
 {
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
     CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
-    Error *local_err = NULL;
 
     if (bc->init) {
-        bc->init(backend, &local_err);
-        if (local_err) {
-            goto out;
-        }
+        bc->init(backend, errp);
     }
-
-    return;
-
-out:
-    error_propagate(errp, local_err);
 }
 
 void cryptodev_backend_set_used(CryptoDevBackend *backend, bool used)
-- 
2.21.0


