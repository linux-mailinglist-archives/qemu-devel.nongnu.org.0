Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09CB3717B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 12:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYpVd-0004Ur-HV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 06:20:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan.brankovic@rt-rk.com>) id 1hYpRx-0002aL-6z
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan.brankovic@rt-rk.com>) id 1hYpRw-0001z4-7L
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:49 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33626 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
	id 1hYpRv-0006zj-Vb
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 655A61A1E99;
	Thu,  6 Jun 2019 12:15:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
	[10.10.13.132])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 4A5531A1E45;
	Thu,  6 Jun 2019 12:15:36 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 12:15:22 +0200
Message-Id: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 0/8] Optimize emulation of ten Altivec
 instructions: lvsl, 
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series buils up on and complements recent work of Thomas Murta, Mark
Cave-Ayland and Richard Henderson in the same area. It is based on devising TCG
translation implementation for selected instructions rather than using helpers.
The selected instructions are most of the time idiosyncratic to ppc platform,
so relatively complex TCG translation (without direct mapping to host
instruction that is not possible in these cases) seems to be the best option,
and that approach is presented in this series. The performance improvements are
significant in all cases.

Stefan Brankovic (8):
  target/ppc: Optimize emulation of lvsl and lvsr instructions
  target/ppc: Optimize emulation of vsl and vsr instructions
  target/ppc: Optimize emulation of vpkpx instruction
  target/ppc: Optimize emulation of vgbbd instruction
  target/ppc: Optimize emulation of vclzd instruction
  target/ppc: Optimize emulation of vclzw instruction
  target/ppc: Optimize emulation of vclzh and vclzb instructions
  target/ppc: Refactor emulation of vmrgew and vmrgow instructions

 target/ppc/translate/vmx-impl.inc.c | 705 ++++++++++++++++++++++++++++++++----
 1 file changed, 636 insertions(+), 69 deletions(-)

-- 
2.7.4


