Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF715821F9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:22:41 +0200 (CEST)
Received: from localhost ([::1]:37468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcJT-0002cP-Ik
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGcE1-0007sF-4s
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:17:01 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52910 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGcDu-0000AL-Q3
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:17:00 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-01 (Coremail) with SMTP id qwCowACHaVpj9OBiuw36Ag--.46851S2;
 Wed, 27 Jul 2022 16:16:36 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YuDkBkrqXaosJbRM@apples>
Date: Wed, 27 Jul 2022 16:16:32 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, kbusch@kernel.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <42878984-948E-4D65-8CA0-293564640F35@ict.ac.cn>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples> <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples> <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples> <Yt/O8+n1pf3SRR7e@apples>
 <Yt/Qs5PelXjX8E1v@apples> <Yt/ZKVHjSTTt08MV@apples> <YuDkBkrqXaosJbRM@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowACHaVpj9OBiuw36Ag--.46851S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18WF17JF4DWr4UGFWfXwb_yoW8ur1Dpa
 4kWrZYganFya4jgF4YqFs2yr1v93yjgr1DCr43Gry7GFnayr97GFWUCF18KFyfArsrXr15
 AayjqrsrZ347JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5ZL07UUUUU==
X-Originating-IP: [159.226.43.13]
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

at 3:06 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jul 26 14:08, Klaus Jensen wrote:
>> Alright. Forget about the iommu, that was just a coincidence.
>>=20
>> This patch seems to fix it. I guess it is the
>> event_notifier_set_handler(..., NULL) that does the trick, but I'd =
like
>> to understand why ;)
>>=20
>>=20
>> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
>> index 533ad14e7a61..3bc3c6bfbe78 100644
>> --- i/hw/nvme/ctrl.c
>> +++ w/hw/nvme/ctrl.c
>> @@ -4238,7 +4238,9 @@ static void nvme_cq_notifier(EventNotifier *e)
>>     NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
>>     NvmeCtrl *n =3D cq->ctrl;
>>=20
>> -    event_notifier_test_and_clear(&cq->notifier);
>> +    if (!event_notifier_test_and_clear(e)) {
>> +        return;
>> +    }
>>=20
>>     nvme_update_cq_head(cq);
>>=20
>> @@ -4275,7 +4277,9 @@ static void nvme_sq_notifier(EventNotifier *e)
>> {
>>     NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
>>=20
>> -    event_notifier_test_and_clear(&sq->notifier);
>> +    if (!event_notifier_test_and_clear(e)) {
>> +        return;
>> +    }
>>=20

Yes, virtio also checks the return value of =
event_notifier_test_and_clear().

>>     nvme_process_sq(sq);
>> }
>> @@ -4307,6 +4311,8 @@ static void nvme_free_sq(NvmeSQueue *sq, =
NvmeCtrl *n)
>>     if (sq->ioeventfd_enabled) {
>>         memory_region_del_eventfd(&n->iomem,
>>                                   0x1000 + offset, 4, false, 0, =
&sq->notifier);
>> +        event_notifier_set_handler(&sq->notifier, NULL);
>> +        nvme_sq_notifier(&sq->notifier);
>>         event_notifier_cleanup(&sq->notifier);
>>     }
>>     g_free(sq->io_req);
>> @@ -4697,6 +4703,8 @@ static void nvme_free_cq(NvmeCQueue *cq, =
NvmeCtrl *n)
>>     if (cq->ioeventfd_enabled) {
>>         memory_region_del_eventfd(&n->iomem,
>>                                   0x1000 + offset, 4, false, 0, =
&cq->notifier);
>> +        event_notifier_set_handler(&cq->notifier, NULL);
>> +        nvme_cq_notifier(&cq->notifier);
>>         event_notifier_cleanup(&cq->notifier);
>>     }
>>     if (msix_enabled(&n->parent_obj)) {
>=20

I=E2=80=99m a bit messed up here. I will further check how virtio =
handles queue deletion today.=


