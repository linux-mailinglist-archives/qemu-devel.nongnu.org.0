Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A491810CCEB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 17:39:48 +0100 (CET)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaMpW-0005Dt-Eb
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 11:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1iaMUK-0000lX-1f
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:17:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1iaMUG-000578-3D
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:17:49 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:54939)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>) id 1iaMUE-0004yZ-Fv
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:17:47 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by cheepnis.misterjones.org with esmtpsa
 (TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128) (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1iaMU2-0002vd-GD; Thu, 28 Nov 2019 17:17:34 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: More HCR_EL2.TIDx fixes
Date: Thu, 28 Nov 2019 16:17:15 +0000
Message-Id: <20191128161718.24361-1-maz@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, kvmarm@lists.cs.columbia.edu,
 peter.maydell@linaro.org, richard.henderson@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 213.251.177.50
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I started looking the rest of the missing TIDx handling,
and this resulted in the following patches.

There is still one thing I'm a bit puzzled by though:

HCR_EL2.TID0 mandates trapping of the AArch32 JIDR
register, but I couldn't find a trace of it in the QEMU
code, and trying to read it seems to generate an exception.

It isn't like anyone is going to miss it, but I wonder if
it should be implemented... It could also be that I'm missing
the obvious and that my testing is broken! ;-)

Marc Zyngier (3):
  target/arm: Honor HCR_EL2.TID2 trapping requirements
  target/arm: Honor HCR_EL2.TID1 trapping requirements
  target/arm: Handle trapping to EL2 of AArch32 VMRS instructions

 target/arm/helper-a64.h        |  2 ++
 target/arm/helper.c            | 64 ++++++++++++++++++++++++++++++----
 target/arm/internals.h         |  8 +++++
 target/arm/translate-vfp.inc.c | 12 +++++--
 target/arm/vfp_helper.c        | 27 ++++++++++++++
 5 files changed, 103 insertions(+), 10 deletions(-)

-- 
2.20.1


