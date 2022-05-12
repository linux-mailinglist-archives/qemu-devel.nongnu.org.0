Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B35255B4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:28:02 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npETh-00068S-72
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npE8Q-0003M7-35
 for qemu-devel@nongnu.org; Thu, 12 May 2022 15:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npE8M-0005DY-M8
 for qemu-devel@nongnu.org; Thu, 12 May 2022 15:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652382352;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PSbwVkozzoWtvwpbneIw1SnphS2QBKN+2QwAeS6ulIc=;
 b=OkGU8ftrkQ7XT1G7qNdv4jO3/Lp6z8WNAoQZKpFxAIho6tEVQezXKvhh2ndCXBGpi5tDjp
 o+ycCxjWRcKVuAh+XGVlJcXIw+GuDJ+DK091+aqnQ19w4jGDHaKnOD1y/PznT7RT6OqzuC
 xjLd0xx8ZLugQnEqb0nyc8kwFKmBc54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-K5O3x5lLN7yXEJbOimGJsQ-1; Thu, 12 May 2022 15:05:51 -0400
X-MC-Unique: K5O3x5lLN7yXEJbOimGJsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC722101AA42
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 19:05:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 105007AD5;
 Thu, 12 May 2022 19:05:48 +0000 (UTC)
Date: Thu, 12 May 2022 20:05:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v5 17/21] migration: Export tls-[creds|hostname|authz]
 params to cmdline too
Message-ID: <Yn1aiRUKwgBczrlP@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-18-peterx@redhat.com>
 <Yn1L4eOEBMVvnYXH@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yn1L4eOEBMVvnYXH@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 07:03:13PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > It's useful for specifying tls credentials all in the cmdline (along with
> > the -object tls-creds-*), especially for debugging purpose.
> > 
> > The trick here is we must remember to not free these fields again in the
> > finalize() function of migration object, otherwise it'll cause double-free.
> > 
> > The thing is when destroying an object, we'll first destroy the properties
> > that bound to the object, then the object itself.  To be explicit, when
> > destroy the object in object_finalize() we have such sequence of
> > operations:
> > 
> >     object_property_del_all(obj);
> >     object_deinit(obj, ti);
> > 
> > So after this change the two fields are properly released already even
> > before reaching the finalize() function but in object_property_del_all(),
> > hence we don't need to free them anymore in finalize() or it's double-free.
> > 
> > This also fixes a trivial memory leak for tls-authz as we forgot to free it
> > before this patch.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/migration.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 71a50b5c37..b0f2de1e09 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -4339,6 +4339,9 @@ static Property migration_properties[] = {
> >                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> >      DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
> >                        postcopy_preempt_break_huge, true),
> > +    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
> > +    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
> > +    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
> >  
> >      /* Migration capabilities */
> >      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> > @@ -4372,12 +4375,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
> >  static void migration_instance_finalize(Object *obj)
> >  {
> >      MigrationState *ms = MIGRATION_OBJ(obj);
> > -    MigrationParameters *params = &ms->parameters;
> >  
> >      qemu_mutex_destroy(&ms->error_mutex);
> >      qemu_mutex_destroy(&ms->qemu_file_lock);
> > -    g_free(params->tls_hostname);
> > -    g_free(params->tls_creds);
> 
> So hmm, why is tls-authz special here?

Pre-existing memory leak bug IIUC


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


