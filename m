Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F769F956
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUsLq-0006KU-70; Wed, 22 Feb 2023 11:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUsLa-0006K5-KC
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:52:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUsLY-0007IH-TB
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677084720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5+lQgoim2W0rg4IM7fyt3bGHd9BQmi3Ew36Q0xeiYI=;
 b=ZEW4jbecRaIyyVWfpEHajdeVfQWJVnJ1hlv9vkujyK+DrgssK/0f9lB7FKUyUxGYUnTVol
 jT2C6SYQrHdROvdVAIsWSRghN1wYKxI9A1JhJoR8imyowcW5manCgr4gLFt9WFPOfDRK4G
 v6DqSyRlmPQJ/XqbFPCqG2Yl6eaSJIs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-DQPqu1lKOlWLGNsVyhvS8A-1; Wed, 22 Feb 2023 11:51:58 -0500
X-MC-Unique: DQPqu1lKOlWLGNsVyhvS8A-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg26-20020a05600c3c9a00b003e21a3f4e84so3428413wmb.8
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L5+lQgoim2W0rg4IM7fyt3bGHd9BQmi3Ew36Q0xeiYI=;
 b=B8WHqIcvNCC0w9XkrO5+DGKTakd3h8jlAtdb1Iz58nXclqnD5bVsqhWw6CV+7RHTmW
 rLgSSzVhx7haxip7C0Rg4NKIuxMo+VcP0f2gBl/6jUaV21ngSWby5i7xQsCbrDXHo559
 Wl/dpsZAH3aAcE4iMe4kPkKu8u5nnfIEOZhw9jxqa5a2cct9Miff2fqSzoxPihVr9+TC
 2Yww7t/KpDsujRObSpSFowZTuS/LIRFByPc5CuiqCPQ/qsMBfC2pWtcFra4yxslQ+Nrk
 POssBPhct8l7epsljOV+6SseqwCFhbHG5UegooHRlYUeD8ypE3prDr+iOWSRfjwciu1Q
 e7VA==
X-Gm-Message-State: AO0yUKXtGBQ49D1E06ZJq51hBXKnS2QaDtArSPwxXdGlo9054UdCcwoK
 KJCjgZsXGVpSHFASGhPS+axJO5drBVIYGgF/DebLT3xuiUYNIXlFQIswqpg2PKrEVRd1S7q7caa
 DM4LpEqAp8ofPjN0=
X-Received: by 2002:adf:dfd0:0:b0:2bf:f735:1310 with SMTP id
 q16-20020adfdfd0000000b002bff7351310mr7556671wrn.2.1677084717430; 
 Wed, 22 Feb 2023 08:51:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/4j7hD0DNeA8MW6jkFF4y9DYahfRbReTEoqSjFKaUxVLqLzkC5G3BUUjNXKV23LTdW3Zo8Gw==
X-Received: by 2002:adf:dfd0:0:b0:2bf:f735:1310 with SMTP id
 q16-20020adfdfd0000000b002bff7351310mr7556655wrn.2.1677084717128; 
 Wed, 22 Feb 2023 08:51:57 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 iz4-20020a05600c554400b003e203681b26sm5679482wmb.29.2023.02.22.08.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:51:56 -0800 (PST)
Date: Wed, 22 Feb 2023 11:51:52 -0500
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
Message-ID: <20230222115106-mutt-send-email-mst@kernel.org>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
 <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
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

On Wed, Feb 22, 2023 at 06:49:10PM +0200, Anton Kuchin wrote:
> On 22/02/2023 17:14, Vladimir Sementsov-Ogievskiy wrote:
> > On 22.02.23 17:25, Anton Kuchin wrote:
> > > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > > +{
> > > > > > +    VHostUserFS *fs = opaque;
> > > > > > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > > > > > +
> > > > > > +    switch (fs->migration_type) {
> > > > > > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > > > > > +        error_report("Migration is blocked by device %s", path);
> > > > > > +        break;
> > > > > > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > > > > > +        return 0;
> > > > > > +    default:
> > > > > > +        error_report("Migration type '%s' is not
> > > > > > supported by device %s",
> > > > > > + VhostUserMigrationType_str(fs->migration_type), path);
> > > > > > +        break;
> > > > > > +    }
> > > > > > +
> > > > > > +    return -1;
> > > > > > +}
> > > > > Should we also add this as .pre_load, to force user select
> > > > > correct migration_type on target too?
> > > > In fact, I would claim we only want pre_load.
> > > > When qemu is started on destination we know where it's migrated
> > > > from so this flag can be set.
> > > > When qemu is started on source we generally do not yet know so
> > > > we don't know whether it's safe to set this flag.
> > 
> > But destination is a "source" for next migration, so there shouldn't be
> > real difference.
> > The new property has ".realized_set_allowed = true", so, as I understand
> > it may be changed at any time, so that's not a problem.
> 
> Yes, exactly. So destination's property sets not how it will handle this
> incoming
> migration but the future outgoing one.


How do you know where you are going to migrate though?
I think you don't.
Setting it on source is better since we know where we
are migrating from.

> > 
> > > 
> > > This property selects if VM can migrate and if it can what should
> > > qemu put
> > > to the migration stream. So we select on source what type of
> > > migration is
> > > allowed for this VM, destination can't check anything at load time.
> > 
> > OK, so the new field "migration" regulates only outgoing migration and
> > do nothing for incoming. On incoming migration the migration stream
> > itself defines the type of device migration.
> > Worth mentioning in doc?
> 
> Good point. I don't think this deserves a respin but if I have to send v4
> I'll include
> clarification in it.


