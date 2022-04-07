Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559164F7BB7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:33:05 +0200 (CEST)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOVk-0000xF-C5
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncOM1-0001zZ-Sq
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncOLz-0006Z9-7X
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649323378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3EHTTaaHszLj0apFM8Iv6a+5ACPWwmxDAAKkcfB3uok=;
 b=ETF7q2SpwacjhOdIVHAI/sNMxXFOvSt+xTeR45Zhebhpy4GH8lGx2+p8RKRFoIFAJbhn4p
 71HCnJPydDAF/vxwkHo1RIUXZf1/zUE43h0p2bceq6cFnrEgB7tP7PRA7VeGJ6FTlLh732
 BgpQXzzs20Jjgp97sdckIqQ4Xy83wWY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-E-rlnM0lMKSsW4nN0hF_4Q-1; Thu, 07 Apr 2022 05:22:57 -0400
X-MC-Unique: E-rlnM0lMKSsW4nN0hF_4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c125-20020a1c3583000000b0038e3f6e871aso1323354wma.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3EHTTaaHszLj0apFM8Iv6a+5ACPWwmxDAAKkcfB3uok=;
 b=IEh4sMUnTRKRqHeBsh83kUK+ov5GTLsxxbgUlyQegxo/Z7vXK5ej6QDR6k3SB8m5kK
 yBJbJIWf/1qohQzp+eCgjZqWUYu4YRURi7pxV6dUBBWNbqT85NLQnHz26i1jLRid0pI8
 ZWrkhZ/UDEI1uu7LFIym4cpoj4IVvFRWvPAPzePwywPdxeUBXUAxZgiFURVIzr36K0hL
 0ryaja+qA1JfaXUvBBu7pDS3yuGVJLeyJ0SdMQzr9zyrrw7g6XM0GRdyZrfcctYOq6tv
 ycBZ8wZjkWHFcpiD//6iX9EQ+kYTf5WpCyzcAmbJXiPMtwv22/18rDqTVAT5EMxwkxeS
 BNPQ==
X-Gm-Message-State: AOAM533mz1f4D6jzECEpNR7re9+rYnUgTUPqq7ZOQLdTyV2HQr1iaFTK
 EK0S6QkmifQxV/4eWIJNRO+nCLEw9N4QVz3w6wHGXv8s2gQ02tvNGbKTmBQc4Ln5kzZlq1psOY4
 smmK6nt+1Wp8RecQ=
X-Received: by 2002:a5d:6301:0:b0:205:cb42:74a5 with SMTP id
 i1-20020a5d6301000000b00205cb4274a5mr10104643wru.385.1649323374677; 
 Thu, 07 Apr 2022 02:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2VxT6VQ7kSePQL3UfMwArjiMfdkXS3hUjU/GYlWpQukI+vUpWbBSWe76vzEBkF2h4HfFgig==
X-Received: by 2002:a5d:6301:0:b0:205:cb42:74a5 with SMTP id
 i1-20020a5d6301000000b00205cb4274a5mr10104635wru.385.1649323374444; 
 Thu, 07 Apr 2022 02:22:54 -0700 (PDT)
Received: from redhat.com ([2.55.139.64]) by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b002057ad822d4sm17355089wri.48.2022.04.07.02.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:22:53 -0700 (PDT)
Date: Thu, 7 Apr 2022 05:22:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] virtio,pc: bugfixes
Message-ID: <20220407052222-mutt-send-email-mst@kernel.org>
References: <20220406211137.38840-1-mst@redhat.com>
 <CAFEAcA8ndeUiV_pph78H-LoSFWJ7DzvzXnLr-uQBD0D-V9PJQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ndeUiV_pph78H-LoSFWJ7DzvzXnLr-uQBD0D-V9PJQA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 10:18:24AM +0100, Peter Maydell wrote:
> On Wed, 6 Apr 2022 at 22:11, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 128e050d41794e61e5849c6c507160da5556ea61:
> >
> >   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-07 17:43:14 -0500)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to f556b9a0cd20d41493afd403fb7f016c8fb01eb3:
> >
> >   virtio-iommu: use-after-free fix (2022-04-06 17:11:03 -0400)
> >
> > ----------------------------------------------------------------
> > virtio,pc: bugfixes
> >
> > Several fixes all over the place
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> RC3 has gone. We're not taking any more changes unless they
> are absolutely release-critical, which means that you need
> to be clearly describing in the pull request cover letter
> what the changes are and why they are release critical.
> 
> thanks
> -- PMM

Will do, thanks!

-- 
MST


