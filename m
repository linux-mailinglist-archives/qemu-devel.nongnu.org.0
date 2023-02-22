Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DF369F9B8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUsfS-0007SA-2l; Wed, 22 Feb 2023 12:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUsfP-0007Rg-R7
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUsfO-0007x9-95
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677085949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDGYACH3rb7CPf3Jg1Z2hhyu9t8D29MVAchY/AHXdos=;
 b=eCAYShodfc3LzXMzRjLFiA+mq+NwjHfZsGHX9XiwXzCs2SYyUbMkl1QK3sMlE7rB5sliBc
 ZvtVBKqVFSVsaXVRb9a28naJRIHcqh9DXkrgYvcwRI3mQpjrIQBkqv3DM4xYN+oKzbOgUJ
 DgeOt4qQiQBKgHyiYul6aMRoL+tqFpc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-lO2f--UjNQSg3DEK8R-67g-1; Wed, 22 Feb 2023 12:12:27 -0500
X-MC-Unique: lO2f--UjNQSg3DEK8R-67g-1
Received: by mail-wm1-f69.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so3741491wme.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 09:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yDGYACH3rb7CPf3Jg1Z2hhyu9t8D29MVAchY/AHXdos=;
 b=Rwwslxxfw8ccvoHgnUQdycJ5uEQLIJBaYe4Lvu/20VoHt0t9tfHLw216MnKLmZGpjS
 we4yR0/kg5R9FpHurSpZDTv4uk9iyb1dgLQZDQ82B0eGQ8s/ZugZTB/g359uy70QHeKe
 6CfGt8u9Xyi1R0YghCg7ysQSERw07CENLzvLV16gjeFwhycwmkI2yhd5mTm5oY7VrBTm
 WOKK16xVv49qa7dlOGzw9i5ELTKXUSk3RcbzmytIjdvZy0h5uvKqWaiZhreAdnex0VoO
 Ce3q0VgS4ROVkJQB7OObQrWF0z18GaDdgzQGZ51WN0PMIm17lPqh8w3dTAR/H+MRhwaI
 gGzw==
X-Gm-Message-State: AO0yUKURpajPBIkgjoFS69HTu2EinygsQt8zKYIAtO5VyIOx8asDW0bT
 K0ZZrtyNhBngJ8h8vzFwbyzGyRb+9KydPXckKWiMvc4KvNb9TB+SAURf/zhSx3UeKgkQCgFwIio
 dxIzFwU5DIHyzBpY=
X-Received: by 2002:a05:6000:3:b0:2c7:d84:e1ea with SMTP id
 h3-20020a056000000300b002c70d84e1eamr1612506wrx.64.1677085946517; 
 Wed, 22 Feb 2023 09:12:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8Q2oDH53qPuEUYf6i9ltZbFsd1OFim72qGV/vpg78WhJkp22a8yLMRUKdjtp0JkepLn2U/bg==
X-Received: by 2002:a05:6000:3:b0:2c7:d84:e1ea with SMTP id
 h3-20020a056000000300b002c70d84e1eamr1612478wrx.64.1677085946222; 
 Wed, 22 Feb 2023 09:12:26 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 v15-20020adfedcf000000b002c70ce264bfsm1715026wro.76.2023.02.22.09.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 09:12:25 -0800 (PST)
Date: Wed, 22 Feb 2023 12:12:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230222121133-mutt-send-email-mst@kernel.org>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
 <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
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

On Wed, Feb 22, 2023 at 07:05:47PM +0200, Anton Kuchin wrote:
> On 22/02/2023 18:51, Michael S. Tsirkin wrote:
> > On Wed, Feb 22, 2023 at 06:49:10PM +0200, Anton Kuchin wrote:
> > > On 22/02/2023 17:14, Vladimir Sementsov-Ogievskiy wrote:
> > > > On 22.02.23 17:25, Anton Kuchin wrote:
> > > > > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > > > > +{
> > > > > > > > +    VHostUserFS *fs = opaque;
> > > > > > > > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > > > > > > > +
> > > > > > > > +    switch (fs->migration_type) {
> > > > > > > > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > > > > > > > +        error_report("Migration is blocked by device %s", path);
> > > > > > > > +        break;
> > > > > > > > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > > > > > > > +        return 0;
> > > > > > > > +    default:
> > > > > > > > +        error_report("Migration type '%s' is not
> > > > > > > > supported by device %s",
> > > > > > > > + VhostUserMigrationType_str(fs->migration_type), path);
> > > > > > > > +        break;
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    return -1;
> > > > > > > > +}
> > > > > > > Should we also add this as .pre_load, to force user select
> > > > > > > correct migration_type on target too?
> > > > > > In fact, I would claim we only want pre_load.
> > > > > > When qemu is started on destination we know where it's migrated
> > > > > > from so this flag can be set.
> > > > > > When qemu is started on source we generally do not yet know so
> > > > > > we don't know whether it's safe to set this flag.
> > > > But destination is a "source" for next migration, so there shouldn't be
> > > > real difference.
> > > > The new property has ".realized_set_allowed = true", so, as I understand
> > > > it may be changed at any time, so that's not a problem.
> > > Yes, exactly. So destination's property sets not how it will handle this
> > > incoming
> > > migration but the future outgoing one.
> > 
> > How do you know where you are going to migrate though?
> > I think you don't.
> > Setting it on source is better since we know where we
> > are migrating from.
> 
> Yes, I don't know where I'm going to migrate to. This is why property
> affects only how source saves state on outgoing migration.

Um. I don't get the logic.


> > 
> > > > > This property selects if VM can migrate and if it can what should
> > > > > qemu put
> > > > > to the migration stream. So we select on source what type of
> > > > > migration is
> > > > > allowed for this VM, destination can't check anything at load time.
> > > > OK, so the new field "migration" regulates only outgoing migration and
> > > > do nothing for incoming. On incoming migration the migration stream
> > > > itself defines the type of device migration.
> > > > Worth mentioning in doc?
> > > Good point. I don't think this deserves a respin but if I have to send v4
> > > I'll include
> > > clarification in it.


