Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC12169998C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgr5-0000Fy-0Z; Thu, 16 Feb 2023 11:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSgr2-0000FB-Ig
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSgr0-0003iP-Q4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676563885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mc+IsOt5m3R3gshXDCa/fJEwv4AEduXbKeR9IoHhWLA=;
 b=H3bY9unTcBqxKBDH1BvoArzgj++HWwklrvGqLRBimmHn4a5EXYAXJ36Pl616pJwiI3udsb
 zfz2ofK4qbVqAXb2HUe7H658HRysRWq+7frNZDnoNCiOpT9V4xmCXcQozT/ovquKWL1oV/
 NQYUwEKhcBYdS+NWtnNpE9xABv6/A08=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-ehlzPhjrNtOG2f-pejnEUw-1; Thu, 16 Feb 2023 11:11:24 -0500
X-MC-Unique: ehlzPhjrNtOG2f-pejnEUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so1358602wmq.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mc+IsOt5m3R3gshXDCa/fJEwv4AEduXbKeR9IoHhWLA=;
 b=40Rjk3GeRw3dKlLkKpgUJO9K1iBAB57x/41ICKk3Eqw4YajroqApHScIVqpelSJ+l0
 7TGiLEu5yTTX3Ia273j6rSOYDfRciOo8fuvmliYNef0PVaiZMkKvwLotORNDiBdb4x+6
 qc6EmaP2Ps/id5QVAKoWEBir7toRTQ93pZhJssqVw55F/gVObsd0WhgdM8Du4vFBpIwa
 Weyp8YZwDLvnUwBgPDNvy4iscWVSUaP1IhYEScFPVcNSX/cSqGdh+Cwc98C/nn8V6gZm
 lKLVQekMokpcQSiJiV2cobZa8E+F5BbjHI6xSbN6taSSbQu2y1Dm+s/9cK8a7VeXXeSN
 xPdA==
X-Gm-Message-State: AO0yUKU/tW2Q5bNkwLNok39qxoiHACiNCHZpTBZuCXIIA6RdrPYZz+gW
 Lz8M3OSyu2gZl8BBs8ocyDzyL/Twlysx9r7stvjcG4PCCViUImIqeIwlcfpYiy1oXoU8IvUENP1
 eQ8P1KRHcBPVxIC8=
X-Received: by 2002:a05:600c:816:b0:3dc:557f:6123 with SMTP id
 k22-20020a05600c081600b003dc557f6123mr5534268wmp.1.1676563882889; 
 Thu, 16 Feb 2023 08:11:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/wwxy3LbU43TQfb161eFw+eA8aWek1BqkuJZ/jg2IOpFBrIvQCnj8wgUSQzmalZAtl56Dduw==
X-Received: by 2002:a05:600c:816:b0:3dc:557f:6123 with SMTP id
 k22-20020a05600c081600b003dc557f6123mr5534255wmp.1.1676563882611; 
 Thu, 16 Feb 2023 08:11:22 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003e00c453447sm5165613wmc.48.2023.02.16.08.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:11:22 -0800 (PST)
Date: Thu, 16 Feb 2023 11:11:18 -0500
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
Message-ID: <20230216110952-mutt-send-email-mst@kernel.org>
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
 <87v8k1itoy.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8k1itoy.fsf@secure.mitica>
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

On Thu, Feb 16, 2023 at 03:14:05PM +0100, Juan Quintela wrote:
> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> > Now any vhost-user-fs device makes VM unmigratable, that also prevents
> > qemu update without stopping the VM. In most cases that makes sense
> > because qemu has no way to transfer FUSE session state.
> >
> > But it is good to have an option for orchestrator to tune this according to
> > backend capabilities and migration configuration.
> >
> > This patch adds device property 'migration' that is 'none' by default
> > to keep old behaviour but can be set to 'external' to explicitly allow
> > migration with minimal virtio device state in migration stream if daemon
> > has some way to sync FUSE state on src and dst without help from qemu.
> >
> > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> The migration bits are correct.
> 
> And I can think a better way to explain that one device is migrated
> externally.
> 
> If you have to respin:
> 
> > +static int vhost_user_fs_pre_save(void *opaque)
> > +{
> > +    VHostUserFS *fs = (VHostUserFS *)opaque;
> 
> This hack is useless.

meaning the cast? yes.

> I know that there are still lots of code that still have it.
> 
> 
> Now remember that I have no clue about vhost-user-fs.
> 
> But this looks fishy
> >  static const VMStateDescription vuf_vmstate = {
> >      .name = "vhost-user-fs",
> > -    .unmigratable = 1,
> > +    .minimum_version_id = 0,
> > +    .version_id = 0,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_VIRTIO_DEVICE,
> > +        VMSTATE_UINT8(migration_type, VHostUserFS),
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +   .pre_save = vhost_user_fs_pre_save,
> >  };
> >  
> >  static Property vuf_properties[] = {
> > @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
> >      DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
> >                         conf.num_request_queues, 1),
> >      DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
> > +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
> > +                         VHOST_USER_MIGRATION_TYPE_NONE,
> > +                         qdev_prop_vhost_user_migration_type,
> > +                         uint8_t),
> >      DEFINE_PROP_END_OF_LIST(),
> 
> We have four properties here (5 with the new migration one), and you
> only migrate one.
> 
> This looks fishy, but I don't know if it makes sense.
> If they _have_ to be configured the same on source and destination, I
> would transfer them and check in post_load that the values are correct.
> 
> Later, Juan.

Weird suggestion.  We generally don't do this kind of check - that
would be open-coding each property. It's management's job to make
sure things are consistent.

-- 
MST


