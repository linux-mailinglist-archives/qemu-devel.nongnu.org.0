Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253F2AD4A0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:20:53 +0100 (CET)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRhk-0001rk-Fm
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcRbs-0003cj-TY
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:14:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43290
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcRbq-0005NU-GV
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:14:48 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcRbz-0005le-Uk; Tue, 10 Nov 2020 11:15:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
Date: Tue, 10 Nov 2020 11:14:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: QOM address space handling
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Hi all,

This email follows on from my investigation of intermittent Travis-CI failures in 
make check's device-introspect test when trying to add the patch at 
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06093.html to my last 
qemu-sparc pull request.

The patch itself seems fairly harmless: moving the sun4u-iommu device as a QOM child 
of the sabre PCI host bridge device. So why was "make check" randomly segfaulting on 
Travis-CI?

The hardest part was trying to reproduce the issue to debug it: eventually after a 
number of Travis-CI runs I discovered I could generate the same problem locally if I 
ran "make check" around 15-20 times in a row, and that gave me a backtrace that 
looked like this:

0x0000000000614b69 in address_space_init (as=0x16f684d8,
root=0x16f68530, name=0x9a1db2 "iommu-as") at ../softmmu/memory.c:2780
2780        QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
(gdb) bt
#0  0x0000000000614b69 in address_space_init (as=0x16f684d8,
  root=0x16f68530, name=0x9a1db2 "iommu-as") at
../softmmu/memory.c:2780
#1  0x00000000005b8f6a in iommu_init (obj=0x16f681c0) at ../hw/sparc64/sun4u_iommu.c:301
#2  0x000000000070a997 in object_init_with_type (obj=0x16f681c0,
  ti=0x1629fac0) at ../qom/object.c:375

With the debugger attached I was able to figure out what was happening: the 
sun4u-iommu device creates the iommu-as address space during instance init, but 
doesn't have a corresponding instance finalize to remove it which leaves a dangling 
pointer in the address_spaces QTAILQ.

Normally this doesn't matter because IOMMUs are created once during machine init, but 
device-introspect-test instantiates sun4u-iommu (and with the patch sabre also adds 
it as a child object during instance init) which adds more dangling pointers to the 
address_spaces list. Every so often the dangling pointers end up pointing to memory 
that gets reused by another QOM object, eventually causing random segfaults during 
instance finalize and/or property iteration.

There are 2 possible solutions here: 1) ensure QOM objects that add address spaces 
during instance init have a corresponding instance finalize function to remove them 
or 2) move the creation of address spaces from instance init to realize.

Does anyone have any arguments for which solution is preferred?

As part of this work I hacked up an address_space_count() function in memory.c that 
returns the size of the address_spaces QTAILQ and added a printf() to display the 
value during instance init and finalize which demonstrates the problem nicely. This 
means it should be possible to add a similar to check to device-introspect-test in 
future to prevent similar errors from happening again.


ATB,

Mark.

