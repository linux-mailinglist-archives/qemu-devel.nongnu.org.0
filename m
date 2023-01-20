Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7367563B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:59:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrvM-00042I-84; Fri, 20 Jan 2023 08:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pIrvJ-00041Y-5z
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pIrvB-00028p-UN
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674223148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ZRFs2P8taa63n5XqTzcRoVgsQZFK9jwo+pFUA/TuVQ=;
 b=gH6yG8lDpuhKKreD7VqQPB18yrDaj/Ev2RrTJxsUNzMNZb+bAScWDjqbvdi9H4RuU1au16
 JpIKW+9UisY5Mhs2QLT8X5kIQiNXLlpWcGwpC25VZz9EaUnI+K35dMjjTbdPt/UsXYXB3/
 pgkhSVHrGc4X1bV4kx+NopfVkC3W1fo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-ih8A-T3mN72iH7eJzvEBAg-1; Fri, 20 Jan 2023 08:59:05 -0500
X-MC-Unique: ih8A-T3mN72iH7eJzvEBAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l23-20020a7bc457000000b003db0cb8e543so1372533wmi.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZRFs2P8taa63n5XqTzcRoVgsQZFK9jwo+pFUA/TuVQ=;
 b=XGwzjrUmdAJuaPa8lJmqrZTqyJW6Lhgj6r/VitYV2BF7SHhIxBwMRMJYUvn5/yVFo4
 JMD7eDVQRJzzUUP2pnAfyH33gvt4B85Ftv6GVrK7xxbGnLEDS05zLrjSx9XCcbs2fT1f
 lO00oybrHP6r1zft0JCwQs/Mf3VXJ1szvfrg51y8vPBNcj994PpHz6DvYMawnW5z6XsJ
 KNmvHnQNUtyM7EWsivRkT/YUpqX/j7jFdHyI5Ywhk+p395Bk/oCsVKS6GhnPS9LaSILl
 njsOhPpnvNsxxkHVn4k8M2zG5hR47aIL46PczOA1s2re3oO8bdGGUi4/3iHDJ8EvIxBM
 wGjA==
X-Gm-Message-State: AFqh2kpD9xpFr7zXq4y/qfimuikNk9w/ejx7RXGZSrRU650rruNwxUim
 VFpQmmkCeHRGx4t05OA9S5BdMMRtjhbx7xX//7lAzBO0chLXyycB3/GaWYG//0+bbkX3wiUP79m
 10iIObiULujojKu0=
X-Received: by 2002:adf:ff90:0:b0:2bd:de40:3a45 with SMTP id
 j16-20020adfff90000000b002bdde403a45mr12561017wrr.51.1674223143972; 
 Fri, 20 Jan 2023 05:59:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBOjA7dkDz+GC/sm+5iBjuDvupMvxxQKIqCcLemxL5i+vE1BYZhMXGES00a7T+3lFU57RaBw==
X-Received: by 2002:adf:ff90:0:b0:2bd:de40:3a45 with SMTP id
 j16-20020adfff90000000b002bdde403a45mr12560997wrr.51.1674223143633; 
 Fri, 20 Jan 2023 05:59:03 -0800 (PST)
Received: from redhat.com ([2.52.19.29]) by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4148000000b002bdd21f25ebsm21491375wrq.71.2023.01.20.05.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:59:02 -0800 (PST)
Date: Fri, 20 Jan 2023 08:58:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <20230120085534-mutt-send-email-mst@kernel.org>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Jan 19, 2023 at 03:45:06PM +0200, Anton Kuchin wrote:
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
> 
> I can imagine smart orchestrator and backend that can transfer
> internal FUSE state, but we are not there yet, and this would be
> their responsibility then to ensure endpoint compatibility between src
> and dst and set the capability (that's why I put "e.g." and "or" in
> the error description).

So instead of relying on the orchestrator how about making it a device
property?


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

Let's try to create a better description of when this flag should be
set. Then shorten it up to create the name.

> > 
> > 
> > >   ##
> > >   # @MigrationCapabilityStatus:
> > > -- 
> > > 2.34.1


