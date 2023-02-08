Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F768F7E6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPpyX-0002Br-Fo; Wed, 08 Feb 2023 14:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpyQ-0002Ax-LT
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpyO-0004cx-Nq
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675883955;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0s3sVpxXYLOBHJxNPe4bGpe1zJUfdjlOpEd//XPCsPg=;
 b=SD//rwBbrW+e8IAsKOcgQOTIJ2uOgBwcz1lj2pDMXjVUC8P/3d+nBLQGoIOIwGjEbupuvW
 Mz6J8jWoMfcdRLuIwaZ2GkpudPNYaPqeaXe2Z2zNzM7HHifMyl3TQzChuTyD37AmuoeLkH
 DfCXbHPOWyoQaFTDVsKEfhsJRSu9Bis=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-sM-xFwj6NMiqadG5Z32HHA-1; Wed, 08 Feb 2023 14:19:14 -0500
X-MC-Unique: sM-xFwj6NMiqadG5Z32HHA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e9-20020a5d6d09000000b002c172f173a9so3193724wrq.17
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0s3sVpxXYLOBHJxNPe4bGpe1zJUfdjlOpEd//XPCsPg=;
 b=FT3IAVR2ipelYMrPQ6Q5rkGO8rUwL7LICxVbTZDFioIm11uVoV2iuwuCDKAcjXj7dY
 cEVyD1hh4unCTv6/uW6h6l3E/dLw8c/Ubh/XbPjrqOIumVs7SmesjRni/Cw2X0pgM2Ky
 ZCv37vpj7XrYkemCBhNmmVbVbcJHpIRzYsdNWna8VgOR3inBoEEUThv+ob4yVgwLHIKb
 3HMyPyNBM4NVeBP+UEDDNnhI8E/OUuc16yqzfuiFD5RZJkg6q1rLI84Y8JaaIJ66Ncy3
 FGbpMkz+fv15tt6gcVX21iIC8CNTF9gDTA+qcTTvxZbJdugMLwnVD1/mt7Hqme2IbyOn
 dGig==
X-Gm-Message-State: AO0yUKW10LHBtUfNGR3sELVyZ7UlS8vJD0p18eh365+4vrXaBTN9zELX
 y3Q7VHFIQ2ULgy5zsl/i+ba7Ap9TvpXHNfzl+qHkuumj+8TCWyHeEANKGSwGxhxyk6tfQvCTQDK
 95OBxlJduwU5goUE=
X-Received: by 2002:a5d:5583:0:b0:2bf:bc75:1730 with SMTP id
 i3-20020a5d5583000000b002bfbc751730mr7618318wrv.70.1675883953171; 
 Wed, 08 Feb 2023 11:19:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+JVExGVs4E9U85kPjWJqGxegEOIgEsFFd9bCe6x0SP5zZjhStdxO0jaiUSbPxMdCfQRKiC+g==
X-Received: by 2002:a5d:5583:0:b0:2bf:bc75:1730 with SMTP id
 i3-20020a5d5583000000b002bfbc751730mr7618302wrv.70.1675883952929; 
 Wed, 08 Feb 2023 11:19:12 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o5-20020a5d62c5000000b002c3e1e1dcd7sm10824525wrv.104.2023.02.08.11.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:19:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v2 1/3] migration: Rework multi-channel checks on URI
In-Reply-To: <20230202212458.726496-2-peterx@redhat.com> (Peter Xu's message
 of "Thu, 2 Feb 2023 16:24:56 -0500")
References: <20230202212458.726496-1-peterx@redhat.com>
 <20230202212458.726496-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 20:19:11 +0100
Message-ID: <87pmak9d8w.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> The whole idea of multi-channel checks was not properly done, IMHO.
>
> Currently we check multi-channel in a lot of places, but actually that's
> not needed because we only need to check it right after we get the URI and
> that should be it.
>
> If the URI check succeeded, we should never need to check it again because
> we must have it.  If it check fails, we should fail immediately on either
> the qmp_migrate or qmp_migrate_incoming, instead of failingg it later after
> the connection established.
>
> Neither should we fail any set capabiliities like what we used to do here:
>
> 5ad15e8614 ("migration: allow enabling mutilfd for specific protocol only", 2021-10-19)
>
> Because logically the URI will only be set later after the capability is
> set, so it doesn't make a lot of sense to check the URI type when setting
> the capability, because we're checking the cap with an old URI passed in,
> and that may not even be the URI we're going to use later.
>
> This patch mostly reverted all such checks for before, dropping the
> variable migrate_allow_multi_channels and helpers.  Instead, add a common
> helper to check URI for multi-channels for either qmp_migrate and
> qmp_migrate_incoming and that should do all the proper checks.  The failure
> will only trigger with the "migrate" or "migrate_incoming" command, or when
> user specified "-incoming xxx" where "xxx" is not "defer".
>
> With that, make postcopy_preempt_setup() as simple as creating the channel.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

The idea is right.  But I think that changing everything in a single
patch is confusing.

> ---
>  migration/migration.c    | 56 +++++++++++++++++++---------------------
>  migration/migration.h    |  3 ---
>  migration/multifd.c      | 12 ++-------
>  migration/postcopy-ram.c | 14 +---------
>  migration/postcopy-ram.h |  2 +-
>  5 files changed, 31 insertions(+), 56 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index f4f7d207f0..ef7fceb5d7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -182,16 +182,26 @@ static int migration_maybe_pause(MigrationState *s,
>                                   int new_state);
>  static void migrate_fd_cancel(MigrationState *s);
>  
> -static bool migrate_allow_multi_channels = true;
> +static bool migration_needs_multiple_sockets(void)
> +{
> +    return migrate_use_multifd() || migrate_postcopy_preempt();
> +}

This function (and use it) makes sense

> -void migrate_protocol_allow_multi_channels(bool allow)
> +static bool uri_supports_multi_channels(const char *uri)
>  {
> -    migrate_allow_multi_channels = allow;
> +    return strstart(uri, "tcp:", NULL) || strstart(uri, "unix:", NULL) ||
> +        strstart(uri, "vsock:", NULL);

Indentation is wrong.  Fixing it by hand.

This other is also ok with me.

>  }
>  
> -bool migrate_multi_channels_is_allowed(void)
> +static bool migration_uri_validate(const char *uri, Error **errp)
>  {
> -    return migrate_allow_multi_channels;
> +    if (migration_needs_multiple_sockets() &&
> +        !uri_supports_multi_channels(uri)) {
> +        error_setg(errp, "Migration requires multi-channel URIs (e.g. tcp)");
> +        return false;
> +    }
> +
> +    return true;
>  }

This name is not O:-)

What about:

migration_channels_and_uri_compatible()

No, it is not perfect, but I can think anything else.

But validate don't mean anything.  I can't know without looking at the
function  what is the meaning of the result.

>  static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
> @@ -491,12 +501,15 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
>  
> -    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
> +    /* URI is not suitable for migration? */
> +    if (!migration_uri_validate(uri, errp)) {
> +        return;
> +    }
> +
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multi_channels(true);
>          socket_start_incoming_migration(p ? p : uri, errp);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> @@ -721,11 +734,6 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
>      migration_incoming_process();
>  }
>  
> -static bool migration_needs_multiple_sockets(void)
> -{
> -    return migrate_use_multifd() || migrate_postcopy_preempt();
> -}
> -
>  void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
> @@ -1347,15 +1355,6 @@ static bool migrate_caps_check(bool *cap_list,
>      }
>  #endif
>  
> -
> -    /* incoming side only */
> -    if (runstate_check(RUN_STATE_INMIGRATE) &&
> -        !migrate_multi_channels_is_allowed() &&
> -        cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> -        error_setg(errp, "multifd is not supported by current protocol");
> -        return false;
> -    }
> -
>      if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
>          if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>              error_setg(errp, "Postcopy preempt requires postcopy-ram");
> @@ -2440,6 +2439,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>      MigrationState *s = migrate_get_current();
>      const char *p = NULL;
>  
> +    /* URI is not suitable for migration? */
> +    if (!migration_uri_validate(uri, errp)) {
> +        return;
> +    }
> +
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>                           has_resume && resume, errp)) {
>          /* Error detected, put into errp */
> @@ -2452,11 +2456,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>      }
>  
> -    migrate_protocol_allow_multi_channels(false);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multi_channels(true);
>          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> @@ -4309,12 +4311,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>      }
>  
>      /* This needs to be done before resuming a postcopy */
> -    if (postcopy_preempt_setup(s, &local_err)) {
> -        error_report_err(local_err);
> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> -                          MIGRATION_STATUS_FAILED);
> -        migrate_fd_cleanup(s);
> -        return;
> +    if (migrate_postcopy_preempt()) {
> +        postcopy_preempt_setup(s);
>      }

I think that this should go in a different patch.

Rest looks ok.

Thanks, Juan.


