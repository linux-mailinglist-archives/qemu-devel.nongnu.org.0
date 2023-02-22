Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611969F4D0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUoTU-0008Bn-7X; Wed, 22 Feb 2023 07:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUoTS-0008BP-IP
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUoTQ-0007S4-Hu
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677069831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P08hhaNUKZ+leW+4KmFx7IW3ZKqOYNaaLWV4OGJy7Is=;
 b=AHb+/L8bQKLP/f+bRxu9FlaVL+Ge+eAAMsQRf617TxzxWv+EIHrf9CBtpIUISriklFDg+o
 bSM5aEvejfbVUWdsAUCh6HO25PaCVS/vmNH2i6rsVkHc5/7vobW0ZP3sYfl3hDMe9zZVGB
 XpyaBWNhqRdEMovxvuQ8tzFR0JOwf8M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-anCazq10O5GydN7OW3YIzg-1; Wed, 22 Feb 2023 07:43:49 -0500
X-MC-Unique: anCazq10O5GydN7OW3YIzg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c15-20020a05600c0a4f00b003ddff4b9a40so3058607wmq.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 04:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P08hhaNUKZ+leW+4KmFx7IW3ZKqOYNaaLWV4OGJy7Is=;
 b=0Oa3+d8+kyxP/wAeLciYUEmzBVnf10iEs+x/wV/LpO7H+oof6eCRBgs1KREgjj9vqC
 t+BlsdJyC7LI8DJPF8J/MWP4btLc249wBPwB6v47ksIX+8clCgQsB4krYnhOOx+FxDQC
 2fBvIQey2acTgyq+EiKYJaXp1nprY4jtiCUoO6bW/wy9LJ6OtsiChCENE9BrOLUcF0ob
 RjSSfAhSbAH1jypbNHIDJY5VNt8mgqIROrInVKqS7W/YDUKXnBBRe7dMD3NbkA9XR/qW
 4KxSyA3F+pIamS9kAT5WxJETVw9qgHaJbhC5lCk4mv0RQ9Z9yAODnif3RAtpL6ecxDJv
 tv0Q==
X-Gm-Message-State: AO0yUKVotGsGnQ/Uvjh28TZEgH6kTa17tu8bdNM7mY6wbAFmUodWuuHl
 exm3/7dB7J8kEmKUnw62gMB4AdaF5ljJKEAuOdB7RZTmuq5BtOFr9v6V5UPfUK6JWWJKhQFYh5m
 uZonJGbAK+MBdyGE=
X-Received: by 2002:adf:e947:0:b0:2c7:bbe:4572 with SMTP id
 m7-20020adfe947000000b002c70bbe4572mr1678454wrn.39.1677069828513; 
 Wed, 22 Feb 2023 04:43:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+xr+vdDulL8RjSpuNrZHwxuUrG4NyZ5V9k0T/QhVMXEMhxQd2FZDp0w5RooVJwac/VRcqNCw==
X-Received: by 2002:adf:e947:0:b0:2c7:bbe:4572 with SMTP id
 m7-20020adfe947000000b002c70bbe4572mr1678436wrn.39.1677069828224; 
 Wed, 22 Feb 2023 04:43:48 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 v26-20020a5d591a000000b002c573cff730sm4354748wrd.68.2023.02.22.04.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:43:47 -0800 (PST)
Date: Wed, 22 Feb 2023 07:43:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230222074214-mutt-send-email-mst@kernel.org>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 22, 2023 at 03:20:00PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 17.02.23 20:00, Anton Kuchin wrote:
> > Migration of vhost-user-fs device requires transfer of FUSE internal state
> > from backend. There is no standard way to do it now so by default migration
> > must be blocked. But if this state can be externally transferred by
> > orchestrator give it an option to explicitly allow migration.
> > 
> > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > ---
> >   hw/core/qdev-properties-system.c    | 10 +++++++++
> >   hw/virtio/vhost-user-fs.c           | 32 ++++++++++++++++++++++++++++-
> >   include/hw/qdev-properties-system.h |  1 +
> >   include/hw/virtio/vhost-user-fs.h   |  2 ++
> >   qapi/migration.json                 | 16 +++++++++++++++
> >   5 files changed, 60 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> > index d42493f630..d9b1aa2a5d 100644
> > --- a/hw/core/qdev-properties-system.c
> > +++ b/hw/core/qdev-properties-system.c
> > @@ -1143,3 +1143,13 @@ const PropertyInfo qdev_prop_uuid = {
> >       .set   = set_uuid,
> >       .set_default_value = set_default_uuid_auto,
> >   };
> > +
> > +const PropertyInfo qdev_prop_vhost_user_migration_type = {
> > +    .name = "VhostUserMigrationType",
> > +    .description = "none/external",
> > +    .enum_table = &VhostUserMigrationType_lookup,
> > +    .get = qdev_propinfo_get_enum,
> > +    .set = qdev_propinfo_set_enum,
> > +    .set_default_value = qdev_propinfo_set_default_value_enum,
> > +    .realized_set_allowed = true,
> > +};
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 83fc20e49e..7deb9df5ec 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -298,9 +298,35 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
> >       return &fs->vhost_dev;
> >   }
> > +static int vhost_user_fs_pre_save(void *opaque)
> > +{
> > +    VHostUserFS *fs = opaque;
> > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > +
> > +    switch (fs->migration_type) {
> > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > +        error_report("Migration is blocked by device %s", path);
> > +        break;
> > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > +        return 0;
> > +    default:
> > +        error_report("Migration type '%s' is not supported by device %s",
> > +                     VhostUserMigrationType_str(fs->migration_type), path);
> > +        break;
> > +    }
> > +
> > +    return -1;
> > +}
> 
> Should we also add this as .pre_load, to force user select correct migration_type on target too?

In fact, I would claim we only want pre_load.
When qemu is started on destination we know where it's migrated
from so this flag can be set.
When qemu is started on source we generally do not yet know so
we don't know whether it's safe to set this flag.


> > +
> >   static const VMStateDescription vuf_vmstate = {
> >       .name = "vhost-user-fs",
> > -    .unmigratable = 1,
> > +    .minimum_version_id = 0,
> > +    .version_id = 0,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_VIRTIO_DEVICE,
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +   .pre_save = vhost_user_fs_pre_save,
> >   };
> >   static Property vuf_properties[] = {
> > @@ -309,6 +335,10 @@ static Property vuf_properties[] = {
> >       DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
> >                          conf.num_request_queues, 1),
> >       DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
> > +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
> > +                         VHOST_USER_MIGRATION_TYPE_NONE,
> > +                         qdev_prop_vhost_user_migration_type,
> > +                         VhostUserMigrationType),
> 
> 1. I see, other similar qdev_prop_* use DEFINE_PROP_SIGNED
> 2. All of them except only qdev_prop_fdc_drive_type, define also a convenient macro in include/hw/qdev-properties-system.h
> 
> should we follow these patterns?
> 
> 
> -- 
> Best regards,
> Vladimir


