Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404666FC3DF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:28:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKa4-0004kj-TI; Tue, 09 May 2023 06:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwKZx-0004iI-EZ; Tue, 09 May 2023 06:28:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwKZt-0004J5-EP; Tue, 09 May 2023 06:28:20 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349A9l1m002972; Tue, 9 May 2023 10:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2HDhjFuVd6JIEM5+7+/4YS1TxdF9g4FJM0zuKESeZqk=;
 b=J8u0r0P1dcTmJlDHZ+md+rVMg5oIPyZbfDYp0yYWlZt6eYx9/5xaqAIQishnZK3JKoHn
 vvTMuDWZJEgonj31Njl4D8myeNjS30CstL85xyH52wozyNinGMuqw8AyoYDVp8JPNIZP
 9MR164YfjHPrfo+G9CVHh+voMErLq2HjTnUGA96roQq5T6PXMAJgaEmdcun9NramQWx5
 ZgUFtLuIn8qfGh8+szMMKa0CJJE19k/ROoGrL8HOmZo+DW1FkqpDYfO3bc0MYHmIq+vr
 +qXefKegYUokIPn9ApQTCUyCVL7GTTX042tFlDt+Hkm/Stcw8DdD8hLLqN2nh6iUk4Ia og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfeqn2fmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 10:27:53 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349AB6vT009011;
 Tue, 9 May 2023 10:27:52 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfeqn2fm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 10:27:52 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3499YQvs002580;
 Tue, 9 May 2023 10:27:51 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3qf88u2tc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 10:27:51 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 349ARoU75833354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 10:27:50 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E01FF58058;
 Tue,  9 May 2023 10:27:49 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7557A58059;
 Tue,  9 May 2023 10:27:41 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 May 2023 10:27:41 +0000 (GMT)
Message-ID: <303c2198-c7a5-0f3c-496b-eed7b931e51a@linux.ibm.com>
Date: Tue, 9 May 2023 15:57:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/21] migration: Move rate_limit_max and rate_limit_used
 to migration_stats
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Leonardo Bras <leobras@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-11-quintela@redhat.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230508130909.65420-11-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lenQlakTjRKXjJFzZB364Im66z5qTsbx
X-Proofpoint-GUID: Dr6bci077FVWbWdypKsuD9xT0sFnxjlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305090079
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/8/23 18:38, Juan Quintela wrote:
> This way we can make them atomic and use this functions from any

s/this/these

> place.  I also moved all functions that use rate_limit to
> migration-stats.
> 
> Functions got renamed, they are not qemu_file anymore.
> 
> qemu_file_rate_limit -> migration_rate_limit_exceeded
> qemu_file_set_rate_limit -> migration_rate_limit_set
> qemu_file_get_rate_limit -> migration_rate_limit_get
> qemu_file_reset_rate_limit -> migration_rate_limit_reset
> qemu_file_acct_rate_limit -> migration_rate_limit_account.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> If you have any good suggestion for better names, I am all ears.
> ---
>   hw/ppc/spapr.c                      |  5 +--
>   hw/s390x/s390-stattrib.c            |  2 +-
>   include/migration/qemu-file-types.h |  2 +-
>   migration/block-dirty-bitmap.c      |  2 +-
>   migration/block.c                   |  5 +--
>   migration/migration-stats.c         | 41 ++++++++++++++++++++++
>   migration/migration-stats.h         | 42 +++++++++++++++++++++++
>   migration/migration.c               | 14 ++++----
>   migration/multifd.c                 |  2 +-
>   migration/options.c                 |  7 ++--
>   migration/qemu-file.c               | 53 ++---------------------------
>   migration/qemu-file.h               | 11 ------
>   migration/ram.c                     |  2 +-
>   migration/savevm.c                  |  2 +-
>   14 files changed, 108 insertions(+), 82 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index ddc9c7b1a1..dbd2753278 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2166,7 +2166,7 @@ static void htab_save_first_pass(QEMUFile *f, SpaprMachineState *spapr,
>                   break;
>               }
>           }
> -    } while ((index < htabslots) && !qemu_file_rate_limit(f));
> +    } while ((index < htabslots) && !migration_rate_limit_exceeded(f));
>   
>       if (index >= htabslots) {
>           assert(index == htabslots);
> @@ -2237,7 +2237,8 @@ static int htab_save_later_pass(QEMUFile *f, SpaprMachineState *spapr,
>               assert(index == htabslots);
>               index = 0;
>           }
> -    } while ((examined < htabslots) && (!qemu_file_rate_limit(f) || final));
> +    } while ((examined < htabslots) &&
> +             (!migration_rate_limit_exceeded(f) || final));
>   
>       if (index >= htabslots) {
>           assert(index == htabslots);
> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
> index aed919ad7d..fb0a20f2e1 100644
> --- a/hw/s390x/s390-stattrib.c
> +++ b/hw/s390x/s390-stattrib.c
> @@ -209,7 +209,7 @@ static int cmma_save(QEMUFile *f, void *opaque, int final)
>           return -ENOMEM;
>       }
>   
> -    while (final ? 1 : qemu_file_rate_limit(f) == 0) {
> +    while (final ? 1 : migration_rate_limit_exceeded(f) == 0) {
        while (final ? 1 : !migration_rate_limit_exceeded(f)) {
>           reallen = sac->get_stattr(sas, &start_gfn, buflen, buf);
>           if (reallen < 0) {
>               g_free(buf);
> diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu-file-types.h
> index 1436f9ce92..0354f45198 100644
> --- a/include/migration/qemu-file-types.h
> +++ b/include/migration/qemu-file-types.h
> @@ -165,6 +165,6 @@ size_t coroutine_mixed_fn qemu_get_counted_string(QEMUFile *f, char buf[256]);
>   
>   void qemu_put_counted_string(QEMUFile *f, const char *name);
>   
> -int qemu_file_rate_limit(QEMUFile *f);
> +bool migration_rate_limit_exceeded(QEMUFile *f);
> return type is also getting changed, could be mentioned in commit log.

>   #endif
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index 20f36e6bd8..a815678926 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -706,7 +706,7 @@ static void bulk_phase(QEMUFile *f, DBMSaveState *s, bool limit)
>       QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
>           while (!dbms->bulk_completed) {
>               bulk_phase_send_chunk(f, s, dbms);
> -            if (limit && qemu_file_rate_limit(f)) {
> +            if (limit && migration_rate_limit_exceeded(f)) {
>                   return;
>               }
>           }
> diff --git a/migration/block.c b/migration/block.c
> index 12617b4152..fc1caa9ca6 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -23,6 +23,7 @@
>   #include "block/dirty-bitmap.h"
>   #include "migration/misc.h"
>   #include "migration.h"
> +#include "migration-stats.h"
>   #include "migration/register.h"
>   #include "qemu-file.h"
>   #include "migration/vmstate.h"
> @@ -625,7 +626,7 @@ static int flush_blks(QEMUFile *f)
>   
>       blk_mig_lock();
>       while ((blk = QSIMPLEQ_FIRST(&block_mig_state.blk_list)) != NULL) {
> -        if (qemu_file_rate_limit(f)) {
> +        if (migration_rate_limit_exceeded(f)) {
>               break;
>           }
>           if (blk->ret < 0) {
> @@ -762,7 +763,7 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
>       /* control the rate of transfer */
>       blk_mig_lock();
>       while (block_mig_state.read_done * BLK_MIG_BLOCK_SIZE <
> -           qemu_file_get_rate_limit(f) &&
> +           migration_rate_limit_get() &&
>              block_mig_state.submitted < MAX_PARALLEL_IO &&
>              (block_mig_state.submitted + block_mig_state.read_done) <
>              MAX_IO_BUFFERS) {
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> index 5278c6c821..e01842cabc 100644
> --- a/migration/migration-stats.c
> +++ b/migration/migration-stats.c
> @@ -13,6 +13,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/stats64.h"
>   #include "qemu/timer.h"
> +#include "qemu-file.h"
>   #include "migration-stats.h"
>   
>   MigrationAtomicStats mig_stats;
> @@ -22,3 +23,43 @@ void calculate_time_since(Stat64 *val, int64_t since)
>       int64_t now = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>       stat64_set(val, now - since);
>   }
> +
> +bool migration_rate_limit_exceeded(QEMUFile *f)
> +{
> +    if (qemu_file_get_error(f)) {
> +        return true;
> +    }
> +
> +    uint64_t rate_limit_used = stat64_get(&mig_stats.rate_limit_used);
> +    uint64_t rate_limit_max = stat64_get(&mig_stats.rate_limit_max);
> +    /*
> +     *  rate_limit_max == 0 means no rate_limit enfoncement.
> +     */
> +    if (rate_limit_max > 0 && rate_limit_used > rate_limit_max) {
> +        return true;
> +    }
> +    return false;
> +}
> +
> +uint64_t migration_rate_limit_get(void)
> +{
> +    return stat64_get(&mig_stats.rate_limit_max);
> +}
> +
> +void migration_rate_limit_set(uint64_t limit)
> +{
> +    /*
> +     * 'limit' is per second.  But we check it each BUFER_DELAY miliseconds.
> +     */
> +    stat64_set(&mig_stats.rate_limit_max, limit);
> +}
> +
> +void migration_rate_limit_reset(void)
> +{
> +    stat64_set(&mig_stats.rate_limit_used, 0);
> +}
> +
> +void migration_rate_limit_account(uint64_t len)
> +{
> +    stat64_add(&mig_stats.rate_limit_used, len);
> +}
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 73c73d75b9..65f11ec7d1 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -69,6 +69,14 @@ typedef struct {
>        * Number of bytes sent during precopy stage.
>        */
>       Stat64 precopy_bytes;
> +    /*
> +     * Maximum amount of data we can send in a cycle.
> +     */
> +    Stat64 rate_limit_max;
> +    /*
> +     * Amount of data we have sent in the current cycle.
> +     */
> +    Stat64 rate_limit_used;
>       /*
>        * How long has the setup stage took.
>        */
> @@ -95,4 +103,38 @@ extern MigrationAtomicStats mig_stats;
>    */
>   
>   void calculate_time_since(Stat64 *val, int64_t since);
> +
> +/**
> + * migration_rate_limit_account: Increase the number of bytes transferred.
> + *
> + * Report on a number of bytes the have been transferred that need to
> + * be applied to the rate limiting calcuations.
> + *
> + * @len: amount of bytes transferred
> + */
> +void migration_rate_limit_account(uint64_t len);
> +
> +/**
> + * migration_rate_limit_get: Get the maximum amount that can be transferred.
> + *
> + * Returns the maximum number of bytes that can be transferred in a cycle.
> + */
> +uint64_t migration_rate_limit_get(void);
> +
> +/**
> + * migration_rate_limit_reset: Reset the rate limit counter.
> + *
> + * This is called when we know we start a new transfer cycle.
> + */
> +void migration_rate_limit_reset(void);
> +
> +/**
> + * migration_rate_limit_set: Set the maximum amount that can be transferred.
> + *
> + * Sets the maximum amount of bytes that can be transferred in one cycle.
> + *
> + * @new_rate: new maximum amount
> + */
> +void migration_rate_limit_set(uint64_t new_rate);
> +
>   #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 72286de969..370998600e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2116,7 +2116,7 @@ static int postcopy_start(MigrationState *ms)
>        * will notice we're in POSTCOPY_ACTIVE and not actually
>        * wrap their state up here
>        */
> -    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth);
> +    migration_rate_limit_set(bandwidth);
>       if (migrate_postcopy_ram()) {
>           /* Ping just for debugging, helps line traces up */
>           qemu_savevm_send_ping(ms->to_dst_file, 2);
> @@ -2295,7 +2295,7 @@ static void migration_completion(MigrationState *s)
>               }
>               if (ret >= 0) {
>                   s->block_inactive = !migrate_colo();
> -                qemu_file_set_rate_limit(s->to_dst_file, 0);
> +                migration_rate_limit_set(0);
>                   ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>                                                            s->block_inactive);
>               }
> @@ -2691,7 +2691,7 @@ static void migration_update_counters(MigrationState *s,
>               stat64_get(&mig_stats.dirty_bytes_last_sync) / bandwidth;
>       }
>   
> -    qemu_file_reset_rate_limit(s->to_dst_file);
> +    migration_rate_limit_reset();
>   
>       update_iteration_initial_status(s);
>   
> @@ -2847,7 +2847,7 @@ bool migration_rate_limit(void)
>   
>       bool urgent = false;
>       migration_update_counters(s, now);
> -    if (qemu_file_rate_limit(s->to_dst_file)) {
> +    if (migration_rate_limit_exceeded(s->to_dst_file)) {
>   
>           if (qemu_file_get_error(s->to_dst_file)) {
>               return false;
> @@ -2969,7 +2969,7 @@ static void *migration_thread(void *opaque)
>       trace_migration_thread_setup_complete();
>   
>       while (migration_is_active(s)) {
> -        if (urgent || !qemu_file_rate_limit(s->to_dst_file)) {
> +        if (urgent || !migration_rate_limit_exceeded(s->to_dst_file)) {
>               MigIterateState iter_state = migration_iteration_run(s);
>               if (iter_state == MIG_ITERATE_SKIP) {
>                   continue;
> @@ -3043,7 +3043,7 @@ static void *bg_migration_thread(void *opaque)
>       rcu_register_thread();
>       object_ref(OBJECT(s));
>   
> -    qemu_file_set_rate_limit(s->to_dst_file, 0);
> +    migration_rate_limit_set(0);
>   
>       setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>       /*
> @@ -3215,7 +3215,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>           notifier_list_notify(&migration_state_notifiers, s);
>       }
>   
> -    qemu_file_set_rate_limit(s->to_dst_file, rate_limit);
> +    migration_rate_limit_set(rate_limit);
>       qemu_file_set_blocking(s->to_dst_file, true);
>   
>       /*
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 4e71c19292..2efb313be4 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -432,7 +432,7 @@ static int multifd_send_pages(QEMUFile *f)
>       multifd_send_state->pages = p->pages;
>       p->pages = pages;
>       transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
> -    qemu_file_acct_rate_limit(f, transferred);
> +    migration_rate_limit_account(transferred);
>       qemu_mutex_unlock(&p->mutex);
>       stat64_add(&mig_stats.transferred, transferred);
>       stat64_add(&mig_stats.multifd_bytes, transferred);
> diff --git a/migration/options.c b/migration/options.c
> index d04b5fbc3a..a024fa3ce6 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -23,6 +23,7 @@
>   #include "migration/colo.h"
>   #include "migration/misc.h"
>   #include "migration.h"
> +#include "migration-stats.h"
>   #include "qemu-file.h"
>   #include "ram.h"
>   #include "options.h"
> @@ -1242,8 +1243,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>       if (params->has_max_bandwidth) {
>           s->parameters.max_bandwidth = params->max_bandwidth;
>           if (s->to_dst_file && !migration_in_postcopy()) {
> -            qemu_file_set_rate_limit(s->to_dst_file,
> -                                s->parameters.max_bandwidth);
> +            migration_rate_limit_set(s->parameters.max_bandwidth);
>           }
>       }
>   
> @@ -1274,8 +1274,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>       if (params->has_max_postcopy_bandwidth) {
>           s->parameters.max_postcopy_bandwidth = params->max_postcopy_bandwidth;
>           if (s->to_dst_file && migration_in_postcopy()) {
> -            qemu_file_set_rate_limit(s->to_dst_file,
> -                    s->parameters.max_postcopy_bandwidth);
> +            migration_rate_limit_set(s->parameters.max_postcopy_bandwidth);
>           }
>       }
>       if (params->has_max_cpu_throttle) {
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 8de1ecd082..3f993e24af 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -27,6 +27,7 @@
>   #include "qemu/error-report.h"
>   #include "qemu/iov.h"
>   #include "migration.h"
> +#include "migration-stats.h"
>   #include "qemu-file.h"
>   #include "trace.h"
>   #include "options.h"
> @@ -40,17 +41,6 @@ struct QEMUFile {
>       QIOChannel *ioc;
>       bool is_writable;
>   
> -    /*
> -     * Maximum amount of data in bytes to transfer during one
> -     * rate limiting time window
> -     */
> -    uint64_t rate_limit_max;
> -    /*
> -     * Total amount of data in bytes queued for transfer
> -     * during this rate limiting time window
> -     */
> -    uint64_t rate_limit_used;
> -
>       /* The sum of bytes transferred on the wire */
>       uint64_t total_transferred;
>   
> @@ -302,7 +292,7 @@ void qemu_fflush(QEMUFile *f)
>               qemu_file_set_error_obj(f, -EIO, local_error);
>           } else {
>               uint64_t size = iov_size(f->iov, f->iovcnt);
> -            qemu_file_acct_rate_limit(f, size);
> +            migration_rate_limit_account(size);
>               f->total_transferred += size;
>           }
>   
> @@ -355,7 +345,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>           int ret = f->hooks->save_page(f, block_offset,
>                                         offset, size, bytes_sent);
>           if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
> -            qemu_file_acct_rate_limit(f, size);
> +            migration_rate_limit_account(size);
>           }
>   
>           if (ret != RAM_SAVE_CONTROL_DELAYED &&
> @@ -726,43 +716,6 @@ uint64_t qemu_file_transferred(QEMUFile *f)
>       return f->total_transferred;
>   }
>   
> -int qemu_file_rate_limit(QEMUFile *f)
> -{
> -    if (qemu_file_get_error(f)) {
> -        return 1;
> -    }
> -    /*
> -     *  rate_limit_max == 0 means no rate_limit enfoncement.
> -     */
> -    if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
> -        return 1;
> -    }
> -    return 0;
> -}
> -
> -uint64_t qemu_file_get_rate_limit(QEMUFile *f)
> -{
> -    return f->rate_limit_max;
> -}
> -
> -void qemu_file_set_rate_limit(QEMUFile *f, uint64_t limit)
> -{
> -    /*
> -     * 'limit' is per second.  But we check it each 100 miliseconds.
> -     */
> -    f->rate_limit_max = limit / XFER_LIMIT_RATIO;
> -}
> -
> -void qemu_file_reset_rate_limit(QEMUFile *f)
> -{
> -    f->rate_limit_used = 0;
> -}
> -
> -void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len)
> -{
> -    f->rate_limit_used += len;
> -}
> -
>   void qemu_put_be16(QEMUFile *f, unsigned int v)
>   {
>       qemu_put_byte(f, v >> 8);
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index ab164a58d0..46029b951c 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -129,17 +129,6 @@ void qemu_file_skip(QEMUFile *f, int size);
>    * accounting information tracks the total migration traffic.
>    */
>   void qemu_file_credit_transfer(QEMUFile *f, size_t size);
> -void qemu_file_reset_rate_limit(QEMUFile *f);
> -/*
> - * qemu_file_acct_rate_limit:
> - *
> - * Report on a number of bytes the have been transferred
> - * out of band from the main file object I/O methods, and
> - * need to be applied to the rate limiting calcuations
> - */
> -void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len);
> -void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
> -uint64_t qemu_file_get_rate_limit(QEMUFile *f);
>   int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
>   int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
>   void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
> diff --git a/migration/ram.c b/migration/ram.c
> index 5ae1fdba45..2339a99932 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3351,7 +3351,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>   
>           t0 = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>           i = 0;
> -        while ((ret = qemu_file_rate_limit(f)) == 0 ||
> +        while ((ret = migration_rate_limit_exceeded(f)) == 0 ||
            while (!(ret = migration_rate_limit_exceeded(f))) ||

Otherwise, looks fine.

regards,
Harsh
>                  postcopy_has_request(rs)) {
>               int pages;
>   
> diff --git a/migration/savevm.c b/migration/savevm.c
> index c7af9050c2..376118bc98 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1345,7 +1345,7 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
>               !(se->ops->has_postcopy && se->ops->has_postcopy(se->opaque))) {
>               continue;
>           }
> -        if (qemu_file_rate_limit(f)) {
> +        if (migration_rate_limit_exceeded(f)) {
>               return 0;
>           }
>           trace_savevm_section_start(se->idstr, se->section_id);

