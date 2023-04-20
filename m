Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D56E932F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:43:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppShB-0004Wt-33; Thu, 20 Apr 2023 07:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppSez-0000hM-RS; Thu, 20 Apr 2023 07:41:16 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppSes-0002hD-GM; Thu, 20 Apr 2023 07:41:09 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 6C09260B43;
 Thu, 20 Apr 2023 14:40:37 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58f::1:1d] (unknown
 [2a02:6b8:b081:b58f::1:1d])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id aec1OH1OomI0-i3Ov0RIW; Thu, 20 Apr 2023 14:40:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681990836; bh=467NfE7qJW+oNj+/t207gF4Yr6Z4hVdmc+sasUd+dvU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=EOwOdgYPJLAT0alV/hhATK4fTCsUZcbQE5S5T3aCS3ZLvaEEE5JTPRNu2ZaQ5H5ev
 bQo2ME5xtPs0haj3qw/UJnerHfQ41OpJk2O3rdICAFGIZz0nRCgDTo6gvCRsK+aWMD
 xmPaQffk80T7e/5sfIrINkysiTYw/eodY4/jnWKE=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <9be9bb57-a5c0-377d-3f51-6155357d0405@yandex-team.ru>
Date: Thu, 20 Apr 2023 14:40:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com, chen.zhang@intel.com,
 lizhijian@fujitsu.com
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
 <87h6tazx8v.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87h6tazx8v.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20.04.23 13:03, Juan Quintela wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>> We don't allow to use x-colo capability when replication is not
>> configured. So, no reason to build COLO when replication is disabled,
>> it's unusable in this case.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
>> +bool migrate_colo_enabled(void)
>> +{
>> +    MigrationState *s = migrate_get_current();
>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
>> +}
> 
> I consolidated all the capabilities check on my series on the list on
> options.c, so this will go there.
> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index bda4789193..2382958364 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -165,7 +165,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>>       MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>>       MIGRATION_CAPABILITY_COMPRESS,
>>       MIGRATION_CAPABILITY_XBZRLE,
>> +#ifdef CONFIG_REPLICATION
>>       MIGRATION_CAPABILITY_X_COLO,
>> +#endif
> 
> Why?
> 
> I very much preffer the capability to be there and just fail when we try
> to enable it.  That way we only need the #ifdef in one place and not all
> over the place.
> 
>>       MIGRATION_CAPABILITY_VALIDATE_UUID,
>>       MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>>   
>> @@ -1329,15 +1331,6 @@ static bool migrate_caps_check(bool *cap_list,
>>       }
>>   #endif
>>   
>> -#ifndef CONFIG_REPLICATION
>> -    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
>> -        error_setg(errp, "QEMU compiled without replication module"
>> -                   " can't enable COLO");
>> -        error_append_hint(errp, "Please enable replication before COLO.\n");
>> -        return false;
>> -    }
>> -#endif
>> -
> 
> See, like this O:-)
> 
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..93863fa88c 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -486,7 +486,8 @@
>>   { 'enum': 'MigrationCapability',
>>     'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
>>              'compress', 'events', 'postcopy-ram',
>> -           { 'name': 'x-colo', 'features': [ 'unstable' ] },
>> +           { 'name': 'x-colo', 'features': [ 'unstable' ],
>> +             'if': 'CONFIG_REPLICATION' },
>>              'release-ram',
>>              'block', 'return-path', 'pause-before-switchover', 'multifd',
>>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> 
> 
> Aha, It is for this that you changed the black magic on the previous
> patch. Looks ok from my ignorance.  As said before, I would not remove
> the capability, left it the way it was.
> 
> You have less code (less #ifdefs that you just had to add), and
> enabling/disabling checking capabilities don't need anything from replication.

Yes, I had a sense of doubt while adding these #ifdefs.

Still, on the other hand I feel that it's strange to have public interface which only can say "I'm not built in" :)

Actually with my way, we have just two #ifdefs instead of one. Seems, not too many. And instead of "I'm not supported" error we just not include the public interface for unsupported feature. It seems to be better user experience. What do you think?


-- 
Best regards,
Vladimir


