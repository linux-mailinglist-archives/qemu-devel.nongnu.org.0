Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499FD54E045
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:53:20 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1o3r-000478-6O
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o1np8-0007OO-2I
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:38:06 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:38942 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o1np5-0004gb-Al
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:38:05 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-05 (Coremail) with SMTP id zQCowADnlu0OFqtiAo3iAw--.16170S2;
 Thu, 16 Jun 2022 19:37:51 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 1/2] hw/nvme: Implement shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YqsIh+OUcWnHU3zp@apples>
Date: Thu, 16 Jun 2022 19:37:50 +0800
Cc: qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A60C1ED-0302-461E-AC32-B4EDC78E91E6@ict.ac.cn>
References: <20220615144907.3093384-1-fanjinhao21s@ict.ac.cn>
 <20220615144907.3093384-2-fanjinhao21s@ict.ac.cn> <YqsIh+OUcWnHU3zp@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADnlu0OFqtiAo3iAw--.16170S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw47XF47ZF4fZr17tF48Xrb_yoW3CFb_Zr
 WDZasrK3y5AFy8JF4j9FyrAw4vga98WFn7X34UtF9rC34rXrs3Zrn8AF4fCF4Iq3y7JrW3
 uw1UJ34rAFs5WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7AYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU08pnPUUUUU==
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

> On Jun 16, 2022, at 6:40 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> This wont work for drivers that *do* rely on updating the buffer for
> admin queues, so we should read it regardless of the value of the =
queue
> id (since we are now updating it through the "Keith Hack^TM").

Sure. Sorry I forgot to update this.

>=20
>>         if (nvme_cq_full(cq)) {
>>             break;
>>         }
>> @@ -4237,6 +4248,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, =
NvmeRequest *req)
>> static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t =
dma_addr,
>>                          uint16_t sqid, uint16_t cqid, uint16_t size)
>> {
>> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
>=20
> You need to load the little endian value with ldq_le_p(&n->bar.cap).
> Sorry, didn't catch this in v1.

Thanks for pointing this out. Will send v3 soon.=


