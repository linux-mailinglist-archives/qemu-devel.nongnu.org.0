Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D717839D00C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 18:41:24 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpvpz-0005gF-B9
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpvlZ-00072O-D6; Sun, 06 Jun 2021 12:36:49 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:42967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpvlV-0004Rf-RQ; Sun, 06 Jun 2021 12:36:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CB635746FDD;
 Sun,  6 Jun 2021 18:36:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A1E7D745709; Sun,  6 Jun 2021 18:36:40 +0200 (CEST)
Message-Id: <cover.1622994395.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 0/5] ppc/Pegasos2 VOF
Date: Sun, 06 Jun 2021 17:46:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Based-on: <20210520090557.435689-1-aik@ozlabs.ru>
^ That is v20 of Alexey's VOF patch

Hello,

Posting these for early review now. I plan to rebase on the next VOF
patch that hopefully fixes those points that I had to circumvent in
patch 1 for now. I've reported these before but now all of those that
are needed for pegasos2 are in one place. Other points I've reported
could be clean ups but not sttictly needed.

With this series on top of VOF v20 I can now boot Linux and MorphOS on
pegasos2 without needing a firmware blob so I hope this is enough to
get this board in 6.1 and also have it enabled so users can start
using it. That means that VOF will also be merged by then. This now
gives VOF another use case that may help it getting finished.

I've also updated my development tree with this series here:

https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/

Please review so I can do any needed changes together with the rebase
on next VOF patch so we don't miss 6.1 this time.

Regards,
BALATON Zoltan

BALATON Zoltan (5):
  Misc VOF fixes
  ppc/pegasos2: Introduce Pegasos2MachineState structure
  target/ppc: Allow virtual hypervisor on CPU without HV
  ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
  ppc/pegasos2: Implement some RTAS functions with VOF

 default-configs/devices/ppc-softmmu.mak |   2 +-
 hw/ppc/Kconfig                          |   1 +
 hw/ppc/pegasos2.c                       | 780 +++++++++++++++++++++++-
 hw/ppc/vof.c                            |  11 +-
 pc-bios/vof.bin                         | Bin 3784 -> 3784 bytes
 pc-bios/vof/entry.S                     |   2 +-
 target/ppc/cpu.c                        |   2 +-
 7 files changed, 776 insertions(+), 22 deletions(-)

-- 
2.21.4


