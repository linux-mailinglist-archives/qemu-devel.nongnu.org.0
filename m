Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0C6F9E99
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:11:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsCT-0001gf-6D; Mon, 08 May 2023 00:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvsCA-0001gM-Ju
 for qemu-devel@nongnu.org; Mon, 08 May 2023 00:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvsC8-0007nD-Lb
 for qemu-devel@nongnu.org; Mon, 08 May 2023 00:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683518990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Helst5eORAne0ZkITT6EPq16+6ERJla2bjiAf5/I8kk=;
 b=Xcb5VSTq3+xC08c4thYImQhODCjjYGu3Hb4FYVXWEuXUTuqUe8T+O6KhECrjKeJom3u7TI
 dIbyCG8vWb2uQ7Rt8Gq7krEyPVxqkGk/Kq3vURrZazj5tSbhRgfYRyxwHxRfrDBR2lbb0Y
 PWZDDA/20hKpKfntZyWGxim0IJXQfDw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-5Ok4w3w-MT-E722PAAPZvQ-1; Mon, 08 May 2023 00:09:48 -0400
X-MC-Unique: 5Ok4w3w-MT-E722PAAPZvQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4f12f45d113so2115498e87.0
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 21:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683518986; x=1686110986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Helst5eORAne0ZkITT6EPq16+6ERJla2bjiAf5/I8kk=;
 b=DL/6BiaM5EcoWgFLSWnesPUh+OhxPnb9zPWFvGlVFBqrxZoqJ/jx9bw4UWEJoi0EyL
 4rWGHOA1CTULNR7ffbW3OKslZLgk7nkPwzuL7lteSzvjKzToVzcQ9UBP2NUinSGNot4v
 BKlHN2GFRsOYjr0uJrYCvoKaQH1PYIAiETaAXgoKkIrT6IlHqy1A9ww4vJP8cwLUOJwi
 CZg7WAEAdGAH4DDgDmXg9/9rrSqaPIKNqdWeEbY0Xg+8iQ2YoKRoZYarAF4GXXhTqENI
 yJExIHGqijjDDb3aNYwB+wlUBDNX9H94CJyJm8UD4N91WDirupUzptSRro5ecu/1oF24
 zFCw==
X-Gm-Message-State: AC+VfDwscbSLGCbOriLEp0WA6fsIdRmOZXdFfl2DwI92RGmqTF9CtNDI
 6MCNnxjXkHz8kTS3tecBYIp8hubpes/l81XrAFiH95g7xL84uXhbAM38epez3QcS7XCvjDTpVZx
 6Ar4f+cLX2RJXHDLPnJTd9VwyUbJ3nFw=
X-Received: by 2002:ac2:5549:0:b0:4ef:f630:5c1e with SMTP id
 l9-20020ac25549000000b004eff6305c1emr2120478lfk.51.1683518986549; 
 Sun, 07 May 2023 21:09:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ogLJhC5t1/XPfoQrVb8C2+IkYLkOgUpDKAtKUTg0Pl7+1NFaihk5vJkGmTVOLZZeyo0j8QMRMgnx4tt5fY4g=
X-Received: by 2002:ac2:5549:0:b0:4ef:f630:5c1e with SMTP id
 l9-20020ac25549000000b004eff6305c1emr2120471lfk.51.1683518986243; Sun, 07 May
 2023 21:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230501020221.188376-1-viktor@daynix.com>
In-Reply-To: <20230501020221.188376-1-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 May 2023 12:09:35 +0800
Message-ID: <CACGkMEutr3KLFqLeOOYEb6apAiDia1qAr8od8Z293XZ=WHLdPw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] vhost: register and change IOMMU flag
 depending on ATS state
To: Viktor Prutyanov <viktor@daynix.com>
Cc: mst@redhat.com, peterx@redhat.com, marcel.apfelbaum@gmail.com, 
 qemu-devel@nongnu.org, yan@daynix.com, yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 1, 2023 at 10:02=E2=80=AFAM Viktor Prutyanov <viktor@daynix.com=
> wrote:
>
> When IOMMU and vhost are enabled together, QEMU tracks IOTLB or
> Device-TLB unmap events depending on whether Device-TLB is enabled. But
> even if Device-TLB and PCI ATS is enabled, the guest can reject to use
> it. For example, this situation appears when Windows Server 2022 is
> running with intel-iommu with device-iotlb=3Don and virtio-net-pci with
> vhost=3Don. The guest implies that no address translation info cached in
> device IOTLB and doesn't send device IOTLB invalidation commands. So,
> it leads to irrelevant address translations in vhost-net in the host
> kernel. Therefore network frames from the guest in host tap interface
> contains wrong payload data.
>
> This series adds checking of ATS state for proper unmap flag register
> (IOMMU_NOTIFIER_UNMAP or IOMMU_NOTIFIER_DEVIOTLB_UNMAP).
>
> Tested on Windows Server 2022, Windows 11 and Fedora guests with
>  -device virtio-net-pci,bus=3Dpci.3,netdev=3Dnd0,iommu_platform=3Don,ats=
=3Don
>  -netdev tap,id=3Dnd0,ifname=3Dtap1,script=3Dno,downscript=3Dno,vhost=3Do=
n
>  -device intel-iommu,intremap=3Don,eim=3Don,device-iotlb=3Don/off
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001312

It would be better if we can have a change log here.

Thanks

>
> Viktor Prutyanov (4):
>   pci: add handling of Enable bit in ATS Control Register
>   virtio-pci: add handling of ATS and Device-TLB enable
>   vhost: register and change IOMMU flag depending on Device-TLB state
>   virtio-net: pass Device-TLB enable/disable events to vhost
>
>  hw/net/vhost_net.c                | 11 +++++++++++
>  hw/net/virtio-net.c               |  8 ++++++++
>  hw/pci/pcie.c                     | 22 ++++++++++++++++++++++
>  hw/virtio/vhost-backend.c         |  6 ++++++
>  hw/virtio/vhost.c                 | 26 ++++++++++++++++++++++++--
>  hw/virtio/virtio-pci.c            | 17 +++++++++++++++++
>  include/hw/pci/pcie.h             |  5 +++++
>  include/hw/virtio/vhost-backend.h |  4 ++++
>  include/hw/virtio/vhost.h         |  1 +
>  include/hw/virtio/virtio.h        |  2 ++
>  include/net/vhost_net.h           |  2 ++
>  11 files changed, 102 insertions(+), 2 deletions(-)
>
> --
> 2.35.1
>


