Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95C332ED8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:17:34 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhrJ-0002nc-Ij
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJfDl-0006EN-Ny
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJfDi-0003aW-QZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615307310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEKs5LEaRlIiCJyZrFMOpaM3dTCR4PQ5MGtnoosh7+o=;
 b=Ll34enNrotwAvYFNLNPBDOwsJVpzq5o7S2pJQ2Q71w2tmmTu8No9qEYkJISolkdbcLmQtP
 hbH2F283vq4CAMFH09f08RAlk8Z6mNInVQTCjoqfnog5sZsC3snxtdoYNiIzgGNEuBSXfY
 j5fnmgu5n5U5wSoVtJvBKwSD/5rpC98=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-orQiJ_RSMpOklnHKnxML3g-1; Tue, 09 Mar 2021 11:28:28 -0500
X-MC-Unique: orQiJ_RSMpOklnHKnxML3g-1
Received: by mail-qv1-f71.google.com with SMTP id d15so10519334qvn.16
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EEKs5LEaRlIiCJyZrFMOpaM3dTCR4PQ5MGtnoosh7+o=;
 b=tS4a86ZrHDAHlw8lKMPiwArHAVR+Ht+qPGxAKDciUZUy3WgIhhjqC4uHBxljQfRN1K
 Fa8IgeZIXBwiuy54KKUBtNm25SA+CXB/+aqdjyY+v4VJvJOQe2nYt0bRodZGJqvkoy6b
 Z9uqGEb+ahiSjHT0dHiRwmPRumBfD2uHjQJrY9kvcAy2Jm+Mu3sAoPlzHcAwjoCkeLMX
 NLG2Nbb+9tkM3vPsy/YYfHoKrZteCLuxIyB4mVZdZomWOl0t+zrh2tbjwZnVYWpDet7J
 G0PTCSABmc/A7H8P92KKGWLoea8kNbqzrUPvFa+R2rLNLk1uWy7++kcm1CXqPxhtn/1/
 RIqQ==
X-Gm-Message-State: AOAM5300q9SEIzWfiRk6HMHkG+B3BVir6vDjNZXYELIXe7UpxSSv8bQY
 Zca51OggdKgVMXojKD9t2FA7sTa8C07G/YiQ7OekPwAkTGF/VaXc6xPBhCsSq6WTK3v1f5Oj2rL
 FTeFzKFwHKGseBGo=
X-Received: by 2002:a05:620a:1369:: with SMTP id
 d9mr26813443qkl.378.1615307308160; 
 Tue, 09 Mar 2021 08:28:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGKM20n5L8wW6Ei0XN5v7BksN4x4MtzmgWcwbL3HUBys6KTE0etn7JkrXEGvoJ9Xfstnk/mw==
X-Received: by 2002:a05:620a:1369:: with SMTP id
 d9mr26813421qkl.378.1615307307971; 
 Tue, 09 Mar 2021 08:28:27 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id q30sm2986567qtd.89.2021.03.09.08.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:28:27 -0800 (PST)
Date: Tue, 9 Mar 2021 11:28:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/7] dma: Introduce dma_aligned_pow2_mask()
Message-ID: <20210309162826.GC763132@xz-x1>
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309102742.30442-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 vivek.gautam@arm.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 11:27:37AM +0100, Eric Auger wrote:
> Currently get_naturally_aligned_size() is used by the intel iommu
> to compute the maximum invalidation range based on @size which is
> a power of 2 while being aligned with the @start address and less
> than the maximum range defined by @gaw.
> 
> This helper is also useful for other iommu devices (virtio-iommu,
> SMMUv3) to make sure IOMMU UNMAP notifiers only are called with
> power of 2 range sizes.
> 
> Let's move this latter into dma-helpers.c and rename it into
> dma_aligned_pow2_mask(). Also rewrite the helper so that it
> accomodates UINT64_MAX values for the size mask and max mask.
> It now returns a mask instead of a size. Change the caller.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


