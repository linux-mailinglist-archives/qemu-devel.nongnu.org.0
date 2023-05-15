Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD070275F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:39:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTj6-0007DY-LW; Mon, 15 May 2023 04:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyTix-0007CV-9Z
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:38:32 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyTiv-0003ar-2c
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:38:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id ACED620A05;
 Mon, 15 May 2023 08:38:24 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 10:38:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00332a1fe3a-bb4d-4645-aab5-6c47967496a5,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d21c0d95-58e5-a274-ea91-2bd275db8a9b@kaod.org>
Date: Mon, 15 May 2023 10:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/21] migration: We set the rate_limit by a second
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
 <20230508130909.65420-4-quintela@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230508130909.65420-4-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4db0d695-16c8-4216-a37d-3546ecf1209e
X-Ovh-Tracer-Id: 17257793775043185561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtledpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrih
 gthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdplhgvohgsrhgrshesrhgvughhrghtrdgtohhmpdhpvghtvghrgiesrhgvughhrghtrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkhgvsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.93,
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
> That the implementation does the check every 100 milliseconds is an
> implementation detail that shouldn't be seen on the interfaz.

Si. Pero, "interface" es mejor aqui.

> Notice that all callers of qemu_file_set_rate_limit() used the
> division or pass 0, so this change is a NOP.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.


> ---
>   migration/migration.c | 7 +++----
>   migration/options.c   | 4 ++--
>   migration/qemu-file.c | 6 +++++-
>   3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 3979a98949..e17a6538b4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2117,7 +2117,7 @@ static int postcopy_start(MigrationState *ms)
>        * will notice we're in POSTCOPY_ACTIVE and not actually
>        * wrap their state up here
>        */
> -    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
> +    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth);
>       if (migrate_postcopy_ram()) {
>           /* Ping just for debugging, helps line traces up */
>           qemu_savevm_send_ping(ms->to_dst_file, 2);
> @@ -3207,11 +3207,10 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>   
>       if (resume) {
>           /* This is a resumed migration */
> -        rate_limit = migrate_max_postcopy_bandwidth() /
> -            XFER_LIMIT_RATIO;
> +        rate_limit = migrate_max_postcopy_bandwidth();
>       } else {
>           /* This is a fresh new migration */
> -        rate_limit = migrate_max_bandwidth() / XFER_LIMIT_RATIO;
> +        rate_limit = migrate_max_bandwidth();
>   
>           /* Notify before starting migration thread */
>           notifier_list_notify(&migration_state_notifiers, s);
> diff --git a/migration/options.c b/migration/options.c
> index 2e759cc306..d04b5fbc3a 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -1243,7 +1243,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>           s->parameters.max_bandwidth = params->max_bandwidth;
>           if (s->to_dst_file && !migration_in_postcopy()) {
>               qemu_file_set_rate_limit(s->to_dst_file,
> -                                s->parameters.max_bandwidth / XFER_LIMIT_RATIO);
> +                                s->parameters.max_bandwidth);
>           }
>       }
>   
> @@ -1275,7 +1275,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>           s->parameters.max_postcopy_bandwidth = params->max_postcopy_bandwidth;
>           if (s->to_dst_file && migration_in_postcopy()) {
>               qemu_file_set_rate_limit(s->to_dst_file,
> -                    s->parameters.max_postcopy_bandwidth / XFER_LIMIT_RATIO);
> +                    s->parameters.max_postcopy_bandwidth);
>           }
>       }
>       if (params->has_max_cpu_throttle) {
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 745361d238..12cf7fb04e 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -29,6 +29,7 @@
>   #include "migration.h"
>   #include "qemu-file.h"
>   #include "trace.h"
> +#include "options.h"
>   #include "qapi/error.h"
>   
>   #define IO_BUF_SIZE 32768
> @@ -747,7 +748,10 @@ int64_t qemu_file_get_rate_limit(QEMUFile *f)
>   
>   void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
>   {
> -    f->rate_limit_max = limit;
> +    /*
> +     * 'limit' is per second.  But we check it each 100 miliseconds.
> +     */
> +    f->rate_limit_max = limit / XFER_LIMIT_RATIO;
>   }
>   
>   void qemu_file_reset_rate_limit(QEMUFile *f)


