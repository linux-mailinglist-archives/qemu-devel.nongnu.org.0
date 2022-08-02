Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921A5879B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:13:52 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInyJ-0002u0-DX
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oInJd-0002KI-Sv; Tue, 02 Aug 2022 04:31:54 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:50054 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oInJb-0007bN-4w; Tue, 02 Aug 2022 04:31:49 -0400
Received: from smtpclient.apple (unknown [106.8.166.203])
 by APP-05 (Coremail) with SMTP id zQCowADn3+3Z4OhiGBayFQ--.42472S2;
 Tue, 02 Aug 2022 16:31:23 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Add helper functions for qid-db conversion
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yui+B7yEikNGACgq@apples>
Date: Tue, 2 Aug 2022 16:31:19 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <46762954-5440-4C96-B39B-BCAA6C86589C@ict.ac.cn>
References: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
 <Yui+B7yEikNGACgq@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADn3+3Z4OhiGBayFQ--.42472S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18WF15Cw48XrWktw45Awb_yoW8XF1fpF
 n3GFW3tw1xta43ta9xtr47Xrn5Zws3Wr18Cr9rK34xAr90yr18Za42kw1Fka4xuFWIkryU
 Zr45KF17WFZFvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUymb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
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
 wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07joGQDUUUUU=
X-Originating-IP: [106.8.166.203]
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

at 2:02 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jul 28 16:07, Jinhao Fan wrote:
>> With the introduction of shadow doorbell and ioeventfd, we need to do
>> frequent conversion between qid and its doorbell offset. The original
>> hard-coded calculation is confusing and error-prone. Add several =
helper
>> functions to do this task.
>>=20
>> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>> ---
>> hw/nvme/ctrl.c | 61 =
++++++++++++++++++++++++++++++++------------------
>> 1 file changed, 39 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 533ad14e7a..6116c0e660 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_t =
cqid)
>> {
>>     return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? 0 : =
-1;
>> }
>> +static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
>> +{
>> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
>> +    return (offset / stride) & 1;
>> +}
>=20
> This can be changed morphed into `(offset >> (2 + dstrd)) & 1` if I am =
not
> mistaken.
>=20

Yes. But my current code looks more readable to me. Is it necessary to
change to `(offset >> (2 + dstrd)) & 1`.

>> +
>> +static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr =
offset)
>> +{
>> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
>> +    return offset / (2 * stride);
>> +}
>=20
> Same, should be able to do `offset >> (2 * dstrd + 1)`, no?

Same as above.


