Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107ECDF5D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 21:17:16 +0200 (CEST)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMdB4-0004Lh-OF
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 15:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1k-0004Gg-FY
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1j-00021U-FC
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26902
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1j-000215-BX
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pG+G68WgVMUlBSMG+FIA/vBrrchUsd+YdC6zcPuCWtA=;
 b=fJzDAezYZZRwyImsdZtzyalnSstsSmA2kw802laYSBoV9oR+Swr431bbfqjkL84Y1i7JeI
 rux54uUfGfdQdpEcpPH7LAhftUxdFSJNLarzHdDt5UQcLAC2LK2CHh8koWYBxokDsp0sR9
 A2FQz6lPtbtI1jmtG7elQl9zyrkxZaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-nHKXP7i_MtutRMk2-T7ZUw-1; Mon, 21 Oct 2019 15:07:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C51647B;
 Mon, 21 Oct 2019 19:07:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4981171C6;
 Mon, 21 Oct 2019 19:07:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/6] hw/arm/digic4: Inline digic4_board_setup_ram() function
Date: Mon, 21 Oct 2019 21:06:53 +0200
Message-Id: <20191021190653.9511-7-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
References: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nHKXP7i_MtutRMk2-T7ZUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having the RAM creation code in a separate function is not
very helpful. Move this code directly inside the board_init()
function, this will later allow the board to have the QOM
ownership of the RAM.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/digic_boards.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 304e4d1a29..ef3fc2b6a5 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -53,12 +53,6 @@ typedef struct DigicBoard {
     const char *rom1_def_filename;
 } DigicBoard;
=20
-static void digic4_board_setup_ram(DigicBoardState *s, hwaddr ram_size)
-{
-    memory_region_allocate_system_memory(&s->ram, NULL, "ram", ram_size);
-    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
-}
-
 static void digic4_board_init(DigicBoard *board)
 {
     Error *err =3D NULL;
@@ -72,7 +66,8 @@ static void digic4_board_init(DigicBoard *board)
         exit(1);
     }
=20
-    digic4_board_setup_ram(s, board->ram_size);
+    memory_region_allocate_system_memory(&s->ram, NULL, "ram", board->ram_=
size);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
=20
     if (board->add_rom0) {
         board->add_rom0(s, DIGIC4_ROM0_BASE, board->rom0_def_filename);
--=20
2.21.0


