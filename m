Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1146999DE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh22-0002lP-6Z; Thu, 16 Feb 2023 11:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSh1s-0002Va-Fq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSh1q-0007Rf-Lr
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676564557;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6y2fFqRuZ2dF6zn+d9ZE1rZ9ez5Vz6J4HtuxFS3Wk20=;
 b=JDvsr/8ChfVP8qpmoz1HI8KQ5qZ607ys7THdncM4L9ICl+Wz/5cIDxmoTZyQMST3fkExT/
 rOW9zht9yQeCJgGYrZu6ih4nNZA8AAZep47zSQTLtd99HcwpOf5JQPpgvtAzhDFE7JRHXs
 z6SEJLeRxLBR/fF047qY8dsdFaVEaXk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-7GdCo49vMqub44AXKrvS_w-1; Thu, 16 Feb 2023 11:22:35 -0500
X-MC-Unique: 7GdCo49vMqub44AXKrvS_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so3400008wms.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6y2fFqRuZ2dF6zn+d9ZE1rZ9ez5Vz6J4HtuxFS3Wk20=;
 b=oheXqGV8J2rDsz2afwscYBBiPX31LBO7lZOILEQCg5drAhlalU2qBYAt/amE4JKfys
 95UxfbBDkIZ1dG1JG+RuB4wRh0crIjYPqzsMZ6Gx7dLkAup3AUkypzD3bcpLN6NyBXBl
 Z+U/+NckuTUOjbYU3qaQ9ZBLGCkrzUwYNxS2CA8zxDJI186WTmOvf/4S1Fcsz/w9noB1
 oZL3BbGrgLTOzP5zcHSckCKC0M4+ukhgK8B/md+bmSTzowudgM8hJ16ZiRKv3JgN1JlU
 s9s/mCR8wXO0bONspSsKVLJevOOuQ3eh3/miBGNBt+719DY1Olv7+13uIFdJKjC17DtR
 47Xw==
X-Gm-Message-State: AO0yUKVe4p4ssQuL4A5DPabI4daO9zaOk7VQJ6R9oneKk8QyJavLN/0Q
 lkR79784mi7xVJ3xPue6AHtWe0wnW/OBGyJb0lqo5BVdYD7eZNT1ctuGAtHgfSCfr34RVCPVnta
 Ma2O7zKGJTBZLfgk=
X-Received: by 2002:adf:e10c:0:b0:2c5:8353:e0ec with SMTP id
 t12-20020adfe10c000000b002c58353e0ecmr2148044wrz.10.1676564554607; 
 Thu, 16 Feb 2023 08:22:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/I71wHZ0yoGP/QwT3epUfNP2ykc/wsU9zn/zgWuPaHoBYgLDXpvurSIheBTxO2Pj6s61FFRA==
X-Received: by 2002:adf:e10c:0:b0:2c5:8353:e0ec with SMTP id
 t12-20020adfe10c000000b002c58353e0ecmr2148024wrz.10.1676564554317; 
 Thu, 16 Feb 2023 08:22:34 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 g11-20020adffc8b000000b002c3f9404c45sm1851094wrr.7.2023.02.16.08.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:22:33 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,  qemu-devel@nongnu.org,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  yc-core@yandex-team.ru,  Stefan Hajnoczi
 <stefanha@redhat.com>,  virtio-fs@redhat.com,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/1] vhost-user-fs: add property to allow migration
In-Reply-To: <20230216111134-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Thu, 16 Feb 2023 11:13:04 -0500")
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
 <87v8k1itoy.fsf@secure.mitica>
 <20230216110952-mutt-send-email-mst@kernel.org>
 <20230216111134-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 17:22:32 +0100
Message-ID: <87zg9dfulz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Thu, Feb 16, 2023 at 11:11:22AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Feb 16, 2023 at 03:14:05PM +0100, Juan Quintela wrote:
>> > Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>> > > Now any vhost-user-fs device makes VM unmigratable, that also prevents
>> > > qemu update without stopping the VM. In most cases that makes sense
>> > > because qemu has no way to transfer FUSE session state.
>> > >
>> > > But it is good to have an option for orchestrator to tune this according to
>> > > backend capabilities and migration configuration.
>> > >
>> > > This patch adds device property 'migration' that is 'none' by default
>> > > to keep old behaviour but can be set to 'external' to explicitly allow
>> > > migration with minimal virtio device state in migration stream if daemon
>> > > has some way to sync FUSE state on src and dst without help from qemu.
>> > >
>> > > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>> > 
>> > Reviewed-by: Juan Quintela <quintela@redhat.com>
>> > 
>> > The migration bits are correct.
>> > 
>> > And I can think a better way to explain that one device is migrated
>> > externally.
>> > 
>> > If you have to respin:
>> > 
>> > > +static int vhost_user_fs_pre_save(void *opaque)
>> > > +{
>> > > +    VHostUserFS *fs = (VHostUserFS *)opaque;
>> > 
>> > This hack is useless.
>> 
>> meaning the cast? yes.
>> 
>> > I know that there are still lots of code that still have it.
>> > 
>> > 
>> > Now remember that I have no clue about vhost-user-fs.
>> > 
>> > But this looks fishy
>> > >  static const VMStateDescription vuf_vmstate = {
>> > >      .name = "vhost-user-fs",
>> > > -    .unmigratable = 1,
>> > > +    .minimum_version_id = 0,
>> > > +    .version_id = 0,
>> > > +    .fields = (VMStateField[]) {
>> > > +        VMSTATE_VIRTIO_DEVICE,
>> > > +        VMSTATE_UINT8(migration_type, VHostUserFS),
>> > > +        VMSTATE_END_OF_LIST()
>
> In fact why do we want to migrate this property?
> We generally don't, we only migrate state.

See previous discussion.
In a nutshell, we are going to have internal migration in the future
(not done yet).

Later, Juan.

>> > > +    },
>> > > +   .pre_save = vhost_user_fs_pre_save,
>> > >  };
>> > >  
>> > >  static Property vuf_properties[] = {
>> > > @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
>> > >      DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>> > >                         conf.num_request_queues, 1),
>> > >      DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
>> > > +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
>> > > +                         VHOST_USER_MIGRATION_TYPE_NONE,
>> > > +                         qdev_prop_vhost_user_migration_type,
>> > > +                         uint8_t),
>> > >      DEFINE_PROP_END_OF_LIST(),
>> > 
>> > We have four properties here (5 with the new migration one), and you
>> > only migrate one.
>> > 
>> > This looks fishy, but I don't know if it makes sense.
>> > If they _have_ to be configured the same on source and destination, I
>> > would transfer them and check in post_load that the values are correct.
>> > 
>> > Later, Juan.
>> 
>> Weird suggestion.  We generally don't do this kind of check - that
>> would be open-coding each property. It's management's job to make
>> sure things are consistent.
>> 
>> -- 
>> MST


