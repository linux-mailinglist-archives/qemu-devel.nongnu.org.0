Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CE44E55B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:09:57 +0100 (CET)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlURR-00039d-1B
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:09:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUPm-0001kI-AT
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUPj-0006F6-9E
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715290;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rzKQnErBxmVwgSDdDHhoyBEs8EbKecqQ9q/Lqg8Y27c=;
 b=iavgTcmjWp0VkvTe3QlxmaVRE660SBEfGYUjibqMjDVe4ljDG/tayuDfU75sKyV7mnQS42
 310NPoKZqnC1q7GhV/Xp0icIIFQA04tTRyH25rc6Tt45ClEy/pyh5UaIbKhXsRY+PFCMhr
 fRn2J2ftQ2ZHjBp+Lp+b+pHVoMSfzEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-BZKxS08HPgyGtq_hrXuG4Q-1; Fri, 12 Nov 2021 06:08:09 -0500
X-MC-Unique: BZKxS08HPgyGtq_hrXuG4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B8C8802E62
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 11:08:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2934B60C05;
 Fri, 12 Nov 2021 11:08:07 +0000 (UTC)
Date: Fri, 12 Nov 2021 11:08:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for
 Linux
Message-ID: <YY5LFM6dAF/+enCP@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <87pmr5vdmm.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87pmr5vdmm.fsf@secure.mitica>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 12:04:33PM +0100, Juan Quintela wrote:
> Leonardo Bras <leobras@redhat.com> wrote:
> > Add property that allows zerocopy migration of memory pages,
> > and also includes a helper function migrate_use_zerocopy() to check
> > if it's enabled.
> >
> > No code is introduced to actually do the migration, but it allow
> > future implementations to enable/disable this feature.
> >
> > On non-Linux builds this parameter is compiled-out.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> Hi
> 
> > +# @zerocopy: Controls behavior on sending memory pages on migration.
> > +#            When true, enables a zerocopy mechanism for sending memory
> > +#            pages, if host supports it.
> > +#            Defaults to false. (Since 6.2)
> > +#
> 
> This needs to be changed to next release, but not big deal.
> 
> 
> > +#ifdef CONFIG_LINUX
> > +int migrate_use_zerocopy(void);
> 
> Please, return bool
> 
> > +#else
> > +#define migrate_use_zerocopy() (0)
> > +#endif
> 
> and false here.
> 
> I know, I know.  We are not consistent here, but the preffered way is
> the other way.
> 
> >  int migrate_use_xbzrle(void);
> >  uint64_t migrate_xbzrle_cache_size(void);
> >  bool migrate_colo_enabled(void);
> > diff --git a/migration/migration.c b/migration/migration.c
> > index abaf6f9e3d..add3dabc56 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
> >      params->multifd_zlib_level = s->parameters.multifd_zlib_level;
> >      params->has_multifd_zstd_level = true;
> >      params->multifd_zstd_level = s->parameters.multifd_zstd_level;
> > +#ifdef CONFIG_LINUX
> > +    params->has_zerocopy = true;
> > +    params->zerocopy = s->parameters.zerocopy;
> > +#endif
> >      params->has_xbzrle_cache_size = true;
> >      params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
> >      params->has_max_postcopy_bandwidth = true;
> > @@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
> >      if (params->has_multifd_compression) {
> >          dest->multifd_compression = params->multifd_compression;
> >      }
> > +#ifdef CONFIG_LINUX
> > +    if (params->has_zerocopy) {
> > +        dest->zerocopy = params->zerocopy;
> > +    }
> > +#endif
> >      if (params->has_xbzrle_cache_size) {
> >          dest->xbzrle_cache_size = params->xbzrle_cache_size;
> >      }
> > @@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> >      if (params->has_multifd_compression) {
> >          s->parameters.multifd_compression = params->multifd_compression;
> >      }
> > +#ifdef CONFIG_LINUX
> > +    if (params->has_zerocopy) {
> > +        s->parameters.zerocopy = params->zerocopy;
> > +    }
> > +#endif
> 
> After seing all this CONFIG_LINUX mess, I am not sure that it is a good
> idea to add the parameter only for LINUX.  It appears that it is better
> to add it for all OS's and just not allow to set it to true there.
> 
> But If QAPI/QOM people preffer that way, I am not going to get into the middle.

I don't like all the conditionals either, but QAPI design wants the
conditionals, as that allows mgmt apps to query whether the feature
is supported in a build or not.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


