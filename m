Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4E690B2C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:01:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7Td-0005NA-CS; Thu, 09 Feb 2023 09:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ7TS-0005MR-9e
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:00:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ7TQ-0006tU-4K
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675951227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e83hUa/85/KOdomnw67J5NZjz4cB7tONUcZPlnb3JwE=;
 b=Ieo9UAP5L4WPcj/dgkaOFw1qgMovwP35lVkRXiesaRWqJ4h6hWgmr5dRJrOfMFJdw2+7c1
 Q3mISyqGObUb6U6nD2qo2kbPq3z9/BqdWr2JOmEqF3LRvnbX0UbKDXKiSTIEzhTApSmWRR
 da3/nkNkZfsBkAZcFQ37FVZ7vgZ1SFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-7iuZNfsjOAWUcptzEN6TEA-1; Thu, 09 Feb 2023 09:00:23 -0500
X-MC-Unique: 7iuZNfsjOAWUcptzEN6TEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0136E87B2CC;
 Thu,  9 Feb 2023 14:00:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F22FC2026D68;
 Thu,  9 Feb 2023 14:00:18 +0000 (UTC)
Date: Thu, 9 Feb 2023 14:00:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 3/6] migration: HMP side changes for modified
 'migrate' QAPI design
Message-ID: <Y+T8cGXoOvxYtipv@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-4-het.gala@nutanix.com>
 <Y+ThkshD8G3ca7Lx@redhat.com>
 <3bf69a6e-f2e1-6335-392b-5e383f0c665b@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bf69a6e-f2e1-6335-392b-5e383f0c665b@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 07:08:13PM +0530, Het Gala wrote:
> 
> On 09/02/23 5:35 pm, Daniel P. Berrangé wrote:
> > On Wed, Feb 08, 2023 at 09:35:57AM +0000, Het Gala wrote:
> > > hmp_migrate() stores modified QAPI 'migrate' arguments from qdict
> > > into well defined MigrateChannel struct with help of
> > > migrate_channel_from_qdict().
> > > hmp_migrate() also accepts uri string as modified QAPI a 'migrate'
> > > argument (for backward compatibility).
> > > 
> > > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > > Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> > > Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> > > Signed-off-by: Het Gala <het.gala@nutanix.com>
> > > ---
> > >   migration/migration-hmp-cmds.c | 105 ++++++++++++++++++++++++++++++++-
> > >   migration/migration.c          |  15 ++++-
> > >   2 files changed, 116 insertions(+), 4 deletions(-)
> > > 


> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 7a14aa98d8..f6dd8dbb03 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -2463,9 +2463,9 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
> > >       return true;
> > >   }
> > > -void qmp_migrate(const char *uri, bool has_blk, bool blk,
> > > -                 bool has_inc, bool inc, bool has_detach, bool detach,
> > > -                 bool has_resume, bool resume, Error **errp)
> > > +void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
> > > +                 bool blk, bool has_inc, bool inc, bool has_detach,
> > > +                 bool detach, bool has_resume, bool resume, Error **errp)
> > >   {
> > >       Error *local_err = NULL;
> > >       MigrationState *s = migrate_get_current();
> > > @@ -2483,6 +2483,15 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
> > >           }
> > >       }
> > > +    /*
> > > +     * Having preliminary checks for uri and channel
> > > +     */
> > > +    if (uri && channel) {
> > > +        error_setg(errp, "uri and channels options should be"
> > s/should be/are/, also best to quote parameter names, eg
> > 
> >      error_setg(errp,
> >                 "'uri' and 'channels' options are mutually exclusive");
> Ack.
> > > +                          "mutually exclusive");
> > > +        return;
> > > +    }
> > > +
> > This change for qmp_migrate will need to be in patch 2.
> > 
> > QEMU needs to compile & pass tests successfully after each individual
> > patch. Currently it'll fail on patch 2, because the code generator
> > wil emit the new qmp_migrate API declaration signature, but the change
> > to the implementation signature is here in patch 3.
> 
> Yes Daniel, it will fail on patch 2. My understanding was that, even if
> sometimes individual patches dont compile properly, the final series of all
> the patches should be compiled properly. But I understand your point.

No, unfortunately we require the strict behaviour, where *every* individual
commit must compile and pass unit tests.

The reason for this is that when chasing regression bugs, it is common for
developers to use 'git bisect' to test compilation across a range of
releases. 'git bisect' will land on completely arbitrary commits, so it
is critical that every QEMU commit in the repo must compile and pass
tests. It isn't sufficient for just the end of the series to compile.

> I have a small concern here Daniel, if you could help me resolve it?
> - There is a similar issue in patch 4. Where some function parameters are to
> be changed. But that function responds to both source and destination side
> changes. So though patch 4 contains all the source side changes, it does not
> take into account destination side changes and it does not compile entirely.
> And after destination side changes are inside patch 6, the dependencies are
> resolved. How is it possible to compile individual patches in this case,
> because then each patch should also have some significant meaning to all the
> changes. So, in that way, source side changes in one commit and destination
> side changes in another commit makes more sense right ?

If there is code that is shared between src + dst, that may put constraints
on how you split up the patches.

Possibly a split like this may avoid having dependancy problems:

  * Patch intoduces the 'MigrateAddress' struct and related child
    objects, but *not* the MigrateChannel struct.
    
  * Patch introduces code that can parse a 'uri' and spit out a
    'MigrateAddress' struct.
    
  * Patch converts internal socket backend to accept MigrateAddress,
    with 'migrate/migrate_incoming' impl convert from uri -> MigrateAddress
    
  * Patch converts internal exec backend to accept MigrateAddress
    with 'migrate/migrate_incoming' impl convert from uri -> MigrateAddress
    
  * Patch converts internal rdma backend to accept MigrateAddress
    with 'migrate/migrate_incoming' impl convert from uri -> MigrateAddress
    
  * Patch converts 'migrate' command to accept MigrateChannel param
    directly
  
  * Patch converts 'migrate_incoming' command to accept MigrateChannel
    param directly.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


