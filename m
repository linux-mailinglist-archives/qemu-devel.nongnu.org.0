Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C92F9EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:53:19 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1T5y-000591-Br
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l1T4U-0004Yt-6Y
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l1T4O-0000a5-EX
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610970696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=po/pEvlyFfskwOnG1hhWBLICkFy4+kTsWRkZ8LrDnbc=;
 b=f0yoe8Y4fxLOzB+w1yME+wTupEUAluJeTBS9SL6BHvL815ox3GABGyUBnMCTfS2Uljyoc8
 L0EIiwcDAnbjrYFEcAFVuFuwTstaPFH+vpvQgpg4wCaT0E4H4bE8DuYTYyE3G9KeSe8rug
 EwtsMoYsiCaWS8Qp1wOp6zGTjDW5rfM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-ARgDJdM4Ouq39208Rf6zpQ-1; Mon, 18 Jan 2021 06:51:34 -0500
X-MC-Unique: ARgDJdM4Ouq39208Rf6zpQ-1
Received: by mail-wr1-f71.google.com with SMTP id n11so8163524wro.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 03:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=po/pEvlyFfskwOnG1hhWBLICkFy4+kTsWRkZ8LrDnbc=;
 b=bXkeu2qaPLTWINCrcDMf/S769EMmLoeh/FsHk8RTuZlkpxmuYt5tFxo6nblCty6mZt
 E6FhX3asmS+1tck3uM5Eqz7ndbwTv4oc2/gvL9eGOxrBsN9G2OqomitIZm3N7uv25i30
 dU/4bZ2XOS5eThAq06mZgmmLgInIOmwqQunbmRrsg90IRg8PqWlzW3MmEhDYX2gSKQ8I
 hmUsXdgmy1ysn/DidzaLA9GhI8P6xKHwzYBKc+Cb9gMZMdyr5MV0uvoHLPRnfXSsEHeh
 pUQWMkCa5WIH/hubDiIyE9q8uHlVtDoW3sDBkQYkVhhP5Y8xJsnY/pPr1FHbEitgToTU
 FBAw==
X-Gm-Message-State: AOAM5310dO8DArPLiJFpdByCrWWqdNRVd4M+nKsSTwN1NgGlE8wKGR5G
 DgDGTw7mffw5QTBxEq4btV+jW2TKNiz/KMR23FEAHddiUcYGxUYpGXtL3bcJ42uEEqUvxQfb/Op
 Jxk3CDNLJ/DotcTI=
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr24762429wrv.375.1610970693644; 
 Mon, 18 Jan 2021 03:51:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8vgj1UVIowPqpfvyRym4ne5k/EUjuZecixUHbf43TpfQKNtPF08OjL9VohIZktaEpu6LpfA==
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr24762418wrv.375.1610970693509; 
 Mon, 18 Jan 2021 03:51:33 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id c190sm25093255wme.19.2021.01.18.03.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 03:51:32 -0800 (PST)
Date: Mon, 18 Jan 2021 06:51:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210118065114-mutt-send-email-mst@kernel.org>
References: <20210108171252.209502-1-sgarzare@redhat.com>
 <20210118091955.4iqfrbfpj6jyjzb2@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210118091955.4iqfrbfpj6jyjzb2@steredhat>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, Jing Zhao <jinzhao@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

queued, thanks!

On Mon, Jan 18, 2021 at 10:19:55AM +0100, Stefano Garzarella wrote:
> Ping :-)
> 
> On Fri, Jan 08, 2021 at 06:12:52PM +0100, Stefano Garzarella wrote:
> > Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
> > set to true by default.
> > To allow the migration, we set this property to false in the hw_compat,
> > but in the wrong place (hw_compat_4_1).
> > 
> > Since commit 9d7bd0826f was released with QEMU 5.0, we move
> > 'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
> > will have the pre-patch behavior and the migration can work.
> > 
> > The issue was discovered with vhost-vsock device and 4.2 machine
> > type without running any kernel in the VM:
> >    $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
> >        -device vhost-vsock-pci,guest-cid=4 \
> >        -monitor stdio -incoming tcp:0:3333
> > 
> >    $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
> >        -device vhost-vsock-pci,guest-cid=3 \
> >        -monitor stdio
> >    (qemu) migrate -d tcp:0:3333
> > 
> >    # qemu-4.2 output
> >    qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
> >    qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
> >    qemu-system-x86_64: load of migration failed: No such file or directory
> > 
> > Reported-by: Jing Zhao <jinzhao@redhat.com>
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
> > Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
> > Cc: mdroth@linux.vnet.ibm.com
> > CC: qemu-stable@nongnu.org
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > hw/core/machine.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index de3b8f1b31..5d6163ab70 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
> >     { "qxl", "revision", "4" },
> >     { "qxl-vga", "revision", "4" },
> >     { "fw_cfg", "acpi-mr-restore", "false" },
> > +    { "virtio-device", "use-disabled-flag", "false" },
> > };
> > const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
> > 
> > GlobalProperty hw_compat_4_1[] = {
> >     { "virtio-pci", "x-pcie-flr-init", "off" },
> > -    { "virtio-device", "use-disabled-flag", "false" },
> > };
> > const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
> > 
> > -- 
> > 2.26.2
> > 
> > 


