Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7A62232B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 05:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oscoU-0008Pa-6W; Tue, 08 Nov 2022 23:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oscoQ-0008PJ-Fc; Tue, 08 Nov 2022 23:35:42 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oscoN-0006bs-NF; Tue, 08 Nov 2022 23:35:42 -0500
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-05 (Coremail) with SMTP id zQCowAD3_rYJLmtjGVu_CA--.55561S2;
 Wed, 09 Nov 2022 12:35:21 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Y2pjohnZi7kCA3m5@cormorant.local>
Date: Wed, 9 Nov 2022 12:35:18 +0800
Cc: John Levon <levon@movementarian.org>, qemu-devel <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF4319DF-5BD5-4627-9178-C6AAED9057E3@ict.ac.cn>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
 <Y1EswYz077swwhuc@cormorant.local>
 <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
 <Y2OvzcfeawKWvvJ0@cormorant.local>
 <3ffebed8-997d-e276-bf4a-c75508b0be11@ict.ac.cn>
 <Y2Sx7O4MFHKrvXQA@cormorant.local> <Y2pOG89mnH3vGG/E@movementarian.org>
 <Y2pjohnZi7kCA3m5@cormorant.local>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAD3_rYJLmtjGVu_CA--.55561S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18JrWfWrWrWrWruF1kuFg_yoW8Xr1kpF
 WxWa17tFy8tF17JFsIyw12vF1jy3y2qF1kX34qqa18AasIvFyYgFWxtr45WFy8ur4xGF18
 Za12yr9xWr98Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gryl42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j4E__UUUUU=
X-Originating-IP: [202.38.79.134]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

at 10:11 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Nov  8 12:39, John Levon wrote:
>> On Fri, Nov 04, 2022 at 07:32:12AM +0100, Klaus Jensen wrote:
>>=20
>>> On Nov  3 21:19, Jinhao Fan wrote:
>>>> On 11/3/2022 8:10 PM, Klaus Jensen wrote:
>>>>> I agree that the spec is a little unclear on this point. In any =
case, in
>>>>> Linux, when the driver has decided that the sq tail must be =
updated,
>>>>> it will use this check:
>>>>>=20
>>>>>   (new_idx - event_idx - 1) < (new_idx - old)
>>>>=20
>>>> When eventidx is already behind, it's like:
>>>>=20
>>>> 0
>>>> 1 <- event_idx
>>>> 2 <- old
>>>> 3 <- new_idx
>>>> 4
>>>> .
>>>> .
>>>> .
>>>>=20
>>>> In this case, (new_idx - event_idx - 1) =3D 3-1-1 =3D 1 >=3D =
(new_idx - old) =3D
>>>> 3-2=3D1, so the host won't update sq tail. Where am I wrong in this =
example?
>>>=20
>>> That becomes 1 >=3D 1, i.e. "true". So this will result in the =
driver
>>> doing an mmio doorbell write.
>>=20
>> The code is:
>>=20
>> static inline int nvme_dbbuf_need_event(u16 event_idx, u16 new_idx, =
u16 old)        =20
>> {                                                                     =
          =20
>>        return (u16)(new_idx - event_idx - 1) < (u16)(new_idx - old);  =
         =20
>> }                                                                     =
          =20
>>=20
>> which per the above is "return 1 < 1;", or false. So the above case =
does *not*
>> do an mmio write. No?
>=20
> Whelp.
>=20
> Looks like I'm in the wrong here, apologies!

So disabling eventidx updates during polling has the potential of =
reducing
doorbell writes. But as Klaus observed removing this function does not =
cause
performance difference. So I guess only one command is processed during =
each
polling iteration.=


