Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF24A994E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:29:57 +0100 (CET)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxiu-0005a7-AY
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFxd5-0000T5-Av
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFxd1-0002hF-7f
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643977430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zrkxnDVlieouSyibvJZAQnlgq6e1rOmCo0AWaRLBqPc=;
 b=ZqhvIcTiwUpl9WYA/dQULowc3bvlJmoix9o731S6KKPTAyEZmmItYdudw94Ps5/yj/81yY
 o7tNG8VDyKmJUev1x4gT3FegYSGFA3npwdDvmuO5JmEmPf9+UWJlHkJD5QjfEo0BujT09q
 F9Agh0uxxSaE3gW/DXnqOdjZnRrYyIg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-ZY4RBPSTNI-68GQV29UxUw-1; Fri, 04 Feb 2022 07:23:48 -0500
X-MC-Unique: ZY4RBPSTNI-68GQV29UxUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso7494605wms.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zrkxnDVlieouSyibvJZAQnlgq6e1rOmCo0AWaRLBqPc=;
 b=lcd+32GmAooSFzXlb8aBRF+RTLEIzglJH05RvurYmGhv8UAkd+j1MGq/hgEfn4JlHk
 Wukgd5/2RyJV/UNHvOB5SoX6JVnOQcdgyduY6D7ni006Kipp1smxDlLjbyeBHh0P71/F
 upC2+nbv2tMJ1plohyU7ABBIVJuVL9Ny2u64/iYaoPEBqj/S0REingA4lL1mumm28xs3
 k9h4UQ8aISOj9ij35zTT0TrCod+ZY2GTmcEIpxC8ZmEfypDoXFLspJemLdcs0mjS653q
 9y5XE/e7VRDDdOl7uDDgq6LYW+dqsNKMqlPXOarnj52LYvnpapNm+tHFR+shAeepOLMO
 qYmQ==
X-Gm-Message-State: AOAM533B9DX3bqtGxxGfyfv5pWafNSk+3aKDFKavmEY3WgcwDrGB8lkY
 EY8bxConp0BD8tlj6y+kxUS07oa/UiwtiRmhdWgCpxYH/SdRPHqbl+qU5CvJTDp8Ld27ipOaDyC
 UhtOp2tbbkKbFPuc=
X-Received: by 2002:a5d:4889:: with SMTP id g9mr2268732wrq.400.1643977426569; 
 Fri, 04 Feb 2022 04:23:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS+C/op72pJeChBr12kFXI+BMP1EdVpcqJJsy7Lz4gomf8EjyetW5jv8Q+OuBCkHikG3rnuQ==
X-Received: by 2002:a5d:4889:: with SMTP id g9mr2268706wrq.400.1643977426331; 
 Fri, 04 Feb 2022 04:23:46 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id o10sm2101698wri.19.2022.02.04.04.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:23:45 -0800 (PST)
Date: Fri, 4 Feb 2022 07:23:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Message-ID: <20220204072104-mutt-send-email-mst@kernel.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cover.1641987128.git.viresh.kumar@linaro.org>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> Hello,
> 
> This patchset adds vhost-user-gpio device's support in Qemu. The support for the
> same has already been added to virtio specification and Linux Kernel.
> 
> A Rust based backend is also in progress and is tested against this patchset:
> 
> https://github.com/rust-vmm/vhost-device/pull/76

So I'm waiting for v2 of this, right?

> --
> Viresh
> 
> Viresh Kumar (2):
>   hw/virtio: add boilerplate for vhost-user-gpio device
>   hw/virtio: add vhost-user-gpio-pci boilerplate
> 
>  hw/virtio/Kconfig                   |   5 +
>  hw/virtio/meson.build               |   2 +
>  hw/virtio/vhost-user-gpio-pci.c     |  69 ++++++
>  hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-gpio.h |  35 +++
>  5 files changed, 454 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-gpio-pci.c
>  create mode 100644 hw/virtio/vhost-user-gpio.c
>  create mode 100644 include/hw/virtio/vhost-user-gpio.h
> 
> -- 
> 2.31.1.272.g89b43f80a514


