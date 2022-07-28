Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D1584364
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:42:52 +0200 (CEST)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5f1-00014H-Ai
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oH5XI-0002sK-FB
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:34:52 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:36950 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oH5XE-0006sC-0D
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:34:51 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowADnCH6PrOJiOYHCEw--.6329S2;
 Thu, 28 Jul 2022 23:34:39 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <CAJSP0QVzhvQ4zeS5BemoxYahuWfMY-Yqt9P+O=uxGVayM8Ms3A@mail.gmail.com>
Date: Thu, 28 Jul 2022 23:34:39 +0800
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-devel <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <6DB3F56B-0C33-4C13-8AD9-07144B36CB63@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
 <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
 <YuDmwhKBpllXNG1i@apples>
 <CAJSP0QVzhvQ4zeS5BemoxYahuWfMY-Yqt9P+O=uxGVayM8Ms3A@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADnCH6PrOJiOYHCEw--.6329S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY07k0a2IF6FyUM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I
 6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
 1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
 0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z2
 80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxE
 wVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
 j7Xo7UUUUU=
X-Originating-IP: [221.220.143.85]
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

at 11:18 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:

> I think that is incorrect. QEMU has guest notifier emulation for the
> non-KVM (and non-MSI-X PCI) cases. When there is no irqfd support
> available, QEMU sets up a regular eventfd and calls
> virtio_queue_guest_notifier_read() when it becomes readable.

Thanks Stefan. I finally understand why there is a `with_irqfd` parameter
for virtio_queue_set_guest_notifier_fd_handler.

But if `with_irqfd` is false, it seems OK to directly call virtio_irq(). Why
still bother using an eventfd? Is it for interrupt batching?


