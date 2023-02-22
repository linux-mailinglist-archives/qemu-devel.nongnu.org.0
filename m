Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD6569FA36
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:31:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUswo-0004pV-Ab; Wed, 22 Feb 2023 12:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUswl-0004pH-UY
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUswi-0005AT-5H
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677087023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPBUKXoQ5D1CXxiLQRXBd9auOfAJDOPVSmzNp1xsIqQ=;
 b=HQwQbHBhMx/erXybl81zHyIvZmjgkDItr7xRiRRz0J5TlA3eKWjrjlxgAsr+tlehai6acV
 fVUd0NnF+A+dI1QKNTK02RhYpdWHmDFzih2L4JKaSw4CJWnUGXvclROWeaCHZRbNEza9TF
 NKPm7Ofdvl6fFHIZg1F8ILBycbLTrR4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-MQjTjao8N4SZHQf4yD0piw-1; Wed, 22 Feb 2023 12:30:18 -0500
X-MC-Unique: MQjTjao8N4SZHQf4yD0piw-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020a5d47a4000000b002c5699ff08aso1779633wrb.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 09:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YPBUKXoQ5D1CXxiLQRXBd9auOfAJDOPVSmzNp1xsIqQ=;
 b=XLVG8Vso7YEJ7xhlrDPwQOnGpWBkqFHSAT5pfK7JnrVztrNMdLg31GTy49moEhsjI1
 gCbI8xQAmYnFlqzw1BrA+DaZL9mKZLDhU+thyLoCW7hHmJ3MEWhy6AW0ATJqg2xOrq7W
 SA2y8Dlc1a7CeUfnkFFRlKRTTyaaQ1DODudXCTMdH03ZQEVCdsMflsv1v2FLjKupm5J7
 V3FLETwE7zeMqf3EDVY1tV8cvZCXoRpFsN7frVHsrRuAMPf54gSoeOfaC7k4ARGwb8qQ
 J7lMjnmUVb47ytw31J7KlXIJZgiH8+9e3IC6DCNJK6z0naqt/5aEAGosLgwDs0xSvHL1
 8acA==
X-Gm-Message-State: AO0yUKUPvdrhY57ehdkdwV9dHhmH7XJVzuMc8VfigeZ+R39shvD1Wkv0
 7ciNBKtH57NJrVrNv+jgDDeKOd3c5w83nBErHrp9zUOGJCx3Gmr992sJKodG0XMuRAJMeoxUUP0
 Jbh778CXHvO7kXrQ=
X-Received: by 2002:a05:600c:a694:b0:3df:fa56:7a33 with SMTP id
 ip20-20020a05600ca69400b003dffa567a33mr7193199wmb.26.1677087016762; 
 Wed, 22 Feb 2023 09:30:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/t/4Rlwhb0aHhPJCbYfVV1OTPsrvehX7uZhM+m5i8fm4dE9vDqu1gOjLegxvYxiZcUQBOBHQ==
X-Received: by 2002:a05:600c:a694:b0:3df:fa56:7a33 with SMTP id
 ip20-20020a05600ca69400b003dffa567a33mr7193179wmb.26.1677087016465; 
 Wed, 22 Feb 2023 09:30:16 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003df5be8987esm1348040wmq.20.2023.02.22.09.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 09:30:15 -0800 (PST)
Date: Wed, 22 Feb 2023 12:30:11 -0500
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
Message-ID: <20230222122726-mutt-send-email-mst@kernel.org>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
 <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <20230222112907-mutt-send-email-mst@kernel.org>
 <954a51f0-dfb8-7688-2197-d93e6b0c5fde@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <954a51f0-dfb8-7688-2197-d93e6b0c5fde@yandex-team.ru>
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

On Wed, Feb 22, 2023 at 07:15:40PM +0200, Anton Kuchin wrote:
> On 22/02/2023 18:43, Michael S. Tsirkin wrote:
> > On Wed, Feb 22, 2023 at 06:14:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > On 22.02.23 17:25, Anton Kuchin wrote:
> > > > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > > > +{
> > > > > > > +    VHostUserFS *fs = opaque;
> > > > > > > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > > > > > > +
> > > > > > > +    switch (fs->migration_type) {
> > > > > > > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > > > > > > +        error_report("Migration is blocked by device %s", path);
> > > > > > > +        break;
> > > > > > > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > > > > > > +        return 0;
> > > > > > > +    default:
> > > > > > > +        error_report("Migration type '%s' is not supported by device %s",
> > > > > > > +                     VhostUserMigrationType_str(fs->migration_type), path);
> > > > > > > +        break;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    return -1;
> > > > > > > +}
> > > > > > Should we also add this as .pre_load, to force user select correct migration_type on target too?
> > > > > In fact, I would claim we only want pre_load.
> > > > > When qemu is started on destination we know where it's migrated
> > > > > from so this flag can be set.
> > > > > When qemu is started on source we generally do not yet know so
> > > > > we don't know whether it's safe to set this flag.
> > > But destination is a "source" for next migration, so there shouldn't be real difference.
> > And whether to allow that migration should be decided by destination of
> > that migration.
> 
> Destination can just refuse to load unsupported state. But this happens
> automatically if migration code finds unknown subsection and needs no
> explicit check by device .pre_load.

Does it happen with the patch in question?
What is this unknown subsection you are talking about?


> > 
> > 
> > > The new property has ".realized_set_allowed = true", so, as I understand it may be changed at any time, so that's not a problem.
> > > 
> > > > This property selects if VM can migrate and if it can what should qemu put
> > > > to the migration stream. So we select on source what type of migration is
> > > > allowed for this VM, destination can't check anything at load time.
> > > OK, so the new field "migration" regulates only outgoing migration and do nothing for incoming. On incoming migration the migration stream itself defines the type of device migration.
> > > Worth mentioning in doc?
> > > 
> > > -- 
> > > Best regards,
> > > Vladimir


