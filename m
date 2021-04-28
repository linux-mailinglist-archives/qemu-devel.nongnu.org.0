Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6036D591
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:16:27 +0200 (CEST)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhF4-0007Us-Gw
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lbhD7-0006VM-4i
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lbhD4-0001aZ-Rn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P16HaSlHhMnvBhZzh8sLu0HxAGZ6AnZZqmL00J9jTAk=;
 b=W9lUe4U28iLMaO1fujhXpdJcmkbBF4wws1r+Ltd/hf+ooQNN+ACPnwai5CnpnycjFCJW77
 Y8b3NyPRKW4JuZRv2/K/ucVpH6t2gu4XMGI57y78hOO093/b9Uv08K+jIdkKI3LNh/CB+g
 vTnwKnl8jXGIAVf6jxpSRjndGlkpM28=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-h4lsB7FmOhKxoW5d34rHeg-1; Wed, 28 Apr 2021 06:14:20 -0400
X-MC-Unique: h4lsB7FmOhKxoW5d34rHeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 60-20020adf85420000b0290109440de5e9so6393599wrh.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P16HaSlHhMnvBhZzh8sLu0HxAGZ6AnZZqmL00J9jTAk=;
 b=tw9xs6hW/2YogTLJ7rXoJkQLmAoCnMQM5J46OjEZBFTHWZ1HEnga6h5/N2eg2WycpQ
 qdTTizLy+7I1icp8CYQb2ZtWlRQ66mCdIqARM0hyvyaKP8mdeEgqsw96S73JlUZiV5gC
 IHJ3GJXnbx4Nipmsyq+qLPg4qVo2dSXPCvi/he0v7XTbDx4yHsXomqhCoM4nm9xbeeMO
 on8W248QNvaFmrywsBTF8TCeBdA9zGCoesUNvTyF9w0AfUjCxAZwolFOrMeMxCiuJV2S
 025uU7VBy9h20Kkeo49B/VmEpj6kfvkwC8AMQNB3AVDmKzg/jqI42L1yc1zg8EtK600b
 AcEA==
X-Gm-Message-State: AOAM5311QgTAd4TNjaB0yFF62NmKUBG9y0W4hpnyCemtzQEG++cVgKIe
 OMWZLnapCBccWTlj0dWj1aCGfvDWFuii0nqtOpfue15Yd2ogCxKX+fRWKzarNxOyKWMFFBGmzSD
 ol0dClOBmJDsUstA=
X-Received: by 2002:adf:fb43:: with SMTP id c3mr35447176wrs.360.1619604859334; 
 Wed, 28 Apr 2021 03:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGVQI29MKXDqg/t3HfK5XzKXBDoIWmzZ895DWVi+0PeN+ujEL+ApmuEhjVW1f4Mim475/OBQ==
X-Received: by 2002:adf:fb43:: with SMTP id c3mr35447161wrs.360.1619604859131; 
 Wed, 28 Apr 2021 03:14:19 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id c77sm3288287wme.37.2021.04.28.03.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:14:18 -0700 (PDT)
Date: Wed, 28 Apr 2021 06:14:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
Message-ID: <20210428061348-mutt-send-email-mst@kernel.org>
References: <20210427135147.111218-1-lvivier@redhat.com>
 <YIgZetbn+10YDdeu@work-vm>
MIME-Version: 1.0
In-Reply-To: <YIgZetbn+10YDdeu@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 03:02:34PM +0100, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
> > In the failover case configuration, virtio_net_device_realize() uses an
> > add_migration_state_change_notifier() to add a state notifier, but this
> > notifier is not removed by the unrealize function when the virtio-net
> > card is unplugged.
> > 
> > If the card is unplugged and a migration is started, the notifier is
> > called and as it is not valid anymore QEMU crashes.
> > 
> > This patch fixes the problem by adding the
> > remove_migration_state_change_notifier() in virtio_net_device_unrealize().
> > 
> > The problem can be reproduced with:
> > 
> >   $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
> >     -device pcie-root-port,slot=4,id=root1 \
> >     -device pcie-root-port,slot=5,id=root2 \
> >     -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
> >     -monitor stdio disk.qcow2
> >   (qemu) device_del net1
> >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > 
> >   Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
> >   0x0000000000000000 in ?? ()
> >   (gdb) bt
> >   #0  0x0000000000000000 in  ()
> >   #1  0x0000555555d726d7 in notifier_list_notify (...)
> >       at .../util/notify.c:39
> >   #2  0x0000555555842c1a in migrate_fd_connect (...)
> >       at .../migration/migration.c:3975
> >   #3  0x0000555555950f7d in migration_channel_connect (...)
> >       error@entry=0x0) at .../migration/channel.c:107
> >   #4  0x0000555555910922 in exec_start_outgoing_migration (...)
> >       at .../migration/exec.c:42
> > 
> > Reported-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Yep, I think that's OK.
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

net stuff so I expect Jason will merge this ...

> > ---
> >  hw/net/virtio-net.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 66b9ff451185..914051feb75b 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3373,6 +3373,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
> >  
> >      if (n->failover) {
> >          device_listener_unregister(&n->primary_listener);
> > +        remove_migration_state_change_notifier(&n->migration_state);
> >      }
> >  
> >      max_queues = n->multiqueue ? n->max_queues : 1;
> > -- 
> > 2.30.2
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


