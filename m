Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECD4E6FE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:17:32 +0200 (CEST)
Received: from localhost ([::1]:59412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHXv-0006ov-87
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43521)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1heHPG-0000vd-SY
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1heHPD-0008Cj-PU
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:34 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:49928 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1heHPC-0007Ma-1g
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 2271A1A413D;
 Fri, 21 Jun 2019 13:07:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 073A41A22A0;
 Fri, 21 Jun 2019 13:07:25 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:07:04 +0200
Message-Id: <1561115232-17155-1-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v3 0/8] target/ppc: Optimize emulation of some
 Altivec
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize emulation of ten Altivec instructions: lvsl, lvsr, vsl, vsr, vpkpx,
vgbbd, vclzb, vclzh, vclzw and vclzd.

This series buils up on and complements recent work of Thomas Murta, Mark
Cave-Ayland and Richard Henderson in the same area. It is based on devising TCG
translation implementation for selected instructions rather than using helpers.
The selected instructions are most of the time idiosyncratic to ppc platform,
so relatively complex TCG translation (without direct mapping to host
instruction that is not possible in these cases) seems to be the best option,
and that approach is presented in this series. The performance improvements are
significant in all cases.

V3:

Fixed problem during build.

V2:

Addressed Richard's Henderson's suggestions.
Fixed problem during build on patch 2/8.
Rebased series to the latest qemu code.

Stefan Brankovic (8):
  target/ppc: Optimize emulation of lvsl and lvsr instructions
  target/ppc: Optimize emulation of vsl and vsr instructions
  target/ppc: Optimize emulation of vpkpx instruction
  target/ppc: Optimize emulation of vgbbd instruction
  target/ppc: Optimize emulation of vclzd instruction
  target/ppc: Optimize emulation of vclzw instruction
  target/ppc: Optimize emulation of vclzh and vclzb instructions
  target/ppc: Refactor emulation of vmrgew and vmrgow instructions

 target/ppc/helper.h                 |  10 -
 target/ppc/int_helper.c             | 365 --------------------
 target/ppc/translate/vmx-impl.inc.c | 642 ++++++++++++++++++++++++++++++++----
 3 files changed, 573 insertions(+), 444 deletions(-)

-- 
2.7.4


