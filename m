Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB686F1263
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 09:32:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psIZe-0005lm-HI; Fri, 28 Apr 2023 03:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psIZU-0005jn-6o
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psIZO-0002m5-GS
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682667065;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fz+lh79GOb0RdkbY2ZiH1H9JdCbCO6/QyO1t94cr2Pk=;
 b=Cn9rnaPioT2RNleWkoMTt7OULPzVKyLCeP5k0dvN2xsRQ37IhqSWY8D4vnns208TSMttzq
 0YeoQyX2/E7YoBHZDe3oWlGyd6NnQeTBlaj45CiT/rtJr6ekAUXPlmr3EBYhLcStv58Y5M
 7sMdIsExjfidOd6LcN4wVRVNaokoRI4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-id71F8WuPT-ZqIJToFybow-1; Fri, 28 Apr 2023 03:31:03 -0400
X-MC-Unique: id71F8WuPT-ZqIJToFybow-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f195129aa4so49954985e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 00:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682667061; x=1685259061;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fz+lh79GOb0RdkbY2ZiH1H9JdCbCO6/QyO1t94cr2Pk=;
 b=SUhQBlP8Pkw28WnSic0NkzxhQtV4N2DVEtzdSxlDj1fEM0Dqkr1lwm6WDtpRtKtMVQ
 7kGgvpOxU+g6obJ75b3zqYq6fVIM7gZbUbhCNxuKD58uohAoLzWJk+whExma9foCYfN5
 S1PZfpt6lLb+ii/1IMb1pNHKI3V127IosSwAlictjQJSYxrluv8pG5Ug9YW22F6nRWsG
 FURDqwwDX3B3H+KbHMZQHlsFcUqG+gbRYoZcI1skPfoHg0LfIewLW+7uxH+9PA4QZC0L
 qmVGa0WKil1TSSU5X78iIsbYbGVD3cJ9OHqdyz6T9DR+9qbYyfZ/Kok5ncb5Wfs+sIn8
 WOKg==
X-Gm-Message-State: AC+VfDwF6YKcjHPz2VlF69kw2ZCXjJyDhvw39SgJ1oGbJISNm053gAAc
 58ZckvLIoGpJHj1CROUMmO9JCxqfValuBFkYUI2cQ1VG+qjm+kBRlmxoO/YhdyfI1QzHjtcuhom
 zhsBi4Z9ZGdHnZsvLH6WgFLB8TUOA
X-Received: by 2002:a05:600c:d7:b0:3f2:51e7:f110 with SMTP id
 u23-20020a05600c00d700b003f251e7f110mr2931731wmm.32.1682667061487; 
 Fri, 28 Apr 2023 00:31:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4izMoEnarDXrStA3A9KylbvKeMNOrxt9wVOfzJWPS/H0n7RLhIyrw3b466CVmpx2zaiiaafw==
X-Received: by 2002:a05:600c:d7:b0:3f2:51e7:f110 with SMTP id
 u23-20020a05600c00d700b003f251e7f110mr2931709wmm.32.1682667060988; 
 Fri, 28 Apr 2023 00:31:00 -0700 (PDT)
Received: from redhat.com ([95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c228b00b003f1736fdfedsm23511053wmf.10.2023.04.28.00.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:31:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com,  lukasstraub2@web.de
Subject: Re: [PATCH v3 3/4] build: move COLO under CONFIG_REPLICATION
In-Reply-To: <20230427202946.1007276-4-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 27 Apr 2023 23:29:45 +0300")
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-4-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 09:30:56 +0200
Message-ID: <87mt2sbgzz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> We don't allow to use x-colo capability when replication is not
> configured. So, no reason to build COLO when replication is disabled,
> it's unusable in this case.
>
> Note also that the check in migrate_caps_check() is not the only
> restriction: some functions in migration/colo.c will just abort if
> called with not defined CONFIG_REPLICATION, for example:
>
>     migration_iteration_finish()
>        case MIGRATION_STATUS_COLO:
>            migrate_start_colo_process()
>                colo_process_checkpoint()
>                    abort()
>
> It could probably make sense to have possibility to enable COLO without
> REPLICATION, but this requires deeper audit of colo & replication code,
> which may be done later if needed.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Nice patch.  Thanks.

> @@ -68,7 +66,6 @@ static bool colo_runstate_is_stopped(void)
>  static void secondary_vm_do_failover(void)
>  {
>  /* COLO needs enable block-replication */
> -#ifdef CONFIG_REPLICATION
>      int old_state;
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      Error *local_err = NULL;
> @@ -133,14 +130,10 @@ static void secondary_vm_do_failover(void)
>      if (mis->migration_incoming_co) {
>          qemu_coroutine_enter(mis->migration_incoming_co);
>      }
> -#else
> -    abort();
> -#endif
>  }

With only this chunks you have proved that your argument is right.
abort() is never a solution.

> diff --git a/migration/options.c b/migration/options.c
> index 912cbadddb..eef2bd0f16 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -171,7 +171,9 @@ Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
>      DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
>                          MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
> +#ifdef CONFIG_REPLICATION
>      DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
> +#endif
>      DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>      DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
> @@ -209,9 +211,13 @@ bool migrate_block(void)

>  bool migrate_colo(void)
>  {
> +#ifdef CONFIG_REPLICATION
>      MigrationState *s = migrate_get_current();
>  
>      return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
> +#else
> +    return false;
> +#endif
>  }

#ifdef 1

>  
>  bool migrate_compress(void)
> @@ -401,7 +407,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>      MIGRATION_CAPABILITY_COMPRESS,
>      MIGRATION_CAPABILITY_XBZRLE,
> +#ifdef CONFIG_REPLICATION
>      MIGRATION_CAPABILITY_X_COLO,
> +#endif
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
>      MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>  

#ifdef 2

> @@ -428,15 +436,6 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
>      }
>  #endif
>  
> -#ifndef CONFIG_REPLICATION
> -    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
> -        error_setg(errp, "QEMU compiled without replication module"
> -                   " can't enable COLO");
> -        error_append_hint(errp, "Please enable replication before COLO.\n");
> -        return false;
> -    }
> -#endif
> -
>      if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>          /* This check is reasonably expensive, so only when it's being
>           * set the first time, also it's only the destination that needs

I would preffer if you removed #ifdef 1 and 2 and let this one in.  I am
trying to get all capabilities to this format.


> diff --git a/stubs/colo.c b/stubs/colo.c
> new file mode 100644
> index 0000000000..f306ab45d6
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,37 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
> +
> +void colo_shutdown(void)
> +{
> +    abort();
> +}

This is wrong, it should be empty.

void migration_shutdown(void)
{
    /*
     * When the QEMU main thread exit, the COLO thread
     * may wait a semaphore. So, we should wakeup the
     * COLO thread before migration shutdown.
     */
    colo_shutdown();

    ......

}



> +void *colo_process_incoming_thread(void *opaque)
> +{
> +    abort();
> +}

At least print an error message?

> +void colo_checkpoint_notify(void *opaque)
> +{
> +    abort();
> +}

Another error message.

It is independently of this patch, but I am thinking about changing the
interface and doing something like this in options.c

changing

    if (params->has_x_checkpoint_delay) {
        s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
        if (migration_in_colo_state()) {
            colo_checkpoint_notify(s);
        }
    }

To

    if (params->has_x_checkpoint_delay) {
        s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
        colo_checkpoint_refresh(s);
    }

That way we can convert it to an empty function.

> +void migrate_start_colo_process(MigrationState *s)
> +{
> +    abort();
> +}

Another case of changing the function interface?

    case MIGRATION_STATUS_COLO:
        if (!migrate_colo()) {
            error_report("%s: critical error: calling COLO code without "
                         "COLO enabled", __func__);
        }
        migrate_start_colo_process(s);

The changes of functions interfaces are independent of this patch.

Later, Juan.


