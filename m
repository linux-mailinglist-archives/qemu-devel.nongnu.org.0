Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B9622C6B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:32:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oslAj-00072C-Vx; Wed, 09 Nov 2022 08:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oslAh-000713-Eg
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oslAf-0004kV-Od
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668000671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n0/o9ewL04JiVuJx2IQADneeLxeTWVwTVZEmjJyT66o=;
 b=Ka7bR4MAMRY0bVmI9LY81UdAxQg/rBKi0ZwODkRABJjJhRnwj3ump8M24uQvmUELNhHrTi
 5sNcdc8VcASHGUQm3wYkTM7KhUkn1pjWKZGkw33ok9vBCg/DC/ToDYhMgL5k7E7VByl/6D
 UkAF8SSFKcjCAJIYGo7QhoKUjYSd9M0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-IZll8p-UNySbh_VckGU0xQ-1; Wed, 09 Nov 2022 08:31:10 -0500
X-MC-Unique: IZll8p-UNySbh_VckGU0xQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so5027261wrg.14
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 05:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0/o9ewL04JiVuJx2IQADneeLxeTWVwTVZEmjJyT66o=;
 b=Ykc1zIMM4NBDthMK3hiyrdmOQqlnQB0lq7YoowklpEeYHmHNQtr3dN/t8LE95FUJ0d
 pjC6wkLFLOmjkmGn19/rPkyUI3mqc88U5cLL3As2sKQGzoR2utlNIuWvfCcTSyOJaAmV
 LHKhkKnW9KMAle4PbdBKCvyTqzUQQipJ3zBYU2Iy/8nrbwJ792qsVQTmuoeZS0OEP8Oc
 PyLT4uXef4+IvLoh7pRCuvdwfQV9Denk9pJpu7/t/HFLGmUE3k4eOHX4jfsX2OrJLhM9
 YkOHORe9+TFb0CEIp9oe2LApzQOxghx1CxMw3tL0zAb3fA5PmyqQWFXt8G+vSIIeKPwN
 NQQg==
X-Gm-Message-State: ACrzQf1s/M9kNsd2ud2GJbYRrYQ3GOXXKnf4N+sGNtGVNObGTQAyNx0F
 mWUZUpDV/mUTDP3qSoADEgXd9Se9/gGh7rDEFUHlfXm46b+YnVBkyT1C+1I/L4wkuOGrtTtGAYw
 Tb1/IqEajwGUdPaY=
X-Received: by 2002:a05:600c:448a:b0:3cf:a359:9f4d with SMTP id
 e10-20020a05600c448a00b003cfa3599f4dmr14233679wmo.133.1668000668852; 
 Wed, 09 Nov 2022 05:31:08 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6EH1TXA59cxBUBrqkG4wfnTreIrkatQnjt2162LavYVzxBK+67H9LxwXnRRJAlU1MgdQPDNg==
X-Received: by 2002:a05:600c:448a:b0:3cf:a359:9f4d with SMTP id
 e10-20020a05600c448a00b003cfa3599f4dmr14233658wmo.133.1668000668622; 
 Wed, 09 Nov 2022 05:31:08 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d11-20020adfe2cb000000b0022e47b57735sm13172435wrj.97.2022.11.09.05.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 05:31:08 -0800 (PST)
Date: Wed, 9 Nov 2022 13:31:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
Message-ID: <Y2urmk6gG4otYTaZ@work-vm>
References: <20221109055629.789795-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109055629.789795-1-leobras@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

* Leonardo Bras (leobras@redhat.com) wrote:
> When multifd and postcopy-ram capabilities are enabled, if a
> migrate-start-postcopy is attempted, the migration will finish sending the
> memory pages and then crash with the following error:

How does that happen? Isn't multifd+postcopy still disabled, I see in 
migrate_caps_check

    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
    ....
        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
            error_setg(errp, "Postcopy is not yet compatible with multifd");
            return false;
        }
    }


Dave

> qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion
> `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because even though all multifd channels could
> yank_register_function(), none of them could unregister it before
> unregistering the MIGRATION_YANK_INSTANCE, causing the assert to fail.
> 
> Fix that by calling multifd_load_cleanup() on postcopy_ram_listen_thread()
> before MIGRATION_YANK_INSTANCE is unregistered.
> 
> Fixes: b5eea99ec2 ("migration: Add yank feature")
> Reported-by: Li Xiaohui <xiaohli@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/migration.h |  1 +
>  migration/migration.c | 18 +++++++++++++-----
>  migration/savevm.c    |  2 ++
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index cdad8aceaa..240f64efb0 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -473,6 +473,7 @@ void migration_make_urgent_request(void);
>  void migration_consume_urgent_request(void);
>  bool migration_rate_limit(void);
>  void migration_cancel(const Error *error);
> +bool migration_load_cleanup(void);
>  
>  void populate_vfio_info(MigrationInfo *info);
>  void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..4f363b2a95 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -486,6 +486,17 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> +bool migration_load_cleanup(void)
> +{
> +    Error *local_err = NULL;
> +
> +    if (multifd_load_cleanup(&local_err)) {
> +        error_report_err(local_err);
> +        return true;
> +    }
> +    return false;
> +}
> +
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> @@ -540,8 +551,7 @@ static void process_incoming_migration_bh(void *opaque)
>       */
>      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
>  
> -    if (multifd_load_cleanup(&local_err) != 0) {
> -        error_report_err(local_err);
> +    if (migration_load_cleanup()) {
>          autostart = false;
>      }
>      /* If global state section was not received or we are in running
> @@ -646,9 +656,7 @@ fail:
>      migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>                        MIGRATION_STATUS_FAILED);
>      qemu_fclose(mis->from_src_file);
> -    if (multifd_load_cleanup(&local_err) != 0) {
> -        error_report_err(local_err);
> -    }
> +    migration_load_cleanup();
>      exit(EXIT_FAILURE);
>  }
>  
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a0cdb714f7..250caff7f4 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
>          exit(EXIT_FAILURE);
>      }
>  
> +    migration_load_cleanup();
> +
>      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                                     MIGRATION_STATUS_COMPLETED);
>      /*
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


