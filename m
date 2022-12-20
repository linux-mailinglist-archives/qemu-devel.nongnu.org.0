Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E536521D3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3p-0004Oj-Dl; Tue, 20 Dec 2022 08:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7d3n-0004OM-Du
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7d3l-00015G-Sg
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671544412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8CotrqcgzXvQXtJ5kZZ0ruh2gQ5daV2bfK3mTqXxUBY=;
 b=FFwwoJsZK8QTBbhqneO+TxvFsLBpLJdXr5deiuZm+FiRNxFcHqcgqD/j19MLy17q+qTrVE
 vTaok9VTntHZIiLm2k8/StbOEt9prAgDg21XkgFRy5kQIFfIC96fBiB/j+tp34dzHdkeaf
 XPPFwwLolpZRsGXJ1q7Fatg8o8U6K7Q=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-9dS85p5kPN6Natghb6Q12A-1; Tue, 20 Dec 2022 08:53:31 -0500
X-MC-Unique: 9dS85p5kPN6Natghb6Q12A-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-3dfb9d11141so142290647b3.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 05:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CotrqcgzXvQXtJ5kZZ0ruh2gQ5daV2bfK3mTqXxUBY=;
 b=PEUovO5qwnFxIHet6SCtbwnnclnVkz/Hh4hsK/JVeV3OZegkcKfaUwV7+4uEBuMiJq
 u6JRoFedf095ji9PV0V1CafehPXhquJ+Ituu4HtvH6MClMXGmTDebmcYtfqyTVGO83h8
 qiavlD3QLeeQWYBUNdCMb4GLC7Gfi+gt9d4Oevzr7RIEW46Epc7YqURQY9a/0JjkQAKo
 oLd7FKDnhrCKVRab4GEtPQEIA7QHQplkwh0TK0y5B/4vbxsy1yYK/Dn7M3rc7iXf53NR
 JZCI6fneE43AjQcOHYoZqcLSO3+20nTLzA6ZTICYcbyFk0LI026c2VYF6sSwpOECyJYT
 oJ+Q==
X-Gm-Message-State: ANoB5pnRyXpfuuv14KZhjzMofbcWEflb1DAVBmD+N2qwswNnWY9DcZpz
 yIo+5BlRTxVVMIHAtNX9PxqmxZCiq/P/uUrNaSjkjKnj24BKT4ixo//c3sWo8IgbGL1Yzqi5k3I
 Is5vcEfQEM6cdtwI=
X-Received: by 2002:a25:d30b:0:b0:6ff:19c7:bac1 with SMTP id
 e11-20020a25d30b000000b006ff19c7bac1mr43963000ybf.12.1671544410953; 
 Tue, 20 Dec 2022 05:53:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4XC0t8Q5I3bdzehgS6J58100S0xhOmi9zG+1iYQhdlcnIJIHSwkQH+Crl41dsoLeDYkRf1yw==
X-Received: by 2002:a25:d30b:0:b0:6ff:19c7:bac1 with SMTP id
 e11-20020a25d30b000000b006ff19c7bac1mr43962980ybf.12.1671544410688; 
 Tue, 20 Dec 2022 05:53:30 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 u9-20020a37ab09000000b006fcaa1eab0esm8752278qke.123.2022.12.20.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:29 -0800 (PST)
Date: Tue, 20 Dec 2022 08:53:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
Message-ID: <20221220085253-mutt-send-email-mst@kernel.org>
References: <20221129081037.12099-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129081037.12099-1-jasowang@redhat.com>
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

On Tue, Nov 29, 2022 at 04:10:34PM +0800, Jason Wang wrote:
> Hi All:
> 
> According to ATS, device should work if ATS is disabled. This is not
> correctly implemented in the current intel-iommu since it doesn't
> handle the UNMAP notifier correctly. This breaks the vhost-net +
> vIOMMU without dt.
> 
> The root casue is that the when there's a device IOTLB miss (note that
> it's not specific to PCI so it can work without ATS), Qemu doesn't
> build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> won't trigger the UNMAP notifier.
> 
> Fixing by build IOVA tree during IOMMU translsation.
> 
> Thanks


IIUC you were going to post v2? At least commit log fixes.

> Jason Wang (3):
>   intel-iommu: fail MAP notifier without caching mode
>   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
>   intel-iommu: build iova tree during IOMMU translation
> 
>  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 25 deletions(-)
> 
> -- 
> 2.25.1


