Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A592F4BDB29
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:18:42 +0100 (CET)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCKf-0005TG-Np
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMC64-0003O5-96
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:03:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMC5z-0004Qe-Lm
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yUjaXtZcZIWgUp9Hx4MQpSL/iHLdGPjCkOxvfuh3xes=;
 b=L/vta0btuqtEfYNAIhF+ErRVqp2GGeiL+LDlgDGfqJmk6jTVQZtLKataJ/pVWkktsEwOUx
 RaelfCL4H2o904Wlre0vbEVyQCS/wMLm3DLJKJYOWX75SmKSOIWfp+LqIFTtVDTBcXrO2b
 vKtSx+K0oLe/xqrDG/3qYv+bag1l9zA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-zlftSOaFPECKUhHYu1kUGQ-1; Mon, 21 Feb 2022 12:03:28 -0500
X-MC-Unique: zlftSOaFPECKUhHYu1kUGQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i188-20020a1c3bc5000000b0037bb9f6feeeso8273590wma.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yUjaXtZcZIWgUp9Hx4MQpSL/iHLdGPjCkOxvfuh3xes=;
 b=VAg+PUb8R8/7dz1+jV8cmyaT6MPcyxXlpdsY+qEr2EtJidqyfJLtROaTW8BUyymY6P
 ZbS96qAMvOb/EelESZuaucjnE9iZrSCOw24lk3GdzXAttBYbhRQJBePuPaXBVruHYfPL
 9FgW3yYDY6SQ8a3Uft73Ql/t2kEAfExUNF2MDAViDL2uLnoiPlHe+TI0RD970gbKNUQh
 lIccuj+Kuk8AW1CShmMEoeQ+DZ+O4XPyXExB9VgNistMCl+RU3gfhc5QxDj3QqXyRBiw
 Ahiv4QWCBkV0aF0t/2TkldOZtvKzAhD+RmLdnpj4TZ+CwQmsp/iqN+jb8sbzKvsSIurB
 76ZQ==
X-Gm-Message-State: AOAM530grGcYoLmMjGXqAnO/7TS9fuYIq0L/jiMLuefTp8nb31N2SPN/
 K1zFGMRUKFgjbWNvhY+xLGBJy+zPTtMaHmrCve9nU8C1d36qxjaBYrOrmD7Fs72LvuWt/xKi27I
 vUDydc7FWIihVoCg=
X-Received: by 2002:a05:600c:4fd6:b0:352:c2c6:8f34 with SMTP id
 o22-20020a05600c4fd600b00352c2c68f34mr22648911wmq.186.1645463007259; 
 Mon, 21 Feb 2022 09:03:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4SDTWSLfJUZDKr+pNcjoLHewKfh0Dp1wYBhKpCS/WIfFUFrjc1KroLGFzzf1Pg8ZReUOj1g==
X-Received: by 2002:a05:600c:4fd6:b0:352:c2c6:8f34 with SMTP id
 o22-20020a05600c4fd600b00352c2c68f34mr22648893wmq.186.1645463007047; 
 Mon, 21 Feb 2022 09:03:27 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b0037c4e2d3baesm8066437wma.19.2022.02.21.09.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:03:26 -0800 (PST)
Date: Mon, 21 Feb 2022 17:03:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 15/20] migration: Allow migrate-recover to run multiple
 times
Message-ID: <YhPF3PS260va9sC9@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-16-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-16-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Previously migration didn't have an easy way to cleanup the listening
> transport, migrate recovery only allows to execute once.  That's done with a
> trick flag in postcopy_recover_triggered.
> 
> Now the facility is already there.
> 
> Drop postcopy_recover_triggered and instead allows a new migrate-recover to
> release the previous listener transport.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

OK, was that the only reason you couldn't recover twice?


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 13 ++-----------
>  migration/migration.h |  1 -
>  migration/savevm.c    |  3 ---
>  3 files changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 6bb321cdd3..16086897aa 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2159,11 +2159,8 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>          return;
>      }
>  
> -    if (qatomic_cmpxchg(&mis->postcopy_recover_triggered,
> -                       false, true) == true) {
> -        error_setg(errp, "Migrate recovery is triggered already");
> -        return;
> -    }
> +    /* If there's an existing transport, release it */
> +    migration_incoming_transport_cleanup(mis);
>  
>      /*
>       * Note that this call will never start a real migration; it will
> @@ -2171,12 +2168,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>       * to continue using that newly established channel.
>       */
>      qemu_start_incoming_migration(uri, errp);
> -
> -    /* Safe to dereference with the assert above */
> -    if (*errp) {
> -        /* Reset the flag so user could still retry */
> -        qatomic_set(&mis->postcopy_recover_triggered, false);
> -    }
>  }
>  
>  void qmp_migrate_pause(Error **errp)
> diff --git a/migration/migration.h b/migration/migration.h
> index f17ccc657c..a863032b71 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -139,7 +139,6 @@ struct MigrationIncomingState {
>      struct PostcopyBlocktimeContext *blocktime_ctx;
>  
>      /* notify PAUSED postcopy incoming migrations to try to continue */
> -    bool postcopy_recover_triggered;
>      QemuSemaphore postcopy_pause_sem_dst;
>      QemuSemaphore postcopy_pause_sem_fault;
>  
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 967ff80547..254aa78234 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2589,9 +2589,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>  
>      assert(migrate_postcopy_ram());
>  
> -    /* Clear the triggered bit to allow one recovery */
> -    mis->postcopy_recover_triggered = false;
> -
>      /*
>       * Unregister yank with either from/to src would work, since ioc behind it
>       * is the same
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


