Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FE3621C90
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:58:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTlz-0005EX-Gm; Tue, 08 Nov 2022 13:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osTlr-0005DR-Ul; Tue, 08 Nov 2022 13:56:28 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osTlp-0003aU-T6; Tue, 08 Nov 2022 13:56:27 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id DB50A5FF67;
 Tue,  8 Nov 2022 21:56:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HG5sBiYAfa-u7NW2ZLL; Tue, 08 Nov 2022 21:56:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667933768; bh=tsewd8RT6grxX4kGlrSLwqa1q23KGGcyQZ7M5PkGP04=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=P6hce+quRssBjy5SsXsv5MVnj3kvfYts5Pj0GYVit1XAS3d+0BTOOiPjWEgUeko/p
 hpbXaTUmpJfBGQDTFTWmiqUJhzatzPJOrmnSpy6L33DwjwfwxIyY45+J7l7bFBUMuV
 Y0BNTJ/XDqoj39pN++ir9cFgSSat2zXUL+BIdiSM=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <119d6719-2d7b-31f3-835e-69014d2be151@yandex-team.ru>
Date: Tue, 8 Nov 2022 21:56:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 04/17] migration: Simplify migration_iteration_run()
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-5-avihaih@nvidia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221103161620.13120-5-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/3/22 19:16, Avihai Horon wrote:
> From: Juan Quintela <quintela@redhat.com>
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>   migration/migration.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ffe868b86f..59cc3c309b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3743,23 +3743,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>   
>       trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
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
> +    if (pending_size < s->threshold_size) {

Is corner case "pending_size == s->threshold_size == 0" theoretically possible here? In this case prepatch we go to completion. Afterpatch we go to next iteration..

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

-- 
Best regards,
Vladimir


