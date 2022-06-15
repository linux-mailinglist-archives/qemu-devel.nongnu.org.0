Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7BC54C079
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 06:02:26 +0200 (CEST)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1KEb-0006JO-1s
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 00:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o1KBF-0005Az-RD
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 23:58:59 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:57804 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o1KB7-0002pU-BJ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 23:58:54 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-01 (Coremail) with SMTP id qwCowAAniBXqWKli1kRvAw--.234S2;
 Wed, 15 Jun 2022 11:58:35 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
Date: Wed, 15 Jun 2022 11:58:34 +0800
Cc: Klaus Jensen <its@irrelevant.dk>, John Levon <levon@movementarian.org>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0E5C6FC-A020-4C0D-8DEA-04139F450455@ict.ac.cn>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn> <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAAniBXqWKli1kRvAw--.234S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWrZry5uFy8ZFW8urWDtwb_yoW8Ww4Dpr
 Z7GF98K34kG3sakwnIvw40qF1FkrZYkry8Jrn8uws0kr90g3yIvr4vkF4Fva40qr9Yg3Z0
 vF4jqasxJF4vyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gr4l42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0YiiDUUUUU==
X-Originating-IP: [202.38.79.134]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> On Jun 14, 2022, at 11:41 PM, Keith Busch <kbusch@kernel.org> wrote:
>=20
> It's a pretty nasty hack, and definitely not in compliance with the =
spec: the
> db_addr is supposed to be read-only from the device side, though I do =
think
> it's safe for this environment. Unless Klaus or anyone finds something =
I'm
> missing, I feel this is an acceptable compromise to address this odd
> discrepency.

:) In my next patch I will check the performance numbers with this hack. =
Not
sure if updating db_addr value from the host will have any performance=20=

implications but I guess it should be OK.

>=20
> I believe the recommended tag for something like this is =
"Suggested-by:", but
> no need to credit me. Just fold it into your first patch and send a =
v2.

Sure. Thanks!

>=20
> By the way, I noticed that the patch never updates the cq's ei_addr =
value. Is
> that on purpose?

Klaus also raised a similar question in a prior comment. I think we need =
to figure
this out before we move on to the v2 patch. I did this because the =
original Google
extension patch did not update cq=E2=80=99s ei_addr. This seems to make =
sense because
the purpose of cq=E2=80=99s ei_addr is for the guest to notify the host =
about cq head
changes when necessary. However, the host does not need this =
notification=20
because we let the host proactively check for cq=E2=80=99s db_addr value =
when it wants
to post a new cqe. This is also the only point where the host uses the =
cq=E2=80=99s
db_addr. Therefore, it is OK to postpone the check for cq=E2=80=99s =
db_addr to this point,
instead of getting timely but not useful notifications by updating =
cq=E2=80=99s ei_addr.
This helps to reduce the number of MMIO=E2=80=99s on the cq=E2=80=99s =
doorbell register.

Klaus, Keith, do you think this design makes sense?=


