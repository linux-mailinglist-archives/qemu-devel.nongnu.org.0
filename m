Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F06F134F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:33:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJXN-0005Hz-0l; Fri, 28 Apr 2023 04:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psJXJ-0005HU-Ir; Fri, 28 Apr 2023 04:33:01 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psJXH-0002lt-Ak; Fri, 28 Apr 2023 04:33:01 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 98C125E850;
 Fri, 28 Apr 2023 11:32:50 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b432::1:18] (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id nWEQpD0OeKo0-aS49CDZ6; Fri, 28 Apr 2023 11:32:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682670769; bh=5Hc58TkIM/HVi/UG95GUQV0IIj4uoffa1D4G3i/QJb0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=bNht2P0cUlGTJZeenDcIgmyH3UonPN6mo2i4lsiBO9ZBxfyC890F78427gXav1kCK
 GaHkINjqEYH/MOC2m2dT/K5bt2SskQdfzJ53SvFqhWWrNunhHWMZ42B2+WRCm3FbG7
 3yyWl+wbUR7Ps5WM8D9KKIK6u7nvDYCmsvXMPgkc=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f50dc40c-4cdd-a226-15d4-3e79b83cbb2c@yandex-team.ru>
Date: Fri, 28 Apr 2023 11:32:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/4] build: move COLO under CONFIG_REPLICATION
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com, chen.zhang@intel.com,
 lizhijian@fujitsu.com, lukasstraub2@web.de
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-4-vsementsov@yandex-team.ru>
 <87mt2sbgzz.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87mt2sbgzz.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 28.04.23 10:30, Juan Quintela wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>> We don't allow to use x-colo capability when replication is not
>> configured. So, no reason to build COLO when replication is disabled,
>> it's unusable in this case.
>>
>> Note also that the check in migrate_caps_check() is not the only
>> restriction: some functions in migration/colo.c will just abort if
>> called with not defined CONFIG_REPLICATION, for example:
>>
>>      migration_iteration_finish()
>>         case MIGRATION_STATUS_COLO:
>>             migrate_start_colo_process()
>>                 colo_process_checkpoint()
>>                     abort()
>>
>> It could probably make sense to have possibility to enable COLO without
>> REPLICATION, but this requires deeper audit of colo & replication code,
>> which may be done later if needed.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> Nice patch.  Thanks.
> 
>> @@ -68,7 +66,6 @@ static bool colo_runstate_is_stopped(void)
>>   static void secondary_vm_do_failover(void)
>>   {
>>   /* COLO needs enable block-replication */
>> -#ifdef CONFIG_REPLICATION
>>       int old_state;
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>>       Error *local_err = NULL;
>> @@ -133,14 +130,10 @@ static void secondary_vm_do_failover(void)
>>       if (mis->migration_incoming_co) {
>>           qemu_coroutine_enter(mis->migration_incoming_co);
>>       }
>> -#else
>> -    abort();
>> -#endif
>>   }
> 
> With only this chunks you have proved that your argument is right.
> abort() is never a solution.
> 
>> diff --git a/migration/options.c b/migration/options.c
>> index 912cbadddb..eef2bd0f16 100644
>> --- a/migration/options.c
>> +++ b/migration/options.c
>> @@ -171,7 +171,9 @@ Property migration_properties[] = {
>>       DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
>>       DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
>>                           MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
>> +#ifdef CONFIG_REPLICATION
>>       DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
>> +#endif
>>       DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
>>       DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>>       DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
>> @@ -209,9 +211,13 @@ bool migrate_block(void)
> 
>>   bool migrate_colo(void)
>>   {
>> +#ifdef CONFIG_REPLICATION
>>       MigrationState *s = migrate_get_current();
>>   
>>       return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
>> +#else
>> +    return false;
>> +#endif
>>   }
> 
> #ifdef 1
> 
>>   
>>   bool migrate_compress(void)
>> @@ -401,7 +407,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>>       MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>>       MIGRATION_CAPABILITY_COMPRESS,
>>       MIGRATION_CAPABILITY_XBZRLE,
>> +#ifdef CONFIG_REPLICATION
>>       MIGRATION_CAPABILITY_X_COLO,
>> +#endif
>>       MIGRATION_CAPABILITY_VALIDATE_UUID,
>>       MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>>   
> 
> #ifdef 2
> 
>> @@ -428,15 +436,6 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
>>       }
>>   #endif
>>   
>> -#ifndef CONFIG_REPLICATION
>> -    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
>> -        error_setg(errp, "QEMU compiled without replication module"
>> -                   " can't enable COLO");
>> -        error_append_hint(errp, "Please enable replication before COLO.\n");
>> -        return false;
>> -    }
>> -#endif
>> -
>>       if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>>           /* This check is reasonably expensive, so only when it's being
>>            * set the first time, also it's only the destination that needs
> 
> I would preffer if you removed #ifdef 1 and 2 and let this one in.  I am
> trying to get all capabilities to this format.

OK, let's start with your idea, interface may be removed later if we want.

> 
> 
>> diff --git a/stubs/colo.c b/stubs/colo.c
>> new file mode 100644
>> index 0000000000..f306ab45d6
>> --- /dev/null
>> +++ b/stubs/colo.c
>> @@ -0,0 +1,37 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu/notify.h"
>> +#include "net/colo-compare.h"
>> +#include "migration/colo.h"
>> +#include "migration/migration.h"
>> +#include "qapi/error.h"
>> +#include "qapi/qapi-commands-migration.h"
>> +
>> +void colo_shutdown(void)
>> +{
>> +    abort();
>> +}
> 
> This is wrong, it should be empty.

Oops right. Good catch

> 
> void migration_shutdown(void)
> {
>      /*
>       * When the QEMU main thread exit, the COLO thread
>       * may wait a semaphore. So, we should wakeup the
>       * COLO thread before migration shutdown.
>       */
>      colo_shutdown();
> 
>      ......
> 
> }
> 
> 
> 
>> +void *colo_process_incoming_thread(void *opaque)
>> +{
>> +    abort();
>> +}
> 
> At least print an error message?


OK

> 
>> +void colo_checkpoint_notify(void *opaque)
>> +{
>> +    abort();
>> +}
> 
> Another error message.
> 
> It is independently of this patch, but I am thinking about changing the
> interface and doing something like this in options.c
> 
> changing
> 
>      if (params->has_x_checkpoint_delay) {
>          s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
>          if (migration_in_colo_state()) {
>              colo_checkpoint_notify(s);
>          }
>      }
> 
> To
> 
>      if (params->has_x_checkpoint_delay) {
>          s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
>          colo_checkpoint_refresh(s);
>      }
> 
> That way we can convert it to an empty function.

Sounds good. I can make a patch and include it to v4

> 
>> +void migrate_start_colo_process(MigrationState *s)
>> +{
>> +    abort();
>> +}
> 
> Another case of changing the function interface?
> 
>      case MIGRATION_STATUS_COLO:
>          if (!migrate_colo()) {
>              error_report("%s: critical error: calling COLO code without "
>                           "COLO enabled", __func__);
>          }

I think, it could be abort()

>          migrate_start_colo_process(s);
> 
> The changes of functions interfaces are independent of this patch.
> 

Still, making empty stubs is clearer than stubs with abort(). I'll try and if changing the interface is not too much, will include it in v4.

-- 
Best regards,
Vladimir


