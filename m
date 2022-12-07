Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1D646570
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:51:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p34Ao-0006d1-EK; Wed, 07 Dec 2022 18:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p34Al-0006cL-NU
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:49:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p34Ah-0006lZ-OJ
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670456990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKc3D/bbj9By1d2/gb02fwFAOZysrGX1sWKaAOzWOSQ=;
 b=Heueythl89iqATcVNZ70eyG3+Za7ErwPyvRqTbyMX+HDcs1tKyugPIqGIc5ExOT2J33Zo8
 ELzhyKiDKG7mupPs6x/1Jak4/BUqZor2cK4Q9/X9H9zT5yAjVibd4ERHauchaF0y60AHb0
 EIu2EA4vaAE98zw8llHRVACJi1NX5o8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-d1OO1CBIOvS2MViliLRj3g-1; Wed, 07 Dec 2022 18:49:49 -0500
X-MC-Unique: d1OO1CBIOvS2MViliLRj3g-1
Received: by mail-qk1-f198.google.com with SMTP id
 bm39-20020a05620a19a700b006fca217dc54so26825037qkb.16
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKc3D/bbj9By1d2/gb02fwFAOZysrGX1sWKaAOzWOSQ=;
 b=aklVvDrN5RXH5zQ/zYgecOEyOEZoUbhqIvyaj305tWmaHvh0AprLswsi2IaPYnB//g
 fbC4PEMxDiTHvaZvjADMlIm7y6pvzzZu6Tc8bpxfnM5ousrnFvRFrddtOpfjH3rER58c
 aGzwa40oiWMdRs5AOfFyRdyDk3TtuDCzlyeo0B/2ZCTc9a6UyjsYEO1tHlI6wa49eSHT
 QpP7DAYoGevH5+83llCw91zFXjmY0p0IKbnQOPNgfKH0vOUuat+H3lYDxUivPwS62BUI
 jfZhGXcscBf8i2HAA1T30TK0/EtmruR/f39JT2Ak3SBRjWP0lf2WT7gJxwLfvdCyrRTa
 Ke6A==
X-Gm-Message-State: ANoB5ple/2dXPmTuhq1jClVVJtf1G/9LH+dHZ1oE9aM2tjct59mUDxKR
 fV8U3KetH0+AE0ResFRXDekndW5cc9s/QmWqq3aQBxN+vlxnqzBryaMtG1XWbeqsfQj6Eynxe/R
 XxMVIw2+HSS+AT9g=
X-Received: by 2002:a0c:efcf:0:b0:4c7:50b7:8d7f with SMTP id
 a15-20020a0cefcf000000b004c750b78d7fmr1988826qvt.11.1670456988741; 
 Wed, 07 Dec 2022 15:49:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf46OzDiGIJTC9Auni+3szOiRKqT1G3S5PMKg4g7gc5EnP7/HYMOe5Jtjd/XvE3EXQieA8vlvA==
X-Received: by 2002:a0c:efcf:0:b0:4c7:50b7:8d7f with SMTP id
 a15-20020a0cefcf000000b004c750b78d7fmr1988821qvt.11.1670456988502; 
 Wed, 07 Dec 2022 15:49:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 az13-20020a05620a170d00b006feb0007217sm9365576qkb.65.2022.12.07.15.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:49:48 -0800 (PST)
Date: Wed, 7 Dec 2022 18:49:46 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org,
 bharat.bhushan@nxp.com, alex.williamson@redhat.com
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Message-ID: <Y5EmmjKBBnjSlvd+@x1n>
References: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221207133646.635760-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi, Eric,

On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
> When assigning VFIO devices protected by a virtio-iommu we need to replay
> the mappings when adding a new IOMMU MR and when attaching a device to
> a domain. While we do a "remap" we currently fail to first unmap the
> existing IOVA mapping and just map the new one. With some device/group
> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
> ranges onto existing ones.

I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
we were working on the vt-d replay for vfio.  The issue is whether DMA can
happen right after UNMAP but before MAP of the same page if the page was
always mapped.

The vt-d resolved it by using iova_tree so in a replay vt-d knows the page
didn't change, so it avoids unmap+map.  It only notifies newly unmapped or
newly mapped.

Thanks,

-- 
Peter Xu


