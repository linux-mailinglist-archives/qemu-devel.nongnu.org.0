Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6A69F93B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:45:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUsDV-0002aZ-Oc; Wed, 22 Feb 2023 11:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUsDT-0002Ys-Kn
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUsDS-0001KI-38
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677084216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G27sB6PBeFxK/VicpXL6b08g4ZNzgMx2pw6RgCawjbc=;
 b=QEVrhEUqIDLIL4MnjokdDhN4NQoQSxC3sYWz22skoKGhDHdIMhg4o5fqQXZCOGdEaQ6NLH
 MF8DjHTncC+ynUxsmgJvSTV6ZD5INatHfUn99dwtTprRXfGIaoOf9SLKaWtI9eNOvvSRoE
 Evi/5luEqoYL70ifo9X4cHcECXNyX0o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-zjt-nWTiMlSGg0gmyC9OQQ-1; Wed, 22 Feb 2023 11:43:35 -0500
X-MC-Unique: zjt-nWTiMlSGg0gmyC9OQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so3749815wml.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G27sB6PBeFxK/VicpXL6b08g4ZNzgMx2pw6RgCawjbc=;
 b=Se7TE3W8kJiWqlFDUwwkRtrJtzvh+6btC5taIthEdUJEIOW9RDai3JhMuVSsqzqiLI
 pWuS6TvZPCAbyL4WZl7nkHHRNmLFKAVvDHnXMzuczIFzLPX3GJGZ5haAwzJ7iCFCk6sy
 kJ7n2zvS/AEnYK09W3Rdkrxl7+RSNIFrF6DIRPqYJH7WLT4swVRjHQ1nHM9oHReN3tcZ
 MqasqUss0v5ueCeFDVzFOBM3vX9MfjY4hd6umbUI2ACQiElxNPu156hbCxatk8yYm+Vu
 NSyJKLEvWOaG/m69/6BhjokJDlxHFI8ueo8lFIgJ2C+NSz5/H5qYRb5r8iwOz1naOBFS
 PxoQ==
X-Gm-Message-State: AO0yUKW/8NQ+voBaFtaG+ZZ1BK/sIJ3dxHDdFmW3Q8/SzFBmfIa6w403
 YHf/0sQc40GbUNCU+AiKw3AmuCJkGqu4GirCWCeagYYWU0h/+Wb0Eu46Mi2ZUL4TKkBOxjAtuqs
 AAW8dsWNYiKeNSrI=
X-Received: by 2002:a5d:6502:0:b0:2c5:fb6d:33e5 with SMTP id
 x2-20020a5d6502000000b002c5fb6d33e5mr7063865wru.0.1677084213849; 
 Wed, 22 Feb 2023 08:43:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9kf9xWAVzL/g72G3qv2LKgHMD0NJebvQzZQpLPJ7MUavAfzMrXd67bQDiEaJ/1aCfu8oAp/w==
X-Received: by 2002:a5d:6502:0:b0:2c5:fb6d:33e5 with SMTP id
 x2-20020a5d6502000000b002c5fb6d33e5mr7063836wru.0.1677084213534; 
 Wed, 22 Feb 2023 08:43:33 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 v8-20020a5d4b08000000b002be5bdbe40csm8175423wrq.27.2023.02.22.08.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:43:33 -0800 (PST)
Date: Wed, 22 Feb 2023 11:43:29 -0500
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
Message-ID: <20230222112907-mutt-send-email-mst@kernel.org>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
 <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
 <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
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

On Wed, Feb 22, 2023 at 06:14:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 22.02.23 17:25, Anton Kuchin wrote:
> > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > +{
> > > > > +    VHostUserFS *fs = opaque;
> > > > > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > > > > +
> > > > > +    switch (fs->migration_type) {
> > > > > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > > > > +        error_report("Migration is blocked by device %s", path);
> > > > > +        break;
> > > > > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > > > > +        return 0;
> > > > > +    default:
> > > > > +        error_report("Migration type '%s' is not supported by device %s",
> > > > > +                     VhostUserMigrationType_str(fs->migration_type), path);
> > > > > +        break;
> > > > > +    }
> > > > > +
> > > > > +    return -1;
> > > > > +}
> > > > Should we also add this as .pre_load, to force user select correct migration_type on target too?
> > > In fact, I would claim we only want pre_load.
> > > When qemu is started on destination we know where it's migrated
> > > from so this flag can be set.
> > > When qemu is started on source we generally do not yet know so
> > > we don't know whether it's safe to set this flag.
> 
> But destination is a "source" for next migration, so there shouldn't be real difference.

And whether to allow that migration should be decided by destination of
that migration.


> The new property has ".realized_set_allowed = true", so, as I understand it may be changed at any time, so that's not a problem.
> 
> > 
> > This property selects if VM can migrate and if it can what should qemu put
> > to the migration stream. So we select on source what type of migration is
> > allowed for this VM, destination can't check anything at load time.
> 
> OK, so the new field "migration" regulates only outgoing migration and do nothing for incoming. On incoming migration the migration stream itself defines the type of device migration.
> Worth mentioning in doc?
> 
> -- 
> Best regards,
> Vladimir


