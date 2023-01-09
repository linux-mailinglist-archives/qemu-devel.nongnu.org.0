Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BD662328
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpKN-00040o-AL; Mon, 09 Jan 2023 05:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEpKL-00040J-Nf
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:24:25 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEpKJ-0008Ub-Sf
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:24:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8A8CA21825;
 Mon,  9 Jan 2023 10:24:19 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 11:24:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00495871de7-8296-4f6d-adb0-f044e4d99143,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b32e9bfb-44fb-fc62-44cb-a6e4d6b7e4cc@kaod.org>
Date: Mon, 9 Jan 2023 11:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 03/14] migration: Simplify migration_iteration_run()
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-4-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229110345.12480-4-avihaih@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f474033f-da09-47b1-a49e-63e8ca161a38
X-Ovh-Tracer-Id: 16956897026189200168
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrvhhihhgrihhhsehnvhhiughirgdrtghomhdpkhifrghnkhhhvgguvgesnhhvihguihgrrdgtohhmpdhmrghorhhgsehnvhhiughirgdrtghomhdpjhhgghesnhhvihguihgrrdgtohhmpdihihhshhgrihhhsehnvhhiughirgdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrg
 hkvgesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgughhilhgsvghrthesrhgvughhrghtrdgtohhmpdhquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthgrrhhguhhpthgrsehnvhhiughirgdrtghomhdpjhhorghordhmrdhmrghrthhinhhssehorhgrtghlvgdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/29/22 12:03, Avihai Horon wrote:
> From: Juan Quintela <quintela@redhat.com>
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   migration/migration.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 9795d0ec5c..61b9ce0fe8 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3758,23 +3758,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>       trace_migrate_pending(pending_size, s->threshold_size,
>                             pend_pre, pend_compat, pend_post);
>   
> -    if (pending_size && pending_size >= s->threshold_size) {
> -        /* Still a significant amount to transfer */
> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
> -            qatomic_read(&s->start_postcopy)) {
> -            if (postcopy_start(s)) {
> -                error_report("%s: postcopy failed to start", __func__);
> -            }
> -            return MIG_ITERATE_SKIP;
> -        }
> -        /* Just another iteration step */
> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
> -    } else {
> +
> +    if (!pending_size || pending_size < s->threshold_size) {
>           trace_migration_thread_low_pending(pending_size);
>           migration_completion(s);
>           return MIG_ITERATE_BREAK;
>       }
>   
> +    /* Still a significant amount to transfer */
> +    if (!in_postcopy && pend_pre <= s->threshold_size &&
> +        qatomic_read(&s->start_postcopy)) {
> +        if (postcopy_start(s)) {
> +            error_report("%s: postcopy failed to start", __func__);
> +        }
> +        return MIG_ITERATE_SKIP;
> +    }
> +
> +    /* Just another iteration step */
> +    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>       return MIG_ITERATE_RESUME;
>   }
>   


