Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6234537EC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:44:22 +0100 (CET)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1ZF-00068S-CS
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1JJ-00005p-Vm
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1JG-0004cG-V8
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637080070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cA8MZN1jjp/rOsgB3ABoB8zkhxA0dw1l8aLbCTQi9d0=;
 b=OvKLr1IHrKg/J6L+PWAXXSwysUSosBnl66dDDpqrYrN8gUwowWamTjU0DoLIlJb0zTracE
 BVCrpfqzii89w2QW2lNHk06z3J9s2mHtWSn5zdC903MCClKblBb4EMbkrncjWW+jVsLDs9
 9EPyEtMmwwwwy7wRDpllQT8uTVYKUP4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-KSE3zkuGPrmTctuXoZrdzA-1; Tue, 16 Nov 2021 11:27:47 -0500
X-MC-Unique: KSE3zkuGPrmTctuXoZrdzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1706070wms.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=cA8MZN1jjp/rOsgB3ABoB8zkhxA0dw1l8aLbCTQi9d0=;
 b=rye7WiIIqjED4xZVAFDMNvITtZ3keuqi7Xmupf8vgYujQHGmjtyJTQ5i7oV/Jc09/l
 otvqHQU/Pqy2pbsnEidOb0lRRBZlBNjsY/gYgc47u/7WDJWHPgYaiPJlbCR66Op1Lwi7
 TwxElhHfHWk7BbtQ7+/hBZGnegZE9G9Av6Zr+bOt/N49u8BrC8XlBifbG57BxFLNaYWU
 qHEkbtAXKajDJ5onGwIL29dxaGMyhrWUoOKvE1ycQxf/Xpw9twRAw9NvxLh+vyE7IpCJ
 MBft/99e9olA1FDhxMkiHgcrPKHTmrs5+2K8Yuh6qEYpUp2hw9AAAVYWLrtEcWRs0t8i
 GdiA==
X-Gm-Message-State: AOAM531t99azP9tUm10YQinsmFppAqxS0KV7uRwAo6whbiovoi2aTdqJ
 D2bjtmNzt8Y7+uFaFwi6cnGJZUzWEdG4Rgju/9wkcpjcJ93tQ2pc5z4gLckt/QzavgMHEQ4dMig
 BDZH6a9d6gtNp7N0=
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr10127067wrt.224.1637080065369; 
 Tue, 16 Nov 2021 08:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxZiufd0QW9h0tbu8kIrXe4NtUUM5rzMVb3aj4W4+WVDJjL94fqtrklq52vUFl6vt3uWO1NQ==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr10127045wrt.224.1637080065161; 
 Tue, 16 Nov 2021 08:27:45 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id p12sm21657056wrr.10.2021.11.16.08.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:27:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 1/2] migration/colo: Optimize COLO start code path
In-Reply-To: <20211110174156.3834330-1-chen.zhang@intel.com> (Zhang Chen's
 message of "Thu, 11 Nov 2021 01:41:55 +0800")
References: <20211110174156.3834330-1-chen.zhang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 16 Nov 2021 17:27:43 +0100
Message-ID: <87lf1ouku8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-dev <qemu-devel@nongnu.org>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> wrote:
> There is no need to start COLO through MIGRATION_STATUS_ACTIVE.

Hi

I don't understand what you are trying to do.  In my reading, at least
the commit message is wrong:

void migrate_start_colo_process(MigrationState *s)
{
    ...
    migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
                      MIGRATION_STATUS_COLO);
    ...
}

and

void *colo_process_incoming_thread(void *opaque)
{
    ...
    migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                      MIGRATION_STATUS_COLO);

So colo starts with MIGRATION_STATUS_ACTIVE.


> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  migration/colo.c      |  2 --
>  migration/migration.c | 18 +++++++++++-------
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/migration/colo.c b/migration/colo.c
> index 2415325262..ad1a4426b3 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -667,8 +667,6 @@ void migrate_start_colo_process(MigrationState *s)
>                                  colo_checkpoint_notify, s);
>  
>      qemu_sem_init(&s->colo_exit_sem, 0);
> -    migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
> -                      MIGRATION_STATUS_COLO);
>      colo_process_checkpoint(s);
>      qemu_mutex_lock_iothread();
>  }
> diff --git a/migration/migration.c b/migration/migration.c
> index abaf6f9e3d..4c8662a839 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3222,7 +3222,10 @@ static void migration_completion(MigrationState *s)
>          goto fail_invalidate;
>      }
>  
> -    if (!migrate_colo_enabled()) {
> +    if (migrate_colo_enabled()) {
> +        migrate_set_state(&s->state, current_active_state,
> +                          MIGRATION_STATUS_COLO);
> +    } else {
>          migrate_set_state(&s->state, current_active_state,
>                            MIGRATION_STATUS_COMPLETED);
>      }

This moves the setup to MIGRATION_STATUS_COLO to completion time instead
of the beggining of the process.  I have no clue why.  I guess you can
put a comment/commit message to say what you ar.e trynig to do.

> @@ -3607,12 +3610,7 @@ static void migration_iteration_finish(MigrationState *s)
>          migration_calculate_complete(s);
>          runstate_set(RUN_STATE_POSTMIGRATE);
>          break;
> -
> -    case MIGRATION_STATUS_ACTIVE:
> -        /*
> -         * We should really assert here, but since it's during
> -         * migration, let's try to reduce the usage of assertions.
> -         */
> +    case MIGRATION_STATUS_COLO:
>          if (!migrate_colo_enabled()) {
>              error_report("%s: critical error: calling COLO code without "
>                           "COLO enabled", __func__);
> @@ -3622,6 +3620,12 @@ static void migration_iteration_finish(MigrationState *s)
>           * Fixme: we will run VM in COLO no matter its old running state.
>           * After exited COLO, we will keep running.
>           */
> +         /* Fallthrough */
> +    case MIGRATION_STATUS_ACTIVE:
> +        /*
> +         * We should really assert here, but since it's during
> +         * migration, let's try to reduce the usage of assertions.
> +         */
>          s->vm_was_running = true;
>          /* Fallthrough */
>      case MIGRATION_STATUS_FAILED:

I guess this change is related to the previous one, but I don't
understand colo enough to review it.

Later, Juan.


