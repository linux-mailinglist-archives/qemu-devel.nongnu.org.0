Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB0686E51
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNI4W-0006w0-BB; Wed, 01 Feb 2023 13:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pNI4T-0006vX-V5
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:43:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pNI4S-0001Re-6P
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675276978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rl0eURWPHJpYGW3Yj2fwysEW5fbYyilqODOcuk24aus=;
 b=RGAc2tPd3dTnN8GDs49/sKBhL3LG8QgH4/ke8mC+CK55JOFK+RPTvlc2qDet+iRCPATeLe
 +g3qeizohVcNIZzQ1wQlE9mFa+CsJ9QWpPOKV8JJMGuP68vzykCpKAvpnX9GRb6gXVNmmS
 RdS42ynKX/jF3jcXbpd4sCwcH4ISuSk=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-ZSr6Ij0rMUG2Q1g3iTCGFQ-1; Wed, 01 Feb 2023 13:42:49 -0500
X-MC-Unique: ZSr6Ij0rMUG2Q1g3iTCGFQ-1
Received: by mail-io1-f72.google.com with SMTP id
 q3-20020a5edb03000000b00725625524e5so1100052iop.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rl0eURWPHJpYGW3Yj2fwysEW5fbYyilqODOcuk24aus=;
 b=U9Abtzl1bDvOvQ+ZBYD3G+7Vy4bXJU/CxB1LugtbJlryKePP7J06OnEvGx4/TgFnfv
 ZH20d1g2t6fD6y+JcY5ihPtZJkNBoYj6g++RpcFiMvME8SkrYcLVsBfGJaNLg9uiFzqi
 u0Fql8qXy6f8hWxIzqkecHezKX3E/6L0+miIyrY7hYcEvlfNwbP5Drr+hoHowFsW56wm
 OiGxhMxQI3rkIdR/XxQ+Km20Vzsw8i5nj9A02aOK7AtxLXDz5P6R1fW7Gqs26GrCfF3n
 iZF6+1VwICucwkF9C54Yf1173eLfFuA965JyGNniideCpTNrlNTaKG8ds+nSBLDdtaJa
 ccsw==
X-Gm-Message-State: AO0yUKUlVIRjRCS+1zD2WNdy8g6wZDaOCae1r22Y9QezcTdtHDqm7Uq0
 NHO3/jUmpuiwulvlmc3F+KASEl4GKhRVH/5WLlFdtGbil1oQiJqz2pHV/+qSoTmz/DgPY6tqaeD
 6QBuXaS7mup5DTS0=
X-Received: by 2002:a5d:890a:0:b0:719:25b3:3db0 with SMTP id
 b10-20020a5d890a000000b0071925b33db0mr1941988ion.14.1675276968846; 
 Wed, 01 Feb 2023 10:42:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/9TWfbbfcExYnD/yegm9R+I+hVsobZcxIeBZ90OCjHEroy6cBjgVHjlMGay5CkocdjI8Mmkw==
X-Received: by 2002:a5d:890a:0:b0:719:25b3:3db0 with SMTP id
 b10-20020a5d890a000000b0071925b33db0mr1941979ion.14.1675276968564; 
 Wed, 01 Feb 2023 10:42:48 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o17-20020a056602125100b0071b3d353401sm3286135iou.33.2023.02.01.10.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 10:42:47 -0800 (PST)
Date: Wed, 1 Feb 2023 11:42:46 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Message-ID: <20230201114246.12d659d3.alex.williamson@redhat.com>
In-Reply-To: <Y9qhSK9ivzBmhnpZ@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
 <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
 <20230131154301.4aaa8448.alex.williamson@redhat.com>
 <Y9mkbLczUb2LFb1o@nvidia.com>
 <20230131211503.3a328e0a.alex.williamson@redhat.com>
 <Y9qhSK9ivzBmhnpZ@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

On Wed, 1 Feb 2023 13:28:40 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Jan 31, 2023 at 09:15:03PM -0700, Alex Williamson wrote:
> 
> > > IMHO this is generally the way forward to do multi-device as well,
> > > remove the MMIO from all the address maps: VFIO, SW access, all of
> > > them. Nothing can touch MMIO except for the vCPU.  
> > 
> > Are you suggesting this relative to migration or in general?    
> 
> I would suggest a general qemu p2p on/off option.
> 
> > P2P is a feature with tangible benefits and real use cases.  Real
> > systems seem to be moving towards making P2P work better, so it
> > would seem short sighted to move to and enforce only configurations
> > w/o P2P in QEMU generally.    
> 
> qemu needs to support it, but it should be a user option option.
> 
> Every system I've been involved with for enabling P2P into a VM has
> been a total nightmare. This is not something you just turn on and it
> works great :\ The whole thing was carefully engineered right down to
> the BIOS to be able to work safely.
> 
> P2P in baremetal is much easier compared to P2P inside a VM.
> 
> > Besides, this would require some sort of deprecation, so are we
> > intending to make users choose between migration and P2P?  
> 
> Give qemu an option 'p2p on/p2p off' and default it to on for
> backwards compatability.
> 
> If p2p on and migration devices don't support P2P states then
> migration is disabled. The user made this choice when they bought
> un-capable HW.
> 
> Log warnings to make it more discoverable. I think with the cdev
> patches we can make it so libvirt can query the device FD for
> capabilities to be even cleaner.
> 
> If user sets 'p2p off' then migration works with all HW.
> 
> p2p on/off is a global switch. With p2p off nothing, no HW or SW or
> hybrid device, can touch the MMIO memory.
> 
> 'p2p off' is a valuable option in its own right because this stuff
> doesn't work reliably and is actively dangerous. Did you know you can
> hard crash the bare metal from a guest on some platforms with P2P
> operations? Yikes. If you don't need to use it turn it off and don't
> take the risk.

If we're honest, there are a number of cases of non-exceptional faults
that an assigned device can generate that the platform might escalate
to fatal errors.

> Arguably for this reason 'p2p off' should trend toward the default as
> it is much safer.

Safety in the hands of the userspace to protect the host though?
Shouldn't the opt-in be at the kernel level whether to allow p2p
mappings?  I don't have an issue if QEMU were to mirror this by
creating a RAM-only AddressSpace for devices which would be used when
p2p is disable (it'd save us some headaches for various unaligned
devices as well), but we shouldn't pretend that actually protects the
host.  OTOH, QEMU could feel confident supporting migration of devices
w/o support of the migration P2P states with that restriction.

> > Are we obliged to start with that hardware?  I'm just trying to think
> > about whether a single device restriction is sufficient to prevent any
> > possible P2P or whether there might be an easier starting point for
> > more capable hardware.  There's no shortage of hardware that could
> > support migration given sufficient effort.  Thanks,  
> 
> I think multi-device will likely have some use cases, so I'd like to
> see a path to have support for them. For this series I think it is
> probably fine since it is already 18 patches.

It might be fine for this series because it hasn't yet proposed to make
migration non-experimental, but it's unclear where the goal post is
that we can actually make that transition.

If we restrict migration to a single vfio device, is that enough?
Theoretically it's not, but perhaps in practice... maybe?

Therefore, do we depend on QEMU implementing a new RAM-only AddressSpace
for devices?  What's the path to making it the default?  Maybe there
are other aspects of the VM from which we can infer a preference
towards migration support, ex. 'host' CPU type.

Another option, as previously mentioned, is to start with requiring P2P
migration support both at the device and QEMU, where we only restrict
the set of devices that could initially support migration without
modifying existing behavior of the VM.

In any case, it seems we're a bit further from being able to declare
this as supported than some had hoped.  Thanks,

Alex


