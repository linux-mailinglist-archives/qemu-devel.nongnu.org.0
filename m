Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512365234D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:00:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e5l-0004T9-8E; Tue, 20 Dec 2022 09:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7e5i-0004O9-Pz
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7e5h-00054W-AS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5JOjQ8Enft7RihZTm4+0dpJWjCA94F3I3MtLy5IAIA=;
 b=Vcj3OdvTZ5Mo7YCe1ML4xAufhvJIIf7w+qoL8NnbHB4zwOXh2pAc5XxTa5YBCcfylManJ/
 l+36nEiEuK62vpO5I20qRng6IVVDlGYgDic897YDVZUvcFbsa71wKfnVuk98iQlyWbq3oU
 kNHAPYPXrad3LiUJLH0BrKC+UongcKU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-01WVQRSbM3638qa68ekGKQ-1; Tue, 20 Dec 2022 09:59:34 -0500
X-MC-Unique: 01WVQRSbM3638qa68ekGKQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 br6-20020a05620a460600b007021e1a5c48so9473631qkb.6
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5JOjQ8Enft7RihZTm4+0dpJWjCA94F3I3MtLy5IAIA=;
 b=WNc/x5yXLYhRsKj/ug4RlHUAdSHJ3JGaxUdxicNls6jc298FRdRg6OAyOVDRpJ6FQ3
 dxqPKnVERHZ+9/THKxgrj05jr6quLHKOem4iBLa/sv/3NPFPcg61dJxa95kj9u/LIuNx
 5Wyp/BrGjL2i0rRd8obVL44KkS1FKqq609I6yHgMG5PqS6xmnYE4Wfe9JcrrJSb0lPIp
 IG69wi77g/Q6qhyEI42Y13/JA1pl4AJwHcd7ACIGnR2USpBLOZAwGjzfQ3NxKus22rF9
 hh8iZ9AljxuFWeSYd6IqSioBxtuEKUmwowPv761owDbZ4Nc5qLjXn8kt5NOQizR2PE2m
 nDPA==
X-Gm-Message-State: ANoB5pmUT0ZHdt+Ssn5tYAobaAsk2TqafxKajbqMDDeGeGiKCb/GGoxi
 38YEvVldxVjU41+sXX4lD7Sm1GOA7sUsOOpvWZ3HAHIARKm/kxvS1MLu4ZzXXGT0Ay8uZDbf+LB
 S6lJXLaCrT0hyBTc=
X-Received: by 2002:a05:6214:5e84:b0:4c7:4e21:fc95 with SMTP id
 mm4-20020a0562145e8400b004c74e21fc95mr61496887qvb.40.1671548374284; 
 Tue, 20 Dec 2022 06:59:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf58i8e+vOCweUArizZ5E0fVOyKYF4FyxNI0pK+2Y4KNspi+gpR6ObBG46BvICpkMX/C29eF4g==
X-Received: by 2002:a05:6214:5e84:b0:4c7:4e21:fc95 with SMTP id
 mm4-20020a0562145e8400b004c74e21fc95mr61496859qvb.40.1671548373956; 
 Tue, 20 Dec 2022 06:59:33 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a408900b006cfc9846594sm8940437qko.93.2022.12.20.06.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 06:59:33 -0800 (PST)
Date: Tue, 20 Dec 2022 09:59:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Message-ID: <20221220095908-mutt-send-email-mst@kernel.org>
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n>
 <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
 <Y5H7fu2ikdXU8b3i@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5H7fu2ikdXU8b3i@x1n>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Dec 08, 2022 at 09:58:06AM -0500, Peter Xu wrote:
> On Thu, Dec 08, 2022 at 08:48:09AM +0100, Eric Auger wrote:
> > Hi Peter,
> 
> Hi, Eric,
> 
> > 
> > On 12/8/22 00:49, Peter Xu wrote:
> > > Hi, Eric,
> > >
> > > On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
> > >> When assigning VFIO devices protected by a virtio-iommu we need to replay
> > >> the mappings when adding a new IOMMU MR and when attaching a device to
> > >> a domain. While we do a "remap" we currently fail to first unmap the
> > >> existing IOVA mapping and just map the new one. With some device/group
> > >> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
> > >> ranges onto existing ones.
> > > I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
> > > we were working on the vt-d replay for vfio.  The issue is whether DMA can
> > > happen right after UNMAP but before MAP of the same page if the page was
> > > always mapped.
> > 
> > I don't think it can race because a mutex is hold while doing the
> > virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
> > map, unmap), see virtio_iommu_handle_command.
> > So I think it is safe.
> 
> It's not the race in the code, it's the race between modifying host IOMMU
> pgtable with DMA happening in parallel.  The bug triggered with DMA_MAP
> returning -EEXIST means there's existing mapping.
> 
> If during replay there's mapped ranges and the ranges are prone to DMA,
> then IIUC it can happen.
> 
> I didn't really check specifically for virtio-iommu and I mostly forget the
> details, just to raise this up.  It's possible for some reason it just
> can't trigger.  VT-d definitely can, in which case we'll see DMA errors on
> the host from the assigned device when the DMA triggers during the "unmap
> and map" window.
> 
> Thanks,

Eric any resolution on this?

> -- 
> Peter Xu


