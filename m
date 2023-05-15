Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8457702E99
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:44:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsW-00083L-0f; Mon, 15 May 2023 09:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyXr5-0004hy-M4
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:11 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyXqw-00012P-6c
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CE9D920DCA;
 Mon, 15 May 2023 13:02:55 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 15:02:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006ee9472a0-e754-4c51-b164-33909c634dfa,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <12e604ae-e9e2-2564-926d-1a1cbbcf68ce@kaod.org>
Date: Mon, 15 May 2023 15:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 11/21] migration: Move migration_total_bytes() to
 migration-stats.c
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
 <20230508130909.65420-12-quintela@redhat.com>
Content-Language: en-US
In-Reply-To: <20230508130909.65420-12-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 878cb9d5-e953-425a-9c54-04f4639b0011
X-Ovh-Tracer-Id: 3278339055298251673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeivefgteeltdefleeiiedutdfhledvhedutdeuteetvdejkeejgeeigfeileffgeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddthedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrih
 gthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdplhgvohgsrhgrshesrhgvughhrghtrdgtohhmpdhpvghtvghrgiesrhgvughhrghtrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkhgvsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.811,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Once there rename it to migration_transferred_bytes() and pass a
> QEMUFile instead of a migration object.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.


> ---
>   migration/migration-stats.c |  6 ++++++
>   migration/migration-stats.h |  9 +++++++++
>   migration/migration.c       | 13 +++----------
>   3 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> index e01842cabc..fba66c4577 100644
> --- a/migration/migration-stats.c
> +++ b/migration/migration-stats.c
> @@ -63,3 +63,9 @@ void migration_rate_limit_account(uint64_t len)
>   {
>       stat64_add(&mig_stats.rate_limit_used, len);
>   }
> +
> +uint64_t migration_transferred_bytes(QEMUFile *f)
> +{
> +    return qemu_file_transferred(f) + stat64_get(&mig_stats.multifd_bytes);
> +}
> +
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 65f11ec7d1..c82fce9608 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -137,4 +137,13 @@ void migration_rate_limit_reset(void);
>    */
>   void migration_rate_limit_set(uint64_t new_rate);
>   
> +/**
> + * migration_transferred_bytes: Return number of bytes transferred
> + *
> + * Returtns how many bytes have we transferred since the beginning of
> + * the migration.  It accounts for bytes sent through any migration
> + * channel, multifd, qemu_file, rdma, ....
> + */
> +uint64_t migration_transferred_bytes(QEMUFile *f);
> +
>   #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 370998600e..e6d262ffe1 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2617,16 +2617,9 @@ static MigThrError migration_detect_error(MigrationState *s)
>       }
>   }
>   
> -/* How many bytes have we transferred since the beginning of the migration */
> -static uint64_t migration_total_bytes(MigrationState *s)
> -{
> -    return qemu_file_transferred(s->to_dst_file) +
> -        stat64_get(&mig_stats.multifd_bytes);
> -}
> -
>   static void migration_calculate_complete(MigrationState *s)
>   {
> -    uint64_t bytes = migration_total_bytes(s);
> +    uint64_t bytes = migration_transferred_bytes(s->to_dst_file);
>       int64_t end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>       int64_t transfer_time;
>   
> @@ -2652,7 +2645,7 @@ static void update_iteration_initial_status(MigrationState *s)
>        * wrong speed calculation.
>        */
>       s->iteration_start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> -    s->iteration_initial_bytes = migration_total_bytes(s);
> +    s->iteration_initial_bytes = migration_transferred_bytes(s->to_dst_file);
>       s->iteration_initial_pages = ram_get_total_transferred_pages();
>   }
>   
> @@ -2667,7 +2660,7 @@ static void migration_update_counters(MigrationState *s,
>           return;
>       }
>   
> -    current_bytes = migration_total_bytes(s);
> +    current_bytes = migration_transferred_bytes(s->to_dst_file);
>       transferred = current_bytes - s->iteration_initial_bytes;
>       time_spent = current_time - s->iteration_start_time;
>       bandwidth = (double)transferred / time_spent;


