Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1433BA32D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 18:28:26 +0200 (CEST)
Received: from localhost ([::1]:45660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzM1h-0007cs-8j
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 12:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzM0f-0006vD-6T
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 12:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzM0b-0004Bi-2K
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 12:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625243234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WoZ3sZyNDw3g1KtNvlOHXMuiStvfD+gQDshniWoc3Lw=;
 b=hVJr6TUaumr8hWKHxagl2wZkqlJh2NfeJkAth7t3mMGP4AMqyxB85DMerdVOiL/ulYd99o
 Y0wy8zA5j5EQZdGhgXkEezYNHKZ1yZXcN6FT15O57T1t9p3h/sgLcIzohVBVHvdXapXj7S
 xFfQt6IjhNeDem359pJRRgAVxQqSckQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-hJJCpkNVNoG2MZ9xec6rZw-1; Fri, 02 Jul 2021 12:27:13 -0400
X-MC-Unique: hJJCpkNVNoG2MZ9xec6rZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e13-20020a5d530d0000b0290126d989c76eso4075732wrv.18
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 09:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WoZ3sZyNDw3g1KtNvlOHXMuiStvfD+gQDshniWoc3Lw=;
 b=Q5Sp576mkQWrQG+HAsMfAEcx/IET4mPbiSEy1mmT0+BT7sqgwi0GEqlgLHsyo9b959
 RC/2kvJRNlR4zFCzeNY3yj6z11t1RtkbjsMdizAbRBUkNsKhh6oL2lz59nr+WZ55pGOt
 XvkQjEtKhbdYJQftK0d11BvqDIPefMQj682N1pDZGKjCwe4m/Vp3YzHJe3bMfyVtZMuj
 z+Mcpueg1cSElV+46j0vuplem6ypsPuRAe0BnzuJctfyq1TKjqbRhXFJfBz32iwqWMHh
 fnOKEEtwaVwmS0sjkHoHzzqSCP6i0G+V4FRKeKtJfZ7OevwqgCTzZ9qB3E+Scgjtnk53
 i/TA==
X-Gm-Message-State: AOAM533z0Lw4OItIDLgoWexzUmik/7f6AZx77J3YQMLrnBrphNfcMbSf
 5CKgr99MHAs5NPUekENjiHchSWn+kbjvbmsRh0cDnIzPWEs2rI+N4VcY/YmuzDw8LlLdEYu+gpq
 uaHI4oT2/nGikErI=
X-Received: by 2002:a05:600c:1c8f:: with SMTP id
 k15mr324332wms.91.1625243232572; 
 Fri, 02 Jul 2021 09:27:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoN6K9l0uLBgoULWrV/8UBRrqAkkLoKXklq2r2DIITQGoA6WKYh2vj8dSmjs1xsreUJ21IJA==
X-Received: by 2002:a05:600c:1c8f:: with SMTP id
 k15mr324309wms.91.1625243232267; 
 Fri, 02 Jul 2021 09:27:12 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id s5sm13055934wmh.46.2021.07.02.09.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 09:27:11 -0700 (PDT)
Date: Fri, 2 Jul 2021 12:27:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 0/5] virtio: Add vhost-user based RNG
Message-ID: <20210702122652-mutt-send-email-mst@kernel.org>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210614202842.581640-1-mathieu.poirier@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 02:28:37PM -0600, Mathieu Poirier wrote:
> This sets adds a vhost-user based random number generator (RNG),
> similar to what has been done for i2c and virtiofsd, with the
> implementation following the patterns already set forth in those.
> 
> Applies cleanly to git://git.qemu.org/qemu.git master(1ea06abceec6).


I get

/scm/qemu/docs/tools/vhost-user-rng.rst:document isn't included in any toctree

any idea?

> Thanks,
> Mathieu
> 
> -----
> New for V2:
> - Replaced "antropy" for "entropy" (Joakim).
> 
> Mathieu Poirier (5):
>   vhost-user-rng: Add vhost-user-rng implementation
>   vhost-user-rng-pci: Add vhost-user-rng-pci implementation
>   vhost-user-rng: backend: Add RNG vhost-user daemon implementation
>   docs: Add documentation for vhost based RNG implementation
>   MAINTAINERS: Add maintainer for vhost-user RNG implementation
> 
>  MAINTAINERS                              |   9 +
>  docs/tools/vhost-user-rng.rst            |  74 +++++
>  hw/virtio/Kconfig                        |   5 +
>  hw/virtio/meson.build                    |   2 +
>  hw/virtio/vhost-user-rng-pci.c           |  79 +++++
>  hw/virtio/vhost-user-rng.c               | 294 +++++++++++++++++
>  include/hw/virtio/vhost-user-rng.h       |  33 ++
>  tools/meson.build                        |   8 +
>  tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
>  tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
>  tools/vhost-user-rng/meson.build         |  10 +
>  11 files changed, 922 insertions(+)
>  create mode 100644 docs/tools/vhost-user-rng.rst
>  create mode 100644 hw/virtio/vhost-user-rng-pci.c
>  create mode 100644 hw/virtio/vhost-user-rng.c
>  create mode 100644 include/hw/virtio/vhost-user-rng.h
>  create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
>  create mode 100644 tools/vhost-user-rng/main.c
>  create mode 100644 tools/vhost-user-rng/meson.build
> 
> -- 
> 2.25.1


