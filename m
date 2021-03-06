Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D532F909
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 09:50:59 +0100 (CET)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lISeI-0006it-5q
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 03:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZA-0001Uu-3R
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:40 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ5-0003Qg-NK
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:39 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dsymm5s73zMhk5;
 Sat,  6 Mar 2021 16:43:20 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 16:45:26 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 17/18] migration/rdma: send data for both rdma-pin-all
 and NOT rdma-pin-all mode
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-18-git-send-email-zhengchuan@huawei.com>
 <20210204101836.GE3039@work-vm>
Message-ID: <1f1e75f3-c619-19e1-a6fe-bfc6f01992e6@huawei.com>
Date: Sat, 6 Mar 2021 16:45:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210204101836.GE3039@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/2/4 18:18, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/rdma.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 61 insertions(+), 4 deletions(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 2097839..c19a91f 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -2002,6 +2002,20 @@ static int qemu_rdma_write_one(QEMUFile *f, RDMAContext *rdma,
>>                                 .repeat = 1,
>>                               };
>>  
>> +    /* use multifd to send data */
>> +    if (migrate_use_multifd()) {
>> +        int channel = get_multifd_RDMA_channel();
>> +        int ret = 0;
>> +        MultiFDSendParams *multifd_send_param = NULL;
>> +        ret = get_multifd_send_param(channel, &multifd_send_param);
>> +        if (ret) {
>> +            error_report("rdma: error getting multifd_send_param(%d)", channel);
>> +            return -EINVAL;
>> +        }
>> +        rdma = (RDMAContext *)multifd_send_param->rdma;
>> +        block = &(rdma->local_ram_blocks.block[current_index]);
>> +    }
>> +
>>  retry:
>>      sge.addr = (uintptr_t)(block->local_host_addr +
>>                              (current_addr - block->offset));
>> @@ -2197,6 +2211,27 @@ retry:
>>      return 0;
>>  }
>>  
>> +static int multifd_rdma_write_flush(void)
>> +{
>> +    /* The multifd RDMA threads send data */
>> +    MultiFDSendParams *multifd_send_param = NULL;
>> +    RDMAContext *rdma = NULL;
>> +    MigrationState *s = migrate_get_current();
>> +    int ret = 0;
>> +
>> +    ret = get_multifd_send_param(s->rdma_channel,
>> +                                 &multifd_send_param);
>> +    if (ret) {
>> +        error_report("rdma: error getting multifd_send_param(%d)",
>> +                     s->rdma_channel);
> 
> Do we need these error_report's for get_multifd_send_param calls - how
> can they fail in practice?
> 
Maybe we do not need it.
The s->rdma_channel should not exceed the migrate_multifd_channels and should not negative.

>> +        return ret;
>> +    }
>> +    rdma = (RDMAContext *)(multifd_send_param->rdma);
>> +    rdma->nb_sent++;
>> +
>> +    return ret;
> 
> But this doesn't actually 'flush' anything?
> 
Yes, it just use to increase the nb_sent. we need to choose a more suitable function name.

>> +}
>> +
>>  /*
>>   * Push out any unwritten RDMA operations.
>>   *
>> @@ -2219,8 +2254,15 @@ static int qemu_rdma_write_flush(QEMUFile *f, RDMAContext *rdma)
>>      }
>>  
>>      if (ret == 0) {
>> -        rdma->nb_sent++;
>> -        trace_qemu_rdma_write_flush(rdma->nb_sent);
>> +        if (migrate_use_multifd()) {
>> +            ret = multifd_rdma_write_flush();
>> +            if (ret) {
>> +                return ret;
>> +            }
>> +        } else {
>> +            rdma->nb_sent++;
>> +            trace_qemu_rdma_write_flush(rdma->nb_sent);
>> +        }
>>      }
>>  
>>      rdma->current_length = 0;
>> @@ -4062,6 +4104,7 @@ wait_reg_complete:
>>              }
>>  
>>              qemu_sem_post(&multifd_send_param->sem_sync);
>> +            qemu_sem_wait(&multifd_send_param->sem);
> 
> why?
> 
The multifd send thread would post sem signal after finishing sending data.
The main thread need wait for multifd RDMA send threads to poll the CQE.
>>          }
>>      }
>>  
>> @@ -4443,6 +4486,7 @@ static void *multifd_rdma_send_thread(void *opaque)
>>      Error *local_err = NULL;
>>      int ret = 0;
>>      RDMAControlHeader head = { .len = 0, .repeat = 1 };
>> +    RDMAContext *rdma = p->rdma;
>>  
>>      trace_multifd_send_thread_start(p->id);
>>      if (multifd_send_initial_packet(p, &local_err) < 0) {
>> @@ -4451,7 +4495,7 @@ static void *multifd_rdma_send_thread(void *opaque)
>>  
>>      /* wait for semaphore notification to register memory */
>>      qemu_sem_wait(&p->sem_sync);
>> -    if (qemu_rdma_registration(p->rdma) < 0) {
>> +    if (qemu_rdma_registration(rdma) < 0) {
>>          goto out;
>>      }
>>      /*
>> @@ -4466,12 +4510,25 @@ static void *multifd_rdma_send_thread(void *opaque)
>>                  break;
>>              }
>>          }
>> +        /* To complete polling(CQE) */
>> +        while (rdma->nb_sent) {
> 
> Where is nb_sent decremented?
> 
the nb_sent is decreased in qemu_rdma_poll which is called by qemu_rdma_block_for_wrid.

>> +            ret = qemu_rdma_block_for_wrid(rdma, RDMA_WRID_RDMA_WRITE, NULL);
>> +            if (ret < 0) {
>> +                error_report("multifd RDMA migration: "
>> +                             "complete polling error!");
>> +                return NULL;
>> +            }
>> +        }
>>          /* Send FINISHED to the destination */
>>          head.type = RDMA_CONTROL_REGISTER_FINISHED;
>> -        ret = qemu_rdma_exchange_send(p->rdma, &head, NULL, NULL, NULL, NULL);
>> +        ret = qemu_rdma_exchange_send(rdma, &head, NULL, NULL, NULL, NULL);
>>          if (ret < 0) {
>> +            error_report("multifd RDMA migration: "
>> +                         "sending remote error!");
>>              return NULL;
>>          }
>> +        /* sync main thread */
>> +        qemu_sem_post(&p->sem);
>>      }
>>  
>>  out:
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

