Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8254AA8B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 09:27:41 +0200 (CEST)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o10xf-0001fK-LQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 03:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o10v7-0000mR-PV
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 03:25:01 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:42078 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o10v3-0003Nr-Eg
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 03:25:00 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-05 (Coremail) with SMTP id zQCowADnlu22N6hidCzsAg--.57446S2;
 Tue, 14 Jun 2022 15:24:39 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
Date: Tue, 14 Jun 2022 15:24:37 +0800
Cc: Klaus Jensen <its@irrelevant.dk>, John Levon <levon@movementarian.org>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn> <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADnlu22N6hidCzsAg--.57446S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtryDtw4UJrWDJFW8Cry3Arb_yoW8Jr1fpF
 WFqa1vyrZ7GF1UJrn3CF4jqw1ruw4kJFyUArsrGr1SvFnxZFyIvFyIkrW5Jr1xuFs3tr4I
 yFWDW3y2gF4qva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07joGQDUUUUU=
X-Originating-IP: [202.38.79.134]
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



> On Jun 14, 2022, at 5:15 AM, Keith Busch <kbusch@kernel.org> wrote:
>=20
>=20
> @@ -6538,9 +6544,25 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr =
addr, int val)
>=20
>         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
>=20
> -        if (!sq->db_addr) {
>         sq->tail =3D new_tail;
> +        if (sq->db_addr) {
> +            /*
> +             * The spec states "the host shall also update the =
controller's
> +             * corresponding doorbell property to match the value of =
that entry
> +             * in the Shadow Doorbell buffer."
> +             *
> +             * Since this context is currently a VM trap, we can =
safely enforce
> +             * the requirement from the device side in case the host =
is
> +             * misbehaving.
> +             *
> +             * Note, we shouldn't have to do this, but various =
drivers
> +             * including ones that run on Linux, are not updating =
Admin Queues,
> +             * so we can't trust reading it for an appropriate sq =
tail.
> +             */
> +            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
> +                    sizeof(sq->tail));
>         }
> +
>         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>     }
> }
> --

Thanks Keith,

This is an interesting hack. I wonder how should I incorporate your =
changes in my patch. I guess I can modify the code in PATCH 1/2 and add =
a =E2=80=9CProposed-by=E2=80=9D tag. Is this the correct way?

Regards,
Jinhao Fan


