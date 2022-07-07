Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB7569E36
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:58:38 +0200 (CEST)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NLJ-0004DF-QA
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o9NDs-0004ex-52
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:50:56 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:45418 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o9NDp-0005Hi-7R
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:50:55 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-05 (Coremail) with SMTP id zQCowACXn7NfnsZiMk5eCw--.3064S2;
 Thu, 07 Jul 2022 16:50:40 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YsZ0eZ7xJtbxgLS8@apples>
Date: Thu, 7 Jul 2022 16:50:39 +0800
Cc: Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8469361-6748-4213-BE46-B68AC8078CC4@ict.ac.cn>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <YsRwyMONg0+mHVsL@apples> <YsSGbhJQXp9fiCZK@kbusch-mbp.dhcp.thefacebook.com>
 <69E2ADBE-5064-4E04-B236-8815D82263AB@ict.ac.cn> <YsZ0eZ7xJtbxgLS8@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowACXn7NfnsZiMk5eCw--.3064S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy3tr1fXr17KFW8ury7trb_yoW5uF4fpr
 WYqa4DKFZ7Xay0yryqqa18Z3Wvkr4xWF4UWryfGw18CwnI9rnxXFW5tFWUuF4YvrZ7Jw42
 vr4UtwsxZrZ0y37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-Originating-IP: [111.199.64.159]
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

at 1:51 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jul  6 19:34, Jinhao Fan wrote:
>> at 2:43 AM, Keith Busch <kbusch@kernel.org> wrote:
>>=20
>>> On Tue, Jul 05, 2022 at 07:11:36PM +0200, Klaus Jensen wrote:
>>>> On Jul  5 22:24, Jinhao Fan wrote:
>>>>> @@ -1374,7 +1374,14 @@ static void =
nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
>>>>>=20
>>>>>    QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
>>>>>    QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
>>>>> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>>>>> +
>>>>> +    if (req->sq->ioeventfd_enabled) {
>>>>> +        /* Post CQE directly since we are in main loop thread */
>>>>> +        nvme_post_cqes(cq);
>>>>> +    } else {
>>>>> +        /* Schedule the timer to post CQE later since we are in =
vcpu thread */
>>>>> +        timer_mod(cq->timer, =
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
>>>>> +    }
>>>>=20
>>>> Actually, we are only in the vcpu thread if we come here from
>>>> nvme_process_db that in very rare circumstances may enqueue the
>>>> completion of an AER due to an invalid doorbell write.
>>>>=20
>>>> In general, nvme_enqueue_req_completion is only ever called from =
the
>>>> main iothread. Which actually causes me to wonder why we defer this =
work
>>>> in the first place. It does have the benefit that we queue up =
several
>>>> completions before posting them in one go and raising the =
interrupt.
>>>> But I wonder if that could be handled better.
>>>=20
>>> I think the timer is used because of the cq_full condition. We need =
to restart
>>> completions when it becomes not full, which requires a doorbell =
write. Having
>>> everyone from the main iothread use the same timer as the doorbell =
handler just
>>> ensures single threaded list access.
>>=20
>> Could we let nvme_process_aers register another timer/BH to trigger
>> nvme_enqueue_req_completion in the iothread? In this way we won=E2=80=99=
t need the
>> timer_mod in nvme_enqueue_req_completion.
>=20
> Yes, we could have process_aers in a timer. Which would probably be
> preferable in order to limit the amount of work the mmio handler is
> doing in that rare case. However, its such a rare case (only =
misbehaving
> drivers) that it's probably not worth optimizing for.

I think putting nvme_process_aers in a timer can help make sure
nvme_enqueue_req_completion is only called in an iothread context. =
Currently
it can be called either in iothread or vcpu thread. So
nvme_enqueue_req_completion has to infer its context, in my patch using =
the
cq->ioeventfd_enabled flag. This approach is probably error-prone. =
Honestly
I am not sure whether cq->ioeventfd_enabled is enough to guarantee we =
are in
iothread.

>> We can also avoid some potential currency problems because CQ is only
>> modified in the iothread.
>=20
> There are currently no concurrency problems because of the Big QEMU
> Lock. When the mmio handler is running, the vcpu holds the BQL (and
> whenever the main iothread is running, it is holding the BQL).

Will this still hold when we move on to iothreads?

>=20
>> BTW, are there any reason that we must use timers (not BH) here? Also =
why do
>> we choose to delay for 500ns?
>=20
> No particular reason. do not see any reason why this could not be =
bottom
> halfs. This will likely change into bhs when we add iothread support
> anyway.

I will try BH when I start the iothread work.


