Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DF327E49
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:29:13 +0100 (CET)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhfk-0007yx-8d
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdk-00055b-5N
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:27:08 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdh-0001yP-0N
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:27:07 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dpzwk2yr1zlRJn;
 Mon,  1 Mar 2021 20:24:54 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 20:26:50 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 11/18] migration/rdma: record host_port for multifd RDMA
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-12-git-send-email-zhengchuan@huawei.com>
 <20210203190427.GU2950@work-vm>
Message-ID: <f2a2ff10-160f-00ec-c5ec-e157215e6cec@huawei.com>
Date: Mon, 1 Mar 2021 20:26:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203190427.GU2950@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
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



On 2021/2/4 3:04, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/migration.c | 1 +
>>  migration/migration.h | 3 +++
>>  migration/rdma.c      | 3 +++
>>  3 files changed, 7 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 129c81a..b8f4844 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1925,6 +1925,7 @@ void migrate_init(MigrationState *s)
>>      s->postcopy_after_devices = false;
>>      s->migration_thread_running = false;
>>      s->enabled_rdma_migration = false;
>> +    s->host_port = NULL;
>>      error_free(s->error);
>>      s->error = NULL;
>>      s->hostname = NULL;
>> diff --git a/migration/migration.h b/migration/migration.h
>> index da5681b..537ee09 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -285,6 +285,9 @@ struct MigrationState {
>>       * Enable RDMA migration
>>       */
>>      bool enabled_rdma_migration;
>> +
>> +    /* Need by Multi-RDMA */
>> +    char *host_port;
> 
> Please keep that next to the char *hostname, since they go together.
> Also, 'Needed'
> 
> Dave
> 
OK, will fix it in V5.
>>  };
>>  
>>  void migrate_set_state(int *state, int old_state, int new_state);
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index ed8a015..9654b87 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -4206,6 +4206,8 @@ void rdma_start_outgoing_migration(void *opaque,
>>          goto err;
>>      }
>>  
>> +    s->host_port = g_strdup(host_port);
>> +
>>      ret = qemu_rdma_source_init(rdma,
>>          s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
>>  
>> @@ -4250,6 +4252,7 @@ void rdma_start_outgoing_migration(void *opaque,
>>  
>>      s->to_dst_file = qemu_fopen_rdma(rdma, "wb");
>>      migrate_fd_connect(s, NULL);
>> +    g_free(s->host_port);
>>      return;
>>  return_path_err:
>>      qemu_rdma_cleanup(rdma);
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

