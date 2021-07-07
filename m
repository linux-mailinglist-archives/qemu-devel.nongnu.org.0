Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDB3BE18E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 05:37:15 +0200 (CEST)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0yN8-0007nL-Lt
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 23:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0yM9-0006vD-J6
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0yM5-0008HE-Ij
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625628967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXLw0xQ/DWAr5Sbcm2O7rdNiCgFJo/mOeq3JWLsaW4I=;
 b=J1O9rTw85qr9PZ4cFz0vsKh+ZZLWFo7T4GoXwxuUFtzqUo21D3hygKRPz6tq2FpFzEiH53
 EPv3L7BNFoGK1D7PVJ6yG6NIWsRseNWNc2IOmzmx+52KHkxLvPVR1boEPvtqasK00HFHQb
 nuKbFq7Ly20WQh0wqLBTtAQ2mpl4x7k=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-DUG4nQvNPAyYxgNWx9A2uw-1; Tue, 06 Jul 2021 23:36:05 -0400
X-MC-Unique: DUG4nQvNPAyYxgNWx9A2uw-1
Received: by mail-pj1-f72.google.com with SMTP id
 k92-20020a17090a14e5b02901731af08bd7so664560pja.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 20:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iXLw0xQ/DWAr5Sbcm2O7rdNiCgFJo/mOeq3JWLsaW4I=;
 b=esNAlJOZbAkKJwATkZqoxKDfUksBSmq90X1QK4Ivl+/oHY6hl2+jQEHxmctDT4INq3
 KgjO60RnzPGSU1qrGHeBV52B7weJVw1rDESOgMiWX1A/XE0r4CctxOE3g6tCG/pfUxn2
 pxlOGusRU8U7VTIELDxe3MEB3ZSkw4NRxF5zFNnLiIZ0ddfW0PYr5MPslpm0vyWwZJDG
 UvrkVbgaGV1txJNF2vaqU6mleF+lh4pUiJexybcY6IRzQ2e1y9h55LpJZ82EUoNCKraP
 SbcEEDEAMflKa0ofw1fl6FIfJ9lpXt+MewdTvZZCOfKBJVAOatSE0tA5XJfPUSd+0v//
 2iXg==
X-Gm-Message-State: AOAM533FhzPFeVNh6cA5PMQqCw1O7jcVgjVBJQg0T3rksG7Yr1noR2PP
 pifpSbr7xdkjgeBxYZDDnUzmHdtGiVPveaN8Brk57BFEuiaOAShMCOSIz0kavFomauQinpjFrZJ
 Pn+XHbnx2qY3JLao=
X-Received: by 2002:a05:6a00:1903:b029:31d:f720:133f with SMTP id
 y3-20020a056a001903b029031df720133fmr15415184pfi.46.1625628963964; 
 Tue, 06 Jul 2021 20:36:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5V+chbRUTyApvuL9bsZKwNKFXGC7RUuu5K5ftqIiGq0m7ODxq0JbHLKwlesdBi9M+HphVXg==
X-Received: by 2002:a05:6a00:1903:b029:31d:f720:133f with SMTP id
 y3-20020a056a001903b029031df720133fmr15415161pfi.46.1625628963714; 
 Tue, 06 Jul 2021 20:36:03 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 10sm17373489pjc.41.2021.07.06.20.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 20:36:03 -0700 (PDT)
Subject: Re: [PATCH] docs: Add '-device intel-iommu' entry
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210611185500.343525-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5391f6ca-57de-473d-beee-408455ef70e3@redhat.com>
Date: Wed, 7 Jul 2021 11:35:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611185500.343525-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jing Zhao <jinzhao@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Chao Yang <chayang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/12 ÉÏÎç2:55, Peter Xu Ð´µÀ:
> The parameters of intel-iommu device are non-trivial to understand.  Add an
> entry for it so that people can reference to it when using.
>
> There're actually a few more options there, but I hide them explicitly because
> they shouldn't be used by normal QEMU users.
>
> Cc: Chao Yang <chayang@redhat.com>
> Cc: Lei Yang <leiyang@redhat.com>
> Cc: Jing Zhao <jinzhao@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14258784b3a..4bb04243907 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -926,6 +926,38 @@ SRST
>   
>   ``-device pci-ipmi-bt,bmc=id``
>       Like the KCS interface, but defines a BT interface on the PCI bus.
> +
> +``-device intel-iommu[,option=...]``
> +    This is only supported by ``-machine q35``, which will enable Intel VT-d
> +    emulation within the guest.  It supports below options:
> +
> +    ``intremap=on|off`` (default: auto)
> +        This enables interrupt remapping feature in the guest.


I think we don't need "in the guest" here.

Other than this:

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks


>   It's required
> +        to enable complete x2apic.  Currently it only supports kvm
> +        kernel-irqchip modes ``off`` or ``split``.  Full kernel-irqchip is not
> +        yet supported.
> +
> +    ``caching-mode=on|off`` (default: off)
> +        This enables caching mode for the VT-d emulated device.  When
> +        caching-mode is enabled, each guest DMA buffer mapping will generate an
> +        IOTLB invalidation from the guest IOMMU driver to the vIOMMU device in
> +        a synchronous way.  It is required for ``-device vfio-pci`` to work
> +        with the VT-d device, because host assigned devices requires to setup
> +        the DMA mapping on the host before guest DMA starts.
> +
> +    ``device-iotlb=on|off`` (default: off)
> +        This enables device-iotlb capability for the emulated VT-d device.  So
> +        far virtio/vhost should be the only real user for this parameter,
> +        paired with ats=on configured for the device.
> +
> +    ``aw-bits=39|48`` (default: 39)
> +        This decides the address width of IOVA address space.  The address
> +        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
> +        4-level IOMMU page tables.
> +
> +    Please also refer to the wiki page for general scenarios of VT-d
> +    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
> +
>   ERST
>   
>   DEF("name", HAS_ARG, QEMU_OPTION_name,


