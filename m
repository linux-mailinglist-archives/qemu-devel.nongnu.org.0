Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D08F5DFF9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 10:37:21 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hialU-0003cq-BS
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 04:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49555)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <longpeng2@huawei.com>) id 1hiait-0001q9-Gq
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1hiair-0001dV-S7
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:34:39 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:55892 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1hiair-0001NN-DP
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:34:37 -0400
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 72262DE4EA8B3C2825FC;
 Wed,  3 Jul 2019 16:34:26 +0800 (CST)
Received: from DGGEMM506-MBX.china.huawei.com ([169.254.3.227]) by
 DGGEMM402-HUB.china.huawei.com ([10.3.20.210]) with mapi id 14.03.0439.000;
 Wed, 3 Jul 2019 16:34:16 +0800
From: longpeng <longpeng2@huawei.com>
To: "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "v.maffione@gmail.com" <v.maffione@gmail.com>
Thread-Topic: [BUG] VM abort after migration
Thread-Index: AdUxeZ+/8CkVm8OiTDG86i1/OL6Vdg==
Date: Wed, 3 Jul 2019 08:34:16 +0000
Message-ID: <785B5B0623C08241B2D0E6E7D8FA6B181E0A8FFF@DGGEMM506-MBX.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.246.209]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.255
Subject: [Qemu-devel] [BUG] VM abort after migration
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
Cc: longpeng <longpeng2@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi guys,

We found a qemu core in our testing environment, the assertion
'assert(bus->irq_count[i] =3D=3D 0)' in pcibus_reset() was triggered and
the bus->irq_count[i] is '-1'.

Through analysis, it was happened after VM migration and we think
it was caused by the following sequence:

*Migration Source*
1. save bus pci.0 state, including irq_count[x] ( =3D0 , old )
2. save E1000:
   e1000_pre_save
    e1000_mit_timer
     set_interrupt_cause
      pci_set_irq --> update pci_dev->irq_state to 1 and
                  update bus->irq_count[x] to 1 ( new )
    the irq_state sent to dest.

*Migration Dest*
1. Receive the irq_count[x] of pci.0 is 0 , but the irq_state of e1000 is 1=
.
2. If the e1000 need change irqline , it would call to pci_irq_handler(),
  the irq_state maybe change to 0 and bus->irq_count[x] will become
  -1 in this situation.
3. do VM reboot then the assertion will be triggered.

We also found some guys faced the similar problem:
[1] https://lists.gnu.org/archive/html/qemu-devel/2016-11/msg02525.html
[2] https://bugs.launchpad.net/qemu/+bug/1702621

Is there some patches to fix this problem ?
Can we save pcibus state after all the pci devs are saved ?

Thanks,
Longpeng(Mike)

