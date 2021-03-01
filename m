Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28E327E44
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:28:13 +0100 (CET)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhem-0005tK-AY
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhcz-0004HC-Nx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:21 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhcw-0001OY-Ay
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:21 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dpzw61NcJz7rk8;
 Mon,  1 Mar 2021 20:24:22 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 20:25:55 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 02/18] migration/rdma: judge whether or not the RDMA is
 used for migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-3-git-send-email-zhengchuan@huawei.com>
 <20210203174951.GM2950@work-vm>
Message-ID: <e1983d8d-f901-0d3e-f82e-5550dda6f763@huawei.com>
Date: Mon, 1 Mar 2021 20:25:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203174951.GM2950@work-vm>
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



On 2021/2/4 1:49, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Add enabled_rdma_migration into MigrationState to judge
>> whether or not the RDMA is used for migration.
>>
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> 
Hi, Dave. Sorry for late reply due to Spring Festival.

> I'd rather see a separate flag added to each of the MigrationState and
> MigrationIncomingState separately for outoging and incoming migration.
>
We use enabled_rdma_migration in migrate_use_rdma() to judge whether or not the RDMA is used for for both Src and Dst.
As far as i see, function like migrate_use_multifd() is used also for both sides.
If we use separate flag added to each of the MigrationState and MigrationIncomingState, we need to add two function to do that for each side.
I am not sure if that is really what you want.

> It's also probably better to call it 'is_rdma_migration' rather than
> enabled.
> 

Yes, I agree with you, it is better to use is_rdma_migration, will use it in next version.

> Dave
> 
>> ---
>>  migration/migration.c | 13 +++++++++++++
>>  migration/migration.h |  6 ++++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 447dfb9..129c81a 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -418,11 +418,13 @@ void migrate_add_address(SocketAddress *address)
>>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>  {
>>      const char *p = NULL;
>> +    MigrationState *s = migrate_get_current();
>>  
>>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>>          return;
>>      }
>>  
>> +    s->enabled_rdma_migration = false;
>>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>>      if (strstart(uri, "tcp:", &p) ||
>>          strstart(uri, "unix:", NULL) ||
>> @@ -430,6 +432,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>          socket_start_incoming_migration(p ? p : uri, errp);
>>  #ifdef CONFIG_RDMA
>>      } else if (strstart(uri, "rdma:", &p)) {
>> +        s->enabled_rdma_migration = true;
>>          rdma_start_incoming_migration(p, errp);
>>  #endif
>>      } else if (strstart(uri, "exec:", &p)) {
>> @@ -1921,6 +1924,7 @@ void migrate_init(MigrationState *s)
>>      s->start_postcopy = false;
>>      s->postcopy_after_devices = false;
>>      s->migration_thread_running = false;
>> +    s->enabled_rdma_migration = false;
>>      error_free(s->error);
>>      s->error = NULL;
>>      s->hostname = NULL;
>> @@ -2162,6 +2166,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>>  #ifdef CONFIG_RDMA
>>      } else if (strstart(uri, "rdma:", &p)) {
>> +        s->enabled_rdma_migration = true;
>>          rdma_start_outgoing_migration(s, p, &local_err);
>>  #endif
>>      } else if (strstart(uri, "exec:", &p)) {
>> @@ -2391,6 +2396,14 @@ bool migrate_rdma_pin_all(void)
>>      return s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
>>  }
>>  
>> +bool migrate_use_rdma(void)
>> +{
>> +    MigrationState *s;
>> +    s = migrate_get_current();
>> +
>> +    return s->enabled_rdma_migration;
>> +}
>> +
>>  bool migrate_use_multifd(void)
>>  {
>>      MigrationState *s;
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 22b36f3..da5681b 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -280,6 +280,11 @@ struct MigrationState {
>>       * This save hostname when out-going migration starts
>>       */
>>      char *hostname;
>> +
>> +    /*
>> +     * Enable RDMA migration
>> +     */
>> +    bool enabled_rdma_migration;
>>  };
>>  
>>  void migrate_set_state(int *state, int old_state, int new_state);
>> @@ -317,6 +322,7 @@ bool migrate_validate_uuid(void);
>>  
>>  bool migrate_auto_converge(void);
>>  bool migrate_rdma_pin_all(void);
>> +bool migrate_use_rdma(void);
>>  bool migrate_use_multifd(void);
>>  bool migrate_pause_before_switchover(void);
>>  int migrate_multifd_channels(void);
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

