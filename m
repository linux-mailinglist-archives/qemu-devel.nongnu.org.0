Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C668F88E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:05:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqfX-0002Hq-8m; Wed, 08 Feb 2023 15:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPqfR-0002Ff-FW
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPqfP-00063C-B1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675886622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVZYbycbnXHHrw119fV5kSO/gvzTlUzYH7YTiyq99J8=;
 b=UpSbq7lOdwUBDAAKa++TKt1fvnV2pGX0rmPvtEmVFN9nexAe06vdy5x8AezlPfPMFXszVc
 2DEFZKVi/6kzcB6zFn96i1bW8YeoaUlhzfGyge/mozZn2FMnh+7kk3s0NBvv8Ul6P2H6E9
 VHY0njTMdTv2Y9PcRlGN8eksJ+0Y8ec=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-gVCCvTutOgadkS4etBhLtQ-1; Wed, 08 Feb 2023 15:03:41 -0500
X-MC-Unique: gVCCvTutOgadkS4etBhLtQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so12810526qko.15
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVZYbycbnXHHrw119fV5kSO/gvzTlUzYH7YTiyq99J8=;
 b=lRtEhkdKK+g3VrH8b6WPoC585kM+DjQ0R6KxynFPIkbu2nfAD9t7RUemsa+0mZsGTW
 m2HvKHsgQu2npAFxsxoRMtlov0U7EYHZ2+JubiWmUGh2gMMOuPvm3ofMEU545hfmVnrR
 VWZXFZx4c2JKZ4lQ/ujAqMXqVU0u2Pgbsh4CLkNjChH/MXXg62fd1z5lcVWs3gzOLLD5
 5dgB0YXNQoh4wc3VC+Uuoo/fGxbiWc7CoCzdYKjH+U1BZJTf5zflDBKCWOCdtR89P1C5
 WCCy3JCiGBPz0vHeWMSmR27P45Q8mDzPWOnrVilVXt65OQ+jox6lniN2ICsuBM73pR98
 G79w==
X-Gm-Message-State: AO0yUKVr9X5GQHjPQ8VCci5JanWRDBIVy7fmUOYK8VVY0WjZyfKq4OjP
 WH0a81+jiEHYVkJGazVVtm8AKr0nhw01Tc2mTbpbpq+vmvfcQIMMXa7Y1LPXH10E+bOdNKEtlXH
 RfDUCc/H7p90s4Xg=
X-Received: by 2002:ac8:5e11:0:b0:3b9:fc92:a6 with SMTP id
 h17-20020ac85e11000000b003b9fc9200a6mr16337804qtx.6.1675886620285; 
 Wed, 08 Feb 2023 12:03:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/byAb6QlkYIs74b0fz5Bx7L49QOzPmbfoAM9tb/G76e9K/0yYrgLGGnx/LOTVUcOg+q6Hf6w==
X-Received: by 2002:ac8:5e11:0:b0:3b9:fc92:a6 with SMTP id
 h17-20020ac85e11000000b003b9fc9200a6mr16337770qtx.6.1675886619991; 
 Wed, 08 Feb 2023 12:03:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 ed4-20020a05620a490400b007195af894e7sm12211961qkb.76.2023.02.08.12.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:03:39 -0800 (PST)
Date: Wed, 8 Feb 2023 15:03:38 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v2 1/3] migration: Rework multi-channel checks on URI
Message-ID: <Y+QAGrBeUltSnrN6@x1n>
References: <20230202212458.726496-1-peterx@redhat.com>
 <20230202212458.726496-2-peterx@redhat.com>
 <87pmak9d8w.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pmak9d8w.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 08:19:11PM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > The whole idea of multi-channel checks was not properly done, IMHO.
> >
> > Currently we check multi-channel in a lot of places, but actually that's
> > not needed because we only need to check it right after we get the URI and
> > that should be it.
> >
> > If the URI check succeeded, we should never need to check it again because
> > we must have it.  If it check fails, we should fail immediately on either
> > the qmp_migrate or qmp_migrate_incoming, instead of failingg it later after
> > the connection established.
> >
> > Neither should we fail any set capabiliities like what we used to do here:
> >
> > 5ad15e8614 ("migration: allow enabling mutilfd for specific protocol only", 2021-10-19)
> >
> > Because logically the URI will only be set later after the capability is
> > set, so it doesn't make a lot of sense to check the URI type when setting
> > the capability, because we're checking the cap with an old URI passed in,
> > and that may not even be the URI we're going to use later.
> >
> > This patch mostly reverted all such checks for before, dropping the
> > variable migrate_allow_multi_channels and helpers.  Instead, add a common
> > helper to check URI for multi-channels for either qmp_migrate and
> > qmp_migrate_incoming and that should do all the proper checks.  The failure
> > will only trigger with the "migrate" or "migrate_incoming" command, or when
> > user specified "-incoming xxx" where "xxx" is not "defer".
> >
> > With that, make postcopy_preempt_setup() as simple as creating the channel.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> The idea is right.  But I think that changing everything in a single
> patch is confusing.
> 
> > ---
> >  migration/migration.c    | 56 +++++++++++++++++++---------------------
> >  migration/migration.h    |  3 ---
> >  migration/multifd.c      | 12 ++-------
> >  migration/postcopy-ram.c | 14 +---------
> >  migration/postcopy-ram.h |  2 +-
> >  5 files changed, 31 insertions(+), 56 deletions(-)
> >
> > diff --git a/migration/migration.c b/migration/migration.c
> > index f4f7d207f0..ef7fceb5d7 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -182,16 +182,26 @@ static int migration_maybe_pause(MigrationState *s,
> >                                   int new_state);
> >  static void migrate_fd_cancel(MigrationState *s);
> >  
> > -static bool migrate_allow_multi_channels = true;
> > +static bool migration_needs_multiple_sockets(void)
> > +{
> > +    return migrate_use_multifd() || migrate_postcopy_preempt();
> > +}
> 
> This function (and use it) makes sense
> 
> > -void migrate_protocol_allow_multi_channels(bool allow)
> > +static bool uri_supports_multi_channels(const char *uri)
> >  {
> > -    migrate_allow_multi_channels = allow;
> > +    return strstart(uri, "tcp:", NULL) || strstart(uri, "unix:", NULL) ||
> > +        strstart(uri, "vsock:", NULL);
> 
> Indentation is wrong.  Fixing it by hand.

Will do.

> 
> This other is also ok with me.
> 
> >  }
> >  
> > -bool migrate_multi_channels_is_allowed(void)
> > +static bool migration_uri_validate(const char *uri, Error **errp)
> >  {
> > -    return migrate_allow_multi_channels;
> > +    if (migration_needs_multiple_sockets() &&
> > +        !uri_supports_multi_channels(uri)) {
> > +        error_setg(errp, "Migration requires multi-channel URIs (e.g. tcp)");
> > +        return false;
> > +    }
> > +
> > +    return true;
> >  }
> 
> This name is not O:-)
> 
> What about:
> 
> migration_channels_and_uri_compatible()
> 
> No, it is not perfect, but I can think anything else.
> 
> But validate don't mean anything.  I can't know without looking at the
> function  what is the meaning of the result.

I don't have an obvious preference; I think it means I'll just go ahead and
rename it. :)

> 
> >  static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
> > @@ -491,12 +501,15 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
> >  {
> >      const char *p = NULL;
> >  
> > -    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
> > +    /* URI is not suitable for migration? */
> > +    if (!migration_uri_validate(uri, errp)) {
> > +        return;
> > +    }
> > +
> >      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> >      if (strstart(uri, "tcp:", &p) ||
> >          strstart(uri, "unix:", NULL) ||
> >          strstart(uri, "vsock:", NULL)) {
> > -        migrate_protocol_allow_multi_channels(true);
> >          socket_start_incoming_migration(p ? p : uri, errp);
> >  #ifdef CONFIG_RDMA
> >      } else if (strstart(uri, "rdma:", &p)) {
> > @@ -721,11 +734,6 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
> >      migration_incoming_process();
> >  }
> >  
> > -static bool migration_needs_multiple_sockets(void)
> > -{
> > -    return migrate_use_multifd() || migrate_postcopy_preempt();
> > -}
> > -
> >  void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> >  {
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> > @@ -1347,15 +1355,6 @@ static bool migrate_caps_check(bool *cap_list,
> >      }
> >  #endif
> >  
> > -
> > -    /* incoming side only */
> > -    if (runstate_check(RUN_STATE_INMIGRATE) &&
> > -        !migrate_multi_channels_is_allowed() &&
> > -        cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> > -        error_setg(errp, "multifd is not supported by current protocol");
> > -        return false;
> > -    }
> > -
> >      if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
> >          if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
> >              error_setg(errp, "Postcopy preempt requires postcopy-ram");
> > @@ -2440,6 +2439,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
> >      MigrationState *s = migrate_get_current();
> >      const char *p = NULL;
> >  
> > +    /* URI is not suitable for migration? */
> > +    if (!migration_uri_validate(uri, errp)) {
> > +        return;
> > +    }
> > +
> >      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
> >                           has_resume && resume, errp)) {
> >          /* Error detected, put into errp */
> > @@ -2452,11 +2456,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
> >          }
> >      }
> >  
> > -    migrate_protocol_allow_multi_channels(false);
> >      if (strstart(uri, "tcp:", &p) ||
> >          strstart(uri, "unix:", NULL) ||
> >          strstart(uri, "vsock:", NULL)) {
> > -        migrate_protocol_allow_multi_channels(true);
> >          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
> >  #ifdef CONFIG_RDMA
> >      } else if (strstart(uri, "rdma:", &p)) {
> > @@ -4309,12 +4311,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
> >      }
> >  
> >      /* This needs to be done before resuming a postcopy */
> > -    if (postcopy_preempt_setup(s, &local_err)) {
> > -        error_report_err(local_err);
> > -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> > -                          MIGRATION_STATUS_FAILED);
> > -        migrate_fd_cleanup(s);
> > -        return;
> > +    if (migrate_postcopy_preempt()) {
> > +        postcopy_preempt_setup(s);
> >      }
> 
> I think that this should go in a different patch.

It's so small and natural so I "hid" it in.  But I agree, I'll split.

Thanks!

-- 
Peter Xu


