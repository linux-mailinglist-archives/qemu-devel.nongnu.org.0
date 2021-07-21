Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F853D0C9E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:59:18 +0200 (CEST)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69wb-000430-My
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m69fR-0005p0-Lr
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m69fP-00082E-J5
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626864090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ocddy8+CPHKWHZcn1Sf6r/XWtKbpqUdUo3Hn6jmDago=;
 b=dm1gD/w6DCa2ibjIMBCp4c2XBpWTOXj3YjuozGYBg3tkAfemFxUb6ypxwe19EhVnAOcZYK
 rVqwTBn7MTKy1jki+mKkwuT0sJcjCxEHmASsP3rybvY45EWpJpi0ExgocmIYiR/ZhUusgx
 XoTgjMSCfxqO+T7B8aVxWpDpxyqOs2I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-837zB3D8MJmTRYwNtp068Q-1; Wed, 21 Jul 2021 06:41:29 -0400
X-MC-Unique: 837zB3D8MJmTRYwNtp068Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 x1-20020aa7dac10000b02903b8906e05b4so832396eds.19
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ocddy8+CPHKWHZcn1Sf6r/XWtKbpqUdUo3Hn6jmDago=;
 b=s9YTrOmtTr4G+6xD4JH/nivuWb73z5HgJkZx3WdcblMthkkIpp+jKucV3nxgAZXmLP
 iPCYwjp06l5tM5plBHQTTOEdH/FFqAZWA3RFh2TfUlDRAeEMAAO284KBzh+nbwmVE1yu
 zbzC0hTWTtoviCbruwTn5bMUX3tadBl5+Yr8N7R/1TXEAILhyXMWLost4l2NlJpitlTa
 w7IaQNGknKfxCUAz8PQNUseS+cZOunx3SC3Bk29hY5Q4jsTC7CtJpMpavYTsVRNTyQW4
 pkbfDFjjLZgWFRwoqQ1AJMhGoTgZaSgAyop4ob8+dEZeTjmf9QjFNlTl5vKe0Z6aVT9m
 uWWg==
X-Gm-Message-State: AOAM5336lbyymCYMxKwTwYdjjLLFXsy46YuQPUKLeJnNAADNfCbicEcJ
 KaTPh5oZpHulSiKE7i3BjvByC/GI2s/z/AXxslxKEyL5x6akXomchQK7vivRw6vQVGTcfNNanmi
 JvUNBuGOvhbyaasI=
X-Received: by 2002:a50:baa4:: with SMTP id x33mr28068338ede.259.1626864087986; 
 Wed, 21 Jul 2021 03:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPMTimgvfsZ6LFqZpt7hQZnZGj56DtfkMc3JYtHdLb9qWjTdV2SUtpMRwdbfZa1kO25Wq8xg==
X-Received: by 2002:a50:baa4:: with SMTP id x33mr28068330ede.259.1626864087859; 
 Wed, 21 Jul 2021 03:41:27 -0700 (PDT)
Received: from redhat.com ([2.55.134.65])
 by smtp.gmail.com with ESMTPSA id d2sm8109580ejo.13.2021.07.21.03.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:41:24 -0700 (PDT)
Date: Wed, 21 Jul 2021 06:41:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] failover: unregister ram on unplug
Message-ID: <20210721062035-mutt-send-email-mst@kernel.org>
References: <20210720181644.196315-1-lvivier@redhat.com>
 <20210721105817.0a4afc21@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721105817.0a4afc21@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 10:58:17AM +0200, Igor Mammedov wrote:
> On Tue, 20 Jul 2021 20:16:44 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
> > This simple change allows to test failover with a simulated device
> > like e1000e rather than a vfio device.
> > 
> > This is interesting to developers that want to test failover on
> > a system with no vfio device. Moreover it simplifies host networking
> > configuration as we can use the same bridge for virtio-net and
> > the other failover networking device.
> > 
> > Without this change the migration of a system configured with failover
> > fails with:
> > 
> >   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
> >   error while loading state for instance 0x0 of device 'ram'
> >   load of migration failed: Invalid argument
> > 
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> > ---
> >  hw/net/virtio-net.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 16d20cdee52a..8f7735bad4f2 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3256,6 +3256,9 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
> >      if (migration_in_setup(s) && !should_be_hidden) {
> >          if (failover_unplug_primary(n, dev)) {
> >              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
> > +            if (PCI_DEVICE(dev)->has_rom) {


Hmm. Any way to hide this behind an interface so
we don't need to poke at pci device internals?

> > +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom , dev);
> > +            }
> >              qapi_event_send_unplug_primary(dev->id);
> >              qatomic_set(&n->failover_primary_hidden, true);
> >          } else {


