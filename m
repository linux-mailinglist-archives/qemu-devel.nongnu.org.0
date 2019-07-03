Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE85C7E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:38:11 +0200 (CEST)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9cQ-0001G5-IA
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35593)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi7Dj-0003ex-DU
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi7De-0004I8-0u
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 21:04:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46638)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi7DL-0001z2-HW; Mon, 01 Jul 2019 21:04:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8ED21308795E;
 Tue,  2 Jul 2019 01:01:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37CA11001B35;
 Tue,  2 Jul 2019 01:01:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 21:59:04 -0300
Message-Id: <20190702005912.15905-20-philmd@redhat.com>
In-Reply-To: <20190702005912.15905-1-philmd@redhat.com>
References: <20190702005912.15905-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 02 Jul 2019 01:01:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 19/27] hw/block/pflash_cfi02: Extract
 pflash_regions_count()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the pflash_regions_count() function, the code will be
easier to review.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190627202719.17739-20-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 1f096ec185..a0d3bd60dc 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -157,6 +157,11 @@ static void pflash_register_memory(PFlashCFI02 *pfl,=
 int rom_mode)
     pfl->rom_mode =3D rom_mode;
 }
=20
+static size_t pflash_regions_count(PFlashCFI02 *pfl)
+{
+    return pfl->cfi_table[0x2c];
+}
+
 static void pflash_timer (void *opaque)
 {
     PFlashCFI02 *pfl =3D opaque;
@@ -192,9 +197,8 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hw=
addr offset,
 static uint32_t pflash_sector_len(PFlashCFI02 *pfl, hwaddr offset)
 {
     assert(offset < pfl->chip_len);
-    int nb_regions =3D pfl->cfi_table[0x2C];
     hwaddr addr =3D 0;
-    for (int i =3D 0; i < nb_regions; ++i) {
+    for (int i =3D 0; i < pflash_regions_count(pfl); ++i) {
         uint64_t region_size =3D (uint64_t)pfl->nb_blocs[i] * pfl->secto=
r_len[i];
         if (addr <=3D offset && offset < addr + region_size) {
             return pfl->sector_len[i];
--=20
2.20.1


