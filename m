Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94261E1DA9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 16:05:16 +0200 (CEST)
Received: from localhost ([::1]:36900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNHGB-0004I2-SK
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 10:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1iNHBN-0002Zq-GK
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1iNHBH-0004p5-Ea
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:13 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:46538 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1iNHBH-0004mJ-23
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A98B91A2268;
 Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.14.77])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 66CCA1A215C;
 Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/3] Optimize emulation of some Altivec instructions
Date: Wed, 23 Oct 2019 15:59:53 +0200
Message-Id: <1571839196-1739-1-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: aleksandar.markovic@rt-rk.com, stefan.brankovic@rt-rk.com,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize emulation of twelve Altivec instructions: lvsl, lvsr, vsl, vsr, vpkpx,
vgbbd, vclzb, vclzh, vclzw, vclzd, vupkhpx and vupklpx.

This series builds up on and complements recent work of Thomas Murta, Mark
Cave-Ayland and Richard Henderson in the same area. It is based on devising TCG
translation implementation for selected instructions rather than using helpers.
The selected instructions are most of the time idiosyncratic to ppc platform,
so relatively complex TCG translation (without direct mapping to host
instruction that is not possible in these cases) seems to be the best option,
and that approach is presented in this series. The performance improvements
are significant in all cases.

V9:

Fixed comments and commit messages.

V8:

Addressed Aleksandar Markovic's suggestions.

V7:

Added optimization for vupkhpx and vupklpx instructions.

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
  target/ppc: Optimize emulation of vclzh and vclzb instructions
  target/ppc: Optimize emulation of vpkpx instruction
  target/ppc: Optimize emulation of vupkhpx and vupklpx instructions

 target/ppc/helper.h                 |   5 -
 target/ppc/int_helper.c             |  50 ------
 target/ppc/translate/vmx-impl.inc.c | 307 +++++++++++++++++++++++++++++++++++-
 3 files changed, 302 insertions(+), 60 deletions(-)

-- 
2.7.4


