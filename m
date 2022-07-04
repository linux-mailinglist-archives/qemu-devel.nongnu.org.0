Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9650564C0E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 05:29:34 +0200 (CEST)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8CmE-0007H5-0R
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 23:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o8Cl1-0006b4-QC
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 23:28:19 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:54324 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o8Ckz-0003Dt-CO
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 23:28:19 -0400
Received: from smtpclient.apple (unknown [114.245.36.56])
 by APP-01 (Coremail) with SMTP id qwCowAAnLw9IXsJir3_uCw--.27007S2;
 Mon, 04 Jul 2022 11:28:09 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Yr8bGnaDRsivoY9b@kbusch-mbp.dhcp.thefacebook.com>
Date: Mon, 4 Jul 2022 11:28:07 +0800
Cc: qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <051A89F3-FED3-401D-8EED-AC83E34EF406@ict.ac.cn>
References: <20220630032231.2881787-1-fanjinhao21s@ict.ac.cn>
 <Yr8bGnaDRsivoY9b@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAAnLw9IXsJir3_uCw--.27007S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw45CFW8Kr4fWw1rJw48Xrb_yoWDXrb_u3
 yrurZYkwnrZr4xu398Ga12vw4aqr4xJw17WFW7ZFyDAanFqa17ur4Iyrn5AFW7Xa13XrW2
 krs8G3Waqw4j9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbw8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeXdbUUUUU=
X-Originating-IP: [114.245.36.56]
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

at 12:04 AM, Keith Busch <kbusch@kernel.org> wrote:

> On Thu, Jun 30, 2022 at 11:22:31AM +0800, Jinhao Fan wrote:
>> +static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
>> +{
>> +    NvmeCtrl *n =3D sq->ctrl;
>> +    uint16_t offset =3D sq->sqid << 3;
>> +    int ret;
>> +
>> +    ret =3D event_notifier_init(&sq->notifier, 0);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
>> +    memory_region_add_eventfd(&n->iomem,
>> +                              0x1000 + offset, 4, false, 0, =
&sq->notifier);
>> +
>> +    return 0;
>> +}
>> +
>> static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>> {
>>     n->sq[sq->sqid] =3D NULL;
>>     timer_free(sq->timer);
>> +    event_notifier_cleanup(&sq->notifier);
>>     g_free(sq->io_req);
>>     if (sq->sqid) {
>>         g_free(sq);
>=20
> I believe there needs to be a corresponding =
memory_region_del_eventfd() when
> deleting the queue before event_notifier_cleanup(), otherwise you'll =
leak
> invalid listeners.

Thanks. Fixed this in v3.


