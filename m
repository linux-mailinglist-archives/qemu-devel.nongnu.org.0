Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61A327E69
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:33:10 +0100 (CET)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhjZ-00046E-MI
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdv-0005RW-Hh
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:27:19 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdt-00026p-C7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:27:19 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dpzwy2DjVzMgb3;
 Mon,  1 Mar 2021 20:25:06 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 20:27:03 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 16/18] migration/rdma: add rdma_channel into
 Migrationstate field
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-17-git-send-email-zhengchuan@huawei.com>
 <20210203201946.GY2950@work-vm>
Message-ID: <8c76d7f7-b23d-25b3-4a9a-e8c1fec4a7aa@huawei.com>
Date: Mon, 1 Mar 2021 20:27:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203201946.GY2950@work-vm>
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



On 2021/2/4 4:19, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Multifd RDMA is need to poll when we send data, record it.
> 
> This looks like it's trying to be the equivalent of the 'static int
> next_channel' in multifd_send_pages.
> 
> If so, why not mkae this 'multifd_channel' and make the function
> 'multifd_next_channel' and replace the code in multifd_send_pages to use
> this as well, rather than make it a special for rdma.
> 
> Dave
> 
Yes, that's a good suggestion. I'll do it in V5.

>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/migration.c |  1 +
>>  migration/migration.h |  1 +
>>  migration/rdma.c      | 14 ++++++++++++++
>>  3 files changed, 16 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index b8f4844..47bd11d 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1926,6 +1926,7 @@ void migrate_init(MigrationState *s)
>>      s->migration_thread_running = false;
>>      s->enabled_rdma_migration = false;
>>      s->host_port = NULL;
>> +    s->rdma_channel = 0;
>>      error_free(s->error);
>>      s->error = NULL;
>>      s->hostname = NULL;
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 537ee09..5ff46e6 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -288,6 +288,7 @@ struct MigrationState {
>>  
>>      /* Need by Multi-RDMA */
>>      char *host_port;
>> +    int rdma_channel;
>>  };
>>  
>>  void migrate_set_state(int *state, int old_state, int new_state);
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index f5eb563..2097839 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -183,6 +183,20 @@ typedef struct {
>>  } RDMAWorkRequestData;
>>  
>>  /*
>> + * Get the multifd RDMA channel used to send data.
>> + */
>> +static int get_multifd_RDMA_channel(void)
>> +{
>> +    int thread_count = migrate_multifd_channels();
>> +    MigrationState *s = migrate_get_current();
>> +
>> +    s->rdma_channel++;
>> +    s->rdma_channel %= thread_count;
>> +
>> +    return s->rdma_channel;
>> +}
>> +
>> +/*
>>   * Negotiate RDMA capabilities during connection-setup time.
>>   */
>>  typedef struct {
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

