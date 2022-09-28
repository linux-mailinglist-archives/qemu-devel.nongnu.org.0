Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25C5EE2E3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:17:23 +0200 (CEST)
Received: from localhost ([::1]:39790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odagU-00022T-Pk
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDk-0003id-VX; Wed, 28 Sep 2022 12:47:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDj-0001HI-6r; Wed, 28 Sep 2022 12:47:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Md2Ts6Vmsz4xGh;
 Thu, 29 Sep 2022 02:47:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Md2Tq2QRRz4xGT;
 Thu, 29 Sep 2022 02:47:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/2] ast2600: Disable NEON and VFPv4-D32
Date: Wed, 28 Sep 2022 18:47:17 +0200
Message-Id: <20220928164719.655586-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Currently, the CPU features exposed to the AST2600 QEMU machines are :

  half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
  vfpd32 lpae evtstrm

But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
  lpae evtstrm

NEON support should be dropped and, in that case, QEMU should
advertise a VFPv4 unit with 16 double-precision registers, and not 32
registers.

This problem was raised by a buildroot rootfs compiled with vfpv4.
Boot went fine under QEMU but on real HW, user space binaries had
issues with output. Compiling buildroot with vfpv4d16 fixed it and
I didn't dig further. Nevertheless, it would be nice to catch such
issues with QEMU.

Thanks,

C. 

Cédric Le Goater (2):
  target/arm: Disable VFPv4-D32 when NEON is not available
  ast2600: Drop NEON from the CPU features

 hw/arm/aspeed_ast2600.c | 2 ++
 target/arm/cpu.c        | 4 ++++
 2 files changed, 6 insertions(+)

-- 
2.37.3


