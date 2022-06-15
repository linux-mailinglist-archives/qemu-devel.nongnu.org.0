Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE99354C762
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:25:04 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1R8x-0007ZW-Gg
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o1R6h-0006KO-NC
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:22:43 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:36640 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o1R6e-0004tu-8j
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:22:43 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-05 (Coremail) with SMTP id zQCowACnyH3vwKliC8x9Aw--.5059S2;
 Wed, 15 Jun 2022 19:22:24 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YqmwZ/FGIROp5ds7@movementarian.org>
Date: Wed, 15 Jun 2022 19:22:22 +0800
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B9E7594-8DA6-4F04-A5FC-10CEDA25368A@ict.ac.cn>
References: <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com> <Yqmc2vKXcMl4Xsme@apples>
 <YqmhO0+5rggd/V5T@movementarian.org> <YqmnTmxpYOeupgnt@apples>
 <YqmwZ/FGIROp5ds7@movementarian.org>
To: John Levon <levon@movementarian.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowACnyH3vwKliC8x9Aw--.5059S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy7tFW7tF4Dtr4UCw1xZrb_yoW8XrykpF
 WxZa1xtFWqkw4jgws5trs7X3W5trW8XF98KrnrJF18WF9av34SkayjgFy5Gry5CrZYgF1j
 v3yY9rW3JrWrZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==
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



> On Jun 15, 2022, at 6:11 PM, John Levon <levon@movementarian.org> =
wrote:
>=20
> On Wed, Jun 15, 2022 at 11:33:02AM +0200, Klaus Jensen wrote:
>=20
>>> BTW I'm surprised that this patch has just this:
>>>=20
>>> +static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
>>> +{
>>> +    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
>>> +                  sizeof(sq->tail));
>>> +}
>>>=20
>>> Isn't this racy against the driver? Compare
>>> https://github.com/spdk/spdk/blob/master/lib/nvmf/vfio_user.c#L1317
>>>=20
>>> thanks
>>> john
>>=20
>> QEMU has full memory barriers on dma read/write, so I believe this is
>> safe?
>=20
> But don't you need to re-read the tail still, for example:


Hi John,

I think we also have a check for concurrent update on the tail. After =
writing eventidx, we read the tail again. It is here:

@@ -5854,6 +5943,11 @@ static void nvme_process_sq(void *opaque)
             req->status =3D status;
             nvme_enqueue_req_completion(cq, req);
         }
+
+        if (n->dbbuf_enabled) {
+            nvme_update_sq_eventidx(sq);
+            nvme_update_sq_tail(sq);
+        }

>=20
>=20
> driver 			device
>=20
> 			eventidx is 3
>=20
> write 4 to tail
> 			read tail of 4
> write 5 to tail
> read eventidx of 3
> nvme_dbbuf_need_event (1)
>=20
> 			set eventidx to 4

Therefore, at this point, we read the tail of 5.

> 			go to sleep
>=20
> at (1), our tail update of 4->5 doesn't straddle the eventidx, so we =
don't send
> any MMIO, and the device won't wake up. This is why the above code =
checks the
> tail twice for any concurrent update.

Thanks,
Jinhao Fan

>=20
> regards
> john


