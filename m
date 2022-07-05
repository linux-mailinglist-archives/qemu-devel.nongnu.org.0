Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEF567120
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:35:38 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jeL-0001WM-9Y
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8jdC-0000ru-6Q
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8jdA-0004pR-8A
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657031663;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Xz+aVpOGihFdjjrkWmwySjHw4arNN+BLqXnaRojjCA0=;
 b=VN6+/NeerLlzHo5ayiHbR2raqY7XZ3ggJ2329Piwb/febhlHt45ifLE5G0R7cmDKR9gziz
 h6+01FMoGoScLL52GRpJdcNoAStiIRIDTZkPcOb4SlPgDE7EQnfc7NznrQoCadxgTxUOFF
 ABntSR2GeanZlivrIDykjeoK/urTcW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-OMEnZTsVOteCLj47JK4MEQ-1; Tue, 05 Jul 2022 10:34:22 -0400
X-MC-Unique: OMEnZTsVOteCLj47JK4MEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D86B88339A4;
 Tue,  5 Jul 2022 14:34:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B77CE40CFD05;
 Tue,  5 Jul 2022 14:34:19 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:34:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
Message-ID: <YsRL6Y4/3puuVC3S@redhat.com>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com>
 <YsRDEyA0mjUD4DSB@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsRDEyA0mjUD4DSB@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Tue, Jul 05, 2022 at 02:56:35PM +0100, Dr. David Alan Gilbert wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
> > We need to add a new flag to mean to sync at that point.
> > Notice that we still synchronize at the end of setup and at the end of
> > complete stages.
> > 
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  migration/migration.c |  2 +-
> >  migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
> >  2 files changed, 31 insertions(+), 13 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 3f79df0b70..6627787fc2 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -4283,7 +4283,7 @@ static Property migration_properties[] = {
> >                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> >      /* We will change to false when we introduce the new mechanism */
> >      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
> > -                      multifd_sync_each_iteration, true),
> > +                      multifd_sync_each_iteration, false),
> >  
> >      /* Migration capabilities */
> >      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 2c7289edad..6792986565 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -81,6 +81,7 @@
> >  #define RAM_SAVE_FLAG_XBZRLE   0x40
> >  /* 0x80 is reserved in migration.h start with 0x100 next */
> >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
> 
> Note this is the very last usable flag!
> We could do with avoiding using them as flags where we dont need to.

Before it is too late, shouldn't we do

   #define RAM_SAVE_FLAG_BIGGER_FLAGS 0x200  

to indicate that this will be followed by another uint64 value
giving us another 64 flags to play with ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


