Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B115C30CFB3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:11:32 +0100 (CET)
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74pX-0002tk-QZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74ky-0006zn-4H
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74kv-0006fy-E1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612307204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KSfjQfYosjGVs5adfqb0CwrgYcOVqj1G3Vu5zh9QTE=;
 b=PVCnbQ2a0vrlMYhd0L4qIqJo6SrC4CiycjdwTErb613KIv8dqzTSDgFuP0Vw7HMa7r1LbK
 ioVIngVbr6qIRaIZ3h35ZBpY6+7WG4Q/EsvOUNwcjITb7gTs8tSO82Aq+hx2iEernH7T2O
 +y9d/V9/ZuPJBJ1BW7lXDylTJ0k06hc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-CvTGp1p9MoWtgTillkV1mg-1; Tue, 02 Feb 2021 18:06:42 -0500
X-MC-Unique: CvTGp1p9MoWtgTillkV1mg-1
Received: by mail-wr1-f72.google.com with SMTP id p16so13010002wrx.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 15:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0KSfjQfYosjGVs5adfqb0CwrgYcOVqj1G3Vu5zh9QTE=;
 b=df+J1nwemv5/YJxd/+5MFcIQ84y7+UDOUI7uBi/UjUFuOIMvN+CwWkpO43Yeq2E2t2
 22JHycwqhg7wsCFPHuPZ9Fw10sol6Olz05SRxM0BSCw5/2lfuDdU0Rm0f8QBVgcR6Lom
 8UOMtkLfXHvNWPkPWIg5s0+tq6OCSYElJVFOOUWkABehcMAOf6Y+wOKn1MpTKKFyrJFw
 RdwfTR3JQ61BXTKiQzvybFMXQimUarUKoIIRnBgvIYFhkdRu4WV2NFKULd92lR4t94dA
 ijYnUqHcwhQP15MjU3ec1Nc+KKSX3h47/m/6Eqr9p/or13CErAQm5LlKeTUgMxlhob6U
 QglQ==
X-Gm-Message-State: AOAM531BpVuVIdyPxTp/F3adVKzWKSBqzgRfzLbGjnv4qcy6s+hRgIBb
 WrvPpQRUL/rzSguKTuRj0sM2fDZmxKLlz/7Eh4mgpY7tfy8pWX7NO6CNtocZXh+vJY5SuAGrB/C
 mxDjD74a8uUeB+rE=
X-Received: by 2002:a1c:b7d6:: with SMTP id h205mr254147wmf.78.1612307200978; 
 Tue, 02 Feb 2021 15:06:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCjhwg0fCg5LR20GcufnnWICqfC8Sio35oifdTza+f/QUYfxnR+2PgVDu9q1RaLrDdl3XMgA==
X-Received: by 2002:a1c:b7d6:: with SMTP id h205mr254028wmf.78.1612307198961; 
 Tue, 02 Feb 2021 15:06:38 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id 35sm56258wrn.42.2021.02.02.15.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 15:06:38 -0800 (PST)
Date: Tue, 2 Feb 2021 18:06:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 12/13] confidential guest support: Alter virtio
 default properties for protected guests
Message-ID: <20210202180328-mutt-send-email-mst@kernel.org>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
 <20210202041315.196530-13-david@gibson.dropbear.id.au>
MIME-Version: 1.0
In-Reply-To: <20210202041315.196530-13-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, mtosatti@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, borntraeger@de.ibm.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 03:13:14PM +1100, David Gibson wrote:
> The default behaviour for virtio devices is not to use the platforms normal
> DMA paths, but instead to use the fact that it's running in a hypervisor
> to directly access guest memory.  That doesn't work if the guest's memory
> is protected from hypervisor access, such as with AMD's SEV or POWER's PEF.
> 
> So, if a confidential guest mechanism is enabled, then apply the
> iommu_platform=on option so it will go through normal DMA mechanisms.
> Those will presumably have some way of marking memory as shared with
> the hypervisor or hardware so that DMA will work.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>


> ---
>  hw/core/machine.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 94194ab82d..497949899b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -33,6 +33,8 @@
>  #include "migration/global_state.h"
>  #include "migration/vmstate.h"
>  #include "exec/confidential-guest-support.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-pci.h"
>  
>  GlobalProperty hw_compat_5_2[] = {};
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> @@ -1196,6 +1198,17 @@ void machine_run_board_init(MachineState *machine)
>           * areas.
>           */
>          machine_set_mem_merge(OBJECT(machine), false, &error_abort);
> +
> +        /*
> +         * Virtio devices can't count on directly accessing guest
> +         * memory, so they need iommu_platform=on to use normal DMA
> +         * mechanisms.  That requires also disabling legacy virtio
> +         * support for those virtio pci devices which allow it.
> +         */
> +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-legacy",
> +                                   "on", true);
> +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_platform",
> +                                   "on", false);

So overriding a boolean property always poses a problem:
if user does set iommu_platform=off we are ignoring this
silently.

Can we change iommu_platform to on/off/auto? Then we can
change how does auto behave.

Bonus points for adding "access_platform" and making it
a synonym of platform_iommu.

>      }
>  
>      machine_class->init(machine);
> -- 
> 2.29.2


