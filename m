Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DD453732
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:20:04 +0100 (CET)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Bh-0001HB-0f
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn1A1-0008Mc-Jf
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn19y-0003Jr-Ju
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637079493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=P3dAy1j8Bnn2Dg6Ul9yRwjIINUA8XqHm0lZrORYjRyQ=;
 b=hULVw9A+dLq46veD5uAYecvlgtxUzTFx2XcFIDNe/TA93YzORfQY0jq2Z+x7p5xxEds1/K
 WfPjkpCq4GCceVdSAVoTJPRSv56GlNwM+rbnc9wJnv+3wkH8yoQ5WaO0Zf+Zg4ioKTcJyv
 W4+hZpC3/A4qJSrzO/SkMa389JwBcRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-AJUWI8-iOB2i-alxPV1pBw-1; Tue, 16 Nov 2021 11:18:05 -0500
X-MC-Unique: AJUWI8-iOB2i-alxPV1pBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26F9804150
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 16:18:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 608E65DF56;
 Tue, 16 Nov 2021 16:17:50 +0000 (UTC)
Date: Tue, 16 Nov 2021 16:17:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
Message-ID: <YZPZq5sC8F1x+TXE@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87pmr0ulqx.fsf@secure.mitica>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 05:08:06PM +0100, Juan Quintela wrote:
> Leonardo Bras <leobras@redhat.com> wrote:
> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> > zerocopy interface.
> >
> > Change multifd_send_sync_main() so it can distinguish each iteration sync from
> > the setup and the completion, so a flush_zerocopy() can be called
> > at the after each iteration in order to make sure all dirty pages are sent
> > before a new iteration is started.
> >
> > Also make it return -1 if flush_zerocopy() fails, in order to cancel
> > the migration process, and avoid resuming the guest in the target host
> > without receiving all current RAM.
> >
> > This will work fine on RAM migration because the RAM pages are not usually freed,
> > and there is no problem on changing the pages content between async_send() and
> > the actual sending of the buffer, because this change will dirty the page and
> > cause it to be re-sent on a next iteration anyway.
> >
> > Given a lot of locked memory may be needed in order to use multid migration
> > with zerocopy enabled, make it optional by creating a new migration parameter
> > "zerocopy" on qapi, so low-privileged users can still perform multifd
> > migrations.
> 
> How much memory can a non-root program use by default?
> 
> 
> >  static void *multifd_send_thread(void *opaque)
> > @@ -853,6 +875,10 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
> >          goto cleanup;
> >      }
> >  
> > +    if (migrate_use_zerocopy()) {
> > +        p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> > +    }
> 
> This belongs
> 
> 
> >      p->c = QIO_CHANNEL(sioc);
> >      qio_channel_set_delay(p->c, false);
> >      p->running = true;
> > @@ -918,6 +944,7 @@ int multifd_save_setup(Error **errp)
> >          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
> >          p->name = g_strdup_printf("multifdsend_%d", i);
> >          p->tls_hostname = g_strdup(s->hostname);
> > +        p->write_flags = 0;
> 
> here?
> 
> >          socket_send_channel_create(multifd_new_send_channel_async, p);
> >      }
> > diff --git a/migration/socket.c b/migration/socket.c
> > index e26e94aa0c..8e40e0a3fd 100644
> > --- a/migration/socket.c
> > +++ b/migration/socket.c
> > @@ -78,8 +78,13 @@ static void socket_outgoing_migration(QIOTask *task,
> >          trace_migration_socket_outgoing_connected(data->hostname);
> >      }
> >  
> > -    if (migrate_use_zerocopy()) {
> > -        error_setg(&err, "Zerocopy not available in migration");
> > +    if (migrate_use_zerocopy() &&
> > +        (!migrate_use_multifd() ||
> > +         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY) ||
> > +          migrate_multifd_compression() != MULTIFD_COMPRESSION_NONE ||
> > +          migrate_use_tls())) {
> > +        error_setg(&err,
> > +                   "Zerocopy only available for non-compressed non-TLS multifd migration");
> >      }
> >  
> >      migration_channel_connect(data->s, sioc, data->hostname, err);
> 
> Do we really want to do this check here?  I think this is really too
> late.
> 
> You are not patching migrate_params_check().
> 
> I think that the proper way of doing this is something like:
> 
>     if (params->zerocopy &&
>         (params->parameters.multifd_compression != MULTIFD_COMPRESSION_NONE ||
>          migrate_use_tls())) {
>            error_setg(&err,
>                      "Zerocopy only available for non-compressed non-TLS multifd migration");
>         return false;
>     }
> 
> You have to do the equivalent of multifd_compression and tls enablement,
> to see that zerocopy is not enabled, of course.
> 
> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
> I can't see a way of doing that without a qio.

I don't think you need to check that feature flag.

The combination of zerocopy and compression is simply illogical
and can be rejected unconditionally.

The combination of zerocopy and TLS is somewhat questionable.
You're always going to have a copy between the plain text and
cipher text. Avoiding an extra copy for the cipher text will
require kerenl work which has no ETA. If it does ever arise,
QEMU will need more work again to actually support it. So
today we can just reject it unconditonally again.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


