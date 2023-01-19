Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442976741F9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:01:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIa9h-0005lW-8y; Thu, 19 Jan 2023 14:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIa9a-0005dq-9m
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIa9Y-0000Pq-B5
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674154847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3IIUR4IoK5Z6NQDxXHth5v2zSS2kWKRrrZ6gNJP6V8I=;
 b=W/JY7hxfN4wPNBYJ2lWogb3Fh+hK4cyJZMxKtZsmdaOyrXvecMj0a7qXqdFwT6GA0AcRmH
 aY9Jho07D10GslnYeWVQdStshRVNG4sOgp38k+1xkk6CGXy10ni1KJRdBjEF3CugX++eMP
 FS++C5ZHr0PV5OH3iB9GUfWYQLWntq4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-N4AXzU9UNee-oS4PN-1LIA-1; Thu, 19 Jan 2023 14:00:44 -0500
X-MC-Unique: N4AXzU9UNee-oS4PN-1LIA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l8-20020adfc788000000b002bdfe72089cso648217wrg.21
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IIUR4IoK5Z6NQDxXHth5v2zSS2kWKRrrZ6gNJP6V8I=;
 b=bkqA/cFgWttrS3UhxJ+NruM+GIi876mcKn/wtLnTOJ1s4JCkp8TX6vReXhH8WV+z32
 G+VOqhLfDYx+qlLRMAHZlQvH5xadzwcsoyQqGEjIk/KzrqvOCI0bZc2WSh+5yRGmAZVF
 RaHy9YVNPdQUebewx7snbMQMBk9qpQ7gF4RkOiCAVwmG46ASND8MKJHMAinFZmMXdCvE
 IO2FGyeeri45shTD2IEbXu33PQbNp3wZD8B40hDQZlvQ6MGyFoAJ5IynNtni0WcVBuru
 Ieoswopxb68qFQEBfOo+e1b69SwwLe83380jL4fVAuKfBm+MM4W+tmGiQnl1D/DBSC3k
 ZVRA==
X-Gm-Message-State: AFqh2kpW3SEyJF1PzN3o7k+TMuCup9bE4ACRuoIS6BT/RulgUnER5ek0
 qej8xAljvCnqnWTVYArpLZP9vnL4sS5V8jsrr7kE4soZBhNNdVvHkbFdWumbIUtDqbgfvYQ49Bo
 DIDR96hJ2yVU5Umc=
X-Received: by 2002:a5d:610a:0:b0:2bd:fd25:788c with SMTP id
 v10-20020a5d610a000000b002bdfd25788cmr9482030wrt.21.1674154843386; 
 Thu, 19 Jan 2023 11:00:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgDXTotMCRVaI3kPQaWLt5UD3AFPEey/05rHpDq5nD/GqFXkx0xcd062P0bfSAN+QZFdj9TA==
X-Received: by 2002:a5d:610a:0:b0:2bd:fd25:788c with SMTP id
 v10-20020a5d610a000000b002bdfd25788cmr9482015wrt.21.1674154843165; 
 Thu, 19 Jan 2023 11:00:43 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 q15-20020adfab0f000000b002bde7999cd6sm16559391wrc.61.2023.01.19.11.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:00:42 -0800 (PST)
Date: Thu, 19 Jan 2023 19:00:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <Y8mTWMVb9d2frxcx@work-vm>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
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

* Anton Kuchin (antonkuchin@yandex-team.ru) wrote:
> On 19/01/2023 14:51, Michael S. Tsirkin wrote:
> > On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
> > > Now any vhost-user-fs device makes VM unmigratable, that also prevents
> > > qemu update without stopping the VM. In most cases that makes sense
> > > because qemu has no way to transfer FUSE session state.
> > > 
> > > But we can give an option to orchestrator to override this if it can
> > > guarantee that state will be preserved (e.g. it uses migration to
> > > update qemu and dst will run on the same host as src and use the same
> > > socket endpoints).
> > > 
> > > This patch keeps default behavior that prevents migration with such devices
> > > but adds migration capability 'vhost-user-fs' to explicitly allow migration.
> > > 
> > > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > > ---
> > >   hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
> > >   qapi/migration.json       |  7 ++++++-
> > >   2 files changed, 30 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index f5049735ac..13d920423e 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -24,6 +24,7 @@
> > >   #include "hw/virtio/vhost-user-fs.h"
> > >   #include "monitor/monitor.h"
> > >   #include "sysemu/sysemu.h"
> > > +#include "migration/migration.h"
> > >   static const int user_feature_bits[] = {
> > >       VIRTIO_F_VERSION_1,
> > > @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
> > >       return &fs->vhost_dev;
> > >   }
> > > +static int vhost_user_fs_pre_save(void *opaque)
> > > +{
> > > +    MigrationState *s = migrate_get_current();
> > > +
> > > +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
> > > +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
> > > +                     "state of backend to be preserved. If orchestrator can "
> > > +                     "guarantee this (e.g. dst connects to the same backend "
> > > +                     "instance or backend state is migrated) set 'vhost-user-fs' "
> > > +                     "migration capability to true to enable migration.");
> > Isn't it possible that some backends are same and some are not?
> > Shouldn't this be a device property then?
> If some are not the same it is not guaranteed that correct FUSE
> state is present there, so orchestrator shouldn't set the capability
> because this can result in destination devices being broken (they'll
> be fine after the remount in guest, but this is guest visible and is
> not acceptable).

Shouldn't this be something that's negotiated as a feature bit in the
vhost-user protocol - i.e. to say whether the device can do migration?

However, I think what you're saying is that a migration might only be
doable in some cases - e.g. a local migration - and that's hard for
either qemu or the daemon to discover by itself; so it's right that
an orchestrator enables it.
(I'm not sure the error_report message needs to be quite so verbose -
normally a one line clear message is enough that people can then look
up).

> I can imagine smart orchestrator and backend that can transfer
> internal FUSE state, but we are not there yet, and this would be
> their responsibility then to ensure endpoint compatibility between src
> and dst and set the capability (that's why I put "e.g." and "or" in
> the error description).

You also need the vhost-user device to be able to do the dirty bitmap
updates; is that being checked somewhere?

Dave

> > 
> > 
> > 
> > > +        return -1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >   static const VMStateDescription vuf_vmstate = {
> > >       .name = "vhost-user-fs",
> > > -    .unmigratable = 1,
> > > +    .minimum_version_id = 0,
> > > +    .version_id = 0,
> > > +    .fields = (VMStateField[]) {
> > > +        VMSTATE_VIRTIO_DEVICE,
> > > +        VMSTATE_END_OF_LIST()
> > > +    },
> > > +   .pre_save = vhost_user_fs_pre_save,
> > >   };
> > >   static Property vuf_properties[] = {
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index 88ecf86ac8..9a229ea884 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -477,6 +477,11 @@
> > >   #                    will be handled faster.  This is a performance feature and
> > >   #                    should not affect the correctness of postcopy migration.
> > >   #                    (since 7.1)
> > > +# @vhost-user-fs: If enabled, the migration process will allow migration of
> > > +#                 vhost-user-fs devices, this should be enabled only when
> > > +#                 backend can preserve local FUSE state e.g. for qemu update
> > > +#                 when dst reconects to the same endpoints after migration.
> > > +#                 (since 8.0)
> > >   #
> > >   # Features:
> > >   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
> > > @@ -492,7 +497,7 @@
> > >              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> > >              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> > >              'validate-uuid', 'background-snapshot',
> > > -           'zero-copy-send', 'postcopy-preempt'] }
> > > +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
> > I kind of dislike that it's such a specific flag. Is only vhost-user-fs
> > ever going to be affected? Any way to put it in a way that is more generic?
> Here I agree with you: I would prefer less narrow naming too. But I
> didn't manage to come up with one. Looks like many other vhost-user
> devices could benefit from this so maybe "vhost-user-stateless" or
> something like this would be better.
> I'm not sure that other types of devices could handle reconnect to
> the old endpoint as easy as vhost-user-fs, but anyway the support for
> this flag needs to be implemented for each device individually.
> What do you think? Any ideas would be appreciated.
> 
> > 
> > 
> > >   ##
> > >   # @MigrationCapabilityStatus:
> > > -- 
> > > 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


