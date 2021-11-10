Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29744BE26
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:58:31 +0100 (CET)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkNC-0004xL-J4
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkkK2-0002T2-BR
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkkJz-0008Uk-6h
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636538110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OgY60ucFqhpZlcYp8AwrXg6h5NlmY/cfpj5DwdBFRE8=;
 b=fufGG3WGcZ4i0/VHoWZkN12QqIENFezMGjdOwxTEo2kgdZYe+0pRQ/cKclalGEAGoIpHea
 LX3+HnFWlEjIDlbPaihVXWKVukEO4+eRtY23fgzs7v+hliGFADcUZ6r7f/rI9cX9g69wPT
 XY/AF6NNUKkkJ8azUMiV1R6cO3A+4Zk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-yWJP0hSyPMaE6F82fPYn4Q-1; Wed, 10 Nov 2021 04:55:08 -0500
X-MC-Unique: yWJP0hSyPMaE6F82fPYn4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so862154wmj.8
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=OgY60ucFqhpZlcYp8AwrXg6h5NlmY/cfpj5DwdBFRE8=;
 b=XTaoUx/zDS6hNOYdYhh82nu5LDSS0rp4FmkIxwfu5bMOSvh/421sRYIavvgroaDFx6
 9l/X/80u82PcfINHA5GUquyZeF+f0aJwuj3QJORy/ytEzpBt8CVtH2+t8QPcR6SFmpcp
 fchArKrk3OHUZkEdTCFrAT0V3jlfTkzVw4xjihZsaQSe7r/PfkVRNOgg5PMEYv4qQHpm
 CTu5ww5gFHQW5OJE+4R294yetK7abAvnDANFO7oYlY1oiCqU+uX5czI23OKVeDvGQJ9a
 nMWnwm0H7GddlRg7tmJojWt3hH2JdUmBlqDkhi0KMor97ZDsvoAqBBwn8G9WuBNWVpwu
 ZvlQ==
X-Gm-Message-State: AOAM531FPw2Jyu3TDHpimj34upnplgLHzZNAUsVJNN+nA7oSb1cYJY6x
 pXre35t6h52R42cneANrUxK/NJITDOpiHohl5IbiVJcGIk5ZIeabmyhTmN63zldOnAYjIMlEVtQ
 /cWDmhd+IniAOZy0=
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr15352284wms.44.1636538107496; 
 Wed, 10 Nov 2021 01:55:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznvfmuKQH4flPbIOtoMX6u6ZAvZ5GhC3sjR97TTVprSEQgIGi/6Vx/JL37GNENHQBgbz7afA==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr15352261wms.44.1636538107282; 
 Wed, 10 Nov 2021 01:55:07 -0800 (PST)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id g13sm4929729wmk.37.2021.11.10.01.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 01:55:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH 1/2] Fixed a QEMU hang when guest poweroff in COLO mode
In-Reply-To: <1636533456-5374-1-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Wed, 10 Nov 2021 16:37:35 +0800")
References: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 10 Nov 2021 10:55:05 +0100
Message-ID: <87ee7o2v46.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> When the PVM guest poweroff, the COLO thread may wait a semaphore
> in colo_process_checkpoint().So, we should wake up the COLO thread
> before migration shutdown.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

A couple of notes.

> ---
>  include/migration/colo.h |  1 +
>  migration/colo.c         | 14 ++++++++++++++
>  migration/migration.c    | 10 ++++++++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/include/migration/colo.h b/include/migration/colo.h
> index 768e1f0..525b45a 100644
> --- a/include/migration/colo.h
> +++ b/include/migration/colo.h
> @@ -37,4 +37,5 @@ COLOMode get_colo_mode(void);
>  void colo_do_failover(void);
>  
>  void colo_checkpoint_notify(void *opaque);
> +void colo_shutdown(COLOMode mode);
>  #endif
> diff --git a/migration/colo.c b/migration/colo.c
> index 2415325..385c1d7 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -820,6 +820,20 @@ static void colo_wait_handle_message(MigrationIncomingState *mis,
>      }
>  }
>  
> +void colo_shutdown(COLOMode mode)
> +{
> +    if (mode == COLO_MODE_PRIMARY) {
> +        MigrationState *s = migrate_get_current();
> +
> +        qemu_event_set(&s->colo_checkpoint_event);
> +        qemu_sem_post(&s->colo_exit_sem);
> +    } else {
> +        MigrationIncomingState *mis = migration_incoming_get_current();
> +
> +        qemu_sem_post(&mis->colo_incoming_sem);
> +    }
> +}
> +
>  void *colo_process_incoming_thread(void *opaque)
>  {
>      MigrationIncomingState *mis = opaque;
> diff --git a/migration/migration.c b/migration/migration.c
> index abaf6f9..9df6328 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -225,6 +225,16 @@ void migration_cancel(const Error *error)
>  
>  void migration_shutdown(void)
>  {
> +    COLOMode mode = get_colo_mode();
> +
> +    /*
> +     * When the QEMU main thread exit, the COLO thread
> +     * may wait a semaphore. So, we should wakeup the
> +     * COLO thread before migration shutdown.
> +     */
> +    if (mode != COLO_MODE_NONE) {
> +        colo_shutdown(mode);
> +     }

don't put the code on the main path.

Could you just put all of this inside a colo_shutdown() call?

Thanks, Juan.

>      /*
>       * Cancel the current migration - that will (eventually)
>       * stop the migration using this structure


