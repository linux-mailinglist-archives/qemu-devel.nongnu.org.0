Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1C2C88A2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:54:18 +0100 (CET)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlVJ-0007lM-2U
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kjlU4-0007MG-Qz
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kjlU3-0002xg-7s
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606751578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6V3A19dUMVKaFgWqYyMEhcnyVCXjTZos9V2r8B0o0PE=;
 b=PhkjLxPiWagf8TeeQglt8T3enOrxzlubIBpkW0zQIc0WmRFKwPT4nt3CekHG1ynm+qs0+c
 UylV6oyM5OZTx9eceLiuXYzSTz4yMZD708EcXI/cEKY2InwHTac5QFWWXw9WvJiuWsGHmm
 3ELubGjStkwh27gtHbngFYeTOZiNEWw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-NW_zgKstMpaiZOjWAj1YGQ-1; Mon, 30 Nov 2020 10:52:53 -0500
X-MC-Unique: NW_zgKstMpaiZOjWAj1YGQ-1
Received: by mail-wm1-f71.google.com with SMTP id n18so1203352wmk.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 07:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6V3A19dUMVKaFgWqYyMEhcnyVCXjTZos9V2r8B0o0PE=;
 b=ugvEpQSsiwqdHZObtA4d6O2+ccJWX1X3FONUZ5V+S7CkXrPvNfUYB5sWLN5nzyY/Zi
 oOUjX69K6BKxZmvtuDUmaeJgEsbm/UtsTrhabvdywOVvMdFohvxYMkVUvUHE8qSQzxJR
 WRvDRUp3usGX5D+F8aZoO5fJ1icFjrwao8e045g9RMiTojR0WJ68UKKaDJ50V/YUH0IN
 7E/fNL4/EubA+ixbJHVcTcmxISWMiP1o+UVWoJ+9H+Z/shjcDiu52a4guXpSSYDHNha6
 XtRdqkl3E/wZ+yRKK+Fz91+ggOY82XDPh9QHJv6uZ6MvtZMFX9yw/wvuNvG3Y4z3hB6A
 BEgA==
X-Gm-Message-State: AOAM533oMudJd3q9wiwxI15eygxmL/XOYl8rlN+d6eJ/2dUIWlKhdQbH
 8sB25RQYovgNICh6aUDbXzyaqKQicpKmrKo6FjdGSDRi4h3JBBKsDJA0S0ZBRuVocPbJu+RMKnX
 vUC5BASFvCzi3GNM=
X-Received: by 2002:a5d:56cb:: with SMTP id m11mr30015196wrw.346.1606751571811; 
 Mon, 30 Nov 2020 07:52:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEZi5ruNCXfT4G4Av9Mxa7iCKuGWUKXtrRRnc4H/Kahn4FFYpLMMiAB+ImjkNTS+h9ZpRWvA==
X-Received: by 2002:a5d:56cb:: with SMTP id m11mr30015147wrw.346.1606751571305; 
 Mon, 30 Nov 2020 07:52:51 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id o13sm24016669wmc.44.2020.11.30.07.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:52:50 -0800 (PST)
Date: Mon, 30 Nov 2020 10:52:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH] virtio: reset device on bad guest index in virtio_load()
Message-ID: <20201130105216-mutt-send-email-mst@kernel.org>
References: <20201120185103.GA442386@sent>
 <20201130155113.GA2306699@li1368-133.members.linode.com>
MIME-Version: 1.0
In-Reply-To: <20201130155113.GA2306699@li1368-133.members.linode.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


No, but how about sending the patch to me and the mailing list?
I didn't get it through either channel.

On Mon, Nov 30, 2020 at 03:51:13PM +0000, John Levon wrote:
> On Fri, Nov 20, 2020 at 06:51:07PM +0000, John Levon wrote:
> 
> > If we find a queue with an inconsistent guest index value, explicitly mark the
> > device as needing a reset - and broken - via virtio_error().
> > 
> > There's at least one driver implementation - the virtio-win NetKVM driver - that
> > is able to handle a VIRTIO_CONFIG_S_NEEDS_RESET notification and successfully
> > restore the device to a working state. Other implementations do not correctly
> > handle this, but as the VQ is not in a functional state anyway, this is still
> > worth doing.
> 
> Ping, anyone have issues with doing this?
> 
> cheers
> john
> 
> > Signed-off-by: John Levon <john.levon@nutanix.com>
> > ---
> >  hw/virtio/virtio.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index ceb58fda6c..eff35fab7c 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3161,12 +3161,15 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
> >              nheads = vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_avail_idx;
> >              /* Check it isn't doing strange things with descriptor numbers. */
> >              if (nheads > vdev->vq[i].vring.num) {
> > -                qemu_log_mask(LOG_GUEST_ERROR,
> > -                              "VQ %d size 0x%x Guest index 0x%x "
> > -                              "inconsistent with Host index 0x%x: delta 0x%x",
> > -                              i, vdev->vq[i].vring.num,
> > -                              vring_avail_idx(&vdev->vq[i]),
> > -                              vdev->vq[i].last_avail_idx, nheads);
> > +                virtio_error(vdev, "VQ %d size 0x%x Guest index 0x%x "
> > +                             "inconsistent with Host index 0x%x: delta 0x%x",
> > +                             i, vdev->vq[i].vring.num,
> > +                             vring_avail_idx(&vdev->vq[i]),
> > +                             vdev->vq[i].last_avail_idx, nheads);
> > +                vdev->vq[i].used_idx = 0;
> > +                vdev->vq[i].shadow_avail_idx = 0;
> > +                vdev->vq[i].inuse = 0;
> > +                continue;
> >              }
> >              vdev->vq[i].used_idx = vring_used_idx(&vdev->vq[i]);
> >              vdev->vq[i].shadow_avail_idx = vring_avail_idx(&vdev->vq[i]);


