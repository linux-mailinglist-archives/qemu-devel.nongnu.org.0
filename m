Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C738E3B546B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 18:43:35 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxXsc-000243-TV
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 12:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoS-0002Cg-5j; Sun, 27 Jun 2021 12:39:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoM-0007mu-Jk; Sun, 27 Jun 2021 12:39:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B1B05746358;
 Sun, 27 Jun 2021 18:39:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 434F67457E5; Sun, 27 Jun 2021 18:39:07 +0200 (CEST)
Message-Id: <cover.1624811233.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/4] ppc/Pegasos2: Firmware replacement using VOF
Date: Sun, 27 Jun 2021 18:27:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210625055155.2252896-1-aik@ozlabs.ru>
^ That is v22 of Alexey's VOF patch

With this series on top of VOF v22 I can now boot Linux and MorphOS on
pegasos2 without a firmware blob so I hope this is enough to get this
board in 6.1 and also have it enabled so people can start using it
eventually (a lot of people don't compile their QEMU but rely on
binaries from distros and other sources). Provided that VOF will also
be merged by then. This gives VOF another use case that may help it
getting merged at last.

Further info and example command lines can be found at
https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

Regards,
BALATON Zoltan

BALATON Zoltan (4):
  ppc/pegasos2: Introduce Pegasos2MachineState structure
  target/ppc: Allow virtual hypervisor on CPU without HV
  ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
  ppc/pegasos2: Implement some RTAS functions with VOF

 default-configs/devices/ppc-softmmu.mak |   2 +-
 hw/ppc/Kconfig                          |   1 +
 hw/ppc/pegasos2.c                       | 783 +++++++++++++++++++++++-
 target/ppc/cpu.c                        |   2 +-
 4 files changed, 771 insertions(+), 17 deletions(-)

-- 
2.21.4


