Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E7D45A9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:44:23 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIy1e-0008Us-Fw
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQW-0005Yh-EM
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQV-00041L-8J
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:00 -0400
Received: from relay.sw.ru ([185.231.240.75]:47786)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQV-0003zo-12
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:05:59 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQS-0003XG-3M; Fri, 11 Oct 2019 19:05:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 001/126] hw/core/loader-fit: fix freeing errp in fit_load_fdt
Date: Fri, 11 Oct 2019 19:03:47 +0300
Message-Id: <20191011160552.22907-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
 Paul Burton <pburton@wavecomp.com>, vsementsov@virtuozzo.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fit_load_fdt forget to check that errp is not NULL and to zero it after
freeing. Fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/core/loader-fit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index 953b16bc82..3ee9fb2f2e 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -200,7 +200,10 @@ static int fit_load_fdt(const struct fit_loader *ldr, const void *itb,
     err = fit_image_addr(itb, img_off, "load", &load_addr, errp);
     if (err == -ENOENT) {
         load_addr = ROUND_UP(kernel_end, 64 * KiB) + (10 * MiB);
-        error_free(*errp);
+        if (errp) {
+            error_free(*errp);
+            *errp = NULL;
+        }
     } else if (err) {
         error_prepend(errp, "unable to read FDT load address from FIT: ");
         ret = err;
-- 
2.21.0


