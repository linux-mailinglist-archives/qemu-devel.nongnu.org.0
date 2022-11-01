Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C060F614FFC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:06:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprHS-00015K-Se; Tue, 01 Nov 2022 09:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oprHN-00014w-O1
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oprHK-0007K1-CT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667309164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tizp+iNl34fQqwfmc07e6bLw1nj6pU/4fcuHqfx8d4=;
 b=QOCMQpqulY+qrfyLxFd2e/6nmW9DJ8L8+kWxggVbM41Xryio7/rYLlLMQ3KxeHz/4DnBrc
 gi0HW7KMrUfr/+dZeTm9IhCv8ueiTZGc8qLWIjGLh6qZNtJjAtRBD9tPXK9E0oL8nU4FME
 HXCO/kWZngbO9AUtH6LiONISh9oXWGI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-okSs66icMBe_GB9cGdzJ_g-1; Tue, 01 Nov 2022 09:26:03 -0400
X-MC-Unique: okSs66icMBe_GB9cGdzJ_g-1
Received: by mail-qv1-f70.google.com with SMTP id
 g1-20020ad45101000000b004bb5eb9913fso7644952qvp.16
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tizp+iNl34fQqwfmc07e6bLw1nj6pU/4fcuHqfx8d4=;
 b=RcTfofxGE1LiP0kyQs9Z2hEAqkSmlXKqns6yncF5BhsAC8kkYdErjyoi4ooSgDmZcQ
 mhcs+a8adw2xQGvdkojdYu+AKtup+KccWuw3RAqHdisDkBMhf1WRWDUhd0PikRDxPjX6
 vdfMABOgJtrrTr9hSay0ULAEwdhIq95oOadsRuHcPLPFGcDzmJrl+4SDZew6v0IGN+f5
 Fn3CGOObgvDw2UYNEr4Gbphgu3KdUKxLvFoDn48jmvslzwh3fhwC3Mcd+Rkc5v+tAiHO
 Bs/fkVBC9HdhuR7QG7s0HNdm7gMW4kSiGHAMTI47lqe2CbPQGp6C41AUPrqBNu1e87lq
 vi3Q==
X-Gm-Message-State: ACrzQf3YKTZspDTjx7xCDBWPyStTwyv892QHtYPfCjSEk5iofbKUoX7l
 OJ4GkXJzF9UmSF9c7dgxXVW838nejPjiswc6rJp10EddCjnNj8r3NSXjLOS1KQH19m2Se2+21bP
 pH0op/IGrp88UHU8=
X-Received: by 2002:a05:620a:254f:b0:6bb:dcb6:4279 with SMTP id
 s15-20020a05620a254f00b006bbdcb64279mr13164083qko.79.1667309162859; 
 Tue, 01 Nov 2022 06:26:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM622wbkfQQV8wUtEpKNJE9D0Nh/SHLna/ZP2smno604VnEUHnsEE9FghY7mJzSKTPW8hyZzhg==
X-Received: by 2002:a05:620a:254f:b0:6bb:dcb6:4279 with SMTP id
 s15-20020a05620a254f00b006bbdcb64279mr13164065qko.79.1667309162628; 
 Tue, 01 Nov 2022 06:26:02 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v7-20020ac87487000000b00342f8d4d0basm5162098qtq.43.2022.11.01.06.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:26:01 -0700 (PDT)
Date: Tue, 1 Nov 2022 14:25:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221101142559.46202198@fedora>
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 08:50:41 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> 
> Holiday here tomorrow, so most likely this is it for features for this release.
> 
> The following changes since commit 75d30fde55485b965a1168a21d016dd07b50ed32:
> 
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-10-30 15:07:25 -0400)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 3e624c953b9c37f5aafdf92c16c721818ec8c648:
> 
>   intel-iommu: PASID support (2022-10-31 08:46:50 -0400)
> 
> ----------------------------------------------------------------
> pci,pc,virtio: features, tests, fixes, cleanups
> 
> lots of acpi rework

expected DSDT tables updates should be updated to include

> first version of biosbits infrastructure
> ASID support in vhost-vdpa
> core_count2 support in smbios

tables added by this test which was merged before above refactoring
to avoid failure (it was masked by 1/86)

or simpler, swap order they are being merged and then just regenerate
tables for this test case only.

> PCIe DOE emulation
> virtio vq reset
> HMAT support
> part of infrastructure for viommu support in vhost-vdpa
> VTD PASID support
> fixes, tests all over the place
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


