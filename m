Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64526A1F0A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaRJ-00011a-B0; Fri, 24 Feb 2023 10:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVaR9-0000vu-63
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:56:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVaR6-000658-QQ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677254200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBPQFHNc52m7spZH1NqsUvG+UGFSfDXTDBJQXvNndas=;
 b=eytPdPOySOttmw9J1DPCivDYGbsKn4bVHhhhX9Xi6y0+dkBK3CPpQcwq9G8QBjxGq7gQhj
 OxqnNq1wfmZL61FHVPRC0RDTHSLUgRxAxvOBgKZ5Sb41dIBKNWTgevZwT8wnXQcQJ+xw0n
 HdlLl5o++3ib4HfFfizWunzQm6roy6k=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-GW91DQrFOVyLB_wHCcR1DA-1; Fri, 24 Feb 2023 10:56:38 -0500
X-MC-Unique: GW91DQrFOVyLB_wHCcR1DA-1
Received: by mail-io1-f69.google.com with SMTP id
 207-20020a6b14d8000000b0074ca9a558feso2149803iou.5
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBPQFHNc52m7spZH1NqsUvG+UGFSfDXTDBJQXvNndas=;
 b=fwPSdnol04yPvS7qq8+i1X6Qfe1BOVFo4DP9d56kxTvbSXguHkNWDnKLzbA58jxSEo
 2V4EWRAt6gO4TRRhRHhfild6Um6jITXS5ddw8zfS3y/MN7hwrjczxEcOR58qMYaLnLmi
 0g8AfAVHGctd69W1WgWIDqAaUNTs/hgdRBaVW+zS137YLnWdmHn3bzH9URnLcKaynAWg
 dFLFJ2U3xfUi9+pY5/vXCiuwA983ytZxisAld9M7MOM2w7pBT8I0uy+GDnL4u12GgjtX
 g4wp+bJt/Y4y7HYY/MQKvHVEqreQeZ68yOKf4kGWZ+JYE3fDAWskvtezMuIry6jDNH9A
 px+A==
X-Gm-Message-State: AO0yUKXhlrQ/jyz1oPInm+pu7mrQ+3O71rTm7t/zyT4ikJnahVyUd8Uv
 VfveUA3Gz74tYysE66FAjK48/m0SVFFe6KCR9Mrhnf1VuG8SPye8DBIgaEbyzKxokqRBVghv7xB
 OjOoYnr338Z7BQoI=
X-Received: by 2002:a92:5204:0:b0:315:4633:c40b with SMTP id
 g4-20020a925204000000b003154633c40bmr14153884ilb.8.1677254197760; 
 Fri, 24 Feb 2023 07:56:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8Edx/BLcxwccvhrLLic0J2aZJ0wEDJSUAIbtwdCuh7NRqjg8Uh1PtegoezGF1vQ5cEpcnh4Q==
X-Received: by 2002:a92:5204:0:b0:315:4633:c40b with SMTP id
 g4-20020a925204000000b003154633c40bmr14153849ilb.8.1677254197417; 
 Fri, 24 Feb 2023 07:56:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f30-20020a02cade000000b00375147442f3sm4200748jap.16.2023.02.24.07.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:56:36 -0800 (PST)
Date: Fri, 24 Feb 2023 08:56:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yishai Hadas
 <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page
 tracking with vIOMMU
Message-ID: <20230224085634.149e3ad2.alex.williamson@redhat.com>
In-Reply-To: <c66d2d8e-f042-964a-a797-a3d07c260a3b@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
 <20230223153309.298af6e1.alex.williamson@redhat.com>
 <Y/f2CJXGLLAtFezU@nvidia.com>
 <3419a4d1-041f-f4f3-1d7d-ab3608bb54ac@oracle.com>
 <c66d2d8e-f042-964a-a797-a3d07c260a3b@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Fri, 24 Feb 2023 12:53:26 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 24/02/2023 11:25, Joao Martins wrote:
> > On 23/02/2023 23:26, Jason Gunthorpe wrote:  
> >> On Thu, Feb 23, 2023 at 03:33:09PM -0700, Alex Williamson wrote:  
> >>> On Thu, 23 Feb 2023 16:55:54 -0400
> >>> Jason Gunthorpe <jgg@nvidia.com> wrote:  
> >>>> On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
> >>>> Or even better figure out how to get interrupt remapping without IOMMU
> >>>> support :\  
> >>>
> >>> -machine q35,default_bus_bypass_iommu=on,kernel-irqchip=split \
> >>> -device intel-iommu,caching-mode=on,intremap=on  
> >>
> >> Joao?
> >>
> >> If this works lets just block migration if the vIOMMU is turned on..  
> > 
> > At a first glance, this looked like my regular iommu incantation.
> > 
> > But reading the code this ::bypass_iommu (new to me) apparently tells that
> > vIOMMU is bypassed or not for the PCI devices all the way to avoiding
> > enumerating in the IVRS/DMAR ACPI tables. And I see VFIO double-checks whether
> > PCI device is within the IOMMU address space (or bypassed) prior to DMA maps and
> > such.
> > 
> > You can see from the other email that all of the other options in my head were
> > either bit inconvenient or risky. I wasn't aware of this option for what is
> > worth -- much simpler, should work!
> >  
> 
> I say *should*, but on a second thought interrupt remapping may still be
> required to one of these devices that are IOMMU-bypassed. Say to put affinities
> to vcpus above 255? I was trying this out with more than 255 vcpus with a couple
> VFs and at a first glance these VFs fail to probe (these are CX6 VFs).
> 
> It is a working setup without the parameter, but now adding a
> default_bus_bypass_iommu=on fails to init VFs:
> 
> [   32.412733] mlx5_core 0000:00:02.0: Rate limit: 127 rates are supported,
> range: 0Mbps to 97656Mbps
> [   32.416242] mlx5_core 0000:00:02.0: mlx5_load:1204:(pid 3361): Failed to
> alloc IRQs
> [   33.227852] mlx5_core 0000:00:02.0: probe_one:1684:(pid 3361): mlx5_init_one
> failed with error code -19
> [   33.242182] mlx5_core 0000:00:03.0: firmware version: 22.31.1660
> [   33.415876] mlx5_core 0000:00:03.0: Rate limit: 127 rates are supported,
> range: 0Mbps to 97656Mbps
> [   33.448016] mlx5_core 0000:00:03.0: mlx5_load:1204:(pid 3361): Failed to
> alloc IRQs
> [   34.207532] mlx5_core 0000:00:03.0: probe_one:1684:(pid 3361): mlx5_init_one
> failed with error code -19
> 
> I haven't dived yet into why it fails.

Hmm, I was thinking this would only affect DMA, but on second thought
I think the DRHD also describes the interrupt remapping hardware and
while interrupt remapping is an optional feature of the DRHD, DMA
remapping is always supported afaict.  I saw IR vectors in
/proc/interrupts and thought it worked, but indeed an assigned device
is having trouble getting vectors.

> 
> > And avoiding vIOMMU simplifies the whole patchset too, if it's OK to add a live
> > migration blocker if `bypass_iommu` is off for any PCI device.
> >   
> 
> Still we could have for starters a live migration blocker until we revisit the
> vIOMMU case ... should we deem that the default_bus_bypass_iommu=on or the
> others I suggested as non-options?

I'm very uncomfortable presuming a vIOMMU usage model, especially when
it leads to potentially untracked DMA if our assumptions are violated.
We could use a MemoryListener on the IOVA space to record a high level
mark, but we'd need to continue to monitor that mark while we're in
pre-copy and I don't think anyone would agree that a migratable VM can
suddenly become unmigratable due to a random IOVA allocation would be
supportable.  That leads me to think that a machine option to limit the
vIOMMU address space, and testing that against the device prior to
declaring migration support of the device is possibly our best option.

Is that feasible?  Do all the vIOMMU models have a means to limit the
IOVA space?  How does QEMU learn a limit for a given device?  We
probably need to think about whether there are devices that can even
support the guest physical memory ranges when we start relocating RAM
to arbitrary addresses (ex. hypertransport).  Can we infer anything
from the vCPU virtual address space or is that still an unreasonable
range to track for devices?  Thanks,

Alex


