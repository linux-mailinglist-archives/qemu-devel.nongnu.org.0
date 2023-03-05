Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A56AAF06
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 11:27:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYlZB-0007Ew-8b; Sun, 05 Mar 2023 05:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pYlZ9-0007EZ-5j
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 05:26:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pYlZ4-0002jx-HK
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 05:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678011961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGyyHi6P+HWUT3daphuhNll3VnybjufIzkbL4BmY1JI=;
 b=NM145ndNZHab2qNaHmiwER9viV5Sg56GvaRLy+eCOvrscA1uZkJo8wUtB+/Hwwkkiv0LbB
 uar1FJuxIC1/VvFhLUWiGS6CEINe21rZhIh/0agOaouUqlkLMEEI8nBT8Ml8vvvA3q0id/
 Cl4KWHkAjKL1xr7WFJ+fWWZ65TItj+M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-Lc87l1-qMuSRAtmarDJzYQ-1; Sun, 05 Mar 2023 05:25:59 -0500
X-MC-Unique: Lc87l1-qMuSRAtmarDJzYQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso942641wru.15
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 02:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678011958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGyyHi6P+HWUT3daphuhNll3VnybjufIzkbL4BmY1JI=;
 b=jXGR/TDU6QH1xxaMs7Sw909tUObeykmYZH02W/D6b1PRefnRlRPFsnEVmfdgBpyNVK
 fKPpHdnthXCK+gRANCj2e8ZDrOcPVbrWPW8VncfXrjBqZp6q8EIy9Mn5FfR8x2a1ryLB
 IRyj/jGY+xUrj7SSPn5MXQvDev0ACkblpzHg2czNMiI+Nr9mR/oVSzmHixWT6kp6uG9r
 X8k/CrZ7FpltQmxmTQuKxO8Qp3lKJaREUXC4G/5LKD+VTUw4zQnOYiulg8hOpk6rP9RN
 XngKXnXIkEK36CyL375iD7XyQab7lKOwHtMJG1sQtJjolxOlvcUhUzQ7BAL3ZbymoLHm
 fllg==
X-Gm-Message-State: AO0yUKVvEBI3H3JSJb2UBqglDJvMSS46LQoU68mRz/+nXO0udL7yBW6x
 bWgyohnAghhquMNYV2F2O675P4sBaz9q+7bWrAbbfDToRV5xS40T7c2WPatwPGpIsicy0Kvwyem
 lKTXsXKumrT0X4vI=
X-Received: by 2002:a05:600c:1c20:b0:3eb:3945:d3f9 with SMTP id
 j32-20020a05600c1c2000b003eb3945d3f9mr6755476wms.4.1678011958725; 
 Sun, 05 Mar 2023 02:25:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+CFh3cFlhhtVuYk3BNjRY6Lgukz0wp6kbvQzCASKP6N9SKEnzBXlVoenItaa//fu+j/apzRQ==
X-Received: by 2002:a05:600c:1c20:b0:3eb:3945:d3f9 with SMTP id
 j32-20020a05600c1c2000b003eb3945d3f9mr6755463wms.4.1678011958461; 
 Sun, 05 Mar 2023 02:25:58 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b003e7c89b3514sm10594854wme.23.2023.03.05.02.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 02:25:58 -0800 (PST)
Date: Sun, 5 Mar 2023 05:25:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PULL 14/53] virtio-rng-pci: fix transitional migration compat
 for vectors
Message-ID: <20230305052533-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-15-mst@redhat.com>
 <456fa17c-71b6-8aec-c38c-d7fbc907e150@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <456fa17c-71b6-8aec-c38c-d7fbc907e150@msgid.tls.msk.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, Mar 04, 2023 at 11:03:20PM +0300, Michael Tokarev wrote:
> 02.03.2023 11:25, Michael S. Tsirkin wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > In bad9c5a516 ("virtio-rng-pci: fix migration compat for vectors") I
> > fixed the virtio-rng-pci migration compatibility, but it was discovered
> > that we also need to fix the other aliases of the device for the
> > transitional cases.
> > 
> > Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> > bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Message-Id: <20230207174944.138255-1-dgilbert@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   hw/core/machine.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index f29e700ee4..1cf6822e06 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -47,6 +47,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> >   GlobalProperty hw_compat_7_1[] = {
> >       { "virtio-device", "queue_reset", "false" },
> >       { "virtio-rng-pci", "vectors", "0" },
> > +    { "virtio-rng-pci-transitional", "vectors", "0" },
> > +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
> >   };
> 
> If we consider this one for 7.2 stable, the previous change here, which
> added "virtio-rng-pci" right before the lines being added, should also
> be picked up, which is bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a:
>  From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>  Date: Mon, 9 Jan 2023 10:58:09 +0000
>  Subject: virtio-rng-pci: fix migration compat for vectors
> 
> Should the two both be included in -stable, or both omitted?
> 
> Thanks,
> 
> /mjt

I'd say include.

-- 
MST


