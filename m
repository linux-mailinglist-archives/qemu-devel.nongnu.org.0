Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3858FD72
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:35:47 +0200 (CEST)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8Lh-0004dA-Eh
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@freepascal.org>)
 id 1oM8Hs-00015D-34
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:31:48 -0400
Received: from mail.freepascal.org ([178.33.235.90]:58788)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1oM8Hp-0006Km-7G
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:31:47 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id BE30718032F;
 Thu, 11 Aug 2022 13:31:40 +0000 (UTC)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefixng.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-DxBT6xI_5L; Thu, 11 Aug 2022 13:31:40 +0000 (UTC)
Received: from [192.168.50.107] (gw-ics.u-strasbg.fr [130.79.210.225])
 by mail.freepascal.org (Postfix) with ESMTPSA id 3365318032D;
 Thu, 11 Aug 2022 13:31:40 +0000 (UTC)
Message-ID: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
Date: Thu, 11 Aug 2022 15:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: fr, en-US
From: Pierre Muller <pierre@freepascal.org>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [RFC] Testing 7.1.0-rc2, qemu-ppc does not give valid disassembly
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.33.235.90; envelope-from=pierre@freepascal.org;
 helo=mail.freepascal.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Pierre Muller <pierre@freepascal.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

   Hello,

   I don't know if this is the right place to submit this report,
but I have a problem with my attempt to check the 7.1.0 release candidate
for linux user powerpc CPU.

   I am testing a simple executable, compiled with Free Pacal compiler,
but also linked to libc.

This is what I obtain with the new rc:

~/gnu/qemu/build-qemu-7.1.0-rc1/qemu-ppc -L ~/sys-root/powerpc-linux -d in_asm tprintf
----------------
IN: _start
0x3ffda784:
OBJD-T: 7c230b78388000003821fff0908100004bfe756d

----------------
IN: _dl_start
0x3ffc1d00:
OBJD-T: 9421fd407c0802a6429f0005

----------------
IN: _dl_start
0x3ffc1d0c:
OBJD-T: 93c102b8938102b092e1029c930102a07fc802a6932102a4934102a8936102ac
OBJD-T: 900102c493a102b493e102bc7c7c1b783fde00043bded2d07d4d42a67d2c42a6
OBJD-T: 7d0d42a67c0a40004082fff0

----------------
IN: _dl_start
0x3ffc1d58:
OBJD-T: 9141026838e00013f00004d7

With qemu-ppc version 7.0.0, I get this:
----------------
IN: _start
0x3ffda784:  7c230b78  mr       r3, r1
0x3ffda788:  38800000  li       r4, 0
0x3ffda78c:  3821fff0  addi     r1, r1, -0x10
0x3ffda790:  90810000  stw      r4, 0(r1)
0x3ffda794:  4bfe756d  bl       0x3ffc1d00

----------------
IN: _dl_start
0x3ffc1d00:  9421fd40  stwu     r1, -0x2c0(r1)
0x3ffc1d04:  7c0802a6  mflr     r0
0x3ffc1d08:  429f0005  bdnzl    0x3ffc1d0c

Which is way better!

   I did find that this is related to the fact that
upon configuration, meson finds no capstone library,
while disassembly of powerpc CPU has been moved to use of
capstone in this commit:


commit 333f944c15e7a6f5503f92d80529a368519d6638
Author: Thomas Huth <thuth@redhat.com>
Date:   Thu May 5 19:36:19 2022 +0200

      disas: Remove old libopcode ppc disassembler

      Capstone should be superior to the old libopcode disassembler,
      so we can drop the old file nowadays.

      Message-Id: <20220505173619.488350-1-thuth@redhat.com>
      Reviewed-by: Cédric Le Goater <clg@kaod.org>
      Signed-off-by: Thomas Huth <thuth@redhat.com>


Even when trying to compile the git checkout,
which contains capstone as a sub-module, in capstone sub-directory,
I always get capstone support set to NO by meson configuration.

configure --help says:

155:  capstone        Whether and how to find the capstone library

   Is there a way to tell configure to use the submodule?
Why doesn't it use the sub-module if pkg-config says that there
is not system capstone library installed?


Any comment most welcome,


Pierre


