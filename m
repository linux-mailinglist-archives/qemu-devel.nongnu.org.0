Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB746FDA16
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:55:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfbB-00027t-1Y; Wed, 10 May 2023 04:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfav-00024i-7d
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfat-0004FS-At
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683708882;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/NA4vwKhFxeAJpBhTebBA1lLxPB1mOmtqjo9Ll4zMPk=;
 b=Si1I2vPJJK0RIvRWxzjc5M6Qq6HHSMf1+ztnI7luuXHLtedrMoz4FOpUcH7HBEjgismePr
 A8dLKB2N6AwYectrDuoRwI7XFFS6JFywSSibg5CMDjX6hyckjrDlWanuX7vA0VhPJXHRtl
 OkndahAJNgJLWvmHePnN8xenH+rzC+Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-d6QZAAqRPrmhpR0hcJs5ew-1; Wed, 10 May 2023 04:54:41 -0400
X-MC-Unique: d6QZAAqRPrmhpR0hcJs5ew-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f42867b47dso17034815e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708879; x=1686300879;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NA4vwKhFxeAJpBhTebBA1lLxPB1mOmtqjo9Ll4zMPk=;
 b=AIgkUCWpp7FneJFGgzaV4hKV8AwWegqD1YHUIZXv4vdM2Y5tXWvJQMjecT/1tfFP1z
 MszCOXEHGEP8SDIwJ5yVpwlFmqRN1J0iU7Zc0VXHfl04pX1oy/OYLLTX/EmWZHW5WBJ1
 +tIu6I5yuhvS2DuV1UAtCUNf7A4bzFG37itSNiXiRoLeqoNtQsNomK7dubnvuOVatyI2
 zREAid2sfJ05KOZL5J1UZqCQsYUyH1aBw4Lw7X/CKf4Burd0QSn9UA5OIPEQ1NalFIJu
 KGsfca1cPdnQPC4MGQRVoI34td2wcH2kwjOC8siviIRhyjL9FzP/T3bMRxfxwfaoo7pG
 pEyA==
X-Gm-Message-State: AC+VfDxhrDtg5QWUm4zZo2y2j1E6qRKNra9x6J/79Kar9zIAtl65kzyv
 qnw7LsC5lsXsS2A5KC+SkiUhzzbFftnWsT8wiQdifzokswTICQ7jKQgK+pLUAkL1Q4mDmZd5O5t
 ZcStBMzqJFhdDbi/u4PQQePTejg==
X-Received: by 2002:a7b:c04c:0:b0:3f3:4147:3048 with SMTP id
 u12-20020a7bc04c000000b003f341473048mr11097726wmc.10.1683708879637; 
 Wed, 10 May 2023 01:54:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qG98KrLNGDtv14ROirQ7bXwcomb41jBflhHeAy7SrcnM8S5kE8a/Il6oj4hvOsfG2ju1UEg==
X-Received: by 2002:a7b:c04c:0:b0:3f3:4147:3048 with SMTP id
 u12-20020a7bc04c000000b003f341473048mr11097704wmc.10.1683708879327; 
 Wed, 10 May 2023 01:54:39 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f42cc3262asm3724133wmq.34.2023.05.10.01.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:54:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,  Peter Xu
 <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 3/8] migration: Add precopy initial data loaded ACK
 functionality
In-Reply-To: <20230501140141.11743-4-avihaih@nvidia.com> (Avihai Horon's
 message of "Mon, 1 May 2023 17:01:36 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-4-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 10:54:37 +0200
Message-ID: <87cz38a7n6.fsf@secure.mitica>
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

Avihai Horon <avihaih@nvidia.com> wrote:
> Add the core functionality of precopy initial data, which allows the
> destination to ACK that initial data has been loaded and the source to
> wait for this ACK before completing the migration.
>
> A new return path command MIG_RP_MSG_INITIAL_DATA_LOADED_ACK is added.
> It is sent by the destination after precopy initial data is loaded to
> ACK to the source that precopy initial data has been loaded.
>
> In addition, two new SaveVMHandlers handlers are added:
> 1. is_initial_data_active which indicates whether precopy initial data
>    is used for this migration user (i.e., SaveStateEntry).
> 2. initial_data_loaded which indicates whether precopy initial data has
>    been loaded by this migration user.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


> @@ -1401,6 +1412,8 @@ void migrate_init(MigrationState *s)
>      s->vm_was_running = false;
>      s->iteration_initial_bytes = 0;
>      s->threshold_size = 0;
> +
> +    s->initial_data_loaded_acked = false;

In general, you let a blank line for the stuff you add, when all the
previous fields don't do that.  Can you remove it.

> @@ -2704,6 +2725,20 @@ static void migration_update_counters(MigrationState *s,
>                                bandwidth, s->threshold_size);
>  }
>  
> +static bool initial_data_loaded_acked(MigrationState *s)
> +{
> +    if (!migrate_precopy_initial_data()) {
> +        return true;
> +    }
> +
> +    /* No reason to wait for precopy initial data loaded ACK if VM is stopped */
> +    if (!runstate_is_running()) {
> +        return true;
> +    }

Thinking loud here.

What happens if we start a migration.  Guest is running.
We enable precopy_initial_data().

And then we stop the guest.

Are we going to receive data that expect this return false?  Or it is
handled somewhere else?

> @@ -2719,6 +2754,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>  {
>      uint64_t must_precopy, can_postcopy;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
> +    bool initial_data_loaded = initial_data_loaded_acked(s);
>  
>      qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
>      uint64_t pending_size = must_precopy + can_postcopy;
> @@ -2731,7 +2767,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>          trace_migrate_pending_exact(pending_size, must_precopy, can_postcopy);
>      }
>  
> -    if (!pending_size || pending_size < s->threshold_size) {
> +    if ((!pending_size || pending_size < s->threshold_size) &&
> +        initial_data_loaded) {
>          trace_migration_thread_low_pending(pending_size);
>          migration_completion(s);
>          return MIG_ITERATE_BREAK;

For this specific variable, I think I am going to add something more
general that this can piggy back.

For the migration tests I need exactly this functionality.  I want
migration to run until the test decided that it is a good idea to
finish.  I.e. For testing xbzrle I need at least three iterations, to
test auto_converge I need a minimum of 13 iterations.  And I am going to
do exactly what you have done here.

Will came back to you after I think something.

> @@ -2739,7 +2776,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>  
>      /* Still a significant amount to transfer */
>      if (!in_postcopy && must_precopy <= s->threshold_size &&
> -        qatomic_read(&s->start_postcopy)) {
> +        initial_data_loaded && qatomic_read(&s->start_postcopy)) {
>          if (postcopy_start(s)) {
>              error_report("%s: postcopy failed to start", __func__);
>          }
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 2740defdf0..7a94deda3b 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2504,6 +2504,39 @@ static int loadvm_process_command(QEMUFile *f)
>      return 0;
>  }
>  
> +static int qemu_loadvm_initial_data_loaded_ack(MigrationIncomingState *mis)
> +{
> +    SaveStateEntry *se;
> +    int ret;
> +
> +    if (!mis->initial_data_enabled || mis->initial_data_loaded_ack_sent) {
> +        return 0;
> +    }
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->initial_data_loaded) {
> +            continue;
> +        }
> +
> +        if (!se->ops->is_initial_data_active ||
> +            !se->ops->is_initial_data_active(se->opaque)) {
> +            continue;
> +        }

If you don't have any other use for is_initial_data_active() I think you
can integrate the functionality with initial_data_loaded().

If it is not active just return 1?

> +
> +        if (!se->ops->initial_data_loaded(se->opaque)) {
> +            return 0;
> +        }
> +    }
> +
> +    ret = migrate_send_rp_initial_data_loaded_ack(mis);
> +    if (!ret) {
> +        mis->initial_data_loaded_ack_sent = true;
> +        trace_loadvm_initial_data_loaded_acked();
> +    }
> +
> +    return ret;
> +}

Later, Juan


