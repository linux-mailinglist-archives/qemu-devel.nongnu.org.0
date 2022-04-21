Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DB50A29F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:35:29 +0200 (CEST)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXu4-0005lY-Gs
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhXZ1-0007Op-T1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhXYz-0001PJ-75
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650550420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6xY8H2ig1MBi+Y1jjHps31TcFcA3gMCfestS4bv/v3E=;
 b=jOiL6kPfPeBPJGVqsd7dfVyXUqL3HjPpORhDUdT/MaNHS1A++yL56n6gKrrshY2//kKhEn
 8e1U2VV3Ru7oqJDt1Juy1EBxos7tGWkOprWj6PSC7rCp85Mhh9sYG6gWDse7VDpGNw0R7q
 JnprdzP2yu5lfdmXq9pJT7JlQwOAuN4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-B85aI5TZMROzmJIHHYpuYg-1; Thu, 21 Apr 2022 10:13:38 -0400
X-MC-Unique: B85aI5TZMROzmJIHHYpuYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0038cfe6edf3fso4551413wme.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 07:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6xY8H2ig1MBi+Y1jjHps31TcFcA3gMCfestS4bv/v3E=;
 b=EgBK/PVfPfvVRYJWjYk0rXDWWDkMNjnwcSpS3JZ6jzITYebSM/NikRE3FBlZR+TLZT
 6jIrkBrYgpB6kiVq1j2ZtJFsPDaUnSA755FGenrVOKDMztbNydHa6e+OALa3tD+nEST9
 ptYSmAwh99vUcg7fyllbrvEWcbb0dEqi8XLkTI8UY6B9iSlZNObV/niYq45l/0WaoQYU
 7HZ4QUBAj+rq81mrjISD39fLnPpaSQsX/MFSQBb8dFPva27dmVzDxOTSrVCz8C3IYkBE
 dj29pYYFwNa511tEtRcpQ6o6Rzyf9cWam2La+RauVJ+esfHKEF9IC4jCGz3V783sGGdc
 AUxw==
X-Gm-Message-State: AOAM532bf7QBXdo92yiw+IMI8doY9p2FvirH+1w4qkrDJ/SncJWaEhSz
 MVRXFQGDZiqBQTIlNT+Rqax1AC0B5N05wAbWavlGw1g9FgoFjjAZU10n7nacc7ZPncivl74zOa6
 nFRA17IbrSPX4D9LfpRGidZfzuY0/bw7/HXLUru87lEAxBRnRrzYeA4kBm8YcN11iE24=
X-Received: by 2002:a1c:7416:0:b0:38e:b8b7:e271 with SMTP id
 p22-20020a1c7416000000b0038eb8b7e271mr8610813wmc.7.1650550417387; 
 Thu, 21 Apr 2022 07:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr0ohpDtBJWOU8kAEa4KqMLE6pW7BezrVeI27qf8O0v7yKlJcYLc+ZRv5LqLXwNIK3jaaKXA==
X-Received: by 2002:a1c:7416:0:b0:38e:b8b7:e271 with SMTP id
 p22-20020a1c7416000000b0038eb8b7e271mr8610782wmc.7.1650550416984; 
 Thu, 21 Apr 2022 07:13:36 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056000110600b00207aa9eec98sm2323200wrw.30.2022.04.21.07.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 07:13:36 -0700 (PDT)
Date: Thu, 21 Apr 2022 15:13:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com
Subject: Re: [PATCH] migration: Read state once
Message-ID: <YmFmjqV7UM0T4jX4@work-vm>
References: <20220413113329.103696-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413113329.103696-1-dgilbert@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'status' field for the migration is updated normally using
> an atomic operation from the migration thread.
> Most readers of it aren't that careful, and in most cases it doesn't
> matter.
> 
> In query_migrate->fill_source_migration_info the 'state'
> is read twice; the first time to decide which state fields to fill in,
> and then secondly to copy the state to the status field; that can end up
> with a status that's inconsistent; e.g. setting up the fields
> for 'setup' and then having an 'active' status.  In that case
> libvirt gets upset by the lack of ram info.
> The symptom is:
>    libvirt.libvirtError: internal error: migration was active, but no RAM info was set
> 
> Read the state exactly once in fill_source_migration_info.
> 
> This is a possible fix for:
> https://bugzilla.redhat.com/show_bug.cgi?id=2074205
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  migration/migration.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 695f0f2900..811c584619 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1073,6 +1073,7 @@ static void populate_disk_info(MigrationInfo *info)
>  static void fill_source_migration_info(MigrationInfo *info)
>  {
>      MigrationState *s = migrate_get_current();
> +    int state = qatomic_read(&s->state);
>      GSList *cur_blocker = migration_blockers;
>  
>      info->blocked_reasons = NULL;
> @@ -1092,7 +1093,7 @@ static void fill_source_migration_info(MigrationInfo *info)
>      }
>      info->has_blocked_reasons = info->blocked_reasons != NULL;
>  
> -    switch (s->state) {
> +    switch (state) {
>      case MIGRATION_STATUS_NONE:
>          /* no migration has happened ever */
>          /* do not overwrite destination migration status */
> @@ -1137,7 +1138,7 @@ static void fill_source_migration_info(MigrationInfo *info)
>          info->has_status = true;
>          break;
>      }
> -    info->status = s->state;
> +    info->status = state;
>  }
>  
>  typedef enum WriteTrackingSupport {
> -- 
> 2.35.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


