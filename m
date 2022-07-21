Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EF57C25B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 04:37:50 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEM4T-0008J7-VY
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 22:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oEM3R-0006yK-No
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 22:36:45 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:45388 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oEM3O-0004bk-Vf
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 22:36:45 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-05 (Coremail) with SMTP id zQCowAA35uywu9hiuAhMEA--.12225S2;
 Thu, 21 Jul 2022 10:36:33 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
Date: Thu, 21 Jul 2022 10:36:32 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAA35uywu9hiuAhMEA--.12225S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWkCr17XrWxZF1UZFyrJFb_yoW5Jw48pa
 y3G3ZIkrWDJ3s7Z34vga1xGFyUAw1kXF4UCa45t3y8JrZ8K3saqrW7Ka45uFWrCr4vy34j
 qr4jq348WasYyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l
 4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
 AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
 cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
 8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-Originating-IP: [159.226.43.13]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

Thanks for the detailed explanation!=20

at 6:21 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:

> Hi Jinhao,
> Thanks for working on this!
>=20
> irqfd is not necessarily faster than KVM ioctl interrupt injection.
>=20
> There are at least two non performance reasons for irqfd:
> 1. It avoids QEMU emulation code, which historically was not thread =
safe and needed the Big QEMU Lock. IOThreads don't hold the BQL and =
therefore cannot safely call the regular interrupt emulation code in =
QEMU. I think this is still true today although parts of the code may =
now be less reliant on the BQL.

This probably means we need to move to irqfd when iothread support is =
added
in qemu-nvme.

> 2. The eventfd interface decouples interrupt injection from the KVM =
ioctl interface. Vhost kernel and vhost-user device emulation code has =
no dependency on KVM thanks to irqfd. They work with any eventfd, =
including irqfd.

This is contrary to our original belief. Klaus once pointed out that =
irqfd
is KVM specific. I agreed with him since I found irqfd implementation is =
in
virt/kvm/eventfd.c. But irqfd indeed avoids the KVM ioctl call. Could =
you
elaborate on what =E2=80=9Cno dependency on KVM=E2=80=9D means?

> 2. How can I debug this kind of cross QEMU-KVM problems?
>=20
> perf(1) is good at observing both kernel and userspace activity =
together. What is it that you want to debug.
>=20

I=E2=80=99ll look into perf(1). I think what I was trying to do is like =
a breakdown
analysis on which part caused the latency. For example, what is the root
cause of the performance improvements or regressions when irqfd is =
turned
on.

> What happens when the MSI-X vector is masked?
>=20
> I remember the VIRTIO code having masking support. I'm on my phone and =
can't check now, but I think it registers a temporary eventfd and =
buffers irqs while the vector is masked.

Yes, this RFC ignored interrupt masking support.=20

>=20
> This makes me wonder if the VIRTIO and NVMe IOThread irqfd code can be =
unified. Maybe IOThread support can be built into the core device =
emulation code (e.g. irq APIs) so that it's not necessary to duplicate =
it.
>=20

Agreed. Recently when working on ioeventfd, iothread and polling =
support, my
typical workflow is to look at how virtio does that and adjust that code
into nvme. I think unifying their IOThread code can be beneficial since
VIRTIO has incorporated many optimizations over the years that can not =
be
directly enjoyed by nvme. But I fear that subtle differences in the two
protocols may cause challenges for the unification.

Again, thanks for your help :)=


