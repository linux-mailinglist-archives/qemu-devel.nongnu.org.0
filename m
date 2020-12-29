Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D92E7526
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 00:12:30 +0100 (CET)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuOAH-0002A3-SO
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 18:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuO7w-0008Tg-Ez
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 18:10:04 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuO7o-0006be-Ij
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 18:10:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F46F7470F0;
 Wed, 30 Dec 2020 00:09:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8EFB874646C; Wed, 30 Dec 2020 00:09:51 +0100 (CET)
Message-Id: <cover.1609282253.git.balaton@eik.bme.hu>
Subject: [PATCH 0/7] vt82c686b clean ups - part II
Date: Tue, 29 Dec 2020 23:50:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This is continuing cleaning up the vt82c686b model with the aim to add
vt8231 emulation without too much duplication, reusing or fixing the
existing model where possible. (DISCALIMER: It does not aim to fix all
existing bugs or make the model perfectly emulate the real chip.) This
series continues general clean up and finishes the power management
part. It is based on previous series and also needs Bonito fix
(currently tested with Jiaxun's proposal).

Still to go are superio and isa bridge parts that will be addressed in
some later series but this and previous series could be merged so far
independently of those future series so I'd appreciate if this could
be reviewed and merged to keep outstanding patches managable.

I can submit this and previous series together as one series if that
helps.

Regards,
BALATON Zoltan

BALATON Zoltan (7):
  vt82c686: Use shorter name for local variable holding object state
  vt82c686: Rename superio config related parts
  vt82c686: Move superio memory region to SuperIOConfig struct
  vt82c686: Reorganise code
  vt82c686: Fix SMBus IO base and configuration registers
  vt82c686: Fix up power management io base and config
  vt82c686: Make vt82c686b-pm an abstract base class and add vt8231-pm
    based on it

 hw/isa/trace-events       |   2 +
 hw/isa/vt82c686.c         | 417 ++++++++++++++++++++++----------------
 hw/mips/fuloong2e.c       |   4 +-
 include/hw/isa/vt82c686.h |   1 +
 4 files changed, 251 insertions(+), 173 deletions(-)

-- 
2.21.3


