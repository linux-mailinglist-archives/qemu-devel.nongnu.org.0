Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F793890F8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:32:37 +0200 (CEST)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNFU-0002u0-KG
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCW-0000WD-2g
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37842
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCU-0008GD-3b
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:31 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCN-0003Tz-GR; Wed, 19 May 2021 15:29:27 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 19 May 2021 15:29:13 +0100
Message-Id: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/4] target/m68k: implement m68k "any instruction" trace mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements the m68k "any instruction" tracing mode which is used
by the NetBSD kernel debugger to implement single-stepping. It is based upon
reading through the M68000 PRM and looking at how the ARM target handles both
gdbstub and architectural single-step exceptions.

With this patchset it becomes possible to single-step the NetBSD kernel using
the in-built kernel debugger:

Stopped in pid 0.1 (system) at  netbsd:cpu_Debugger+0x6:        unlk    a6
db> s
Stopped in pid 0.1 (system) at  netbsd:cpu_Debugger+0x8:        rts
db> 
Stopped in pid 0.1 (system) at  netbsd:main+0x2c:       jsr     kernel_lock_init
        [addr:0x1a38f6 ]
db> 
Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init:        linkw   a6,#0
db> 
Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0x4:    clrb    kernel_l
ock     [addr:0x33f400 ]
db> 
Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0xa:    clrb    kernel_l
ock_dodebug     [addr:0x35b48c ]
db> 
Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0x10:   unlk    a6
db> 
Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0x12:   rts
db> c
Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
[   1.0000000]     2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017,
[   1.0000000]     2018, 2019, 2020 The NetBSD Foundation, Inc.  All rights reserved.
[   1.0000000] Copyright (c) 1982, 1986, 1989, 1991, 1993
[   1.0000000]     The Regents of the University of California.  All rights reserved.

[   1.0000000] NetBSD 9.1 (GENERIC) #0: Sun Oct 18 19:24:30 UTC 2020
... etc ...


Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

[q800-macos-upstream patchset series: 2]

Mark Cave-Ayland (4):
  target/m68k: introduce is_singlestepping() function
  target/m68k: call gen_raise_exception() directly if single-stepping in
    gen_jmp_tb()
  target/m68k: introduce gen_singlestep_exception() function
  target/m68k: implement m68k "any instruction" trace mode

 target/m68k/cpu.h       |  8 +++++++
 target/m68k/translate.c | 51 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 51 insertions(+), 8 deletions(-)

-- 
2.20.1


