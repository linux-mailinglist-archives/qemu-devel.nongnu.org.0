Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5B32546D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 18:14:38 +0100 (CET)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFKDk-0002sA-N5
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 12:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lFKCx-0002R8-UP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 12:13:47 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lFKCw-0004Sb-3X
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 12:13:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i7so5284130wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 09:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fRFOcw1xhew8rNs0sF2Wu9Do743uZQ9iBCS3kg5ey/Q=;
 b=OQvd8eDZ0jsvhsHsqBdp4PsaAEEEA4KmsxefYLB10+TfHXUNH/0Qgt7h5GqS7XLAaV
 HfDPoVmNHEFEYaMjdkQm9LOkeK2rAxXrCqKBqHjH2WuA5FKixuqXqgQ004sOIrXDYuxJ
 Kn+WDBxHOlmvWaUPTMOfWqtIx1nm6fnJ09IrEdSbGRQ8qMqcdi+5BgSlvyUqPveGJtNx
 FP+UoDim+6N45+ENYX6ij6cAr2j01jW9FXDZ+0nGHo21xo6RV7y4NZER+XDL5ynV5WtG
 tMKpWtMlxiZhT1+ZuO4M6VIZg09tsJmDWPzPe9G2jIe0DrS37k3g7kjpRNXIxk2VPnr3
 7H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fRFOcw1xhew8rNs0sF2Wu9Do743uZQ9iBCS3kg5ey/Q=;
 b=STFh9Qcwd42IX3Dd37fZzc7m8S56d7WFwx4JWDBwWgWO6bpAR2WmdEe8qRO1Gwb1PN
 9/JWoE1d+0eM4b1wPLMbJ7PpzOqGTfFswqeR7/8NtYmk4vxPiKeW60aMn2NAUjUimc+d
 GOmENEDzyq+32jeH+UinIUY/vUVOPMHsK9rwXUNOo1uOCEs2D79xMeawDrnEYuduZ88E
 Eb9LxORMRglpZkGK4uhdVD0ignIDtNgFtRA3SMXAFvwBvo+vzorBxXC+DOX+WFSo85Yw
 yBKCzPjEd9NxAigK1CPQOEXRPCoYDjs6S6t4INnkm606/WpRMPHirxUTtpLn1o7O5F6l
 V63A==
X-Gm-Message-State: AOAM532IJ9ZSNm6bEzDjVbNN4WAAHn6ZjxKsMaSkHu0L9LdCtGNp4Rwd
 Cwq0mvdUJHE7dhG3Gpv0iRVzNA==
X-Google-Smtp-Source: ABdhPJzS42XDXwZThR8fnDomso690Xgug+YDGYfrdhVfXNgDGQZMOAWhxpv/TRIi8T9SSCIhsyHzxQ==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr4152821wml.62.1614273223822; 
 Thu, 25 Feb 2021 09:13:43 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n10sm9517563wrt.83.2021.02.25.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 09:13:43 -0800 (PST)
Date: Thu, 25 Feb 2021 18:13:24 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio-iommu: Default to bypass during boot
Message-ID: <YDfatCDUZ3FISPJI@myrica>
References: <20210218105929.1433230-1-jean-philippe@linaro.org>
 <20210221064211-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210221064211-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 21, 2021 at 06:45:18AM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 18, 2021 at 11:59:30AM +0100, Jean-Philippe Brucker wrote:
> > Currently the virtio-iommu device must be programmed before it allows
> > DMA from any PCI device. This can make the VM entirely unusable when a
> > virtio-iommu driver isn't present, for example in a bootloader that
> > loads the OS from storage.
> > 
> > Similarly to the other vIOMMU implementations, default to DMA bypassing
> > the IOMMU during boot. Add a "boot-bypass" option that lets users change
> > this behavior.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> wouldn't this be a spec violation?
> 
> 
> When the device is reset, endpoints are not attached to any domain.
> 
> If the VIRTIO_IOMMU_F_BYPASS feature is negotiated, all accesses from
> unattached endpoints are allowed and translated by the IOMMU using the
> identity function. If the feature is not negotiated, any memory access
> from an unattached endpoint fails. Upon attaching an endpoint in
> bypass mode to a new domain, any memory access from the endpoint fails,
> since the domain does not contain any mapping.

Right, but the device behavior regarding BYPASS is specified as:

  If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
  device SHOULD NOT let endpoints access the guest-physical address space.

So I figured that the spec could be read as "before feature negotiation
it's undefined whether the IOMMU is bypassed or not" and so a device
implementation can choose either (previously discussed at [1]). But it's a
stretch, we should clarify this.

Also, the OS might want to know whether DMA was bypassing the IOMMU before
the device is initialized. If there are strong security requirements, then
boot-bypass means the system was vulnerable to DMA attacks during boot.

So I'd like to add a new feature bit for this, VIRTIO_IOMMU_F_BOOT_BYPASS,
that tells whether DMA bypasses the IOMMU before feature negotiation. It's
only an indicator, accepting the feature doesn't change anything. I'll
send the spec change shortly.

Thanks,
Jean

[1] https://lore.kernel.org/qemu-devel/20200109104032.GA937123@myrica/

> Maybe it's not too late to change the spec here - want to try sending
> a spec patch?

