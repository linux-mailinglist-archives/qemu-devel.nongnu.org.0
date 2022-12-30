Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691DE659474
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 04:46:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB6KK-0006nM-Av; Thu, 29 Dec 2022 22:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pB6KH-0006nE-Io
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 22:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pB6KF-0002xL-Q5
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 22:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672371893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=65zq9t45D+P0L1XiDPXRoKu8r3yu7NZCie+q3Oi+JXI=;
 b=QX8Sh26Zi9MGLpFd2m02fo4kCG/xP/MWIgnQsOGH9P7e0jX/zI2Qh9zI7r/E+r7JDYYlY7
 BjdaDzs0OfWU2+j7dtHbCjDMKGdtjM+y8ZtQLr4LHuKGeJQwJOI6hC6+gDzdsoIARM8Z5J
 7tR+n9z9zcwmvunC5NOciaS1xqJgGNM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-bHkrm6brPji8bjNYXAf5ew-1; Thu, 29 Dec 2022 22:44:51 -0500
X-MC-Unique: bHkrm6brPji8bjNYXAf5ew-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-14261bd9123so9418244fac.21
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 19:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=65zq9t45D+P0L1XiDPXRoKu8r3yu7NZCie+q3Oi+JXI=;
 b=h1o3R+Ga9lAVGYMZB+n4yl6SS0f7T3B+RUKhLcZoOHarXmRvZZr5KbjdW2yPzwg70T
 h/1nBu1dNkoqAvGaH2z37LY0zeRC1yplWvBLOsaHzphI+8IgVGv/buBhDVSk1AWUJKNr
 enobTpLDM/F1Tt4O/iZ1LktRT8dC31lrmEQ0fPm7Y67twmMkrwS5YOhZS6whxeW0gx5a
 xbQWmI5nso7AXO5HNhBxwi3uUiKF9Iu7Xte51yjkE+5VGh+ZUtTZ4cSTR3JxlcdLsW9V
 3egsLpsm6cYs8TbrqrIglpXsvebjJ623u6hMudaCa/cNXDcgR/cPwzVPZIkGMJ+qW51h
 xVvQ==
X-Gm-Message-State: AFqh2krhbyXV34afA5ryDgJ4jFu2JNuyIIdCMOSeQgZw2uRk1hIs0wrK
 VlbNCxzPI03j1e/UB5HUK/KFMLGk+9sNInIZ7yXV3Lt1tll+CJLMYyEBSY/TooIgdMxJ7kwfAiZ
 WVNmep6N0BMhvxfC7NZuIPqX/x2acIq8=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr1526377oah.35.1672371891223; 
 Thu, 29 Dec 2022 19:44:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuV3umf6dFHSGo8l2i1HZsfOf6WevaLLQ3EFc+mGX3Ldj/5+m/ECaxW+Cdj9Di8SwlcW3RuXKjoE4u3xzIT65U=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr1526373oah.35.1672371891014; Thu, 29
 Dec 2022 19:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
 <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
 <DBBP189MB143342BF93DB130D8B9715EB95F39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DBBP189MB143342BF93DB130D8B9715EB95F39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 30 Dec 2022 11:44:40 +0800
Message-ID: <CACGkMEv1OKUtuJcCfFmbZyc1evAaZe_o=8VnqLAKFbXGzLk71Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Dec 30, 2022 at 3:17 AM Sriram Yagnaraman
<sriram.yagnaraman@est.tech> wrote:
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, 23 December 2022 04:24
> > To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> > Cc: qemu-devel@nongnu.org; Dmitry Fleytman
> > <dmitry.fleytman@gmail.com>; Michael S . Tsirkin <mst@redhat.com>;
> > Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Subject: Re: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
> >
> > On Thu, Dec 22, 2022 at 7:43 PM Sriram Yagnaraman
> > <sriram.yagnaraman@est.tech> wrote:
> > >
> > > A new attempt at adding support for Intel 82576 Gigabit Ethernet
> > > adapter with SR-IOV support.
> > >
> > > Start qemu with the following parameters.
> > >    qemu-system-x86_64 -enable-kvm -M q35 \
> > >    ...
> > >    -device pcie-root-port,slot=3,id=pcie_port.3 \
> > >    -netdev
> > tap,id=net3,script=no,downscript=/tmp/rmtap,ifname=xcbr3_t2,queues=1 \
> > >    -device igb,bus=pcie_port.3,netdev=net3,mac=00:00:00:01:03:02
> > >
> > > Load IGB/IGBVF modules if needed.
> > > modprobe igb
> > > modprobe igbvf
> > >
> > > Create VFs via /sys
> > > ls /sys/bus/pci/devices/0000:01:00.0/
> > > echo 2 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
> > >
> > > Sriram Yagnaraman (5):
> > >   pcie: add helper function to get number of VFs
> > >   hw/net/net_tx_pkt: helper function to get l2 hdr
> > >   hw/net/igb: register definitions
> > >   hw/net/igb: emulated intel IGB (82576EB) network device
> > >   hw/net/igb: build support for igb/igbvf devices
> >
> > Haven't reviewed this series but I think we'd have two more things:
> >
> > 1) update the MAINTAINERS
> Any suggestions on who should/will maintain this?

I think you should be the best candidate for the maintainer :)

(Btw, we have a lot of NIC without a maintainer which usually makes
the review very slow).

Thanks

>
> > 2) a qtest for igb (having a qtest for sr-iov would be even better)
> >
> > Thanks
> >
> > >
> > >  hw/i386/Kconfig             |    1 +
> > >  hw/net/Kconfig              |    5 +
> > >  hw/net/e1000_regs.h         |  357 +++-
> > >  hw/net/e1000x_common.c      |   13 +
> > >  hw/net/e1000x_common.h      |   28 +
> > >  hw/net/igb.c                |  627 ++++++
> > >  hw/net/igb.h                |  184 ++
> > >  hw/net/igb_core.c           | 3782 +++++++++++++++++++++++++++++++++++
> > >  hw/net/igb_core.h           |  216 ++
> > >  hw/net/igbvf.c              |  262 +++
> > >  hw/net/meson.build          |    2 +
> > >  hw/net/net_tx_pkt.c         |   17 +-
> > >  hw/net/net_tx_pkt.h         |    8 +
> > >  hw/net/trace-events         |  190 ++
> > >  hw/pci/pcie_sriov.c         |    6 +
> > >  include/hw/pci/pcie_sriov.h |    5 +
> > >  16 files changed, 5671 insertions(+), 32 deletions(-)  create mode
> > > 100644 hw/net/igb.c  create mode 100644 hw/net/igb.h  create mode
> > > 100644 hw/net/igb_core.c  create mode 100644 hw/net/igb_core.h  create
> > > mode 100644 hw/net/igbvf.c
> > >
> > > --
> > > 2.34.1
> > >
>


