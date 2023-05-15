Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222CC702AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:36:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVYO-000136-W7; Mon, 15 May 2023 06:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyVYL-00012A-Sh
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:35:41 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyVYI-0008Cx-Uh
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:35:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0015B209E9;
 Mon, 15 May 2023 10:35:34 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 12:35:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001b06aa98c-15cc-4f4c-bba3-34e228fddce4,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f977b30c-448a-6791-affe-6c74b7d64fc4@kaod.org>
Date: Mon, 15 May 2023 12:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/21] migration: Move setup_time to mig_stats
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, <qemu-devel@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, <qemu-block@nongnu.org>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>, Fam Zheng <fam@euphon.net>, Thomas Huth
 <thuth@redhat.com>, Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-9-quintela@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230508130909.65420-9-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 92485f31-3b05-4eb7-95d0-6643bc6dffd1
X-Ovh-Tracer-Id: 789818787571272601
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpfhgrmhesvghuphhhohhnrdhnvghtpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdphhgrrhhshhhpsgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhhitg
 hhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhlvghosghrrghssehrvgguhhgrthdrtghomhdpphgvthgvrhigsehrvgguhhgrthdrtghomhdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.93,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/8/23 15:08, Juan Quintela wrote:
> It is a time that needs to be cleaned each time cancel migration.
> Once there ccreate calculate_time_since() to calculate how time since
> a time in the past.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/migration-stats.c |  7 +++++++
>   migration/migration-stats.h | 14 ++++++++++++++
>   migration/migration.c       |  9 ++++-----
>   migration/migration.h       |  1 -
>   4 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> index 2f2cea965c..5278c6c821 100644
> --- a/migration/migration-stats.c
> +++ b/migration/migration-stats.c
> @@ -12,6 +12,13 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/stats64.h"
> +#include "qemu/timer.h"
>   #include "migration-stats.h"
>   
>   MigrationAtomicStats mig_stats;
> +
> +void calculate_time_since(Stat64 *val, int64_t since)
> +{
> +    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_HOST);
> +    stat64_set(val, now - since);
> +}
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index cf8a4f0410..73c73d75b9 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -69,6 +69,10 @@ typedef struct {
>        * Number of bytes sent during precopy stage.
>        */
>       Stat64 precopy_bytes;
> +    /*
> +     * How long has the setup stage took.
> +     */
> +    Stat64 setup_time;
>       /*
>        * Total number of bytes transferred.
>        */
> @@ -81,4 +85,14 @@ typedef struct {
>   
>   extern MigrationAtomicStats mig_stats;
>   
> +/**
> + * calculate_time_since: Calculate how much time has passed
> + *
> + * @val: stat64 where to store the time
> + * @since: reference time since we want to calculate
> + *
> + * Returns: Nothing.  The time is stored in val.
> + */
> +
> +void calculate_time_since(Stat64 *val, int64_t since);

Since this routine is in the "migration" namespace, I would rename it to

   void migration_time_since(Stat64 *val, int64_t since);

of even

   void migration_time_since(MigrationAtomicStats *stat, int64_t since);

Do you need it elsewhere than in migration.c ?

Thanks,

C.

>   #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index b1cfb56523..72286de969 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -884,7 +884,7 @@ static void populate_time_info(MigrationInfo *info, MigrationState *s)
>   {
>       info->has_status = true;
>       info->has_setup_time = true;
> -    info->setup_time = s->setup_time;
> +    info->setup_time = stat64_get(&mig_stats.setup_time);
>   
>       if (s->state == MIGRATION_STATUS_COMPLETED) {
>           info->has_total_time = true;
> @@ -1387,7 +1387,6 @@ void migrate_init(MigrationState *s)
>       s->pages_per_second = 0.0;
>       s->downtime = 0;
>       s->expected_downtime = 0;
> -    s->setup_time = 0;
>       s->start_postcopy = false;
>       s->postcopy_after_devices = false;
>       s->migration_thread_running = false;
> @@ -2640,7 +2639,7 @@ static void migration_calculate_complete(MigrationState *s)
>           s->downtime = end_time - s->downtime_start;
>       }
>   
> -    transfer_time = s->total_time - s->setup_time;
> +    transfer_time = s->total_time - stat64_get(&mig_stats.setup_time);
>       if (transfer_time) {
>           s->mbps = ((double) bytes * 8.0) / transfer_time / 1000;
>       }
> @@ -2965,7 +2964,7 @@ static void *migration_thread(void *opaque)
>       qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>                                  MIGRATION_STATUS_ACTIVE);
>   
> -    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
> +    calculate_time_since(&mig_stats.setup_time, setup_start);
>   
>       trace_migration_thread_setup_complete();
>   
> @@ -3077,7 +3076,7 @@ static void *bg_migration_thread(void *opaque)
>       qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>                                  MIGRATION_STATUS_ACTIVE);
>   
> -    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
> +    calculate_time_since(&mig_stats.setup_time, setup_start);
>   
>       trace_migration_thread_setup_complete();
>       s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> diff --git a/migration/migration.h b/migration/migration.h
> index 3a918514e7..7f554455ac 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -311,7 +311,6 @@ struct MigrationState {
>       int64_t downtime;
>       int64_t expected_downtime;
>       bool capabilities[MIGRATION_CAPABILITY__MAX];
> -    int64_t setup_time;
>       /*
>        * Whether guest was running when we enter the completion stage.
>        * If migration is interrupted by any reason, we need to continue


