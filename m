Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68223AB4DD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:36:23 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltsBy-0007uB-Ot
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lts0M-0000q7-P0; Thu, 17 Jun 2021 09:24:22 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:33315
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lts0J-0006k6-1k; Thu, 17 Jun 2021 09:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xg/CpoPf6Ga/DsUIGt+X9hD1AX4DsvTzSlRVZM36Wl4=; b=NmXEd/vrIu9MJPuhk4k5SmSLGU
 vKLFw60okIQjO6GlTELPfYE/TeE5RT9YlbVDaxnVrSd+QU4v8HearamYnOpUEWF9hod6nZAt7tI/p
 A2D19VyNc92sFlmb1xDOurt8K7H6awTT1UxKwLwQZEE/DAaqqPW8p4sVPFvFkD9MtTBYIHaS6nsZI
 rwmCdWZ+8VSKt3ZfPcOmQHFefEtDhoA92KvAboe1Mq2FShvDGoK1K6WmUBHfuG7Y81rlhL1ndACVH
 3EpRgOQd2CR3WtCq7BaEHrrKM2EjzZIR/N5sD7W34rEXqRcCwMt9+1BzCN19kQEPAQfIkqk4eQSRf
 ogAfj7qA==;
Received: from 93-153-64-87.customers.tmcz.cz ([93.153.64.87]
 helo=[192.168.0.108])
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) id 1lts0D-0003Bq-F6; Thu, 17 Jun 2021 15:24:13 +0200
Subject: Re: [PATCH] hw/nvme: fix pin-based interrupt behavior (again)
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210617100820.75510-1-its@irrelevant.dk>
 <YMsfXG+SeYuMvHlt@apples.localdomain>
From: =?UTF-8?B?SmFrdWIgSmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Message-ID: <7408fc95-6d6b-b3ce-698e-41cb268b8d03@kernkonzept.com>
Date: Thu, 17 Jun 2021 15:24:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMsfXG+SeYuMvHlt@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=jakub.jermar@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 12:09 PM, Klaus Jensen wrote:
> On Jun 17 12:08, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Jakub noticed[1] that, when using pin-based interrupts, the device will
>> unconditionally deasssert when any CQEs are acknowledged. However, the
>> pin should not be deasserted if other completion queues still holds
>> unacknowledged CQEs.
>>
>> The bug is an artifact of commit ca247d35098d ("hw/block/nvme: fix
>> pin-based interrupt behavior") which fixed one bug but introduced
>> another. This is the third time someone tries to fix pin-based
>> interrupts (see commit 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt
>> behaviour of NVMe"))...
>>
>> Third time's the charm, so fix it, again, by keeping track of how many
>> CQs have unacknowledged CQEs and only deassert when all are cleared.
>>
>>  [1]: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
>>
>> Fixes: ca247d35098d ("hw/block/nvme: fix pin-based interrupt behavior")
>> Reported-by: Jakub Jermář <jakub.jermar@kernkonzept.com>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>> hw/nvme/nvme.h |  1 +
>> hw/nvme/ctrl.c | 15 ++++++++++++++-
>> 2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index 93a7e0e5380e..60250b579464 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -405,6 +405,7 @@ typedef struct NvmeCtrl {
>>     uint32_t    max_q_ents;
>>     uint8_t     outstanding_aers;
>>     uint32_t    irq_status;
>> +    int         cq_pending;
>>     uint64_t    host_timestamp;                 /* Timestamp sent by 
>> the host */
>>     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>>     uint64_t    starttime_ms;
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 7dea64b72e6a..9419f67c4e88 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -473,7 +473,9 @@ static void nvme_irq_deassert(NvmeCtrl *n, 
>> NvmeCQueue *cq)
>>             return;
>>         } else {
>>             assert(cq->vector < 32);
>> -            n->irq_status &= ~(1 << cq->vector);
>> +            if (!n->cq_pending) {
>> +                n->irq_status &= ~(1 << cq->vector);
>> +            }
>>             nvme_irq_check(n);
>>         }
>>     }
>> @@ -1258,6 +1260,7 @@ static void nvme_post_cqes(void *opaque)
>>     NvmeCQueue *cq = opaque;
>>     NvmeCtrl *n = cq->ctrl;
>>     NvmeRequest *req, *next;
>> +    bool pending = cq->head != cq->tail;
>>     int ret;
>>
>>     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
>> @@ -1287,6 +1290,10 @@ static void nvme_post_cqes(void *opaque)
>>         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
>>     }
>>     if (cq->tail != cq->head) {
>> +        if (!pending) {
>> +            n->cq_pending++;
>> +        }
>> +
>>         nvme_irq_assert(n, cq);
>>     }
>> }
>> @@ -4099,6 +4106,11 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, 
>> NvmeRequest *req)
>>         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
>>         return NVME_INVALID_QUEUE_DEL;
>>     }
>> +
>> +    if (cq->tail != cq->head) {
>> +        n->cq_pending--;
>> +    }
>> +
>>     nvme_irq_deassert(n, cq);
>>     trace_pci_nvme_del_cq(qid);
>>     nvme_free_cq(cq, n);
>> @@ -5758,6 +5770,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr 
>> addr, int val)
>>         }
>>
>>         if (cq->tail == cq->head) {
>> +            n->cq_pending--;
>>             nvme_irq_deassert(n, cq);
>>         }
>>     } else {
>> -- 
>> 2.32.0
>>
> 
> Jakub, can you test this in your environment?

Yep, still tests fine.

Jakub

