Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043CF449CE6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 21:09:43 +0100 (CET)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAxZ-000222-PN
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 15:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1mkAwG-0000Wk-Tn; Mon, 08 Nov 2021 15:08:20 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:52288
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1mkAwE-0005G7-Fu; Mon, 08 Nov 2021 15:08:20 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id C16A1DA11FD;
 Mon,  8 Nov 2021 21:08:13 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 31776460015; Mon,  8 Nov 2021 21:08:12 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] device_tree: Fix compiler error
Date: Mon,  8 Nov 2021 21:07:56 +0100
Message-Id: <20211108200756.1302697-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A build with gcc (Debian 10.2.1-6) 10.2.1 20210110 fails:

../../../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
../../../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
  560 |     int namelen, retval;
      |                  ^~~~~~

This is not a real error, but the compiler can be satisfied with a small change.

Fixes: b863f0b75852 ("device_tree: Add qemu_fdt_add_path")
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 softmmu/device_tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3965c834ca..9e96f5ecd5 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         return -1;
     }
 
-    while (p) {
+    do {
         name = p + 1;
         p = strchr(name, '/');
         namelen = p != NULL ? p - name : strlen(name);
@@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         }
 
         parent = retval;
-    }
+    } while (p);
 
     return retval;
 }
-- 
2.30.2


