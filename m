Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31E506CCA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:51:14 +0200 (CEST)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngnK4-0003E9-PB
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ngnH6-00024R-PY
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 08:48:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ngnH3-0001BS-Ea
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 08:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650372484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yRAAVaNGPkKZKdELc5FcguuEaov7XgsPJllEV+p6Riw=;
 b=gJHfxVQLE5uvkbh6XRNv5/qPHjCXFVd9S07s1ikY2Z1ZF8Lm+lmW/xEFHUtRFEze0NHPXz
 HThyzdJgvLAeF9VBhSR8tvACMUosGzgn/bKVEIaBhWI6zbyeVWrs/MzFHL815aQFeRLru5
 mI4prXSwCME9eHrVcN/6i/3I3ybREa8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-9FfUcLbFOmyrXVchpoTpNQ-1; Tue, 19 Apr 2022 08:48:03 -0400
X-MC-Unique: 9FfUcLbFOmyrXVchpoTpNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso1183639wmq.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 05:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=yRAAVaNGPkKZKdELc5FcguuEaov7XgsPJllEV+p6Riw=;
 b=QJa86qG9LSOK6lhpcwR8ZWNSmzLxeNeVOj4Dp9UG2MaRvTvihPCjEk5/6ux/7ZRMNS
 RsGWqdkNcyvQ4thlmpyicwqzd3OjnQ5vLRYTGAbJceNfe9mdPeJug74vVSQOyCd1ioMF
 3iR7JyEmw2VyDYagmdIgiJvDv9Htvmphu8tLglcG7ZBxw+vD6QI18XyGIem6TfeN+e0V
 wZESGBhYThS1dnUiuBk3J++9X6ggcNkhzHiaeB9Em6VOYiP518r6UD6KQp+AbejjMshv
 z1alVytBNcRctdxpCEf9hlPmeMN2krybFIQR88qDovA6qj260wQ6PNlPolrFsCB0HOO0
 afVg==
X-Gm-Message-State: AOAM532TKFg1b2uLoeJ/0Ju6ww4sbQU17zOQqLzDIQsyzvw5+hQC5D/N
 t0eV8DHCUoWir3MGq3vCVE/i2heVSpM43sx5FJr/E2omAyHV7xDQKtzcXTZkdQvRPNdE7mFcAzc
 5fmRlDTEMsuP7XZ0=
X-Received: by 2002:a5d:6449:0:b0:207:a1f4:b52 with SMTP id
 d9-20020a5d6449000000b00207a1f40b52mr11392287wrw.511.1650372482237; 
 Tue, 19 Apr 2022 05:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIYX7gy9cuItSyfuqXC9byZUp6G1GF43Q1fZCKJX/We9caEAL8V9wEMa00Kte0At9dCTJjXA==
X-Received: by 2002:a5d:6449:0:b0:207:a1f4:b52 with SMTP id
 d9-20020a5d6449000000b00207a1f40b52mr11392270wrw.511.1650372481968; 
 Tue, 19 Apr 2022 05:48:01 -0700 (PDT)
Received: from localhost (static-114-163-6-89.ipcom.comunitel.net.
 [89.6.163.114]) by smtp.gmail.com with ESMTPSA id
 i6-20020a0560001ac600b0020a93f75030sm5426872wry.48.2022.04.19.05.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:48:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: Read state once
In-Reply-To: <20220413113329.103696-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Wed, 13 Apr 2022 12:33:29 +0100")
References: <20220413113329.103696-1-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 19 Apr 2022 14:47:59 +0200
Message-ID: <87czhdqlxc.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: leobras@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
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

Reviewed-by: Juan Quintela <quintela@redhat.com>


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


