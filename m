Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80843BE5A9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:32:46 +0200 (CEST)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13vB-0008Rx-Vb
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m13sT-0004nb-SX
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:29:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m13sQ-00033N-Cc
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625650192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/bIJN5glXqepYvCWXhd5RxhIEtcIYzdGPJaBAh9hJM=;
 b=SAA8NscMB0mJ4XtbLNa4Q0x725jYOVUBr2hgZyRSt4ktF8SVvpWcFL0XED4V11XvGL3W/i
 npOMEYKbGkeZMWBcUu1qsQ+SNNiBqYVP8fQkpfjntftgANeWPZ+Ijn1KUN6+L814pkBAIM
 pJlLNzyrbA3r4pIYzn8MR99xmhrJp4o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-waaPjcaXPr6aGsa1aRYYPA-1; Wed, 07 Jul 2021 05:29:50 -0400
X-MC-Unique: waaPjcaXPr6aGsa1aRYYPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so545841wrq.21
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 02:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o/bIJN5glXqepYvCWXhd5RxhIEtcIYzdGPJaBAh9hJM=;
 b=CcDa1yIApQQhdxJNBdWAWVFVWl7UMy6yITX4pe1H+27Kwnu/PEqVusJ1ezoTpoO55a
 JLyXcuVDNGnmz+Buk9d7t/QhABhHSqOfyxB1V//ZkXpOhfXwUId9jN7qLwRfzX2Jp9ZV
 hw0oQOH6pIMI5aSVEUfWPlUsQqIUo669TLm/CYzgeNR9RpYRfRfBxY/DU2Isj/speqgU
 vW/DU+dG29ncV1Iu44Gp+k5XXCeB7rkgy2V1YVu4o7snKwwURDpasYcKF5KTY5VxO6Oo
 cVj5FY8qVforIvz8S3nGmp586MvtBXU6Imb8y4rPagBK1cPGnaVg5nFYFNuhfKimM0/k
 9SSQ==
X-Gm-Message-State: AOAM533qXVRY1FHN+4xH0jmztYHsLPo8rwzhfaPxyiASclfi//vYDOCU
 5a5xjoaGm356FsJClaSlexrqzNMzeBgc9pX+0DiWUnUoGbq2zIH4obOZgVBbwafShkOqRbWmTdb
 lU+z5iKKxvuOxLYM=
X-Received: by 2002:a05:6000:180b:: with SMTP id
 m11mr9124704wrh.6.1625650189312; 
 Wed, 07 Jul 2021 02:29:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ7E3fKtYtjVyWmbzwOFYApPJSZqdHjqKiZEy33FWVnYWkt6WUxHWGz27U/K1ZYiEwGz5OiA==
X-Received: by 2002:a05:6000:180b:: with SMTP id
 m11mr9124696wrh.6.1625650189160; 
 Wed, 07 Jul 2021 02:29:49 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m5sm5260712wmq.2.2021.07.07.02.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 02:29:48 -0700 (PDT)
Subject: Re: [PATCH] docs: Add '-device intel-iommu' entry
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210611185500.343525-1-peterx@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <6355528a-5d67-f178-90f9-53103d7540f1@redhat.com>
Date: Wed, 7 Jul 2021 11:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611185500.343525-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 6/11/21 8:55 PM, Peter Xu wrote:
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
>  qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14258784b3a..4bb04243907 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -926,6 +926,38 @@ SRST
>  
>  ``-device pci-ipmi-bt,bmc=id``
>      Like the KCS interface, but defines a BT interface on the PCI bus.
> +
> +``-device intel-iommu[,option=...]``
> +    This is only supported by ``-machine q35``, which will enable Intel VT-d
> +    emulation within the guest.  It supports below options:
> +
> +    ``intremap=on|off`` (default: auto)
> +        This enables interrupt remapping feature in the guest.  It's required
> +        to enable complete x2apic.  Currently it only supports kvm
> +        kernel-irqchip modes ``off`` or ``split``.  Full kernel-irqchip is not
> +        yet supported.
maybe explain how the default is chosen (based on kernel-irqhcip mode?)
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
I thought if was needed for vhost. What is the usage for virtio?
> +        paired with ats=on configured for the device.
What is not obvious to me is whether there is a kind of diagnosis
whether device-iotlb and caching mode settings are consistent with
vfio/vhost usage. Does qemu exit if there is inconsistency?
> +
> +    ``aw-bits=39|48`` (default: 39)
> +        This decides the address width of IOVA address space.  The address
> +        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
> +        4-level IOMMU page tables.
> +
> +    Please also refer to the wiki page for general scenarios of VT-d
> +    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
> +
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,
>
Besides, it is quite useful.

Thanks

Eric


