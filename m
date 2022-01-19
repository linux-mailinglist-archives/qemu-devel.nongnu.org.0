Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9449414E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:51:13 +0100 (CET)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGzA-0005Gi-D7
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAGpG-0002rw-TR
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:40:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAGpD-00080G-0d
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642621254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PS5OD+CxyUhFDdQxYuOMKV5LGbpugh6kF42OfZwPnwk=;
 b=FKAD/oqfguCfy8eAp34WFC/ek7k6SpTCZV3EbC3aVXJEY2t+2Su1z8HMRSn4qbRkF+DQMI
 3K+RfUMeKK8iUQ6R1MX5GQwqiA9tLs4KmPbc1ykeqdj9FfWwAzpRef/F1Zc9G+vrivpNOk
 xm05t+/sS770KNzBn7B3gu3MkSRvFAE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-W2OcMuYxMreeSNdQ0u2yyw-1; Wed, 19 Jan 2022 14:40:53 -0500
X-MC-Unique: W2OcMuYxMreeSNdQ0u2yyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n13-20020a05600c3b8d00b0034979b7e200so1694840wms.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 11:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PS5OD+CxyUhFDdQxYuOMKV5LGbpugh6kF42OfZwPnwk=;
 b=BUtSl4qlKACuM/5jFZFhM/Xbgai282M7m8dzrtTPnBRm9eUD+EUMnLehqygX3TGxJV
 ZE0aFO0PtphebKd6TMwylR4iezxKDD1INVH8Q56IRTe1zuCpldLShPhUtVgzLWREBO4p
 5RhGJLFyzS9Y6Eb5EORN4cy7OCzWwGlT3sjMoxPBJiMuOWtHWNxQFKx4RU2IWppFJ7q6
 nfnl1LaSXDwLl9Q3oepWaE/lDUid31l9N+de7MaHl7Izb0cX6AXSbbkoYyxPSQN45dNI
 VSRVP2menLzesu4W1LUnnIHK1QY/VNZv9TBmOs0lOZ8Clutz4iDIwel4OPfvUu8vHWUO
 Fxcw==
X-Gm-Message-State: AOAM5337F/L5MKEkrNFQsXV/EtA5NiqoFSPQO0zETc30usS4SMU9kjw8
 naKChBL/jqoQy1C2Rx0a30O8I+aQWhUVuOSK1KPAho+TaXtT4ydoVxdosdkY9oKjW8wwQrX6QUg
 8/q+KfKEIlQd6wRg=
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr5149631wmi.12.1642621250906;
 Wed, 19 Jan 2022 11:40:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQu0zJ4uTTljm6LYKeuPN9pqOvISPcR4C3T8lOnKLpj6ULbb2z/fUEPyfbaHVMQqE4LaLmzA==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr5149613wmi.12.1642621250674;
 Wed, 19 Jan 2022 11:40:50 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o3sm740494wrq.70.2022.01.19.11.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 11:40:50 -0800 (PST)
Date: Wed, 19 Jan 2022 19:40:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
Message-ID: <YehpP5C5LNvz59Km@work-vm>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-3-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211231055935.1878503-3-chen.zhang@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> COLO dose not support postcopy migration and remove the Fixme.


'does' not 'dose'

> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  migration/migration.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 2afa77da03..3fac9c67ca 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3230,7 +3230,11 @@ static void migration_completion(MigrationState *s)
>          goto fail_invalidate;
>      }
>  
> -    if (!migrate_colo_enabled()) {
> +    if (migrate_colo_enabled() && s->state == MIGRATION_STATUS_ACTIVE) {
> +        /* COLO dose not support postcopy */
> +        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
> +                          MIGRATION_STATUS_COLO);

I'm a bit confused; where were we setting the source state to COLO
before - I can't find it!

Dave

> +    } else {
>          migrate_set_state(&s->state, current_active_state,
>                            MIGRATION_STATUS_COMPLETED);
>      }
> @@ -3621,10 +3625,6 @@ static void migration_iteration_finish(MigrationState *s)
>                           "COLO enabled", __func__);
>          }
>          migrate_start_colo_process(s);
> -        /*
> -         * Fixme: we will run VM in COLO no matter its old running state.
> -         * After exited COLO, we will keep running.
> -         */
>           /* Fallthrough */
>      case MIGRATION_STATUS_ACTIVE:
>          /*
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


