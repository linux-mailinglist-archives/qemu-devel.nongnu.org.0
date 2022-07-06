Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE185686C0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:36:10 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93KD-0005ZG-Ec
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o93IQ-0004MO-5t
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:34:18 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:42758 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o93IN-0001kA-F8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:34:17 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-01 (Coremail) with SMTP id qwCowAA3PgYsc8Vi2zP5DA--.25829S2;
 Wed, 06 Jul 2022 19:34:04 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YsSGbhJQXp9fiCZK@kbusch-mbp.dhcp.thefacebook.com>
Date: Wed, 6 Jul 2022 19:34:04 +0800
Cc: Klaus Jensen <its@irrelevant.dk>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <69E2ADBE-5064-4E04-B236-8815D82263AB@ict.ac.cn>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <YsRwyMONg0+mHVsL@apples> <YsSGbhJQXp9fiCZK@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAA3PgYsc8Vi2zP5DA--.25829S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15KFyDXFWUAr43Cw43Awb_yoW8ZrWDpr
 WYqayDJF97Z3y0yrZrXa1rZw18Cr40qFWUCryfJw18Cwn29r42qayYyFy5XF45ZrZ2qw42
 vF4UGwsxZFy3A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
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

at 2:43 AM, Keith Busch <kbusch@kernel.org> wrote:

> On Tue, Jul 05, 2022 at 07:11:36PM +0200, Klaus Jensen wrote:
>> On Jul  5 22:24, Jinhao Fan wrote:
>>> @@ -1374,7 +1374,14 @@ static void =
nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
>>>=20
>>>     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
>>>     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
>>> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>>> +
>>> +    if (req->sq->ioeventfd_enabled) {
>>> +        /* Post CQE directly since we are in main loop thread */
>>> +        nvme_post_cqes(cq);
>>> +    } else {
>>> +        /* Schedule the timer to post CQE later since we are in =
vcpu thread */
>>> +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) =
+ 500);
>>> +    }
>>=20
>> Actually, we are only in the vcpu thread if we come here from
>> nvme_process_db that in very rare circumstances may enqueue the
>> completion of an AER due to an invalid doorbell write.
>>=20
>> In general, nvme_enqueue_req_completion is only ever called from the
>> main iothread. Which actually causes me to wonder why we defer this =
work
>> in the first place. It does have the benefit that we queue up several
>> completions before posting them in one go and raising the interrupt.
>> But I wonder if that could be handled better.
>=20
> I think the timer is used because of the cq_full condition. We need to =
restart
> completions when it becomes not full, which requires a doorbell write. =
Having
> everyone from the main iothread use the same timer as the doorbell =
handler just
> ensures single threaded list access.

Could we let nvme_process_aers register another timer/BH to trigger
nvme_enqueue_req_completion in the iothread? In this way we won=E2=80=99t =
need the
timer_mod in nvme_enqueue_req_completion. We can also avoid some =
potential
currency problems because CQ is only modified in the iothread.

BTW, are there any reason that we must use timers (not BH) here? Also =
why do
we choose to delay for 500ns?=


