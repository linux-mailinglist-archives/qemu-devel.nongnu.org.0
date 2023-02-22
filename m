Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23669FCF4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvcd-0007B0-Ao; Wed, 22 Feb 2023 15:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvca-0007Ad-P3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvcY-0001ny-PC
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677097305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWBPhtl/WqqeNIgrys6rIJufZiIXM+NTlyDNY+Ybxkg=;
 b=ZDV/XVDprHHA6B/Csf2fd6i3uYjDLa5dVktsugwiDPQj2pWckXovUYiS0Pbi9LXl0g4bN/
 FBivjYB6aeN0nDbtvuqBcexFQ1nHn73Je6OXBZQQdiJU8kvqKOzPeCdVOSf1Wk+FhKsmKo
 wQN6bfzQUE15YxJjSORwmcrMg1O3V+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-h0ObUxj-NI2nku8ItSeFSA-1; Wed, 22 Feb 2023 15:21:43 -0500
X-MC-Unique: h0ObUxj-NI2nku8ItSeFSA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so1897489wmb.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWBPhtl/WqqeNIgrys6rIJufZiIXM+NTlyDNY+Ybxkg=;
 b=jp1hObKYD31Y4aoPyEtIh9haB+Xkyp3ynGQjl4wygtUIho4/mnJvtdgPugIqlbMAoL
 o0Rg4jBULbLSTnf9CeXfWEkHDURVHvS3ytF1pyN5m58ScEhu5DOZ8eJlZqu+oh+xMeHY
 FyrKXJFtIYEfbA4hSWvG+17UAxXQx/qDH7hNnEi2rlHm1NsIrG1+aD3QtDFmIYm/esK2
 rvw6gBTbrVnYfxchKoPO/+No5NZpUyX/GwAUg3cay3f/A36LNyRadUh/bdzYa49bUPQz
 XKrTuM4Fjyvc4e0RMPZmtkgoeLiBrLQ3drTyPgn82xVUiqOlKmGdOalYcmBCNDwgDXP1
 GRoQ==
X-Gm-Message-State: AO0yUKWuRIukxMYXAU8lZAJCcbDz5henpZSz5Tm+OOA5zwx9nW5oZzOI
 ISXoHhOINceP8j+nFW/u+V14R/r1EWLZAOnoIRoZN5hLKc56LsZy08CNGnM9A/eK9q9VaGI3iKw
 iOzcRJIHPrYH9nko=
X-Received: by 2002:a05:6000:1789:b0:2c6:825d:ed13 with SMTP id
 e9-20020a056000178900b002c6825ded13mr8674728wrg.25.1677097302380; 
 Wed, 22 Feb 2023 12:21:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8nei5fEoJDjthjQsg99FKdXOnNhZiHYScVXZPW+vV5kWe9meHYvDgGuHSXPFMfi54u5c6Giw==
X-Received: by 2002:a05:6000:1789:b0:2c6:825d:ed13 with SMTP id
 e9-20020a056000178900b002c6825ded13mr8674710wrg.25.1677097301976; 
 Wed, 22 Feb 2023 12:21:41 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 a18-20020adffad2000000b002c56013c07fsm7623040wrs.109.2023.02.22.12.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 12:21:41 -0800 (PST)
Date: Wed, 22 Feb 2023 15:21:36 -0500
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
Message-ID: <20230222151814-mutt-send-email-mst@kernel.org>
References: <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
 <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
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

On Wed, Feb 22, 2023 at 08:25:19PM +0200, Anton Kuchin wrote:
> On 22/02/2023 19:12, Michael S. Tsirkin wrote:
> > On Wed, Feb 22, 2023 at 07:05:47PM +0200, Anton Kuchin wrote:
> > > On 22/02/2023 18:51, Michael S. Tsirkin wrote:
> > > > On Wed, Feb 22, 2023 at 06:49:10PM +0200, Anton Kuchin wrote:
> > > > > On 22/02/2023 17:14, Vladimir Sementsov-Ogievskiy wrote:
> > > > > > On 22.02.23 17:25, Anton Kuchin wrote:
> > > > > > > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > > > > > > +{
> > > > > > > > > > +    VHostUserFS *fs = opaque;
> > > > > > > > > > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > > > > > > > > > +
> > > > > > > > > > +    switch (fs->migration_type) {
> > > > > > > > > > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > > > > > > > > > +        error_report("Migration is blocked by device %s", path);
> > > > > > > > > > +        break;
> > > > > > > > > > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > > > > > > > > > +        return 0;
> > > > > > > > > > +    default:
> > > > > > > > > > +        error_report("Migration type '%s' is not
> > > > > > > > > > supported by device %s",
> > > > > > > > > > + VhostUserMigrationType_str(fs->migration_type), path);
> > > > > > > > > > +        break;
> > > > > > > > > > +    }
> > > > > > > > > > +
> > > > > > > > > > +    return -1;
> > > > > > > > > > +}
> > > > > > > > > Should we also add this as .pre_load, to force user select
> > > > > > > > > correct migration_type on target too?
> > > > > > > > In fact, I would claim we only want pre_load.
> > > > > > > > When qemu is started on destination we know where it's migrated
> > > > > > > > from so this flag can be set.
> > > > > > > > When qemu is started on source we generally do not yet know so
> > > > > > > > we don't know whether it's safe to set this flag.
> > > > > > But destination is a "source" for next migration, so there shouldn't be
> > > > > > real difference.
> > > > > > The new property has ".realized_set_allowed = true", so, as I understand
> > > > > > it may be changed at any time, so that's not a problem.
> > > > > Yes, exactly. So destination's property sets not how it will handle this
> > > > > incoming
> > > > > migration but the future outgoing one.
> > > > How do you know where you are going to migrate though?
> > > > I think you don't.
> > > > Setting it on source is better since we know where we
> > > > are migrating from.
> > > Yes, I don't know where I'm going to migrate to. This is why property
> > > affects only how source saves state on outgoing migration.
> > Um. I don't get the logic.
> 
> For this feature to work we need orchestrator to manage the migration. And
> we
> generally assume that it is responsibility of orchestrator to ensure
> matching
> properties on source and destination.
> As orchestrator manages both sides of migration it can set option (and we
> can
> check it) on either source or destination. Now it's not important which side
> we
> select, because now the option is essentially binary allow/deny (but IMHO it
> is much better to refuse source to migrate than find later that state can't
> be
> loaded by destination, in case of file migration this becomes especially
> painful).
> 
> But there are plans to add internal migration option (extract FUSE state
> from
> backend and transfer it in QEMU migration stream), and that's where
> setting/checking
> on source becomes important because it will rely on this property to decide
> if
> extra state form backend needs to be put in the migration stream subsection.


If we do internal migration that will be a different property
which has to match on source *and* destination.


> If you are concerned about orchestrator breaking assumption of matching
> properties
> on source and destination this is not really supported AFAIK but I don't
> think we
> need to punish it for this, maybe it has its reasons: I can imagine scenario
> where orchestrator could want to migrate from source with
> 'migration=external'
> to destination with 'migration=none' to ensure that destination can't be
> migrated further.

No. I am concerned about a simple practical matter:
- I decide to restart qemu on the same host - so I need to enable
  migration
- Later I decide to migrate qemu to another host - this should be
  blocked


Property on source does not satisfy both at the same time.
Property on destination does.



> > 
> > 
> > > > > > > This property selects if VM can migrate and if it can what should
> > > > > > > qemu put
> > > > > > > to the migration stream. So we select on source what type of
> > > > > > > migration is
> > > > > > > allowed for this VM, destination can't check anything at load time.
> > > > > > OK, so the new field "migration" regulates only outgoing migration and
> > > > > > do nothing for incoming. On incoming migration the migration stream
> > > > > > itself defines the type of device migration.
> > > > > > Worth mentioning in doc?
> > > > > Good point. I don't think this deserves a respin but if I have to send v4
> > > > > I'll include
> > > > > clarification in it.


