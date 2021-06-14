Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3083A6881
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:53:58 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsn2L-0006oT-Iq
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lsn0k-0005vn-AU; Mon, 14 Jun 2021 09:52:18 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:49271
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lsn0i-000496-Eb; Mon, 14 Jun 2021 09:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b8Un2EhZYDqDGUvqRlyqj6u/mQF7OODEb1gPCu7oX7g=; b=XCI1Vr+WBF5Q5vbINk+Mcvluyy
 To0m6zzaaS8wDcZQTCDVXK25ciefs0HYeXay+KqBSOrmwgrYHDXKscF2A4FY2oQcRCMudYjUNoOgJ
 LaKq5xqw6w8KmgqdBihSQNESA0Ejzv4ybM5n/a3kD4rD9m7tAfsBfJojumFHxZE4ONtm0YrynLceU
 yfUQ2IEo6ffkjipsiPVVd76SMZLFNIoHbdl5ktXmvbwdB5kPqCA+XagfdcptsLA7Guc0VDo7UhipO
 wcMIzWDDuSC7yS5xkupN6dioW3cItLp98/yAXT8TGiisSbasjeHDk0X0NoWcFCN86ou7UIEYORSjL
 eDKQfqlg==;
Received: from 93-153-64-87.customers.tmcz.cz ([93.153.64.87]
 helo=[192.168.0.108])
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) id 1lsn0e-0006N2-12; Mon, 14 Jun 2021 15:52:12 +0200
Subject: Re: [PATCH] hw/nvme: be more careful when deasserting IRQs
To: Klaus Jensen <its@irrelevant.dk>
References: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
 <YMJWn27U+Gubgdl3@apples.localdomain>
From: =?UTF-8?B?SmFrdWIgSmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Message-ID: <7cb5bd98-57c9-6f2a-0fc0-11241a716453@kernkonzept.com>
Date: Mon, 14 Jun 2021 15:52:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMJWn27U+Gubgdl3@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=jakub.jermar@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 8:14 PM, Klaus Jensen wrote:
> On Jun 10 13:46, Jakub Jermář wrote:
>> An IRQ vector used by a completion queue cannot be deasserted without
>> first checking if the same vector does not need to stay asserted for
>> some other completion queue.
>>
>> Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
>> ---
>> hw/nvme/ctrl.c | 21 +++++++++++++++++++--
>> 1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 0bcaf7192f..c0980929eb 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -473,6 +473,21 @@ static void nvme_irq_deassert(NvmeCtrl *n, 
>> NvmeCQueue *cq)
>>     }
>> }
>>
>> +/*
>> + * Check if the vector used by the cq can be deasserted, i.e. it 
>> needn't be
>> + * asserted for some other cq.
>> + */
>> +static bool nvme_irq_can_deassert(NvmeCtrl *n, NvmeCQueue *cq)
>> +{
>> +    for (unsigned qid = 0; qid < n->params.max_ioqpairs + 1; qid++) {
>> +        NvmeCQueue *q = n->cq[qid];
>> +
>> +        if (q && q->vector == cq->vector && q->head != q->tail)
>> +            return false;  /* some queue needs this to stay asserted */
>> +    }
>> +    return true;
>> +}
>> +
>> static void nvme_req_clear(NvmeRequest *req)
>> {
>>     req->ns = NULL;
>> @@ -4089,7 +4104,9 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, 
>> NvmeRequest *req)
>>         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
>>         return NVME_INVALID_QUEUE_DEL;
>>     }
>> -    nvme_irq_deassert(n, cq);
>> +    if (nvme_irq_can_deassert(n, cq)) {
>> +        nvme_irq_deassert(n, cq);
>> +    }
>>     trace_pci_nvme_del_cq(qid);
>>     nvme_free_cq(cq, n);
>>     return NVME_SUCCESS;
>> @@ -5757,7 +5774,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr 
>> addr, int val)
>>             timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) 
>> + 500);
>>         }
>>
>> -        if (cq->tail == cq->head) {
>> +        if (nvme_irq_can_deassert(n, cq)) {
>>             nvme_irq_deassert(n, cq);
>>         }
>>     } else {
>> -- 
>> 2.31.1
>>
> 
> This is actually an artifact of commit ca247d35098d3 ("hw/block/nvme: 
> fix pin-based interrupt behavior") that I did a year ago. Prior to that 
> fix, the completion queue id was used to index the internal IS register 
> (irq_status), which, while wrong spec-wise, had the effect of... 
> actually working.
> 
> Anyway, I agree that the logic is flawed right now, since we should only 
> deassert when all outstanding cqe's have been acknowledged by the host.
> 
> nvme_irq_can_deassert should be guarded with a check on msix_enabled(), 
> but in any case I am not happy about looping over all completion queues 
> on each cq doorbell write. I think this can be ref counted? I.e. 
> decrement when cq->tail == cq->head on the cq doorbell write and 
> increment only when going from empty to non-empty in nvme_post_cqes().

I reworked this to use reference counting in v2.

Jakub

