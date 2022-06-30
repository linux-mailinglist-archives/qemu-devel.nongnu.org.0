Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E483560EF2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 04:05:54 +0200 (CEST)
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6jZ3-0002w5-5P
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 22:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o6jXx-0002GE-Fo
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 22:04:45 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:54782 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o6jXu-0007RR-UN
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 22:04:45 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-01 (Coremail) with SMTP id qwCowADHzw+uBL1i8iAdCg--.31577S2;
 Thu, 30 Jun 2022 10:04:32 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yrx2mVPEO1MIiU4W@kbusch-mbp.dhcp.thefacebook.com>
Date: Thu, 30 Jun 2022 10:04:30 +0800
Cc: qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D464180-3F0E-49EC-96A7-BEBC89B397F2@ict.ac.cn>
References: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
 <8F470FDC-3213-4284-8A85-487ACE690FB7@ict.ac.cn>
 <Yrx2mVPEO1MIiU4W@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowADHzw+uBL1i8iAdCg--.31577S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr47Jr1Uuw1UAFykKryDKFg_yoW3Krb_uw
 1v9a93G3yqqFn7t39YkFs8Gr9rXw48Cr109rWUWr4Ut3s5Xay5ZF4kuryUA3yfJa15urZ8
 WrZ8AryIq34q9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2_HUDUUUU
X-Originating-IP: [111.199.64.159]
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


> That looks correct since we don't need the ioevent is an optional =
optimization.
>=20
> I would just suggest making this easier to read. For example, in
> nvme_init_sq_ioeventfd(), instead of assigning within a conditional:
>=20
>    if ((ret =3D event_notifier_init(&cq->notifier, 0))) {
>=20
> Do each part separately:
>=20
>    ret =3D event_notifier_init(&cq->notifier, 0);
>    if (ret) {

Thanks for the comment! Will change in the next version.

>=20
>> I=E2=80=99ve also been wondering whether using irqfd for sending =
interrupts can
>> bring some benefits. I=E2=80=99m not familiar with how QEMU emulates =
interrupts.
>> What do you think of irqfd=E2=80=99s?
>=20
> Not sure about this mechanism, I'll need to look into it.

Since irqfd is internally a counter, I guess it may be able to =
=E2=80=9Ccoalesce=E2=80=9D
interrupts so that performance can be improved. I will try it tomorrow.=


