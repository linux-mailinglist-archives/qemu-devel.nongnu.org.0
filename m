Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D321461B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 15:30:02 +0200 (CEST)
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jriEz-0001LQ-EC
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 09:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jriDg-0000d4-AJ
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 09:28:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50951
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jriDd-0003ms-Ua
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 09:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593869314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nCx/73CmzmT8ue4hzE/7q02KJlNMcHIInqzf8wcVCs0=;
 b=DBze2SHZwdxS5U7yXrs4fOQYrCViUge0g/d+ILTaYmIxxpXwYacucD+XodaMgGNXnOo/eK
 56IJjwuTwwICzeJnZrI+r/bcJUSDt8Z+EPevshNDgtK/HMCYW0a7IxWRLIKdbEyLUMkuyE
 FlkcZZPUYGVMjjyPO8oU6xrMSivFUiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-seAJpGq_MRe5LGT2tbBe2Q-1; Sat, 04 Jul 2020 09:28:32 -0400
X-MC-Unique: seAJpGq_MRe5LGT2tbBe2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7741A186A201;
 Sat,  4 Jul 2020 13:28:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04DC079258;
 Sat,  4 Jul 2020 13:28:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 677131138648; Sat,  4 Jul 2020 15:28:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 19/44] block/parallels: Simplify parallels_open() after
 previous commit
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-20-armbru@redhat.com>
 <c637cddf-cb3f-97d3-ce78-1a0dd46a1db9@virtuozzo.com>
Date: Sat, 04 Jul 2020 15:28:29 +0200
In-Reply-To: <c637cddf-cb3f-97d3-ce78-1a0dd46a1db9@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 3 Jul 2020 18:29:41 +0300")
Message-ID: <87imf3o1du.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:06:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 02.07.2020 18:49, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>   block/parallels.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 32d0ecd398..e0ec819550 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -843,6 +843,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>                                          &local_err);
>>       g_free(buf);
>>       if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>>           goto fail_options;
>>       }
>>   @@ -873,15 +874,11 @@ static int parallels_open(BlockDriverState
>> *bs, QDict *options, int flags,
>>     fail_format:
>>       error_setg(errp, "Image not in Parallels format");
>> +fail_options:
>>       ret = -EINVAL;
>>   fail:
>>       qemu_vfree(s->header);
>>       return ret;
>> -
>> -fail_options:
>> -    error_propagate(errp, local_err);
>> -    ret = -EINVAL;
>> -    goto fail;
>>   }
>>     
>>
>
> You leak local_err in one case. With at least:
>
> diff --git a/block/parallels.c b/block/parallels.c
> index e0ec819550..5c1940ee02 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -829,7 +829,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>          goto fail_options;
>      }
>  -    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
> +    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
>          goto fail_options;
>      }

You're right, that's wrong.  Missed when I reordered my patches.

This PATCH needs to go after "[PATCH v2 37/44] error: Reduce unnecessary
error propagation", which has this hunk.

> squashed-in:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

I'll keep your R-by there, hope that's okay.

> Still, if we have a special patch for the this function, we can get rid of one more propagation:
>
> diff --git a/block/parallels.c b/block/parallels.c
> index e0ec819550..d4ad83ac19 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -829,7 +829,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>          goto fail_options;
>      }
>  -    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
> +    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
>          goto fail_options;
>      }
>  @@ -863,9 +863,8 @@ static int parallels_open(BlockDriverState *bs,
> QDict *options, int flags,
>      error_setg(&s->migration_blocker, "The Parallels format used by node '%s' "
>                 "does not support live migration",
>                 bdrv_get_device_or_node_name(bs));
> -    ret = migrate_add_blocker(s->migration_blocker, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    ret = migrate_add_blocker(s->migration_blocker, errp);
> +    if (ret < 0) {
>          error_free(s->migration_blocker);
>          goto fail;
>      }

This additional hunk is part of PATCH 41.
>
>
> with it, as well:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks!


