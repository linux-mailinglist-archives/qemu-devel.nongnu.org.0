Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9645A2C53
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:32:35 +0200 (CEST)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcG3-0000b3-1M
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRbp2-0002rE-Kx; Fri, 26 Aug 2022 12:04:40 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:47274 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRbov-0005OK-Tp; Fri, 26 Aug 2022 12:04:36 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowACH89AJ7whjy2B8AA--.15818S2;
 Sat, 27 Aug 2022 00:04:26 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
Date: Sat, 27 Aug 2022 00:04:23 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, its@irrelevant.dk, stefanha@gmail.com,
 Klaus Jensen <k.jensen@samsung.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4AAC7045-E15F-48A0-80AF-13A450DC2588@ict.ac.cn>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
 <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
 <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowACH89AJ7whjy2B8AA--.15818S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1fury7Xr1kAw15Jry7KFg_yoWDuFc_ZF
 sagFn7Ar4UAFZ7Wa4DAa4avr1jqas5WFyFyws7Ja45Xw1fJ34kuF93urnrAr1UWrW0grnr
 uFZxWwnYy3yakjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
 80aVCY1x0267AKxVWUJVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
 zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
 8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVWUMxAIw28IcxkI
 7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVyv3UUUUU
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

at 11:34 PM, Keith Busch <kbusch@kernel.org> wrote:

> On Fri, Aug 26, 2022 at 11:12:04PM +0800, Jinhao Fan wrote:
>> Use KVM's irqfd to send interrupts when possible. This approach is
>> thread safe. Moreover, it does not have the inter-thread =
communication
>> overhead of plain event notifiers since handler callback are called
>> in the same system call as irqfd write.
>>=20
>> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> No idea what's going on here... This one is causing the following =
assert
> failure with --enable-kvm:
>=20
>  qemu-system-x86_64: ../accel/kvm/kvm-all.c:1781: =
kvm_irqchip_commit_routes: Assertion `ret =3D=3D 0' failed.

My intuition is that if irq-eventfd is off we shouldn=E2=80=99t call
kvm_irqchip_commit_routes(). Probably we missed some check here.

> I find it calls KVM_SET_GSI_ROUTING ioctl with gsi set to =
KVM_IRQ_ROUTING_MSI,
> and linux kernel returns EINVAL in that case. It's never set that way =
without
> this patch. Am I the only one seeing this?



