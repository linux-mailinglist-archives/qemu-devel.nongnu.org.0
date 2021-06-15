Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B53A7834
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:44:21 +0200 (CEST)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3kC-0007us-4O
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lt3iL-0005zE-Tq; Tue, 15 Jun 2021 03:42:26 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:51373
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lt3iI-0002hr-So; Tue, 15 Jun 2021 03:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pq/OGSZNZr44GnBeT+UNeCgrlbUPu4iTaCuDRs22Lbs=; b=hosc4ULRQs7ChOmTM4Qtb09/np
 pLfC2BaXGGpjHAjiOFJo72AnwujYzjcEw1CMt2FaWYnfbWmESdCyQrZJkdK7W1Rmd8Z7lxCEvKbeO
 v5OQAZr1Yjo4qNvmHqoQ8UKjbu7WrBDVmY58P5Yhu28jw5tJ0gQL8B2xOAL5Lv/gPxlO1Y8PBjNF4
 Ml/JPdKkixjwhogCywU7EH3GgrHygLuJzeYuFxWhDJUdBEylTcShauNuzuVh35jFnHlQoIsK4WmDy
 OxzEDuaeovFYnpsRA1ONtsNxwZmYuy5XPwUGolrlL9qRcBn+HZkzc/4ptJMTeZiLbX66zWeWUhBBU
 CyyIlpkw==;
Received: from 93-153-64-87.customers.tmcz.cz ([93.153.64.87]
 helo=[192.168.0.108])
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) id 1lt3iF-0007yY-BH; Tue, 15 Jun 2021 09:42:19 +0200
Subject: Re: [PATCH v2] hw/nvme: be more careful when deasserting IRQs
To: Klaus Jensen <its@irrelevant.dk>
References: <20210614135429.56475-1-jakub.jermar@kernkonzept.com>
 <YMedu0Ry1YKJ/2SV@apples.localdomain>
From: =?UTF-8?B?SmFrdWIgSmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Message-ID: <ca7fc845-47e9-e122-e4c5-128761a0f2aa@kernkonzept.com>
Date: Tue, 15 Jun 2021 09:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMedu0Ry1YKJ/2SV@apples.localdomain>
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

On 6/14/21 8:19 PM, Klaus Jensen wrote:
> On Jun 14 15:54, Jakub Jermář wrote:
>> An IRQ vector used by a completion queue cannot be deasserted without
>> first checking if the same vector does not need to stay asserted for
>> some other completion queue. To this end the controller structure is
>> extended by a counter of asserted completion queues.
>>
>> To prevent incrementing the counter for completion queues that are
>> asserted repeatedly, each completion queue is extended by a flag which
>> tells whether the queue is currently asserted.
>>
> 
> I wasn't clear on this on my last review, but the misunderstanding here 
> is that the completion queue vector somehow matters for pin-based 
> interrupts - it does not. There is only *one* interrupt vector and if 
> the controller is not using MSI-X, then the Interrupt Vector (IV) field 
> of the Create I/O Completion Queue command *must* be zero.
> 
> In other words, all that matters is if there are one or more CQEs posted 
> (in any queue).

Ah, my bad. I got confused by the assert(vector < 32).

> Would this (untested) patch do the trick?

It works for my testcase, but I am not sure this will work when deassert 
is called when the IRQ is not necessarily asserted, such as in nvme_del_cq.

Jakub

> diff --git i/hw/nvme/nvme.h w/hw/nvme/nvme.h
> index 93a7e0e5380e..60250b579464 100644
> --- i/hw/nvme/nvme.h
> +++ w/hw/nvme/nvme.h
> @@ -405,6 +405,7 @@ typedef struct NvmeCtrl {
>       uint32_t    max_q_ents;
>       uint8_t     outstanding_aers;
>       uint32_t    irq_status;
> +    int         cq_pending;
>       uint64_t    host_timestamp;                 /* Timestamp sent by 
> the host */
>       uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>       uint64_t    starttime_ms;
> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> index 7dea64b72e6a..4de4b3177463 100644
> --- i/hw/nvme/ctrl.c
> +++ w/hw/nvme/ctrl.c
> @@ -473,6 +473,10 @@ static void nvme_irq_deassert(NvmeCtrl *n, 
> NvmeCQueue *cq)
>               return;
>           } else {
>               assert(cq->vector < 32);
> +            if (--(n->cq_pending)) {
> +                return;
> +            }
> +
>               n->irq_status &= ~(1 << cq->vector);
>               nvme_irq_check(n);
>           }
> @@ -1258,6 +1262,7 @@ static void nvme_post_cqes(void *opaque)
>       NvmeCQueue *cq = opaque;
>       NvmeCtrl *n = cq->ctrl;
>       NvmeRequest *req, *next;
> +    bool empty = cq->head == cq->tail;
>       int ret;
> 
>       QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
> @@ -1287,6 +1292,10 @@ static void nvme_post_cqes(void *opaque)
>           QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
>       }
>       if (cq->tail != cq->head) {
> +        if (empty) {
> +            n->cq_pending++;
> +        }
> +
>           nvme_irq_assert(n, cq);
>       }
>   }
> 
> 
>> Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
>> ---
>> hw/nvme/ctrl.c | 22 ++++++++++++++++------
>> hw/nvme/nvme.h |  2 ++
>> 2 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 0bcaf7192f..97a5d768ee 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -451,9 +451,13 @@ static void nvme_irq_assert(NvmeCtrl *n, 
>> NvmeCQueue *cq)
>>             msix_notify(&(n->parent_obj), cq->vector);
>>         } else {
>>             trace_pci_nvme_irq_pin();
>> -            assert(cq->vector < 32);
>> -            n->irq_status |= 1 << cq->vector;
>> -            nvme_irq_check(n);
>> +            if (!cq->irq_asserted) {
>> +                cq->irq_asserted = true;
>> +                assert(cq->vector < 32);
>> +                n->irq_asserted_cnt[cq->vector]++;
>> +                n->irq_status |= 1 << cq->vector;
>> +                nvme_irq_check(n);
>> +            }
>>         }
>>     } else {
>>         trace_pci_nvme_irq_masked();
>> @@ -466,9 +470,15 @@ static void nvme_irq_deassert(NvmeCtrl *n, 
>> NvmeCQueue *cq)
>>         if (msix_enabled(&(n->parent_obj))) {
>>             return;
>>         } else {
>> -            assert(cq->vector < 32);
>> -            n->irq_status &= ~(1 << cq->vector);
>> -            nvme_irq_check(n);
>> +            if (cq->irq_asserted) {
>> +                cq->irq_asserted = false;
>> +                assert(cq->vector < 32);
>> +                assert(n->irq_asserted_cnt[cq->vector]);
>> +                if (n->irq_asserted_cnt[cq->vector]-- == 1) {
>> +                    n->irq_status &= ~(1 << cq->vector);
>> +                }
>> +                nvme_irq_check(n);
>> +            }
>>         }
>>     }
>> }
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index 81a35cda14..753bf7a923 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -352,6 +352,7 @@ typedef struct NvmeCQueue {
>>     uint32_t    head;
>>     uint32_t    tail;
>>     uint32_t    vector;
>> +    bool        irq_asserted;
>>     uint32_t    size;
>>     uint64_t    dma_addr;
>>     QEMUTimer   *timer;
>> @@ -404,6 +405,7 @@ typedef struct NvmeCtrl {
>>     uint32_t    max_q_ents;
>>     uint8_t     outstanding_aers;
>>     uint32_t    irq_status;
>> +    uint16_t    irq_asserted_cnt[32];
>>     uint64_t    host_timestamp;                 /* Timestamp sent by 
>> the host */
>>     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>>     uint64_t    starttime_ms;
>> -- 
>> 2.31.1
>>
>>
> 


