Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CD7E02F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 18:30:11 +0200 (CEST)
Received: from localhost ([::1]:57564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htDxy-00030j-Sc
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 12:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54299)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <liq3ea@163.com>) id 1htDwh-0002I2-JA
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@163.com>) id 1htDwf-0002G0-KW
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:28:51 -0400
Received: from m12-14.163.com ([220.181.12.14]:38171)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <liq3ea@163.com>) id 1htDwc-0002D9-G8
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=yaFV1OG1X4baN5vnmi
 5E7lB71iWmlxgmHSlRIYsVlXs=; b=V8M9RAP7tFAPwroUuYibBMACQyXkH0FWP0
 GnpKM4jiVNezPgW+oSS3g+wgWz3N3O9GidOxfwck5swwDl/uvqfrfGVmsOF/7rla
 BSfpKa9Mz1EHZpe1a26rw3JLsO3RhKEESuXK79SU8PUY7euDA6Mu9Izn9iiAawRH
 NG72GVTto=
Received: from localhost.localdomain (unknown [36.22.237.80])
 by smtp10 (Coremail) with SMTP id DsCowADXykgzE0Nddxj4Hg--.24960S2;
 Fri, 02 Aug 2019 00:28:36 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: mst@redhat.com,
	pbonzini@redhat.com
Date: Thu,  1 Aug 2019 09:28:20 -0700
Message-Id: <20190801162820.11238-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DsCowADXykgzE0Nddxj4Hg--.24960S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF1DGr1Dury7AFWrZFykGrg_yoW8GF4rpr
 13J3WrWrWxXryUJr1DXF4xG3W7Kw1UCFn5WF9xJr18Xr1agFsxJr43tr48try5uFykKr17
 Jr1FqF4Utr18Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2PfdUUUUU=
X-Originating-IP: [36.22.237.80]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhsEbVaD20SnaQABsR
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Subject: [Qemu-devel] [PATCH] hw: intel_iommu: initialize 'name' in
 vtd_find_add_as
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'name' variable in vtd_find_add_as function is not initialized
now, so when in gdb, we will got following output:

(gdb) p name
$1 = "vtd-00.0\000\000\000\000\000\000\000\000\060\330\377\377\377\177\000\000\001\000\000\000\000\000\000\000p\330\377\377\377\177\000\000\353\362\372VUU\000\000p\330\377\377\377\177\000\000  \000\000\060b\000\000\220\021\000\000\360a\000\000\200\"\002\000\020a\000\000  \000\000\060b\000\000\200\332\377\377\377\177\000\000\240\330\377\377\377\177\000\000<\364\372VUU\000\000\000\000\000\000\000\000\000\000  \000\000\060b\000"

After this patch, it is more clear:

(gdb) p name
$1 = "vtd-00.0", '\000' <repeats 119 times>

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/i386/intel_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index de86f53b4e..e379c2a512 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3286,7 +3286,7 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
     uintptr_t key = (uintptr_t)bus;
     VTDBus *vtd_bus = g_hash_table_lookup(s->vtd_as_by_busptr, &key);
     VTDAddressSpace *vtd_dev_as;
-    char name[128];
+    char name[128] = {};
 
     if (!vtd_bus) {
         uintptr_t *new_key = g_malloc(sizeof(*new_key));
-- 
2.17.1



