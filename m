Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75904D0BF7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:22:05 +0100 (CET)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMg0-0005B7-Qq
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRMDY-0005QX-OE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:52:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRMDX-0006hm-3d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGbaG+rd3UmBgx3zMSteJxCe31rOtUFk6NaV1hamiz0=;
 b=TeE3gNPVBIl6Ik0uiRLTzUQ3MoZDWTMkrKjjcqsMFviJxLFy2KLNToYF4f+xgHUXTldSj4
 FZA8O3VuEJht0vIQfjoThu4WhUZtHppijA6BO6Jdn1MsHGu7HU947joTlSWpl62sGtQ1I4
 RYkOZoXEnLg1DB/AGVRbkoryti4W/OE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-pA7Edk6IOWGrWcGZI9EsEg-1; Mon, 07 Mar 2022 17:52:36 -0500
X-MC-Unique: pA7Edk6IOWGrWcGZI9EsEg-1
Received: by mail-ej1-f70.google.com with SMTP id
 og24-20020a1709071dd800b006dab87bec4fso4221408ejc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BGbaG+rd3UmBgx3zMSteJxCe31rOtUFk6NaV1hamiz0=;
 b=X0o719tSbBuEcGRqdcctcHybl/HUDV2n7nVkFHNnW1KyZOf3fzeJNGp/fcTNJFIqy5
 4q3Bh/y8pBIaY1kMMyN8f6JAETM/D6s2qFBmwJ8td3n+kl0REB/Pyl6azu506KCOD+R0
 +KTjrIYcJKHgbmYn6U8wUOKOqq8EnuoYNqLMpE7bOJsLxlughB6fdvCD2b0h3YpO3rb/
 X4i7RqT9hVzgYunlseoO6e7JycqAS277e8aVbhaAIbCQwSRuDYXNhA0DeIL+JVNL+yVi
 bC3/EYJMzWCmbpI/+B2XwJjvGvpvArR5n7Zs9Z1e/WjD3+2TSPtt7udUZvO7btHDnGmI
 EgTw==
X-Gm-Message-State: AOAM5330LD1kSCZmSqvsFzzKXKKpMpJFDRvYaJh4ZKG0bMw81VhH1luq
 BxBQAGxGAMgf2v+Jq6L1xh0i9XxSCjRLeu3WRVqjzYO2hOcjDvrzu1Q07Aocr6m4oipQgY8l8dv
 tNd93yYLPjvvX+Vg=
X-Received: by 2002:a17:906:1e91:b0:6ae:99d9:93b1 with SMTP id
 e17-20020a1709061e9100b006ae99d993b1mr10781145ejj.111.1646693555363; 
 Mon, 07 Mar 2022 14:52:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlvOselvENnEMf3j3M6Ao5V+DWpUvJX9UvTyj86XrfLZ+FLd4Ja6XSmq7jlaoEKFASzxEyQQ==
X-Received: by 2002:a17:906:1e91:b0:6ae:99d9:93b1 with SMTP id
 e17-20020a1709061e9100b006ae99d993b1mr10781132ejj.111.1646693555043; 
 Mon, 07 Mar 2022 14:52:35 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm5167248ejt.50.2022.03.07.14.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:52:34 -0800 (PST)
Date: Mon, 7 Mar 2022 17:52:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20220307174713-mutt-send-email-mst@kernel.org>
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Mar 07, 2022 at 05:13:16PM +0000, Peter Maydell wrote:
> On Mon, 7 Mar 2022 at 17:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 7 Mar 2022 at 10:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
> > >
> > >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to 41d137fc631bd9315ff84727d780757d25054c58:
> > >
> > >   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-06 16:06:16 -0500)
> > >
> > > ----------------------------------------------------------------
> > > virtio,pc,pci: features, cleanups, fixes
> > >
> > > vhost-user enabled on non-linux systems
> > > beginning of nvme sriov support
> > > bigger tx queue for vdpa
> > > virtio iommu bypass
> > > An FADT flag to detect legacy keyboards.
> > >
> > > Fixes, cleanups all over the place
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > Fails to build on the build-system-centos job:
> >
> > libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
> > `qmp_decode_features':
> > /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
> > reference to `gpu_map'
> > /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
> > reference to `gpu_map'
> > collect2: error: ld returned 1 exit status
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2172339948
> 
> Also fails on cross-win64-system:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2172339938
> 
> ../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
> ../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
> | ^
> ../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
> | ^
> ../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
> | ^
> cc1: all warnings being treated as errors
> 
> -- PMM

I dropped these for now but I really question the value of this warning,
as you can see the reason we have the buggy cast to unsigned long
is because someone wanted to shut up the warning on a 32 bit system.

Now, I could maybe get behind this if it simply warned about a cast that
loses information (cast to a smaller integer) or integer/pointer cast
that does not go through uintptr_t without regard to size.

> 
> 
> >
> > thanks
> > -- PMM
> 
> 
> 
> -- 
> 12345678901234567890123456789012345678901234567890123456789012345678901234567890
>          1         2         3         4         5         6         7         8


