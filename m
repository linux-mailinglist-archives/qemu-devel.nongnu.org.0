Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDD493FB8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:17:37 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFWZ-0004E1-Tz
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAFVX-0003OT-Pp
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAFVT-00042B-0z
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642616164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTrnfP8NupjnIunQTqr1AzFtfcL7wi4QCUZeUgCs/Dg=;
 b=YyzrcfOfYvyQkhO3yDw7GRcu635gyOM/zpUgpAYu4JXrPzhZ1Bw30PkjHa6eqlIw4J2vjl
 xSogq7EA+pDQKRqw+UYPmFod0gAwTCHUDZxXpxtXjMqWEMmQ6Ob1JGNGBP5Vi+4f3p8i5D
 Eiskk05UUNv/x8wYVbzIV+b2LnsgC6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-lopkWyZaOPO6aeMA5aK6JA-1; Wed, 19 Jan 2022 13:16:03 -0500
X-MC-Unique: lopkWyZaOPO6aeMA5aK6JA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20692100CCDC
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 18:16:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E967E8FD;
 Wed, 19 Jan 2022 18:15:15 +0000 (UTC)
Date: Wed, 19 Jan 2022 18:15:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP
 for Linux
Message-ID: <YehVMEL1hPaTbCIE@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
 <YeAkpTE0gqf1dj4C@redhat.com>
 <CAJ6HWG4GQV1N_=18TPqQygKCz36+VBx=b4EtUoZpMvcOQ6v0Vg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG4GQV1N_=18TPqQygKCz36+VBx=b4EtUoZpMvcOQ6v0Vg@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 03:03:29PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Thu, Jan 13, 2022 at 10:10 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> > > Add property that allows zero-copy migration of memory pages,
> > > and also includes a helper function migrate_use_zero_copy() to check
> > > if it's enabled.
> > >
> > > No code is introduced to actually do the migration, but it allow
> > > future implementations to enable/disable this feature.
> > >
> > > On non-Linux builds this parameter is compiled-out.
> > >
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  qapi/migration.json   | 24 ++++++++++++++++++++++++
> > >  migration/migration.h |  5 +++++
> > >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
> > >  migration/socket.c    |  5 +++++
> > >  monitor/hmp-cmds.c    |  6 ++++++
> > >  5 files changed, 72 insertions(+)
> >
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Thanks!
> 
> >
> > >
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index bbfd48cf0b..2e62ea6ebd 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -730,6 +730,13 @@
> > >  #                      will consume more CPU.
> > >  #                      Defaults to 1. (Since 5.0)
> > >  #
> > > +# @zero-copy: Controls behavior on sending memory pages on migration.
> > > +#             When true, enables a zero-copy mechanism for sending memory
> > > +#             pages, if host supports it.
> > > +#             Requires that QEMU be permitted to use locked memory for guest
> > > +#             RAM pages.
> > > +#             Defaults to false. (Since 7.0)
> > > +#
> > >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> > >  #                        aliases for the purpose of dirty bitmap migration.  Such
> > >  #                        aliases may for example be the corresponding names on the
> > > @@ -769,6 +776,7 @@
> > >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> > >             'max-cpu-throttle', 'multifd-compression',
> > >             'multifd-zlib-level' ,'multifd-zstd-level',
> > > +           { 'name': 'zero-copy', 'if' : 'CONFIG_LINUX'},
> > >             'block-bitmap-mapping' ] }
> > >
> > >  ##
> > > @@ -895,6 +903,13 @@
> > >  #                      will consume more CPU.
> > >  #                      Defaults to 1. (Since 5.0)
> > >  #
> > > +# @zero-copy: Controls behavior on sending memory pages on migration.
> > > +#             When true, enables a zero-copy mechanism for sending memory
> > > +#             pages, if host supports it.
> > > +#             Requires that QEMU be permitted to use locked memory for guest
> > > +#             RAM pages.
> > > +#             Defaults to false. (Since 7.0)
> > > +#
> > >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> > >  #                        aliases for the purpose of dirty bitmap migration.  Such
> > >  #                        aliases may for example be the corresponding names on the
> > > @@ -949,6 +964,7 @@
> > >              '*multifd-compression': 'MultiFDCompression',
> > >              '*multifd-zlib-level': 'uint8',
> > >              '*multifd-zstd-level': 'uint8',
> > > +            '*zero-copy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
> > >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> >
> > The current zerocopy impl is for the send path.
> >
> > Do you expect we might get zerocopy in the receive path
> > later ?
> 
> It's possible, but I haven't started the implementation yet.
> 
> >
> > If so then either call this 'send-zero-copy', or change it
> > from a bool to an enum taking '["send", "recv", "both"]'.
> >
> > I'd probably take the former and just rename it.
> >
> 
> Well, my rationale:
> - I want to set zero copy sending:
> zero-copy is set in the sending host, start migration.
> 
> - I want to set zero copy receiving:
> zero-copy is set in the receiving host, wait for migration.
> (Of course host support is checked when setting the parameter).
> 
> The problem with the current approach is trying to enable zero-copy on
> receive before it's implemented, which will 'fail' silently .
> A possible solution would be to add a patch to check in the receiving
> path if zero-copy is enabled, and fail for now.

That's not good because mgmt apps cannot query the QAPI schema
to find out if this feature is supported or not.

If we wantt o support zero copy recv, then we need an explicit
flag for it that is distinct from zero copy send, so that apps
can introspect whether the feature is implemneted in QEMU or
not.

Distinct named bool flags feels better, and also makes it clear
to anyone not familiar with the impl that the current  code is
strictly send only.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


