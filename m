Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804726FC3A8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:16:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKOC-0001H8-HL; Tue, 09 May 2023 06:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKOA-0001Gw-43
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKO7-00025Y-SN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683627366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n+XKrzUQkepXmwrnUpGda1nIZPh4MENu0rMSM7pB9Lk=;
 b=bmjRBc8I1RnuaF6M7rzfWCcEz/AnP+6Ta1jOSzH7TdrbA4lLl6L8QndqJODQ49L2zsK6Rp
 xuO3WoXrhiARcOML/tF6kaZaE0unDFU3uLG0dxUhzQ3/0cqnsz6llgSR25Pq99+7i3lshH
 ZUXdWpEX1PNsGIP56qLRchf7jMuSFvw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-boJ0vvpSOuiS1LwK8Hdv4Q-1; Tue, 09 May 2023 06:16:05 -0400
X-MC-Unique: boJ0vvpSOuiS1LwK8Hdv4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f348182ffcso36125315e9.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683627364; x=1686219364;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+XKrzUQkepXmwrnUpGda1nIZPh4MENu0rMSM7pB9Lk=;
 b=jbWbwu8NsugSaDsqG5P5tPPPNRY7IJl59mAHOBgY6K3i0fVydnM+PnHXspagRxHL1l
 XXGqzGOWDIO9CAugKHB66Iqb4EHafSQkOtVFCp95GdyOeW5qb/Bh46MEeX0EckSQR+5Z
 KyDC06SqNy7Etgl7LvbNY3P/h8UrZ7rVlLIHnr90WET1cNfz95+W7tvLkT4YN4MRsz0D
 hxnAUdAP/kcvl5PEItprYhhjcxhoulKElOHMFrXD9QDTR1tWQ+ggmZD7sryugZ4dVoIp
 IWQ6FyE2N6lmAKmTdzDI5dJ5q23CF1SvPuQLkJXBp6NpoF8ddesFbulUAqj4SHFmyeTL
 G9yA==
X-Gm-Message-State: AC+VfDylHzCU2HUNWX6I+na4h3OV5dpWppDEEHI5WAsxRO3+gaO5W6hv
 /cuJjFk/TeWVPvys4vFslV05aLU2oqhKbD1u3db0GFEVGaZLIzm0V9ZowltPEAt4afP8AwzY+mo
 X6lZpuWu2Exl0YFc=
X-Received: by 2002:a5d:6442:0:b0:306:32be:f0fe with SMTP id
 d2-20020a5d6442000000b0030632bef0femr8433052wrw.67.1683627364485; 
 Tue, 09 May 2023 03:16:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43MKtLORnt7jQiXRWh07DODTcGGVB6oI0gJKNVHfUmPD3GsiFjWt1FdsUR+omoCwaqmUOTcQ==
X-Received: by 2002:a5d:6442:0:b0:306:32be:f0fe with SMTP id
 d2-20020a5d6442000000b0030632bef0femr8433036wrw.67.1683627364165; 
 Tue, 09 May 2023 03:16:04 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 v23-20020a5d5917000000b0030632833e74sm14044563wrd.11.2023.05.09.03.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 03:16:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "tejus.gk" <tejus.gk@nutanix.com>
Cc: qemu-devel@nongnu.org,  peterx@redhat.com,  leobras@redhat.com,
 berrange@redhat.com,  shivam.kumar1@nutanix.com
Subject: Re: [RFC v2 1/1] migration: Update error description whenever
 migration fails
In-Reply-To: <20230508153223.133081-2-tejus.gk@nutanix.com> (tejus gk's
 message of "Mon, 8 May 2023 15:32:23 +0000")
References: <20230508153223.133081-1-tejus.gk@nutanix.com>
 <20230508153223.133081-2-tejus.gk@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 12:16:02 +0200
Message-ID: <874jolg68t.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"tejus.gk" <tejus.gk@nutanix.com> wrote:
> There are places in the code where the migration is marked failed with
> MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
> libvirt doesn't know why the migration failed when it queries for it.
>
> Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
> ---
>  migration/migration.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 232e387109..87101eed5c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1660,15 +1660,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_outgoing_migration(s, p, &local_err);
>      } else {
> -        if (!(has_resume && resume)) {
> -            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> -        }

Why are you removing this yank_unregister()?

> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
> +        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
>                     "a valid migration protocol");
> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> -                          MIGRATION_STATUS_FAILED);
>          block_cleanup_parameters();
> -        return;
>      }
>  
>      if (local_err) {
> @@ -2050,7 +2044,7 @@ migration_wait_main_channel(MigrationState *ms)
>   * Switch from normal iteration to postcopy
>   * Returns non-0 on error
>   */
> -static int postcopy_start(MigrationState *ms)
> +static int postcopy_start(MigrationState *ms, Error **errp)
>  {
>      int ret;
>      QIOChannelBuffer *bioc;
> @@ -2165,7 +2159,7 @@ static int postcopy_start(MigrationState *ms)
>       */
>      ret = qemu_file_get_error(ms->to_dst_file);
>      if (ret) {
> -        error_report("postcopy_start: Migration stream errored (pre package)");
> +        error_setg(errp, "postcopy_start: Migration stream errored (pre package)");
>          goto fail_closefb;
>      }
>  
> @@ -2202,7 +2196,7 @@ static int postcopy_start(MigrationState *ms)
>  
>      ret = qemu_file_get_error(ms->to_dst_file);
>      if (ret) {
> -        error_report("postcopy_start: Migration stream errored");
> +        error_setg(errp, "postcopy_start: Migration stream errored");
>          migrate_set_state(&ms->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                                MIGRATION_STATUS_FAILED);
>      }
> @@ -2719,6 +2713,7 @@ typedef enum {
>  static MigIterateState migration_iteration_run(MigrationState *s)
>  {
>      uint64_t must_precopy, can_postcopy;
> +    Error *local_err = NULL;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>  
>      qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
> @@ -2741,8 +2736,9 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      /* Still a significant amount to transfer */
>      if (!in_postcopy && must_precopy <= s->threshold_size &&
>          qatomic_read(&s->start_postcopy)) {
> -        if (postcopy_start(s)) {
> -            error_report("%s: postcopy failed to start", __func__);
> +        if (postcopy_start(s, &local_err)) {
> +            migrate_set_error(s, local_err);
> +            error_report_err(local_err);
>          }
>          return MIG_ITERATE_SKIP;
>      }
> @@ -3232,8 +3228,10 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>       */
>      if (migrate_postcopy_ram() || migrate_return_path()) {
>          if (open_return_path_on_source(s, !resume)) {
> -            error_report("Unable to open return-path for postcopy");
> +            error_setg(&local_err, "Unable to open return-path for postcopy");
>              migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
> +            migrate_set_error(s, local_err);
> +            error_report_err(local_err);
>              migrate_fd_cleanup(s);
>              return;
>          }

The rest of the patch looks right to me.

Later, Juan.


