Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC55682BBC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:46:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMp3z-000358-Vj; Tue, 31 Jan 2023 06:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pMp3w-00033y-US; Tue, 31 Jan 2023 06:44:32 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pMp3t-0000Dp-RG; Tue, 31 Jan 2023 06:44:32 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2D42260792;
 Tue, 31 Jan 2023 14:44:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b42f::1:11] (unknown
 [2a02:6b8:b081:b42f::1:11])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 EiTPXE0Qg4Y1-IRtb4es3; Tue, 31 Jan 2023 14:44:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675165454; bh=HhDu7ld1q04KDlSmICVDzuzPVH1vPqSnPP+kEbMOV3Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=WcO065ny3tUeLe3MBLs+Fk4ZAK/UTstjLE0KgoJc9P8q3Y8MazsPE4b1UZwqGtUQj
 58CnBGCsREAOmWwm05DardJ/kKMXKyzxITjZCM8xzz2OAD5JuUUSQioT8GJabg87vX
 DOfaa9vnEexWQAYJcpckM1+VOQLCQkZfPeBgO7hk=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <38da6faf-1d7f-66fc-b305-738a6e8dfaf1@yandex-team.ru>
Date: Tue, 31 Jan 2023 14:44:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL 5/5] migration: simplify migration_iteration_run()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230130080307.1792-1-quintela@redhat.com>
 <20230130080307.1792-6-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230130080307.1792-6-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 30.01.23 11:03, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   migration/migration.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 594a42f085..644c61e91d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3764,23 +3764,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>                                       pend_pre, pend_compat, pend_post);
>       }
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
> +    if (pending_size < s->threshold_size) {

to keep the logic, formally it should be "if (!pending_size || pending_size < s->threshold_size)"...

Actually, could s->threshold_size be 0 here? Or, worth an assertion assert(s->threshold_size) ?

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


