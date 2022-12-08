Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C8647256
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IM3-0004t6-Db; Thu, 08 Dec 2022 09:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p3IM1-0004pa-Di
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:58:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p3ILj-0001QQ-G6
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670511490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4RFPA6eEeHI4Jv4yjfcr8VKG9mhfAMp+FIXSx/wsDxM=;
 b=VB0Wjf3J3qr9Nm1LF56FourOboKaHk5vgPSwtYYSFYeI/23YzTOrVCe7ilw5Ak+yx8Be8+
 j8euw+wPApBM7PfX3vMI/HGeaeOITWEgIoWTfuy2vpkLOq7KcskS/8Crm5OiRQGe1Cfm8k
 OP5t3UVqw1BfHh8POODf2ubp/NsI0QU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-540-lLB0ceoIPaOYL1uPObT2mQ-1; Thu, 08 Dec 2022 09:58:09 -0500
X-MC-Unique: lLB0ceoIPaOYL1uPObT2mQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 t21-20020ac86a15000000b003a6c4e80c4bso1590571qtr.7
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RFPA6eEeHI4Jv4yjfcr8VKG9mhfAMp+FIXSx/wsDxM=;
 b=7wzZ07WqBHr6KzvA6gJMmjYgXvX2G+/J+SsMuP+xKg58jKEqbuJ7AlmJUW0EdxxOCQ
 pixo5qzaXtIlXwIaP6sE50cVBJ23d1ItnJd/vqdq9T0F/AzId+LNWfaoyBSgZ1hDWhxJ
 Cddnt+RaB7VWTy5jfgJRAkm5pTxzb7WbmPE8esrwrhEM9Cqnn4dyTZ++CrwqqhFP8113
 yez0ptmKBfEsSZ3d/jiyoIu+rqTB9/o9PDOB3tygr8BW4+7H+pwgb0VHlJI1KTL/TAJB
 5emxMm11+L52HWvS2Q6yhs0/Q5oKqFJOIMKZjDfaWy1Zxe+yPj3aL1rneW716O575Y1N
 ES6w==
X-Gm-Message-State: ANoB5pnBNUwyU5sogooV1uz5Aq/izrtqB6BT8skHu7jl0h8MlipNROOp
 c07qe2PxE9inTThMfPQbdJPtLYXXgRV5IyCa1J92mJjHnVb7VdQKTvjfPojctmPzwYsOHep9dp9
 OE0YwsiMWhSKOImo=
X-Received: by 2002:a05:622a:144:b0:3a5:361f:9819 with SMTP id
 v4-20020a05622a014400b003a5361f9819mr4820793qtw.18.1670511488731; 
 Thu, 08 Dec 2022 06:58:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5RTts6o6M28qATCkZQDY0hi9TKYUnT15PiJFa9C9TYmXOQxZ5Cr/F3YDHQbaC7zMB7ZSJpEw==
X-Received: by 2002:a05:622a:144:b0:3a5:361f:9819 with SMTP id
 v4-20020a05622a014400b003a5361f9819mr4820769qtw.18.1670511488474; 
 Thu, 08 Dec 2022 06:58:08 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 s190-20020ae9dec7000000b006f7ee901674sm18683355qkf.2.2022.12.08.06.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 06:58:07 -0800 (PST)
Date: Thu, 8 Dec 2022 09:58:06 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org,
 bharat.bhushan@nxp.com, alex.williamson@redhat.com
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Message-ID: <Y5H7fu2ikdXU8b3i@x1n>
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n>
 <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 08, 2022 at 08:48:09AM +0100, Eric Auger wrote:
> Hi Peter,

Hi, Eric,

> 
> On 12/8/22 00:49, Peter Xu wrote:
> > Hi, Eric,
> >
> > On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
> >> When assigning VFIO devices protected by a virtio-iommu we need to replay
> >> the mappings when adding a new IOMMU MR and when attaching a device to
> >> a domain. While we do a "remap" we currently fail to first unmap the
> >> existing IOVA mapping and just map the new one. With some device/group
> >> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
> >> ranges onto existing ones.
> > I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
> > we were working on the vt-d replay for vfio.  The issue is whether DMA can
> > happen right after UNMAP but before MAP of the same page if the page was
> > always mapped.
> 
> I don't think it can race because a mutex is hold while doing the
> virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
> map, unmap), see virtio_iommu_handle_command.
> So I think it is safe.

It's not the race in the code, it's the race between modifying host IOMMU
pgtable with DMA happening in parallel.  The bug triggered with DMA_MAP
returning -EEXIST means there's existing mapping.

If during replay there's mapped ranges and the ranges are prone to DMA,
then IIUC it can happen.

I didn't really check specifically for virtio-iommu and I mostly forget the
details, just to raise this up.  It's possible for some reason it just
can't trigger.  VT-d definitely can, in which case we'll see DMA errors on
the host from the assigned device when the DMA triggers during the "unmap
and map" window.

Thanks,

-- 
Peter Xu


