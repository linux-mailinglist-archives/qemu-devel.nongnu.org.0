Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4232F15F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:37:45 +0100 (CET)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEOW-0006F4-Lb
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp2-0003bk-Uk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:05 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:52740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDox-00012L-EG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/3uzVVcX1dXDE0e8PJddj3NWjx5kXISrRaNAmc98xc=; b=DhOWiJfWlGBAZ5mNLrGJysZU/U
 964nGburwi5u+t3libRgEINcYVTSUvWwS/VzW/Qz4Qgv3Yo3xiJ6saYCOPMbITXSSqjvF2g/V1XQp
 QUULNYGGn2z/XQwe7IsyvSb/XMtgF33wYdbqEYb7bxi8Hm+Jy4j8ELm2jnHhYcb41hIw=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] tests/tcg: Add TriCore tests
Date: Fri,  5 Mar 2021 18:00:30 +0100
Message-Id: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601038, da=102572719,
 mc=527, sc=4, hc=523, sp=0, fso=30601038, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kbastian@mail.uni-paderborn.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

after a long while and thanks to Thomas reminder, I finally came back to this
series. I addressed most of your comments except for the timeout --foreground
problem (see https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00921.html). 
I just couldn't figure out why QEMU hangs when run from the Makefile.

You can find the full tree here:
https://github.com/bkoppelmann/qemu/tree/tricore-tcg-tests2

Cheers,
Bastian

Bastian Koppelmann (15):
  tests/tcg: Add docker_as and docker_ld cmds
  tests/tcg: Run timeout cmds using --foreground
  hw/tricore: Add testdevice for tests in tests/tcg/
  tests/tcg/tricore: Add build infrastructure
  configure: Emit HOST_CC to config-host.mak
  tests/tcg/tricore: Add macros to create tests and first test 'abs'
  tests/tcg/tricore: Add bmerge test
  tests/tcg/tricore: Add clz test
  tests/tcg/tricore: Add dvstep test
  tests/tcg/tricore: Add fadd test
  tests/tcg/tricore: Add fmul test
  tests/tcg/tricore: Add ftoi test
  tests/tcg/tricore: Add madd test
  tests/tcg/tricore: Add msub test
  tests/tcg/tricore: Add muls test

 MAINTAINERS                                   |   1 +
 configure                                     |   1 +
 hw/tricore/meson.build                        |   1 +
 hw/tricore/tricore_testboard.c                |   8 ++
 hw/tricore/tricore_testdevice.c               |  82 +++++++++++
 include/hw/tricore/tricore_testdevice.h       |  38 ++++++
 tests/tcg/Makefile.qemu                       |  15 ++
 tests/tcg/Makefile.target                     |   5 +-
 tests/tcg/configure.sh                        |  27 +++-
 tests/tcg/tricore/Makefile.softmmu-target     |  26 ++++
 .../tcg/tricore/Makefile.softmmu-target.orig  |  25 ++++
 tests/tcg/tricore/link.ld                     |  60 ++++++++
 tests/tcg/tricore/macros.h                    | 129 ++++++++++++++++++
 tests/tcg/tricore/test_abs.S                  |   7 +
 tests/tcg/tricore/test_bmerge.S               |   8 ++
 tests/tcg/tricore/test_clz.S                  |   9 ++
 tests/tcg/tricore/test_dvstep.S               |  15 ++
 tests/tcg/tricore/test_fadd.S                 |  16 +++
 tests/tcg/tricore/test_fmul.S                 |   8 ++
 tests/tcg/tricore/test_ftoi.S                 |  10 ++
 tests/tcg/tricore/test_madd.S                 |  11 ++
 tests/tcg/tricore/test_msub.S                 |   9 ++
 tests/tcg/tricore/test_muls.S                 |   9 ++
 23 files changed, 517 insertions(+), 3 deletions(-)
 create mode 100644 hw/tricore/tricore_testdevice.c
 create mode 100644 include/hw/tricore/tricore_testdevice.h
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target.orig
 create mode 100644 tests/tcg/tricore/link.ld
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 tests/tcg/tricore/test_abs.S
 create mode 100644 tests/tcg/tricore/test_bmerge.S
 create mode 100644 tests/tcg/tricore/test_clz.S
 create mode 100644 tests/tcg/tricore/test_dvstep.S
 create mode 100644 tests/tcg/tricore/test_fadd.S
 create mode 100644 tests/tcg/tricore/test_fmul.S
 create mode 100644 tests/tcg/tricore/test_ftoi.S
 create mode 100644 tests/tcg/tricore/test_madd.S
 create mode 100644 tests/tcg/tricore/test_msub.S
 create mode 100644 tests/tcg/tricore/test_muls.S

-- 
2.30.1


