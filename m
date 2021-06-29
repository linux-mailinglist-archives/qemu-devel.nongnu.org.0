Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B73B7741
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:32:20 +0200 (CEST)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHat-0008TK-5v
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyHZa-0007hg-AQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyHZX-0004GR-1m
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624987853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbckbO5rLuoo9YM/x0vpvvIRusAteieeF54x1LFqLGw=;
 b=i7YUdOKbo3BAXEOYNuWPXF9GTPRosv2qX1ZM4ibrb3xrwuzd1laI5eHwV/8/e+u8tBf4u9
 mAVhheGZxoyX3m27ZQXYBWtvzqAJcCBUS+t58xTwyrbu09eQ5xe6hRdHiVBAS04dwkJIY0
 l9JAOz59VSLeD6lqqUrGzse7ZLLYtOs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-VcVZ6PUmOoG1mDBF2wSW_A-1; Tue, 29 Jun 2021 13:30:51 -0400
X-MC-Unique: VcVZ6PUmOoG1mDBF2wSW_A-1
Received: by mail-wr1-f72.google.com with SMTP id
 j1-20020adfb3010000b02901232ed22e14so31627wrd.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XbckbO5rLuoo9YM/x0vpvvIRusAteieeF54x1LFqLGw=;
 b=iOlAF8npBV2pFhdO8wr1277Sgi507jyLUZjCcQ30erObOVDpz4+oA9wcE7O4A9A53k
 6lgK9Ia1jGLHCsyS20XgFxHxww2SGCvZzFxxD6o9HcM2MMX3nMOzOGIJQFUs7Mrj9y7W
 rsVIion5OeGHUUSOkP+PbaPW6zgcsyRky1b0EW8QUrR4gGT6+/5Z7gdgDKS/CRUTj3Gu
 /5+xYJswAwtgDKWjXjyXUJsSFp4+9d2Ntwp4RzTenRIFshPH1p1XnoNbzkKf3FOWveEt
 b/FA78XbLvW9DR24GX1KaVu+Qz0kWLJnEZ69z4bYtOxxVRMJo2gpuqGz65O2SIY4jGQu
 DxjA==
X-Gm-Message-State: AOAM530499bZp7N/WBvMiPfJQARZ5/q/Dw77841E1ZoLRKulyuc/Kt3V
 KpQgAKFtUIOsT/j0v4dyt2bpvWOpPT320uiblKE3HBXHkwFsnG3dCdF713bbOVEU301WboVgKFt
 CSo0bVKDNWa/d2j0=
X-Received: by 2002:a5d:6783:: with SMTP id v3mr34353576wru.217.1624987850690; 
 Tue, 29 Jun 2021 10:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEFvKrA12NUSv6t1QEizdfsoUPLW5+jRJz8kAu0qhiGwuT+dY/SNrq11Rn/GBHc/LZoDZ8sg==
X-Received: by 2002:a5d:6783:: with SMTP id v3mr34353557wru.217.1624987850469; 
 Tue, 29 Jun 2021 10:30:50 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id 9sm4104759wmf.3.2021.06.29.10.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 10:30:50 -0700 (PDT)
Date: Tue, 29 Jun 2021 18:30:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/2] migration: move wait-unplug loop to its own function
Message-ID: <YNtYxyX61+H5o853@work-vm>
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-2-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629155007.629086-2-lvivier@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> The loop is used in migration_thread() and bg_migration_thread(),
> so we can move it to its own function and call it from these both places.
> 
> Moreover, in migration_thread() we have a wrong state transition from
> SETUP to ACTIVE while state could be WAIT_UNPLUG. This is correctly
> managed in bg_migration_thread() so use this code instead.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 54 +++++++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d1880..3e92c405a2b6 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3664,6 +3664,28 @@ bool migration_rate_limit(void)
>      return urgent;
>  }
>  
> +/*
> + * if failover devices are present, wait they are completely
> + * unplugged
> + */
> +
> +static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
> +                                    int new_state)
> +{
> +    if (qemu_savevm_state_guest_unplug_pending()) {
> +        migrate_set_state(&s->state, old_state, MIGRATION_STATUS_WAIT_UNPLUG);
> +
> +        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> +               qemu_savevm_state_guest_unplug_pending()) {
> +            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> +        }
> +
> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
> +    } else {
> +        migrate_set_state(&s->state, old_state, new_state);
> +    }
> +}
> +
>  /*
>   * Master migration thread on the source VM.
>   * It drives the migration and pumps the data down the outgoing channel.
> @@ -3710,22 +3732,10 @@ static void *migration_thread(void *opaque)
>  
>      qemu_savevm_state_setup(s->to_dst_file);
>  
> -    if (qemu_savevm_state_guest_unplug_pending()) {
> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> -                          MIGRATION_STATUS_WAIT_UNPLUG);
> -
> -        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> -               qemu_savevm_state_guest_unplug_pending()) {
> -            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> -        }
> -
> -        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
> -                MIGRATION_STATUS_ACTIVE);
> -    }
> +    qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
> +                               MIGRATION_STATUS_ACTIVE);
>  
>      s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
> -    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> -                      MIGRATION_STATUS_ACTIVE);
>  
>      trace_migration_thread_setup_complete();
>  
> @@ -3833,21 +3843,9 @@ static void *bg_migration_thread(void *opaque)
>      qemu_savevm_state_header(s->to_dst_file);
>      qemu_savevm_state_setup(s->to_dst_file);
>  
> -    if (qemu_savevm_state_guest_unplug_pending()) {
> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> -                          MIGRATION_STATUS_WAIT_UNPLUG);
> -
> -        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> -               qemu_savevm_state_guest_unplug_pending()) {
> -            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> -        }
> +    qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
> +                               MIGRATION_STATUS_ACTIVE);
>  
> -        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
> -                          MIGRATION_STATUS_ACTIVE);
> -    } else {
> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> -                MIGRATION_STATUS_ACTIVE);
> -    }
>      s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
>  
>      trace_migration_thread_setup_complete();
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


