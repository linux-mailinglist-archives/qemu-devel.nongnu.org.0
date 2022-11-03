Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7561862B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:28:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqe0V-0006jr-PC; Thu, 03 Nov 2022 13:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqe0U-0006ji-If
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqe0S-0003VK-5j
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496475;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewmxJyUpMV55LEiiQTwp4rNLuzSBhHSG4FmJrsxUE8Y=;
 b=cJgoD4+icXwFoUr+3lNSaVN+czVmdtcqEpVHusQ6yOCqdcO6w93slPlm630jdT5Ek6h7Bf
 pD0POhlSF4YYyp0zA26W5D7TqLQIzmc4z+WjfgT/rf4RE6JoPXjoZcwNfZ3S5EuKrbd0Lz
 RAr4cHW9l3DgciSTTC0AlWhIbZeAQ64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-EKvRYufYMHi7PhZmti_elg-1; Thu, 03 Nov 2022 13:27:51 -0400
X-MC-Unique: EKvRYufYMHi7PhZmti_elg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81EBB85A583;
 Thu,  3 Nov 2022 17:27:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2D340C6EC3;
 Thu,  3 Nov 2022 17:27:50 +0000 (UTC)
Date: Thu, 3 Nov 2022 17:27:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com,
 Prerna Saxena <prerna.saxena@nutanix.com>
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
Message-ID: <Y2P6FMs42GLzkKl/@redhat.com>
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
 <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
 <Y2OKCel2FlMQw+bI@redhat.com>
 <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 10:04:54PM +0530, manish.mishra wrote:
> 
> On 03/11/22 2:59 pm, Daniel P. Berrangé wrote:
> > On Thu, Nov 03, 2022 at 02:50:25PM +0530, manish.mishra wrote:
> > > On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
> > > > On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
> > > > > On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
> > > > > > On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
> > > > > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > > > > index 739bb683f3..f4b6f278a9 100644
> > > > > > > --- a/migration/migration.c
> > > > > > > +++ b/migration/migration.c
> > > > > > > @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> > > > > > >     {
> > > > > > >         MigrationIncomingState *mis = migration_incoming_get_current();
> > > > > > >         Error *local_err = NULL;
> > > > > > > -    bool start_migration;
> > > > > > >         QEMUFile *f;
> > > > > > > +    bool default_channel = true;
> > > > > > > +    uint32_t channel_magic = 0;
> > > > > > > +    int ret = 0;
> > > > > > > -    if (!mis->from_src_file) {
> > > > > > > -        /* The first connection (multifd may have multiple) */
> > > > > > > +    if (migrate_use_multifd() && !migration_in_postcopy()) {
> > > > > > > +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
> > > > > > > +                                        sizeof(channel_magic), &local_err);
> > > > > > > +
> > > > > > > +        if (ret != 1) {
> > > > > > > +            error_propagate(errp, local_err);
> > > > > > > +            return;
> > > > > > > +        }
> > > > > > ....and thus this will fail for TLS channels AFAICT.
> > > > > Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
> > > > But we need this problem fixed with TLS too, so just excluding it
> > > > isn't right. IMHO we need to modify the migration code so we can
> > > > read the magic earlier, instead of peeking.
> > > > 
> > > > 
> > > > With regards,
> > > > Daniel
> > > Hi Daniel, I was trying tls migrations. What i see is that tls session
> > > creation does handshake. So if we read ahead in ioc_process_incoming
> > > for default channel. Because client sends magic only after multiFD
> > > channels are setup, which too requires tls handshake.
> > By the time we get to migrate_ioc_process_incoming, the TLS handshake
> > has already been performed.
> > 
> > migration_channel_process_incoming
> >      -> migration_ioc_process_incoming
> > 
> > vs
> > 
> > migration_channel_process_incoming
> >      -> migration_tls_channel_process_incoming
> >          -> migration_tls_incoming_handshake
> > 	     -> migration_channel_process_incoming
> > 	         ->  migration_ioc_process_incoming
> > 
> 
> Yes sorry i thought we block on source side till handshake is done but that is not true. I checked then why that deadlock is happening. So this where the dealock is happening.
> 
> static int ram_save_setup(QEMUFile *f, void *opaque) {
> +
> +
>     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
> 
>     ret =  multifd_send_sync_main(f);
>     if (ret < 0) {
>         return ret;
>     }
> 
>     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>     qemu_fflush(f);
> 
>     return 0;
> }
> 
> Now if we block in migration_ioc_process_incoming for reading magic
> value from channel, which is actually sent by client when this
> qemu_fflush is done. Before this qemu_fflush we wait for
> multifd_send_sync_main which actually requires that tls handshake is
> done for multiFD channels as it blocks on sem_sync which posted by
> multifd_send_thread which is called after handshake||. But then on
> destination side we are blocked in migration_ioc_process_incoming()
> waiting to read something from default channel hence handshake for
> multiFD channels can not happen. This to me looks unresolvable
> whatever way we try to manipulate stream until we do some changes
> on source side.

The TLS handshake is already complete when migration_ioc_process_incoming
is blocking on read.

Regardless of which channel we're talking about, thue TLS handshake is
always performed & finished before we try to either send or recv any
data.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


