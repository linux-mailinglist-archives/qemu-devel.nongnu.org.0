Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B73EE36F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 16:17:43 +0100 (CET)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRe6w-0003yZ-50
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 10:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clement.deschamps@greensocs.com>) id 1iRe1V-00017t-R2
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:12:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clement.deschamps@greensocs.com>) id 1iRe1U-0002DO-Rv
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:12:05 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:47152)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clement.deschamps@greensocs.com>)
 id 1iRe1R-0002Av-TG; Mon, 04 Nov 2019 10:12:02 -0500
Received: from chartreuse.bar.greensocs.com (chartreuse.bar.greensocs.com
 [172.16.11.101])
 by beetle.greensocs.com (Postfix) with ESMTPS id 217B096F52;
 Mon,  4 Nov 2019 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1572880319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9POxuJGJwaGIEQPa0Ye5ozjHsuXtnHg87pzNAASKC88=;
 b=xRY5qNhqlocAm5FR10uUXp1djzLTb/CITHx1a55E84OKbDWlQCatzytwVeOH2eUBpQikjX
 avZPCUQheNQB/g4hzcEZFMNi/6bqFvVB0ClU/qCyynZCqABCTAYb5ideTdt7sw4H0X3vjo
 RQlkuOvP4jQwQsgAorCvmysI50jKAGk=
From: Clement Deschamps <clement.deschamps@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/boot: Set NSACR.{CP11, CP10} in dummy SMC setup routine
Date: Mon,  4 Nov 2019 16:11:37 +0100
Message-Id: <20191104151137.81931-1-clement.deschamps@greensocs.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1572880319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9POxuJGJwaGIEQPa0Ye5ozjHsuXtnHg87pzNAASKC88=;
 b=v9WBhfGPtmNdF3fhSFLoyBEzUuwKw4JvMu3oFQMQB6EnfOR4egfRgDF0g6TslF3LN7xALY
 Q8U31NHIdunDxK5y3PZeN938howl2iABb446IsVz7QLOCaAsF4QDus8vpFvctjpYDTSQq2
 9lhSb19ULvjdhwp8gubQcMUuvjcXdk0=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1572880319; a=rsa-sha256; cv=none;
 b=uPHf5codb4Livp3i42ROSbz+Dqc3I9CsRt/j76+uqt3nr0TcaqX94Lnv/8I/12IsX/3mgp
 Y+EDpUuQe55SpK8ExvFpsYsKFUNygpLweoHvR8b92DObtmyQYg7EWtlkj4SCKRwn0YAi24
 ejhvAk2lkfbtSxORW9MqEAn2c2tntVc=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Clement Deschamps <clement.deschamps@greensocs.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the NSACR CP11 and CP10 bits, to allow FPU access in Non-Secure state
when using dummy SMC setup routine. Otherwise an AArch32 kernel will UNDE=
F as
soon as it tries to use the FPU.

This fixes kernel panic when booting raspbian on raspi2.

Successfully tested with:
  2017-01-11-raspbian-jessie-lite.img
  2018-11-13-raspbian-stretch-lite.img
  2019-07-10-raspbian-buster-lite.img

See also commit ece628fcf6 that fixes the issue when *not* using the
dummy SMC setup routine.

Fixes: fc1120a7f5
Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ef6724960c..8fb4a63606 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -240,6 +240,9 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *c=
pu,
     };
     uint32_t board_setup_blob[] =3D {
         /* board setup addr */
+        0xee110f51, /* mrc     p15, 0, r0, c1, c1, 2  ;read NSACR */
+        0xe3800b03, /* orr     r0, #0xc00             ;set CP11, CP10 */
+        0xee010f51, /* mcr     p15, 0, r0, c1, c1, 2  ;write NSACR */
         0xe3a00e00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
         0xee0c0f30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
         0xee110f11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
--=20
2.23.0


