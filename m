Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D246A183F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:48:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTkT-0001UT-KO; Fri, 24 Feb 2023 03:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVTkO-0001UF-ID
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVTkM-0001AB-OC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677228486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugFzW75VJwHiMQnXOqleVevMuSykjQgt1oAj22zolaE=;
 b=RfEcDPrkrAm9654qtFSh0Wrq/WuhMP18wi3QLKgKz0qBgdfev23McqguesJWYu/1+9uK/T
 gqb3YDVmFCNt9ao41b5sV2Az6GOx1flNs8t0GhZwnPd1dH5HFeeaI7N6TzlGla3AcV4kp1
 HMRc0ApPRCMngot84Ptqqap0RkicXv4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-4RIxdBnmPaeo0gyS3TIgOw-1; Fri, 24 Feb 2023 03:48:04 -0500
X-MC-Unique: 4RIxdBnmPaeo0gyS3TIgOw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso760810wms.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ugFzW75VJwHiMQnXOqleVevMuSykjQgt1oAj22zolaE=;
 b=u5+Ul4hDwLJOD15639TexfkT9GIygs4NYirE2vhPEnsG/Huc88VuFw44l608B6jrV7
 bxwo7sRUEXCkAiiopSgY8K8aPcsypAb9Prj5q7d33X6gVQ5c+CnRuMnVfvE/iMxdwu/n
 XJ3YsxCdzMrMux8NViBDZfBgGTdEzxvYgJmy7lZFAiLmFgXoyb2QeO8lgvuo63565vHD
 YJ/bqBEhsD+dgZgNYtGvqk3awLiYfjTpnaPMTjnzT3iH0TStdMrYJZIAUNUusfN9Hjya
 sZ9EgHCT1s8Qp6qX+pyxbhyD9vc952NAeFLQ+1+/rYiu4JaPNSVp/Oe3bUFGaIQEHPkH
 +3BQ==
X-Gm-Message-State: AO0yUKXyuJpdUV1kje7JMX8TN/3N5meIGtZ6kQewu1hN5dXwOGLsMnHw
 ItMlO6Qmk5Sit13ttJ6mzgzxkBBqMSdyZhjtRja1Z9qraiOSmENLhMCQkN8aMcLt67TE0Ic3z9n
 MBgSCKHducmVPUvI=
X-Received: by 2002:adf:e242:0:b0:2c5:a42b:8bc1 with SMTP id
 bl2-20020adfe242000000b002c5a42b8bc1mr12854576wrb.5.1677228483342; 
 Fri, 24 Feb 2023 00:48:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8wIDkVmxCFrzbzAJBzXZGrtag8Ale0fzlakz0BAVPHhOPX5/mY0JYDGcKV54/9wMvyPSly+g==
X-Received: by 2002:adf:e242:0:b0:2c5:a42b:8bc1 with SMTP id
 bl2-20020adfe242000000b002c5a42b8bc1mr12854555wrb.5.1677228482961; 
 Fri, 24 Feb 2023 00:48:02 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f0:a3e9:76f3:3a96:2a:eb18])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm10171980wrj.70.2023.02.24.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:48:02 -0800 (PST)
Date: Fri, 24 Feb 2023 03:47:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230224034258-mutt-send-email-mst@kernel.org>
References: <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/fZm12yGIPnwaDX@fedora>
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

On Thu, Feb 23, 2023 at 04:24:43PM -0500, Stefan Hajnoczi wrote:
> On Thu, Feb 23, 2023 at 02:36:33AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Feb 22, 2023 at 03:21:42PM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Feb 22, 2023 at 08:25:19PM +0200, Anton Kuchin wrote:
> > > > On 22/02/2023 19:12, Michael S. Tsirkin wrote:
> > > > > On Wed, Feb 22, 2023 at 07:05:47PM +0200, Anton Kuchin wrote:
> > > > > > On 22/02/2023 18:51, Michael S. Tsirkin wrote:
> > > > > > > On Wed, Feb 22, 2023 at 06:49:10PM +0200, Anton Kuchin wrote:
> > > > > > > > On 22/02/2023 17:14, Vladimir Sementsov-Ogievskiy wrote:
> > > > > > > > > On 22.02.23 17:25, Anton Kuchin wrote:
> > > > > > > > > > > > > +static int vhost_user_fs_pre_save(void *opaque)
> > > > > > > > > > > > > +{
> > > > > > > > > > > > > +    VHostUserFS *fs = opaque;
> > > > > > > > > > > > > +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +    switch (fs->migration_type) {
> > > > > > > > > > > > > +    case VHOST_USER_MIGRATION_TYPE_NONE:
> > > > > > > > > > > > > +        error_report("Migration is blocked by device %s", path);
> > > > > > > > > > > > > +        break;
> > > > > > > > > > > > > +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> > > > > > > > > > > > > +        return 0;
> > > > > > > > > > > > > +    default:
> > > > > > > > > > > > > +        error_report("Migration type '%s' is not
> > > > > > > > > > > > > supported by device %s",
> > > > > > > > > > > > > + VhostUserMigrationType_str(fs->migration_type), path);
> > > > > > > > > > > > > +        break;
> > > > > > > > > > > > > +    }
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +    return -1;
> > > > > > > > > > > > > +}
> > > > > > > > > > > > Should we also add this as .pre_load, to force user select
> > > > > > > > > > > > correct migration_type on target too?
> > > > > > > > > > > In fact, I would claim we only want pre_load.
> > > > > > > > > > > When qemu is started on destination we know where it's migrated
> > > > > > > > > > > from so this flag can be set.
> > > > > > > > > > > When qemu is started on source we generally do not yet know so
> > > > > > > > > > > we don't know whether it's safe to set this flag.
> > > > > > > > > But destination is a "source" for next migration, so there shouldn't be
> > > > > > > > > real difference.
> > > > > > > > > The new property has ".realized_set_allowed = true", so, as I understand
> > > > > > > > > it may be changed at any time, so that's not a problem.
> > > > > > > > Yes, exactly. So destination's property sets not how it will handle this
> > > > > > > > incoming
> > > > > > > > migration but the future outgoing one.
> > > > > > > How do you know where you are going to migrate though?
> > > > > > > I think you don't.
> > > > > > > Setting it on source is better since we know where we
> > > > > > > are migrating from.
> > > > > > Yes, I don't know where I'm going to migrate to. This is why property
> > > > > > affects only how source saves state on outgoing migration.
> > > > > Um. I don't get the logic.
> > > > 
> > > > For this feature to work we need orchestrator to manage the migration. And
> > > > we
> > > > generally assume that it is responsibility of orchestrator to ensure
> > > > matching
> > > > properties on source and destination.
> > > > As orchestrator manages both sides of migration it can set option (and we
> > > > can
> > > > check it) on either source or destination. Now it's not important which side
> > > > we
> > > > select, because now the option is essentially binary allow/deny (but IMHO it
> > > > is much better to refuse source to migrate than find later that state can't
> > > > be
> > > > loaded by destination, in case of file migration this becomes especially
> > > > painful).
> > > > 
> > > > But there are plans to add internal migration option (extract FUSE state
> > > > from
> > > > backend and transfer it in QEMU migration stream), and that's where
> > > > setting/checking
> > > > on source becomes important because it will rely on this property to decide
> > > > if
> > > > extra state form backend needs to be put in the migration stream subsection.
> > > 
> > > 
> > > If we do internal migration that will be a different property
> > > which has to match on source *and* destination.
> > > 
> > > 
> > > > If you are concerned about orchestrator breaking assumption of matching
> > > > properties
> > > > on source and destination this is not really supported AFAIK but I don't
> > > > think we
> > > > need to punish it for this, maybe it has its reasons: I can imagine scenario
> > > > where orchestrator could want to migrate from source with
> > > > 'migration=external'
> > > > to destination with 'migration=none' to ensure that destination can't be
> > > > migrated further.
> > > 
> > > No. I am concerned about a simple practical matter:
> > > - I decide to restart qemu on the same host - so I need to enable
> > >   migration
> > > - Later I decide to migrate qemu to another host - this should be
> > >   blocked
> > > 
> > > 
> > > Property on source does not satisfy both at the same time.
> > > Property on destination does.
> > 
> > 
> > Stefan what's your take on this? Should we move this from
> > save to load hook?
> 
> This property can be changed on the source at runtime via qom-set, so
> you don't need to predict the future. The device can be started from an
> incoming migration with "external" and then set to "stateful" migration
> to migrate to another host later on.

And then you are supposed to change it back if migration fails?
External tool failures have to be handled ...
How likely is all this fragile dance not to have bugs?

And all of this effort for what? Just to make the case of a buggy
management tool fail a bit faster - is it really worth it?

Compare to setting it on destination where you can set it
on command line or through qom and forget about it.
No?

> Anton, can you share the virtiofsd patches so we have a full picture of
> how "external" migration works? I'd like to understand the workflow and
> also how it can be extended when "stateful" migration is added.
> 
> > 
> > > 
> > > 
> > > > > 
> > > > > 
> > > > > > > > > > This property selects if VM can migrate and if it can what should
> > > > > > > > > > qemu put
> > > > > > > > > > to the migration stream. So we select on source what type of
> > > > > > > > > > migration is
> > > > > > > > > > allowed for this VM, destination can't check anything at load time.
> > > > > > > > > OK, so the new field "migration" regulates only outgoing migration and
> > > > > > > > > do nothing for incoming. On incoming migration the migration stream
> > > > > > > > > itself defines the type of device migration.
> > > > > > > > > Worth mentioning in doc?
> > > > > > > > Good point. I don't think this deserves a respin but if I have to send v4
> > > > > > > > I'll include
> > > > > > > > clarification in it.
> > 



