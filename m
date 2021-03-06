Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21232F903
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 09:48:11 +0100 (CET)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lISba-0003FB-O2
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 03:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ7-0001Su-Nr
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ4-0003PN-Tg
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:37 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DsynF64xLz8sbn;
 Sat,  6 Mar 2021 16:43:45 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 16:45:22 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 14/18] migration/rdma: register memory for multifd RDMA
 channels
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-15-git-send-email-zhengchuan@huawei.com>
 <20210203201211.GX2950@work-vm>
Message-ID: <8482ecb7-15ad-7a6f-e835-b3be3524f8b5@huawei.com>
Date: Sat, 6 Mar 2021 16:45:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203201211.GX2950@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/2/4 4:12, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> 
> This could do with a description in the commit message of the sequence;
> I think you're waiting for the semaphore; doing the registratin, then
> waiting again to say that everyone has finished???
> 
Yes. The detailed description will be added in v5.
>> ---
>>  migration/multifd.c |  3 ++
>>  migration/rdma.c    | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  2 files changed, 93 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 919a414..1186246 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -537,6 +537,9 @@ void multifd_send_terminate_threads(Error *err)
>>          qemu_mutex_lock(&p->mutex);
>>          p->quit = true;
>>          qemu_sem_post(&p->sem);
>> +        if (migrate_use_rdma()) {
>> +            qemu_sem_post(&p->sem_sync);
>> +        }
>>          qemu_mutex_unlock(&p->mutex);
>>      }
>>  }
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 1095a8f..c906cc7 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -3838,6 +3838,19 @@ static int rdma_load_hook(QEMUFile *f, void *opaque, uint64_t flags, void *data)
>>          return rdma_block_notification_handle(opaque, data);
>>  
>>      case RAM_CONTROL_HOOK:
>> +        if (migrate_use_multifd()) {
>> +            int i;
>> +            MultiFDRecvParams *multifd_recv_param = NULL;
>> +            int thread_count = migrate_multifd_channels();
>> +            /* Inform dest recv_thread to poll */
>> +            for (i = 0; i < thread_count; i++) {
>> +                if (get_multifd_recv_param(i, &multifd_recv_param)) {
>> +                    return -1;
>> +                }
>> +                qemu_sem_post(&multifd_recv_param->sem_sync);
>> +            }
>> +        }
>> +
>>          return qemu_rdma_registration_handle(f, opaque);
>>  
>>      default:
>> @@ -3910,6 +3923,24 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>>          head.type = RDMA_CONTROL_RAM_BLOCKS_REQUEST;
>>          trace_qemu_rdma_registration_stop_ram();
>>  
>> +        if (migrate_use_multifd()) {
>> +            /*
>> +             * Inform the multifd channels to register memory
>> +             */
>> +            int i;
>> +            int thread_count = migrate_multifd_channels();
>> +            MultiFDSendParams *multifd_send_param = NULL;
>> +            for (i = 0; i < thread_count; i++) {
>> +                ret = get_multifd_send_param(i, &multifd_send_param);
>> +                if (ret) {
>> +                    error_report("rdma: error getting multifd(%d)", i);
>> +                    return ret;
>> +                }
>> +
>> +                qemu_sem_post(&multifd_send_param->sem_sync);
>> +            }
>> +        }
>> +
>>          /*
>>           * Make sure that we parallelize the pinning on both sides.
>>           * For very large guests, doing this serially takes a really
>> @@ -3968,6 +3999,21 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>>                      rdma->dest_blocks[i].remote_host_addr;
>>              local->block[i].remote_rkey = rdma->dest_blocks[i].remote_rkey;
>>          }
>> +        /* Wait for all multifd channels to complete registration */
>> +        if (migrate_use_multifd()) {
>> +            int i;
>> +            int thread_count = migrate_multifd_channels();
>> +            MultiFDSendParams *multifd_send_param = NULL;
>> +            for (i = 0; i < thread_count; i++) {
>> +                ret = get_multifd_send_param(i, &multifd_send_param);
>> +                if (ret) {
>> +                    error_report("rdma: error getting multifd(%d)", i);
>> +                    return ret;
>> +                }
>> +
>> +                qemu_sem_wait(&multifd_send_param->sem);
>> +            }
>> +        }
>>      }
>>  
>>      trace_qemu_rdma_registration_stop(flags);
>> @@ -3979,6 +4025,24 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>>          goto err;
>>      }
>>  
>> +    if (migrate_use_multifd()) {
>> +        /*
>> +         * Inform src send_thread to send FINISHED signal.
>> +         * Wait for multifd RDMA send threads to poll the CQE.
>> +         */
>> +        int i;
>> +        int thread_count = migrate_multifd_channels();
>> +        MultiFDSendParams *multifd_send_param = NULL;
>> +        for (i = 0; i < thread_count; i++) {
>> +            ret = get_multifd_send_param(i, &multifd_send_param);
>> +            if (ret < 0) {
>> +                goto err;
>> +            }
>> +
>> +            qemu_sem_post(&multifd_send_param->sem_sync);
>> +        }
>> +    }
>> +
>>      return 0;
>>  err:
>>      rdma->error_state = ret;
>> @@ -4355,19 +4419,37 @@ static void *multifd_rdma_send_thread(void *opaque)
>>  {
>>      MultiFDSendParams *p = opaque;
>>      Error *local_err = NULL;
>> +    int ret = 0;
>> +    RDMAControlHeader head = { .len = 0, .repeat = 1 };
>>  
>>      trace_multifd_send_thread_start(p->id);
>>      if (multifd_send_initial_packet(p, &local_err) < 0) {
>>          goto out;
>>      }
>>  
>> +    /* wait for semaphore notification to register memory */
>> +    qemu_sem_wait(&p->sem_sync);
>> +    if (qemu_rdma_registration(p->rdma) < 0) {
>> +        goto out;
>> +    }
>> +    /*
>> +     * Inform the main RDMA thread to run when multifd
>> +     * RDMA thread have completed registration.
>> +     */
>> +    qemu_sem_post(&p->sem);
>>      while (true) {
>> +        qemu_sem_wait(&p->sem_sync);
>>          WITH_QEMU_LOCK_GUARD(&p->mutex) {
>>              if (p->quit) {
>>                  break;
>>              }
>>          }
>> -        qemu_sem_wait(&p->sem);
> 
> Is this something where you put the line in just a few patches earlier -
> if so, put it in the right place in the original patch.
> 
> Dave
> 
My mistake. this is wrong place in patch-004, will correct it. Thanks.

>> +        /* Send FINISHED to the destination */
>> +        head.type = RDMA_CONTROL_REGISTER_FINISHED;
>> +        ret = qemu_rdma_exchange_send(p->rdma, &head, NULL, NULL, NULL, NULL);
>> +        if (ret < 0) {
>> +            return NULL;
>> +        }
>>      }
>>  
>>  out:
>> @@ -4406,14 +4488,20 @@ static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
>>  static void *multifd_rdma_recv_thread(void *opaque)
>>  {
>>      MultiFDRecvParams *p = opaque;
>> +    int ret = 0;
>>  
>>      while (true) {
>> +        qemu_sem_wait(&p->sem_sync);
>>          WITH_QEMU_LOCK_GUARD(&p->mutex) {
>>              if (p->quit) {
>>                  break;
>>              }
>>          }
>> -        qemu_sem_wait(&p->sem_sync);
>> +        ret = qemu_rdma_registration_handle(p->file, p->c);
>> +        if (ret < 0) {
>> +            qemu_file_set_error(p->file, ret);
>> +            break;
>> +        }
>>      }
>>  
>>      WITH_QEMU_LOCK_GUARD(&p->mutex) {
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

