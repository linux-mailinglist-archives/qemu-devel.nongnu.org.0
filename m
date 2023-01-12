Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C22667FA2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG3dE-0003FE-I0; Thu, 12 Jan 2023 14:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG3d4-0003EA-FQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG3d2-0005Sg-Hn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673553168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUYGROoZDQ0yofjbWmhFvkSo/UbSTtoFYCX4EUKz0IY=;
 b=eDhp1y6vOAiV4xW6JlR+dNuxM6pGmt14jT3ZytmL5ph7sxG9N/2MRN/9s/cBkkYrNSCHKk
 Y1IQXDmmOX4dQerkvl6JHgV0dR+zTyrXQjgOyw4YERGGiz3VvZJ53J/ZBNq8k2dofgXSs1
 FOsfA0co5Tc2hec1dlTNDzQU/kbvdEc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-LoDq-fWwPFCDEYeLZKtK_A-1; Thu, 12 Jan 2023 14:52:44 -0500
X-MC-Unique: LoDq-fWwPFCDEYeLZKtK_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso3760462wrg.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 11:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUYGROoZDQ0yofjbWmhFvkSo/UbSTtoFYCX4EUKz0IY=;
 b=HoabL9IEUFX+96UmlhOgyhXEc+39lWGAPfMpETYe4IXPq8aTNHlJUJMkib4w0JW7de
 L7ESi+QOAh+CuNAWICqZaP3DJPYT8ce8ZvMLZysRcRgX46ydf4Lm2CfP/JkwScZyek0Y
 9JRVDtg+fuNAHs2A+a1ZhEM9f1hGacaZbN3Xfmyzgd61bOicBIzV0AJGTrAGmSfzM2Uu
 ebWtlF+Z1p9Zyhz/CtBnT/bzqaarm6qJED0IrGOSwRESXBIHc3Iws81xnGoJnTf7lcao
 YgDsInKqDbS018ZGy4ecch3HSnwLJFB8pI3j2x5NuipKLoLRGq4AES/lp4CB6+ff6zgt
 SqtA==
X-Gm-Message-State: AFqh2kplqiPeastX/5l0PJSQAu28s3EphCBB9R3u8GkGq1QmiiAmDCY5
 6BDGdRWJBYlQkFQCM63gfUfYeP6uoKn3zb0giIir/mfvWPNeCLpj0GihXtJBcp3KFMwEVqA0TjA
 6IsQkoA7Q+3G5SyY=
X-Received: by 2002:a05:600c:4e08:b0:3d2:139e:f64f with SMTP id
 b8-20020a05600c4e0800b003d2139ef64fmr58811598wmq.40.1673553163791; 
 Thu, 12 Jan 2023 11:52:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIPowEUzVHocDIDT2cLwNf98884v7j5e/KlZ9lrG2gwexWfz8WjlzWb0eQ+DfOwRm6wgZ0ig==
X-Received: by 2002:a05:600c:4e08:b0:3d2:139e:f64f with SMTP id
 b8-20020a05600c4e0800b003d2139ef64fmr58811586wmq.40.1673553163576; 
 Thu, 12 Jan 2023 11:52:43 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm31406203wmb.29.2023.01.12.11.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 11:52:43 -0800 (PST)
Date: Thu, 12 Jan 2023 19:52:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Message-ID: <Y8BlCeViRSzyTQ8+@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com>
 <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
> On 12.01.23 18:56, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> > > For virtio-mem, we want to have the plugged/unplugged state of memory
> > > blocks available before migrating any actual RAM content, and perform
> > > sanity checks before touching anything on the destination. This
> > > information is immutable on the migration source while migration is active,
> > > 
> > > We want to use this information for proper preallocation support with
> > > migration: currently, we don't preallocate memory on the migration target,
> > > and especially with hugetlb, we can easily run out of hugetlb pages during
> > > RAM migration and will crash (SIGBUS) instead of catching this gracefully
> > > via preallocation.
> > > 
> > > Migrating device state via a vmsd before we start iterating is currently
> > > impossible: the only approach that would be possible is avoiding a vmsd
> > > and migrating state manually during save_setup(), to be restored during
> > > load_state().
> > > 
> > > Let's allow for migrating device state via a vmsd early, during the
> > > setup phase in qemu_savevm_state_setup(). To keep it simple, we
> > > indicate applicable vmds's using an "immutable" flag.
> > > 
> > > Note that only very selected devices (i.e., ones seriously messing with
> > > RAM setup) are supposed to make use of such early state migration.
> > > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   include/migration/vmstate.h |  5 +++++
> > >   migration/savevm.c          | 14 ++++++++++++++
> > >   2 files changed, 19 insertions(+)
> > > 
> > > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > > index ad24aa1934..dd06c3abad 100644
> > > --- a/include/migration/vmstate.h
> > > +++ b/include/migration/vmstate.h
> > > @@ -179,6 +179,11 @@ struct VMStateField {
> > >   struct VMStateDescription {
> > >       const char *name;
> > >       int unmigratable;
> > > +    /*
> > > +     * The state is immutable while migration is active and is saved
> > > +     * during the setup phase, to be restored early on the destination.
> > > +     */
> > > +    int immutable;
> > 
> > A bool would be nicer (as it would for unmigratable above)
> 
> Yes, I chose an int for consistency with "unmigratable". I can turn that
> into a bool.
> 
> I'd even include a cleanup patch for unmigratable if it wouldn't be ...
> 
> $ git grep "unmigratable \=" | wc -l
> 29

It might be OK if you just change the declaration; I mean '1' is pretty
close to true? (I think...)
Anyway, at least make the new one a bool.

> > >       int version_id;
> > >       int minimum_version_id;
> > >       MigrationPriority priority;
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index ff2b8d0064..536d6f662b 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -1200,6 +1200,15 @@ void qemu_savevm_state_setup(QEMUFile *f)
> > >       trace_savevm_state_setup();
> > >       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> > > +        if (se->vmsd && se->vmsd->immutable) {
> > > +            ret = vmstate_save(f, se, ms->vmdesc);
> > > +            if (ret) {
> > > +                qemu_file_set_error(f, ret);
> > > +                break;
> > > +            }
> > > +            continue;
> > > +        }
> > > +
> > 
> > Does this give you the ordering you want? i.e. there's no guarantee here
> > that immutables come first?
> 
> Yes, for virtio-mem at least this is fine. There are no real ordering
> requirements in regard to save_setup().
> 
> I guess one could use vmstate priorities to affect the ordering, if
> required.
> 
> So for my use case this is good enough, any suggestions? Thanks.

OK, but consider whether it might be better just to have a separate
QTAILQ_FOREACH look in savevm_state_setup that first does all the
immutables, and then all the setups.

Dave

> -- 
> Thanks,
> 
> David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


