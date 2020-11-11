Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C152AEAB0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 08:58:17 +0100 (CET)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcl1E-0008Og-9A
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 02:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcl0B-0007dA-MY
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 02:57:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcl05-0001XR-S3
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 02:57:11 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWHBC5rfVz15Tpk;
 Wed, 11 Nov 2020 15:56:51 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 15:56:52 +0800
Subject: Re: [PATCH v3 04/18] migration/rdma: add multifd_setup_ops for rdma
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
 <1602908748-43335-5-git-send-email-zhengchuan@huawei.com>
 <20201110123037.GE3108@work-vm>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <44d5f215-673a-cddb-2429-175f20bb266d@huawei.com>
Date: Wed, 11 Nov 2020 15:56:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201110123037.GE3108@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 02:07:52
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 fengzhimin1@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/11/10 20:30, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/multifd.c |  6 ++++
>>  migration/multifd.h |  4 +++
>>  migration/rdma.c    | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 92 insertions(+)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 1f82307..0d494df 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -1210,6 +1210,12 @@ MultiFDSetup *multifd_setup_ops_init(void)
>>  {
>>      MultiFDSetup *ops;
>>  
>> +#ifdef CONFIG_RDMA
>> +    if (migrate_use_rdma()) {
>> +        ops = multifd_rdma_setup();
>> +        return ops;
>> +    }
>> +#endif
>>      ops = &multifd_socket_ops;
>>      return ops;
>>  }
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 446315b..62a0b2a 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -173,6 +173,10 @@ typedef struct {
>>      void (*recv_channel_setup)(QIOChannel *ioc, MultiFDRecvParams *p);
>>  } MultiFDSetup;
>>  
>> +#ifdef CONFIG_RDMA
>> +MultiFDSetup *multifd_rdma_setup(void);
>> +#endif
>> +MultiFDSetup *multifd_setup_ops_init(void);
>>  void multifd_register_ops(int method, MultiFDMethods *ops);
>>  
>>  #endif
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 0340841..ad4e4ba 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -19,6 +19,7 @@
>>  #include "qemu/cutils.h"
>>  #include "rdma.h"
>>  #include "migration.h"
>> +#include "multifd.h"
>>  #include "qemu-file.h"
>>  #include "ram.h"
>>  #include "qemu-file-channel.h"
>> @@ -4138,3 +4139,84 @@ err:
>>      g_free(rdma);
>>      g_free(rdma_return_path);
>>  }
>> +
>> +static void *multifd_rdma_send_thread(void *opaque)
>> +{
>> +    MultiFDSendParams *p = opaque;
>> +
>> +    while (true) {
>> +        qemu_mutex_lock(&p->mutex);
>> +        if (p->quit) {
>> +            qemu_mutex_unlock(&p->mutex);
>> +            break;
>> +        }
>> +        qemu_mutex_unlock(&p->mutex);
>> +        qemu_sem_wait(&p->sem);
>> +    }
>> +
>> +    qemu_mutex_lock(&p->mutex);
>> +    p->running = false;
>> +    qemu_mutex_unlock(&p->mutex);
>> +
>> +    return NULL;
>> +}
> 
> You might like to consider using WITH_QEMU_LOCK_GUARD, I think that
> would become:
> 
>   while (true) {
>       WITH_QEMU_LOCK_GUARD(&p->mutex) {
>           if (p->quit) {
>               break;
>           }
>       }
>       qemu_sem_wait(&p->sem);
>   }
>   WITH_QEMU_LOCK_GUARD(&p->mutex) {
>       p->running = false;
>   }
> 
OK. and this remind me now we keep qemu_mutex_lock(&p->mutex); in our multifd code, it that should also optimized?
>> +
>> +static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
>> +{
>> +    Error *local_err = NULL;
>> +
>> +    if (p->quit) {
>> +        error_setg(&local_err, "multifd: send id %d already quit", p->id);
>> +        return ;
>> +    }
>> +    p->running = true;
>> +
>> +    qemu_thread_create(&p->thread, p->name, multifd_rdma_send_thread, p,
>> +                       QEMU_THREAD_JOINABLE);
>> +}
>> +
>> +static void *multifd_rdma_recv_thread(void *opaque)
>> +{
>> +    MultiFDRecvParams *p = opaque;
>> +
>> +    while (true) {
>> +        qemu_mutex_lock(&p->mutex);
>> +        if (p->quit) {
>> +            qemu_mutex_unlock(&p->mutex);
>> +            break;
>> +        }
>> +        qemu_mutex_unlock(&p->mutex);
>> +        qemu_sem_wait(&p->sem_sync);
>> +    }
>> +
>> +    qemu_mutex_lock(&p->mutex);
>> +    p->running = false;
>> +    qemu_mutex_unlock(&p->mutex);
>> +
>> +    return NULL;
>> +}
>> +
>> +static void multifd_rdma_recv_channel_setup(QIOChannel *ioc,
>> +                                            MultiFDRecvParams *p)
>> +{
>> +    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
>> +
>> +    p->file = rioc->file;
>> +    return;
>> +}
>> +
>> +static MultiFDSetup multifd_rdma_ops = {
>> +    .send_thread_setup = multifd_rdma_send_thread,
>> +    .recv_thread_setup = multifd_rdma_recv_thread,
>> +    .send_channel_setup = multifd_rdma_send_channel_setup,
>> +    .recv_channel_setup = multifd_rdma_recv_channel_setup
>> +};
>> +
>> +MultiFDSetup *multifd_rdma_setup(void)
>> +{
>> +    MultiFDSetup *rdma_ops;
>> +
>> +    rdma_ops = &multifd_rdma_ops;
>> +
>> +    return rdma_ops;
> 
> Why bother making this a function - just export multifd_rdma_ops ?
> 
> Dave
> 
OK, will consider in that way.

>> +}
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

