Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52265C31D4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 12:55:33 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFFoZ-0006fm-Rd
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 06:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iFFkT-0003bG-NP
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iFFkO-0007RS-5b
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:51:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iFFkM-0007OI-5w
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:51:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20E3E10CC201;
 Tue,  1 Oct 2019 10:51:07 +0000 (UTC)
Received: from thuth.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C56D26199;
 Tue,  1 Oct 2019 10:51:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/5] hw/core/loader: Fix possible crash in rom_copy()
Date: Tue,  1 Oct 2019 12:50:56 +0200
Message-Id: <20191001105057.3949-5-thuth@redhat.com>
In-Reply-To: <20191001105057.3949-1-thuth@redhat.com>
References: <20191001105057.3949-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 01 Oct 2019 10:51:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both, "rom->addr" and "addr" are derived from the binary image
that can be loaded with the "-kernel" paramer. The code in
rom_copy() then calculates:

    d = dest + (rom->addr - addr);

and uses "d" as destination in a memcpy() some lines later. Now with
bad kernel images, it is possible that rom->addr is smaller than addr,
thus "rom->addr - addr" gets negative and the memcpy() then tries to
copy contents from the image to a bad memory location. This could
maybe be used to inject code from a kernel image into the QEMU binary,
so we better fix it with an additional sanity check here.

Cc: qemu-stable@nongnu.org
Reported-by: Guangming Liu
Buglink: https://bugs.launchpad.net/qemu/+bug/1844635
Message-Id: <20190925130331.27825-1-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0d60219364..5099f27dc8 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1281,7 +1281,7 @@ int rom_copy(uint8_t *dest, hwaddr addr, size_t size)
         if (rom->addr + rom->romsize < addr) {
             continue;
         }
-        if (rom->addr > end) {
+        if (rom->addr > end || rom->addr < addr) {
             break;
         }
 
-- 
2.18.1


