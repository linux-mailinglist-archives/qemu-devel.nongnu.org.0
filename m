Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F2BDF26
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 15:39:25 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD7Vr-0004e7-V1
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 09:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iD6xJ-0001jP-0a
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 09:03:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iD6xH-00071M-S9
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 09:03:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50408)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iD6xH-00071C-Gh; Wed, 25 Sep 2019 09:03:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA0EF3083392;
 Wed, 25 Sep 2019 13:03:38 +0000 (UTC)
Received: from thuth.com (ovpn-116-109.ams2.redhat.com [10.36.116.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E8CF608C0;
 Wed, 25 Sep 2019 13:03:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/core/loader: Fix possible crash in rom_copy()
Date: Wed, 25 Sep 2019 15:03:31 +0200
Message-Id: <20190925130331.27825-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 25 Sep 2019 13:03:38 +0000 (UTC)
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
Cc: mdroth@linux.vnet.ibm.com, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both, "rom->addr" and "addr" are derived from the binary image
that can be loaded with the "-kernel" paramer. The code in
rom_copy() then calculates:

    d = dest + (rom->addr - addr);

and uses "d" as destination in a memcpy() some lines later. Now with
bad kernel images, it is possible that rom->addr is smaller than addr,
thus "rom->addr - addr" gets negative and the memcpy() then tries to
copy contents from the image to a bad memory location. In the best case,
this just crashes QEMU, in the worst case, this could maybe be used to
inject code from the kernel image into the QEMU binary, so we better fix
it with an additional sanity check here.

Cc: qemu-stable@nongnu.org
Reported-by: Guangming Liu
Buglink: https://bugs.launchpad.net/qemu/+bug/1844635
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


