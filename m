Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBE699996
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:13:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgss-00026c-N2; Thu, 16 Feb 2023 11:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSgso-00024v-Fe
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSgsm-0003yY-OQ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676563996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=owfgyqJ2esoDJ+LWujEU6aCU4RaHUTNu3czFsfXS5TI=;
 b=ONP1hhNU/HtAh3+ZhDx92aqrY93WSjweJM0TdZYnn3DuulYYqSBJHg1Oyma6ffN6vvrTYn
 jjOwD3J1H6slwKSERIEAdtKydu9tqwaVlX5WgSwlxOdmH9FXh/a8PcA0SauWMXbhqzP/7B
 Zy53u619ml8DpuVdDCkxyH3e2UnchMk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-lBG8jfzoN5u9mPvmeI3kPA-1; Thu, 16 Feb 2023 11:13:11 -0500
X-MC-Unique: lBG8jfzoN5u9mPvmeI3kPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg9-20020a05600c3c8900b003e1e7d3db06so1350841wmb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owfgyqJ2esoDJ+LWujEU6aCU4RaHUTNu3czFsfXS5TI=;
 b=kJHokLO8HhocqeQiwupHiN1SOqim+Jw0iBd94ajP5ZtBGMYxuK8wn0cSARmHwPK+6L
 /LVi+yXZmnGkE6oW/N8x/8rS1/V8vrlktZIqLJtGyqpAlXW4XJ6VLJDkDNT7BIaRrhSk
 4WuazR7Kp8DBAmjZdzQmexNtUMqPWY2qfJnt+cOtVq4ZWBchfrkWJXODlAuQ6EVV/1YG
 HinTSj5nmnOt3Av2Z65kGEj4FH2ffMRG0NwX7K2WBZ8dwVy04Ocsy5Jrzdg/48yz+SpJ
 6fSH7D59eSUmPZ6zjyGDQHtAUHTAlp576eWMd6kXQVEjD3VCGL2PXtoqWSQTwTv3f/Jc
 Izdw==
X-Gm-Message-State: AO0yUKWe/s2DLvoWBpjO5lqYurvLEhqs9/FnNRfXYsFvWl2WZhWAqftH
 zqhOTdZvIMLk85qdLdvQAPa6ro981kX8iNrARliLc/8t7pVLQ1TQ1fzhSZR2DO+ohC4AWkzerdo
 cDlfjBcyQJmQWRYw=
X-Received: by 2002:a05:600c:188a:b0:3e1:fc61:e0e5 with SMTP id
 x10-20020a05600c188a00b003e1fc61e0e5mr5851752wmp.33.1676563990141; 
 Thu, 16 Feb 2023 08:13:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+GyGEKIOmcn5yzS9uzx0dWxxGCXi87qDJXHJBuK6pFyS3pNOXrRBI9GJy0w1Q0L9M81o6hQg==
X-Received: by 2002:a05:600c:188a:b0:3e1:fc61:e0e5 with SMTP id
 x10-20020a05600c188a00b003e1fc61e0e5mr5851727wmp.33.1676563989858; 
 Thu, 16 Feb 2023 08:13:09 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 bi23-20020a05600c3d9700b003e200d3b2d1sm2203034wmb.38.2023.02.16.08.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:13:09 -0800 (PST)
Date: Thu, 16 Feb 2023 11:13:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, yc-core@yandex-team.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/1] vhost-user-fs: add property to allow migration
Message-ID: <20230216111134-mutt-send-email-mst@kernel.org>
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
 <87v8k1itoy.fsf@secure.mitica>
 <20230216110952-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216110952-mutt-send-email-mst@kernel.org>
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

On Thu, Feb 16, 2023 at 11:11:22AM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 16, 2023 at 03:14:05PM +0100, Juan Quintela wrote:
> > Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> > > Now any vhost-user-fs device makes VM unmigratable, that also prevents
> > > qemu update without stopping the VM. In most cases that makes sense
> > > because qemu has no way to transfer FUSE session state.
> > >
> > > But it is good to have an option for orchestrator to tune this according to
> > > backend capabilities and migration configuration.
> > >
> > > This patch adds device property 'migration' that is 'none' by default
> > > to keep old behaviour but can be set to 'external' to explicitly allow
> > > migration with minimal virtio device state in migration stream if daemon
> > > has some way to sync FUSE state on src and dst without help from qemu.
> > >
> > > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > 
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > 
> > The migration bits are correct.
> > 
> > And I can think a better way to explain that one device is migrated
> > externally.
> > 
> > If you have to respin:
> > 
> > > +static int vhost_user_fs_pre_save(void *opaque)
> > > +{
> > > +    VHostUserFS *fs = (VHostUserFS *)opaque;
> > 
> > This hack is useless.
> 
> meaning the cast? yes.
> 
> > I know that there are still lots of code that still have it.
> > 
> > 
> > Now remember that I have no clue about vhost-user-fs.
> > 
> > But this looks fishy
> > >  static const VMStateDescription vuf_vmstate = {
> > >      .name = "vhost-user-fs",
> > > -    .unmigratable = 1,
> > > +    .minimum_version_id = 0,
> > > +    .version_id = 0,
> > > +    .fields = (VMStateField[]) {
> > > +        VMSTATE_VIRTIO_DEVICE,
> > > +        VMSTATE_UINT8(migration_type, VHostUserFS),
> > > +        VMSTATE_END_OF_LIST()

In fact why do we want to migrate this property?
We generally don't, we only migrate state.

> > > +    },
> > > +   .pre_save = vhost_user_fs_pre_save,
> > >  };
> > >  
> > >  static Property vuf_properties[] = {
> > > @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
> > >      DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
> > >                         conf.num_request_queues, 1),
> > >      DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
> > > +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
> > > +                         VHOST_USER_MIGRATION_TYPE_NONE,
> > > +                         qdev_prop_vhost_user_migration_type,
> > > +                         uint8_t),
> > >      DEFINE_PROP_END_OF_LIST(),
> > 
> > We have four properties here (5 with the new migration one), and you
> > only migrate one.
> > 
> > This looks fishy, but I don't know if it makes sense.
> > If they _have_ to be configured the same on source and destination, I
> > would transfer them and check in post_load that the values are correct.
> > 
> > Later, Juan.
> 
> Weird suggestion.  We generally don't do this kind of check - that
> would be open-coding each property. It's management's job to make
> sure things are consistent.
> 
> -- 
> MST


