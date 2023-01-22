Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F9676B92
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVWv-0006wA-TO; Sun, 22 Jan 2023 03:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJVWq-0006v2-2A
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJVWn-0002Mp-K6
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674375396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iU81PML3BHnjK9JLlRxh5ClhURPma1NJ8n1m0A/9d8Y=;
 b=QX3nt62XxW1uavnJPEH8orX+Un176rRuExlJ2HXeDsbzHAVwoY8P46GUrjqvsagrgVj4aP
 eBLhn8+iRzXYvliOSl5CgRdNZFVLs4gLiXZH2tW+1w2PFKiKt4Qj9cvbHsbZ1KJYSc2hEs
 GSw1iMLGW3JoftZdl0Mv4sE4tWZWsYs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-fpxU-MCjMZG6lbpucbhgoA-1; Sun, 22 Jan 2023 03:16:34 -0500
X-MC-Unique: fpxU-MCjMZG6lbpucbhgoA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hq7-20020a1709073f0700b0086fe36ed3d0so5999210ejc.3
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 00:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iU81PML3BHnjK9JLlRxh5ClhURPma1NJ8n1m0A/9d8Y=;
 b=mX7thulei2RTFrOee5d0Xci2dQhbOfPsODmflkyGy4PcDoCAE74GkipRrUVTKXJCUS
 e8XyI6jefh87MTc0hexK1QSY5z3XH/HB+vg8IHwDs2acxQmq9KAXM1ZS61g9tccjaXbD
 1H+WPSojqRuFe5SAK3MutdsI9baJ2+k30eSGqFJ2nrO1NMnWrDT0QzvoqVx/ZzNdzUdX
 q9aGszx+k/RNkDV2rwGz47b+TcoFtNcbND2i4Nc6JYYj3aBA+RR4je35pZUrKR6HbRZO
 k2wgpj2vfdY5/gfa3csLmccSMC9wtmA3UJved401ymqTqMQshLsbe+yJnfFXgSbUNGte
 OqYA==
X-Gm-Message-State: AFqh2kpi75G/cVYDWfdjFGBzOaUo9lLMBDJ2ajR5CpYU8c4U6oIu6/pe
 7wYSn+zHaHOJHzPEsAQo3dnuAnySGxO+5WLUmuy8FRbBiAENgmFZSTzbNklLEJ80iE/SBqPo41y
 t3AdC5e0PdwSjlKI=
X-Received: by 2002:a05:6402:3898:b0:499:c343:30e5 with SMTP id
 fd24-20020a056402389800b00499c34330e5mr22680986edb.3.1674375393164; 
 Sun, 22 Jan 2023 00:16:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXur6PYApH6/jLPM+UtQIqMeN25MtT69J3yUbuoO/0VG6NhBMavT6gPA6jAy0vj5HqZX1+G+Sw==
X-Received: by 2002:a05:6402:3898:b0:499:c343:30e5 with SMTP id
 fd24-20020a056402389800b00499c34330e5mr22680953edb.3.1674375392805; 
 Sun, 22 Jan 2023 00:16:32 -0800 (PST)
Received: from redhat.com ([2.52.149.29]) by smtp.gmail.com with ESMTPSA id
 r24-20020aa7da18000000b004704658abebsm19960522eds.54.2023.01.22.00.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 00:16:31 -0800 (PST)
Date: Sun, 22 Jan 2023 03:16:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <20230122030455-mutt-send-email-mst@kernel.org>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 20, 2023 at 07:37:18PM +0200, Anton Kuchin wrote:
> On 20/01/2023 15:58, Michael S. Tsirkin wrote:
> > On Thu, Jan 19, 2023 at 03:45:06PM +0200, Anton Kuchin wrote:
> > > On 19/01/2023 14:51, Michael S. Tsirkin wrote:
> > > > On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
> > > > > Now any vhost-user-fs device makes VM unmigratable, that also prevents
> > > > > qemu update without stopping the VM. In most cases that makes sense
> > > > > because qemu has no way to transfer FUSE session state.
> > > > > 
> > > > > But we can give an option to orchestrator to override this if it can
> > > > > guarantee that state will be preserved (e.g. it uses migration to
> > > > > update qemu and dst will run on the same host as src and use the same
> > > > > socket endpoints).
> > > > > 
> > > > > This patch keeps default behavior that prevents migration with such devices
> > > > > but adds migration capability 'vhost-user-fs' to explicitly allow migration.
> > > > > 
> > > > > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > > > > ---
> > > > >    hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
> > > > >    qapi/migration.json       |  7 ++++++-
> > > > >    2 files changed, 30 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > > > index f5049735ac..13d920423e 100644
> > > > > --- a/hw/virtio/vhost-user-fs.c
> > > > > +++ b/hw/virtio/vhost-user-fs.c
> > > > > @@ -24,6 +24,7 @@
> > > > >    #include "hw/virtio/vhost-user-fs.h"
> > > > >    #include "monitor/monitor.h"
> > > > >    #include "sysemu/sysemu.h"
> > > > > +#include "migration/migration.h"
> > > > >    static const int user_feature_bits[] = {
> > > > >        VIRTIO_F_VERSION_1,
> > > > > @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
> > > > >        return &fs->vhost_dev;
> > > > >    }
> > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > +{
> > > > > +    MigrationState *s = migrate_get_current();
> > > > > +
> > > > > +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
> > > > > +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
> > > > > +                     "state of backend to be preserved. If orchestrator can "
> > > > > +                     "guarantee this (e.g. dst connects to the same backend "
> > > > > +                     "instance or backend state is migrated) set 'vhost-user-fs' "
> > > > > +                     "migration capability to true to enable migration.");
> > > > Isn't it possible that some backends are same and some are not?
> > > > Shouldn't this be a device property then?
> > > If some are not the same it is not guaranteed that correct FUSE
> > > state is present there, so orchestrator shouldn't set the capability
> > > because this can result in destination devices being broken (they'll
> > > be fine after the remount in guest, but this is guest visible and is
> > > not acceptable).
> > > 
> > > I can imagine smart orchestrator and backend that can transfer
> > > internal FUSE state, but we are not there yet, and this would be
> > > their responsibility then to ensure endpoint compatibility between src
> > > and dst and set the capability (that's why I put "e.g." and "or" in
> > > the error description).
> > So instead of relying on the orchestrator how about making it a device
> > property?
> 
> We have to rely on the orchestrator here and I can't see how a property
> can help us with this: same device can be migratable or not depending
> on if the destination is the same host, what features backend supports,
> how management software works and other factors of environment that
> are not accessible from qemu or backend daemon.
> So in the end we'll end up with orchestrator having to setup flags for
> each device before each migration based on information only it can
> have - in my opinion this is worse than just giving the orchestrator
> a single flag that it can set after calculating the decision for
> the particular migration that it organizes.
> 
> > 
> > 
> > > > 
> > > > 
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > >    static const VMStateDescription vuf_vmstate = {
> > > > >        .name = "vhost-user-fs",
> > > > > -    .unmigratable = 1,
> > > > > +    .minimum_version_id = 0,
> > > > > +    .version_id = 0,
> > > > > +    .fields = (VMStateField[]) {
> > > > > +        VMSTATE_VIRTIO_DEVICE,
> > > > > +        VMSTATE_END_OF_LIST()
> > > > > +    },
> > > > > +   .pre_save = vhost_user_fs_pre_save,
> > > > >    };
> > > > >    static Property vuf_properties[] = {
> > > > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > > > index 88ecf86ac8..9a229ea884 100644
> > > > > --- a/qapi/migration.json
> > > > > +++ b/qapi/migration.json
> > > > > @@ -477,6 +477,11 @@
> > > > >    #                    will be handled faster.  This is a performance feature and
> > > > >    #                    should not affect the correctness of postcopy migration.
> > > > >    #                    (since 7.1)
> > > > > +# @vhost-user-fs: If enabled, the migration process will allow migration of
> > > > > +#                 vhost-user-fs devices, this should be enabled only when
> > > > > +#                 backend can preserve local FUSE state e.g. for qemu update
> > > > > +#                 when dst reconects to the same endpoints after migration.
> > > > > +#                 (since 8.0)
> > > > >    #
> > > > >    # Features:
> > > > >    # @unstable: Members @x-colo and @x-ignore-shared are experimental.
> > > > > @@ -492,7 +497,7 @@
> > > > >               'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> > > > >               { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> > > > >               'validate-uuid', 'background-snapshot',
> > > > > -           'zero-copy-send', 'postcopy-preempt'] }
> > > > > +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
> > > > I kind of dislike that it's such a specific flag. Is only vhost-user-fs
> > > > ever going to be affected? Any way to put it in a way that is more generic?
> > > Here I agree with you: I would prefer less narrow naming too. But I
> > > didn't manage to come up with one. Looks like many other vhost-user
> > > devices could benefit from this so maybe "vhost-user-stateless" or
> > > something like this would be better.
> > > I'm not sure that other types of devices could handle reconnect to
> > > the old endpoint as easy as vhost-user-fs, but anyway the support for
> > > this flag needs to be implemented for each device individually.
> > > What do you think? Any ideas would be appreciated.
> > Let's try to create a better description of when this flag should be
> > set. Then shorten it up to create the name.
> 
> This flag should be set when qemu don't need to worry about any
> external state stored in vhost-user daemons during migration:
> don't fail migration, just pack generic virtio device states to
> migration stream and orchestrator guarantees that the rest of the
> state will be present at the destination to restore full context and
> continue running.

Sorry  I still do not get it.  So fundamentally, why do we need this property?
vhost-user-fs is not created by default that we'd then need opt-in to
the special "migrateable" case.
That's why I said it might make some sense as a device property as qemu
tracks whether device is unplugged for us.

But as written, if you are going to teach the orchestrator about
vhost-user-fs and its special needs, just teach it when to migrate and
where not to migrate.

Either we describe the special situation to qemu and let qemu
make an intelligent decision whether to allow migration,
or we trust the orchestrator. And if it's the latter, then 'migrate'
already says orchestrator decided to migrate.

> > 
> > > > 
> > > > >    ##
> > > > >    # @MigrationCapabilityStatus:
> > > > > -- 
> > > > > 2.34.1


