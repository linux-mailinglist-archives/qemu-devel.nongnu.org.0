Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D460A97928
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 14:22:46 +0200 (CEST)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0PdV-0007ls-VE
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 08:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <SRS0=9d03=721=mail.uni-paderborn.de=kbastian@mail.uni-paderborn.de>)
 id 1i0Pb8-0005hR-UU
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 08:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <SRS0=9d03=721=mail.uni-paderborn.de=kbastian@mail.uni-paderborn.de>)
 id 1i0Pb7-00067J-G2
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 08:20:18 -0400
Received: from zuban.uni-paderborn.de ([131.234.189.17]:47988
 helo=mail.uni-paderborn.de)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from
 <SRS0=9d03=721=mail.uni-paderborn.de=kbastian@mail.uni-paderborn.de>)
 id 1i0Pb7-00065x-9g
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 08:20:17 -0400
Received: from pova.uni-paderborn.de ([131.234.189.23]
 helo=localhost.localdomain)
 by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
 id 1i0Pb4-00015F-M5; Wed, 21 Aug 2019 14:20:14 +0200
Received: from mail.uni-paderborn.de by pova with queue id 3651393-2;
 Wed, 21 Aug 2019 12:20:13 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 14:20:02 +0200
Message-Id: <20190821122007.17448-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.7.2805085, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.8.21.121217, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.8.13.5630000
X-IMT-Spam-Score: 0.0 ()
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.17
Subject: [Qemu-devel] [PATCH v2 0/5] tricore: Convert to translate_loop
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
Cc: kbastian@mail.uni-paderborn.de, david.brenken@efs-auto.de,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I finally came around to port TriCore to the "new" translate_loop
infrastructure. This is necessary such that TriCore can be used in the upcoming
plugin API [1].

Cheers,
Bastian

[1] (https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03165.html)

v1 -> v2:
    [03/05] Now also save hflags in tricore_tr_init_disas_context()
    [04/05] New patch that raises EXCP_DEBUG for breakpoints, TriCore debug insns
    [05/05] New patch that properly fetches 16 bit insns and does the page
    boundary check.

Bastian Koppelmann (5):
  target/tricore: Use DisasContextBase API
  target-tricore: Make env a member of DisasContext
  target/tricore: Use translate_loop
  target/tricore: Implement a qemu excptions helper
  target/tricore: Fix tricore_tr_translate_insn

 target/tricore/helper.h    |   1 +
 target/tricore/op_helper.c |   7 +
 target/tricore/translate.c | 581 ++++++++++++++++++++-----------------
 3 files changed, 326 insertions(+), 263 deletions(-)

--
2.23.0


