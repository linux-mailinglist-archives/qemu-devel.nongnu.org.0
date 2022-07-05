Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A0566CEE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:21:18 +0200 (CEST)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8hYL-0006SU-8D
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8hWR-0005cW-Fx
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8hWO-0006sW-3a
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657023554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QBgiHePRbqxXheIf8VOvQIJtRXyyWgHJV3Q4GT60/tk=;
 b=HJhl/OHMECkPhxfPwq733EV7Jrs/TjXNCpTdO3JibW4Nl0ETmXOFwH/m7jh67xp+enHf6H
 P9tWGPS7qHVZWbEQvABUBIhRu09Q2xxk9aUXWeHzeluACjB1k1KsjClpOODAVRT0KZy1vd
 ti8MWliv0k2T9uIH50GVJYuThQ4nz+E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-KM4urM3fMc-mjvoronClfw-1; Tue, 05 Jul 2022 08:19:13 -0400
X-MC-Unique: KM4urM3fMc-mjvoronClfw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g10-20020adfa58a000000b0021d419f7751so1925415wrc.23
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QBgiHePRbqxXheIf8VOvQIJtRXyyWgHJV3Q4GT60/tk=;
 b=ESJbrjFgkWOG4lsm87E9fQBVgjlg39v4PTKCvb/I9V40m1zpeWmthuCx3U/SgGXNTG
 vKnL+b6aVzF9JUDI/bZZibTH9ydBrqunWkR3q6S7cp62N44NngNnx5cfWZLNQC73lkpt
 BiVJ06CoL4EW0se84Hg5zeEuId24w12t/RwYIZ1pOze8l2wjJjay0yA58Ff5CiJLoO6k
 sTfU7o+R48Sn8IS6NG0XauybOpAkOgY7Q37eoUFECTW06dLgFIc379zUpVC2j4ZIBlqk
 6999UzfWBb4KAYix/UyLOd1fjYNiCmGPKqMUnBtktIomlET7Fj1eJJkrkobCAn9CTXNg
 pmfA==
X-Gm-Message-State: AJIora87ocC5O+sheX4xnJAxKdOX6E710Bdz0ERsyAhw0ExWO9u2zUyg
 0YZYNwJuk87xqouO18gAzRsTUUVZuXRAJx79XU7NhVdm9BSr+exHsEG95I2qcSDz0vQMua2/4IS
 Sux/pk5/ZnpGNE8M=
X-Received: by 2002:a7b:cb8a:0:b0:3a0:ac8a:7c43 with SMTP id
 m10-20020a7bcb8a000000b003a0ac8a7c43mr37508327wmi.152.1657023552690; 
 Tue, 05 Jul 2022 05:19:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1syvhg4FYNU+7BjvDOAgrChMU5XtLsK2sNpZWs/R2/GzzBtpLG1WgUXjha0T0L1W2ueayr6Vw==
X-Received: by 2002:a7b:cb8a:0:b0:3a0:ac8a:7c43 with SMTP id
 m10-20020a7bcb8a000000b003a0ac8a7c43mr37508305wmi.152.1657023552438; 
 Tue, 05 Jul 2022 05:19:12 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00219e77e489fsm32038165wrt.17.2022.07.05.05.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:19:11 -0700 (PDT)
Date: Tue, 5 Jul 2022 13:19:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 1/5] multifd: Create property multifd-sync-each-iteration
Message-ID: <YsQsPc53NVXOY8dp@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140507.1246-2-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We used to synchronize all channels at the end of each RAM section
> sent.  That is not needed, so preparing to only synchronize once every
> full round in latests patches.
> 
> Notice that we initialize the property as true.  We will change the
> default when we introduce the new mechanism.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.h |  6 ++++++
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 10 ++++++++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index 485d58b95f..70dae24516 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -332,6 +332,11 @@ struct MigrationState {
>       * This save hostname when out-going migration starts
>       */
>      char *hostname;
> +    /*
> +     * Synchronize channels after each iteration.
> +     * We used to do that on the past, but it is suboptimal.
> +     */
> +    bool multifd_sync_each_iteration;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> @@ -374,6 +379,7 @@ int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> +bool migrate_multifd_sync_each_iteration(void);
>  
>  #ifdef CONFIG_LINUX
>  bool migrate_use_zero_copy_send(void);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..c8a60917e0 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -43,6 +43,7 @@
>  GlobalProperty hw_compat_7_0[] = {
>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>      { "nvme-ns", "eui64-default", "on"},
> +    { "migration", "multifd-sync-each-iteration", "on"},
>  };
>  const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index 31739b2af9..3f79df0b70 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2540,6 +2540,13 @@ bool migrate_use_multifd(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
>  
> +bool migrate_multifd_sync_each_iteration(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->multifd_sync_each_iteration;
> +}
> +
>  bool migrate_pause_before_switchover(void)
>  {
>      MigrationState *s;
> @@ -4274,6 +4281,9 @@ static Property migration_properties[] = {
>      DEFINE_PROP_SIZE("announce-step", MigrationState,
>                        parameters.announce_step,
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> +    /* We will change to false when we introduce the new mechanism */
> +    DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
> +                      multifd_sync_each_iteration, true),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


