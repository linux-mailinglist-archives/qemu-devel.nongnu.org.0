Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E189B32F904
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 09:48:26 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lISbp-0003Lv-Vc
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 03:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZH-0001de-C7
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:47 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZC-0003UM-Tz
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:47 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dsynp4WJPzjVbg;
 Sat,  6 Mar 2021 16:44:14 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 16:45:30 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 18/18] migration/rdma: RDMA cleanup for multifd
 migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-19-git-send-email-zhengchuan@huawei.com>
 <20210204103243.GF3039@work-vm>
Message-ID: <99dbb52f-e5fd-a7b4-8b50-ef9bfb484d0f@huawei.com>
Date: Sat, 6 Mar 2021 16:45:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210204103243.GF3039@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 2021/2/4 18:32, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/multifd.c |  6 ++++++
>>  migration/multifd.h |  1 +
>>  migration/rdma.c    | 16 +++++++++++++++-
>>  3 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 1186246..4031648 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -577,6 +577,9 @@ void multifd_save_cleanup(void)
>>          p->packet_len = 0;
>>          g_free(p->packet);
>>          p->packet = NULL;
>> +#ifdef CONFIG_RDMA
>> +        multifd_rdma_cleanup(p->rdma);
>> +#endif
> 
> You may find it easier to add an entry into stubs/ for
> multifd_rdma_cleanup; it then avoids the need for the ifdef.
> 
OK. I will do that in V5.

>>          multifd_send_state->ops->send_cleanup(p, &local_err);
>>          if (local_err) {
>>              migrate_set_error(migrate_get_current(), local_err);
>> @@ -1039,6 +1042,9 @@ int multifd_load_cleanup(Error **errp)
>>          p->packet_len = 0;
>>          g_free(p->packet);
>>          p->packet = NULL;
>> +#ifdef CONFIG_RDMA
>> +        multifd_rdma_cleanup(p->rdma);
>> +#endif
>>          multifd_recv_state->ops->recv_cleanup(p);
>>      }
>>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 26d4489..0ecec5e 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -183,6 +183,7 @@ typedef struct {
>>  
>>  #ifdef CONFIG_RDMA
>>  extern MultiFDSetup multifd_rdma_ops;
>> +void multifd_rdma_cleanup(void *opaque);
>>  #endif
>>  void multifd_send_terminate_threads(Error *err);
>>  int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp);
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index c19a91f..f14357f 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -2369,7 +2369,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
>>  {
>>      int idx;
>>  
>> -    if (rdma->cm_id && rdma->connected) {
>> +    if (rdma->channel && rdma->cm_id && rdma->connected) {
>>          if ((rdma->error_state ||
>>               migrate_get_current()->state == MIGRATION_STATUS_CANCELLING) &&
>>              !rdma->received_error) {
>> @@ -4599,6 +4599,20 @@ static void multifd_rdma_recv_channel_setup(QIOChannel *ioc,
>>      return;
>>  }
>>  
>> +void multifd_rdma_cleanup(void *opaque)
> 
> I think you need to make it clear that this is only to cleanup one
> channel, rather than the whole multifd-rdma connection;
> multifd_load_cleanup for example cleans up all the channels, where as I
> think this is only doing one?
> 
Yes, the multifd_load_cleanup cleans up all the channels with the iteration of migrate_multifd_channels.
Now, we just put multifd_rdma_cleanup into that iteration of multifd_load_cleanup to clear it one by one.
do you mean the name of multifd_rdma_cleanup is misleading and should changed it in order to distinguish with  multifd_load_cleanup?

> Don't use a 'void *opaque' except for something that's called via
> a registration/callback scheme that's designed to be generic
> (e.g. multifd_send_thread does it because it's called from
> qemu_thread_create that doesn't know the type).  Where you know
> the type, use it!
> 
I agree with you.
I will do that in V5 with typedefs.h.
>> +{
>> +    RDMAContext *rdma = (RDMAContext *)opaque;
>> +
>> +    if (!migrate_use_rdma()) {
>> +        return;
>> +    }
>> +
>> +    rdma->listen_id = NULL;
>> +    rdma->channel = NULL;
>> +    qemu_rdma_cleanup(rdma);
>> +    g_free(rdma);
>> +}
>> +
>>  MultiFDSetup multifd_rdma_ops = {
>>      .send_thread = multifd_rdma_send_thread,
>>      .recv_thread = multifd_rdma_recv_thread,
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

