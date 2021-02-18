Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275231EDBD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:56:34 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnXS-0004Ra-56
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lCnPU-0006VG-Lu
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:48:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lCnPP-0001hQ-NX
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613670491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vaLcHI81bsZGD/eLOp6GXk4o4+/iVT8dFQ95ievPE78=;
 b=YeeJggAw7pQQWIPd7o0QpVclT7zIV6N146TFW6XM7lKC6dvP4KyXL9PXeZNUMJrkbgbP1/
 VGLpOQCIP3J4pUMfE6VF6wT4oILFzyht+kx/bQTLN947E/bXSNluNt2yFALflUZRYuC9Ce
 LOdL3DS6rM4eqUh6x9fdTEGKs4tPqFc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-Y7xB8AqNMUmYogwNXm8aeA-1; Thu, 18 Feb 2021 12:48:07 -0500
X-MC-Unique: Y7xB8AqNMUmYogwNXm8aeA-1
Received: by mail-qk1-f200.google.com with SMTP id r15so1781168qke.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 09:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vaLcHI81bsZGD/eLOp6GXk4o4+/iVT8dFQ95ievPE78=;
 b=TPSvBKg7Wr3f7ZJ2b1ljMhk5v7e8t9o8spJfPfEf98KvES1Xmu0eN4i9+8tLMPpa0u
 BC+7RnaYsINfiMFamGn+2FhQYq+zwRQ1M4mUAlGsE3AZPcOeuAf7D6xJBT2or7w/Dksv
 i/PpjPUZ0Itrq6PZCZX1dMlcMmYCaTQsbGY8hVKaomxYAAnv2c2Dm9CEaSZrDAgxvWaU
 JOWf/uAplS1CAiXw4tnhUJBnkS+y+Hvc4Yy5Rcb4UD1g0hUl6MVTls06+1H1b/fT4AfS
 VAJ/QXgL3fKmQq0RrvtxM4Qe/Ib2BdDiEqN5/lPKrbE9YSeAl3xGZj5Wkh1Xi7G9hy1M
 J8nA==
X-Gm-Message-State: AOAM531WqMSnMUaOjtZ5pQvTBDP9+/YqSSzxJ6QCzcyyJ0G+4ayamyyQ
 F4QCqxlPIX1NuzeNcLwfcEBH3JqLxm5ODnOiOdZWmO5OFc4R8QfFNXpbAJBORE2Dw7330UKzj1z
 YCtnrs0QYBjYPOgg=
X-Received: by 2002:a37:4ecd:: with SMTP id c196mr5327074qkb.264.1613670486556; 
 Thu, 18 Feb 2021 09:48:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd27zMBWXue2vsafxmHsbjxXHGUFoHVZxU89rY6WgYZSmv1Rdn2w48d733AXaxZBLgZHJfVw==
X-Received: by 2002:a37:4ecd:: with SMTP id c196mr5327056qkb.264.1613670486289; 
 Thu, 18 Feb 2021 09:48:06 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id 90sm3841235qtc.86.2021.02.18.09.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 09:48:05 -0800 (PST)
Date: Thu, 18 Feb 2021 12:48:04 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH] virtio-iommu: Handle non power of 2 range invalidations
Message-ID: <20210218174804.GB108961@xz-x1>
References: <20210218141650.424967-1-eric.auger@redhat.com>
 <20210218164203.GA108961@xz-x1>
 <b2781e6b-d3db-8d89-4ae2-f81f12251793@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b2781e6b-d3db-8d89-4ae2-f81f12251793@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, vivek.gautam@arm.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 06:18:22PM +0100, Auger Eric wrote:
> Hi Peter,
> 
> On 2/18/21 5:42 PM, Peter Xu wrote:
> > Eric,
> > 
> > On Thu, Feb 18, 2021 at 03:16:50PM +0100, Eric Auger wrote:
> >> @@ -164,12 +166,27 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
> >>  
> >>      event.type = IOMMU_NOTIFIER_UNMAP;
> >>      event.entry.target_as = &address_space_memory;
> >> -    event.entry.addr_mask = virt_end - virt_start;
> >> -    event.entry.iova = virt_start;
> >>      event.entry.perm = IOMMU_NONE;
> >>      event.entry.translated_addr = 0;
> >> +    event.entry.addr_mask = mask;
> >> +    event.entry.iova = virt_start;
> >>  
> >> -    memory_region_notify_iommu(mr, 0, event);
> >> +    if (mask == UINT64_MAX) {
> >> +        memory_region_notify_iommu(mr, 0, event);
> >> +    }
> >> +
> >> +    size = mask + 1;
> >> +
> >> +    while (size) {
> >> +        uint8_t highest_bit = 64 - clz64(size) - 1;
> > 
> > I'm not sure fetching highest bit would work right. E.g., with start=0x11000
> > and size=0x11000 (then we need to unmap 0x11000-0x22000), current code will
> > first try to invalidate range (0x11000, 0x10000), that seems still invalid
> > since 0x11000 is not aligned to 0x10000 page mask.
> 
> Hum I thought aligning the size was sufficient. Where is it checked exactly?

I don't remember all the context either.. :)

Firstly - It makes sense to do that since hardware does it, and emulation code
would make sense to follow that.

There's some more info where I looked into the src of when vt-d got introduced
with the similar change:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg625340.html

I'm not 100% certain anything will break if we don't use page mask but
arbitrary length as vhost did in iotlb msg.  However what Yan Zhao reported is
definitely worse than that since we (vt-d) used to unmap outside the range of
the range just for page mask alignment.

Thanks,

-- 
Peter Xu


