Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA708304000
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:18:58 +0100 (CET)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PBJ-0006oZ-GF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4PAD-0005pL-4W
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4PAA-0004va-UU
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LFwlacptuCgE08Av3UdMWxfcxCb1wEDVrSdSeiuXlWk=;
 b=CMqSZJj31UzOREzKPgrmuv1SjhWKOjWQpTZjJt6A9F5NBSh/aCDKlOHMSNL7bxcYybEntX
 lFU1miyoIGyRDMXSHTaUTvhkiSDwfmqdgls5UrxLI/h7cEvdzcG1AkBRHoHAFLqa8movJB
 wG3193GSiJDFnACf9g52d6zWFZ5mTqk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-Iq1kKSrPOx2vrPVcuiSO5w-1; Tue, 26 Jan 2021 09:17:42 -0500
X-MC-Unique: Iq1kKSrPOx2vrPVcuiSO5w-1
Received: by mail-wm1-f71.google.com with SMTP id h25so1439906wmb.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LFwlacptuCgE08Av3UdMWxfcxCb1wEDVrSdSeiuXlWk=;
 b=Y6kFbKtGKqQeS367T1w5gmSr4mip9my9Yquktb+wUGyay6O6OMj1D/LmUSpqHF19+w
 U3zyrhz2dQVta6DESg5cBfH2UBM52oo0N2UBygbYxdudNi7BLo2ufcwGOuC+AyZanK/i
 xB9HH7OVfEa5bToX9ckQfYCkOdUPMQkrXB3CnvgHvk5rfBObV24kTmYypms5PS+Aw1gr
 Z2l/e/WOU7OT9xMO5945DeX+F4yPCzDKUs97DNHzrRpduWRB9klCNdUqHUct2UEx7ykE
 qONa0N86W+WkycbRXnly55/4nWBB6WeuDQmpi1UTpyw5s32H096eda18NVWggEdpFto5
 eV9w==
X-Gm-Message-State: AOAM5321NSmKU6tLSr9VXnfT7M1VnyT96NXcXEwap5GYtxptfpFvK4rs
 3REFQjHBrgHd47RefXDNZHeiN0krGpPIPRw+Mkt2i3P6pT/5DRCoSzAlbaiQVjhipmjwcHRRa+N
 SHKHShhWTdA0aV+I=
X-Received: by 2002:adf:b519:: with SMTP id a25mr6278157wrd.263.1611670661015; 
 Tue, 26 Jan 2021 06:17:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeAfFjFwy2/R4yDE9ZgjbZ+RDXT4wfVD4y+0t9L9v+y03SHQY5vNst+3F4aR2Nw9EnSmc0Jw==
X-Received: by 2002:adf:b519:: with SMTP id a25mr6278131wrd.263.1611670660845; 
 Tue, 26 Jan 2021 06:17:40 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id w129sm3924024wmb.11.2021.01.26.06.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:17:39 -0800 (PST)
Date: Tue, 26 Jan 2021 09:17:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210126091722-mutt-send-email-mst@kernel.org>
References: <20210108171252.209502-1-sgarzare@redhat.com>
 <20210118160312.GB9899@work-vm>
 <20210119084519.a7lkqmmudu4n4em5@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210119084519.a7lkqmmudu4n4em5@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, mdroth@linux.vnet.ibm.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Jing Zhao <jinzhao@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 09:45:19AM +0100, Stefano Garzarella wrote:
> On Mon, Jan 18, 2021 at 04:03:12PM +0000, Dr. David Alan Gilbert wrote:
> > * Stefano Garzarella (sgarzare@redhat.com) wrote:
> > > Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
> > > set to true by default.
> > > To allow the migration, we set this property to false in the hw_compat,
> > > but in the wrong place (hw_compat_4_1).
> > > 
> > > Since commit 9d7bd0826f was released with QEMU 5.0, we move
> > > 'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
> > > will have the pre-patch behavior and the migration can work.
> > 
> > Be a little careful that fixing this probably causes a migration from
> > 5.2->6.0 to fail with this machine type;  so when we do these
> > type of fixes we often fix an old machine type between some pair of qemu
> > versions and then break it between a different set.
> 
> Good point!
> 
> I did some tests using the example below always using pc-q35-4.2 and it
> seems that works well:
> 
> - 5.2 -> 6.0    pass
> - 5.2 -> 4.2            FAIL
> - 6.0 -> 5.2    pass
> - 6.0 -> 4.2    pass
> - 4.2 -> 5.2    pass
> - 4.2 -> 6.0    pass
> 
> Should I run some more tests?
> 
> Thanks,
> Stefano


dgilbert how about an ack?

> > 
> > Dave
> > 
> > > The issue was discovered with vhost-vsock device and 4.2 machine
> > > type without running any kernel in the VM:
> > >     $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
> > >         -device vhost-vsock-pci,guest-cid=4 \
> > >         -monitor stdio -incoming tcp:0:3333
> > > 
> > >     $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
> > >         -device vhost-vsock-pci,guest-cid=3 \
> > >         -monitor stdio
> > >     (qemu) migrate -d tcp:0:3333
> > > 
> > >     # qemu-4.2 output
> > >     qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
> > >     qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
> > >     qemu-system-x86_64: load of migration failed: No such file or directory
> > > 
> > > Reported-by: Jing Zhao <jinzhao@redhat.com>
> > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
> > > Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
> > > Cc: mdroth@linux.vnet.ibm.com
> > > CC: qemu-stable@nongnu.org
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > >  hw/core/machine.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index de3b8f1b31..5d6163ab70 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
> > >      { "qxl", "revision", "4" },
> > >      { "qxl-vga", "revision", "4" },
> > >      { "fw_cfg", "acpi-mr-restore", "false" },
> > > +    { "virtio-device", "use-disabled-flag", "false" },
> > >  };
> > >  const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
> > > 
> > >  GlobalProperty hw_compat_4_1[] = {
> > >      { "virtio-pci", "x-pcie-flr-init", "off" },
> > > -    { "virtio-device", "use-disabled-flag", "false" },
> > >  };
> > >  const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
> > > 
> > > --
> > > 2.26.2
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 


