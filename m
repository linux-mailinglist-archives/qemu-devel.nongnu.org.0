Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C9932F907
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 09:49:14 +0100 (CET)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIScc-0005GL-0N
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 03:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ8-0001Ti-Ct
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ5-0003La-0U
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:38 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsynC2vG2zjVqB;
 Sat,  6 Mar 2021 16:43:43 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 16:45:18 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 10/18] migration/rdma: Create the multifd recv channels
 for RDMA
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-11-git-send-email-zhengchuan@huawei.com>
 <20210203185906.GT2950@work-vm>
Message-ID: <14e99256-9a86-9052-111b-4fd6fec8f3e0@huawei.com>
Date: Sat, 6 Mar 2021 16:45:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203185906.GT2950@work-vm>
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



On 2021/2/4 2:59, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> We still don't transmit anything through them, and we only build
>> the RDMA connections.
>>
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/rdma.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 67 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 996afb0..ed8a015 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -3267,6 +3267,40 @@ static void rdma_cm_poll_handler(void *opaque)
>>      }
>>  }
>>  
>> +static bool qemu_rdma_accept_setup(RDMAContext *rdma)
>> +{
>> +    RDMAContext *multifd_rdma = NULL;
>> +    int thread_count;
>> +    int i;
>> +    MultiFDRecvParams *multifd_recv_param;
>> +    thread_count = migrate_multifd_channels();
>> +    /* create the multifd channels for RDMA */
>> +    for (i = 0; i < thread_count; i++) {
>> +        if (get_multifd_recv_param(i, &multifd_recv_param) < 0) {
>> +            error_report("rdma: error getting multifd_recv_param(%d)", i);
>> +            return false;
>> +        }
>> +
>> +        multifd_rdma = (RDMAContext *) multifd_recv_param->rdma;
>> +        if (multifd_rdma->cm_id == NULL) {
>> +            break;
>> +        } else {
>> +            multifd_rdma = NULL;
>> +        }
> 
> I'm confused by what this if is doing - what are the two cases?
> 
Since we share the CM channel and CM id with main thread,
we assign the cmd_id through the callback rdma_accept_incoming_migration() for the multifd thread if cm_id is NULL.
Once it is assigned, we could go to the normal rdma_cm_poll_handler() set handler.

>> +    }
>> +
>> +    if (multifd_rdma) {
>> +        qemu_set_fd_handler(rdma->channel->fd,
>> +                            rdma_accept_incoming_migration,
>> +                            NULL, (void *)(intptr_t)multifd_rdma);
>> +    } else {
>> +        qemu_set_fd_handler(rdma->channel->fd, rdma_cm_poll_handler,
>> +                            NULL, rdma);
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>  static int qemu_rdma_accept(RDMAContext *rdma)
>>  {
>>      RDMACapabilities cap;
>> @@ -3366,6 +3400,10 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>>          qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
>>                              NULL,
>>                              (void *)(intptr_t)rdma->return_path);
>> +    } else if (migrate_use_multifd()) {
>> +        if (!qemu_rdma_accept_setup(rdma)) {
>> +            goto err_rdma_dest_wait;
>> +        }
>>      } else {
>>          qemu_set_fd_handler(rdma->channel->fd, rdma_cm_poll_handler,
>>                              NULL, rdma);
>> @@ -3976,6 +4014,34 @@ static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>>      return rioc->file;
>>  }
>>  
>> +static void migration_rdma_process_incoming(QEMUFile *f,
>> +                                            RDMAContext *rdma, Error **errp)
>> +{
>> +    MigrationIncomingState *mis = migration_incoming_get_current();
>> +    QIOChannel *ioc = NULL;
>> +    bool start_migration = false;
>> +
>> +    if (!migrate_use_multifd()) {
>> +        rdma->migration_started_on_destination = 1;
>> +        migration_fd_process_incoming(f, errp);
>> +        return;
>> +    }
>> +
>> +    if (!mis->from_src_file) {
>> +        mis->from_src_file = f;
>> +        qemu_file_set_blocking(f, false);
>> +    } else {
>> +        ioc = QIO_CHANNEL(getQIOChannel(f));
>> +        /* Multiple connections */
>> +        assert(migrate_use_multifd());
> 
> Are you sure that's never triggerable by something trying to connect
> badly? If it was it would be better to error than abort.
> 
This is the similiar action with tcp multifd which is introduced by a429e7f4887313370,
However we will never get there if migrate_use_multifd is false because of return at the first judgement of function, we could not do it or just put a warning.

>> +        start_migration = multifd_recv_new_channel(ioc, errp);
> 
> And what does 'start_migration' mean here - is that meaning that we have
> a full set of connections?
> 
Yes, multifd_recv_new_channel returns true when correctly receiving all channels.

> Dave
> 
>> +    }
>> +
>> +    if (start_migration) {
>> +        migration_incoming_process();
>> +    }
>> +}
>> +
>>  static void rdma_accept_incoming_migration(void *opaque)
>>  {
>>      RDMAContext *rdma = opaque;
>> @@ -4004,8 +4070,7 @@ static void rdma_accept_incoming_migration(void *opaque)
>>          return;
>>      }
>>  
>> -    rdma->migration_started_on_destination = 1;
>> -    migration_fd_process_incoming(f, &local_err);
>> +    migration_rdma_process_incoming(f, rdma, &local_err);
>>      if (local_err) {
>>          error_reportf_err(local_err, "RDMA ERROR:");
>>      }
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

