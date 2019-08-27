Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B79E49C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 11:41:06 +0200 (CEST)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2XyK-0002pc-OK
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 05:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1i2XwJ-0001dI-CS
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1i2XwH-000502-U3
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:38:58 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54749 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1i2XwH-0004eO-O7
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:38:57 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 924721A20B1;
 Tue, 27 Aug 2019 11:37:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6C8F81A1E52;
 Tue, 27 Aug 2019 11:37:52 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 11:37:40 +0200
Message-Id: <1566898663-25858-1-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 0/3] target/ppc: Optimize emulation of some
 Altivec instructions
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
Cc: richard.henderson@linaro.org, david@gibson.dropbear.id.au
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
and that approach is presented in this series. The performance improvements
are significant in all cases.

V6:

Rebased series to the latest qemu code.
Excluded all patches that are already accepted.

V5:

Fixed vpkpx bug and added it back in patch.
Fixed graphical distortions on OSX 10.3 and 10.4.
Removed conversion of vmrgh and vmrgl instructions to vector operations for
further investigation.

V4:

Addressed Richard's Henderson's suggestions.
Removed vpkpx's optimization for further investigation on graphical distortions
it caused on OSX 10.2-4 guests.
Added opcodes for vector vmrgh(b|h|w) and vmrgl(b|h|w) in tcg.
Implemented vector vmrgh and vmrgl instructions for i386.
Converted vmrgh and vmrgl instructions to vector operations.

V3:

Fixed problem during build.

V2:

Addressed Richard's Henderson's suggestions.
Fixed problem during build on patch 2/8.
Rebased series to the latest qemu code.

Stefan Brankovic (3):
  target/ppc: Optimize emulation of vpkpx instruction
  target/ppc: Optimize emulation of vclzh and vclzb instructions
  target/ppc: Refactor emulation of vmrgew and vmrgow instructions

 target/ppc/helper.h                 |   3 -
 target/ppc/int_helper.c             |  30 ----
 target/ppc/translate/vmx-impl.inc.c | 301 ++++++++++++++++++++++++++++++++----
 3 files changed, 269 insertions(+), 65 deletions(-)

-- 
2.7.4


