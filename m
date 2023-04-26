Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA26EEBCA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 03:12:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTgG-0000uw-64; Tue, 25 Apr 2023 21:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prTgE-0000uL-GK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prTgB-0003zP-3Y
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682471441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIkVvqEPPeutTe+0rDq2AucXwApEeT002V/ss90AWtg=;
 b=K9T3JguuBSogJevMrJ+EHtc0gMFJlKGdEEMVYtp35dYq2zXMvpDRLAqo5u6jmkl6uNTUcE
 JAcS6AJMOKv15mL7L0nOESo7e23RWSdTjcHywTRk7eUfQOPicYW7+TOW2KSBSeV9PxP/m8
 ixngTLoOTXNeUXFyQ0TOXyuVEm56Ek4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-VX3MkrfPM8OLnWgeS2VB_g-1; Tue, 25 Apr 2023 21:10:40 -0400
X-MC-Unique: VX3MkrfPM8OLnWgeS2VB_g-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so18940091cf.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 18:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682471439; x=1685063439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIkVvqEPPeutTe+0rDq2AucXwApEeT002V/ss90AWtg=;
 b=DAK3E3FI2+l7gnuThkUKtR/u0elCK5WWugAsQs4H7F14Ds3Iyak3Jb/dtnCei/pAuB
 JdMKf53nGTK74KjEcTbEpRAYfMJVVc3wf2u+kXFF7QoSBd+xpX/VhS/z4RhcqAxN4dmS
 NxSK0mTaxn+IO1anEL/8780OTJViqfwuNbqMdBMh2icdbD0zW4+pttlpnOIr+WZUlu9A
 P8bD0ufsLskETrG9xQ2Z5t/16PdU2gjQWNOlD7krLXtwfC0rhADhZzk2erPidenSUjYb
 5cc6t9H9foZn8B1Ok/NPNAxAO7bBUHe1W4hf0w70b4D0Ed5KV7584oPYdo+iw7RxqPfP
 0i8Q==
X-Gm-Message-State: AAQBX9f7sz2HlS3Xn4Ia7oNfkh02FadiDgEw9Ce+FoB4rGZ745lgsGoH
 VP+7flg7NZzrxiKtwJhkhbfvjdDID6n79DjvToW0LcUSBmrLzWAuZGfEdCx19QlMcAKJD1c8MNB
 kpS4E/ih74rEiipQ=
X-Received: by 2002:a05:622a:306:b0:3ef:4614:d0e9 with SMTP id
 q6-20020a05622a030600b003ef4614d0e9mr6701565qtw.5.1682471439609; 
 Tue, 25 Apr 2023 18:10:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZzWqoYCUMeWz1R37c9yJ2tLdHnmQMQYRrunTuPaTsxfFcGs5N6Ye3DFerR/8Dwl0JdrKijdw==
X-Received: by 2002:a05:622a:306:b0:3ef:4614:d0e9 with SMTP id
 q6-20020a05622a030600b003ef4614d0e9mr6701545qtw.5.1682471439322; 
 Tue, 25 Apr 2023 18:10:39 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05620a241300b0074fb065bde4sm2024128qkn.18.2023.04.25.18.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 18:10:38 -0700 (PDT)
Date: Tue, 25 Apr 2023 21:10:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/4] migration: Allow postcopy_ram_supported_by_host()
 to report err
Message-ID: <ZEh6DUILNIpUKmYO@x1n>
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-5-peterx@redhat.com>
 <87y1mnzm4j.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87y1mnzm4j.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 19, 2023 at 09:51:24PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Instead of print it to STDERR, bring the error upwards so that it can be
> > reported via QMP responses.
> >
> > E.g.:
> >
> > { "execute": "migrate-set-capabilities" ,
> >   "arguments": { "capabilities":
> >   [ { "capability": "postcopy-ram", "state": true } ] } }
> >
> > { "error":
> >   { "class": "GenericError",
> >     "desc": "Postcopy is not supported: Host backend files need to be TMPFS
> >     or HUGETLBFS only" } }
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/migration.c    |  9 +++---
> >  migration/postcopy-ram.c | 61 ++++++++++++++++++++++------------------
> >  migration/postcopy-ram.h |  3 +-
> >  migration/savevm.c       |  3 +-
> >  4 files changed, 42 insertions(+), 34 deletions(-)
> >
> > diff --git a/migration/migration.c b/migration/migration.c
> > index bda4789193..ac15fa6092 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -1313,6 +1313,7 @@ static bool migrate_caps_check(bool *cap_list,
> >      MigrationCapabilityStatusList *cap;
> >      bool old_postcopy_cap;
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> > +    Error *local_err = NULL;
> 
> This variable can be declared in the only block that uses it.

Sure, though I just remembered I can use ERRP_GUARD(), hence I'll go with
that.

> 
> > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > index bbb8af61ae..0713ddeeef 100644
> > --- a/migration/postcopy-ram.c
> > +++ b/migration/postcopy-ram.c
> > @@ -282,11 +282,14 @@ static bool request_ufd_features(int ufd, uint64_t features)
> >      return true;
> >  }
> >  
> > -static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
> > +static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis,
> > +                                Error **errp)
> >  {
> >      uint64_t asked_features = 0;
> >      static uint64_t supported_features;
> >  
> > +    assert(errp);
> > +
> 
> Is this right?  My impression was that you have to live with errp being NULL.

Right it knows, I just wanted to make sure error msg got captured, but we
don't really need to worrry here, all callers are in this case I believe.

Let me also switch to ERRP_GUARD() just to still avoid error_abort being
passed in, so we can still abort with a full message.

> 
> error_setg() knows how to handle it being NULL:
> 
> error_setg() -> error_setg_internal() -> error_setv()
> 
> static void error_setv(Error **errp,
>                        const char *src, int line, const char *func,
>                        ErrorClass err_class, const char *fmt, va_list ap,
>                        const char *suffix)
> {
>     ....
>     if (errp == NULL) {
>         return;
>     }
> 
> 
> > -static int test_ramblock_postcopiable(RAMBlock *rb)
> > +static int test_ramblock_postcopiable(RAMBlock *rb, Error **errp)
> 
> In patch 3 you do this other change:
> 
> -static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
> +static int test_ramblock_postcopiable(RAMBlock *rb)
> 
> Can you do with a single change?
> 
> The idea of the patch is right.

I saw that patch 3 already merged.  I'll just spin this one, thanks!

-- 
Peter Xu


