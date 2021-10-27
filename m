Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7E43C77A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:17:26 +0200 (CEST)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mffzp-0003El-MH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mffvf-0001vh-91
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mffvc-00076Z-OR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635329583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4InJxE9KGZBWCtATT/KerI0zI4GnbKV2Hy3ExzJQTQw=;
 b=E5DmpHoeJHfNodYuK9NK1q3vK6hg2rgKsNtrfGl7NklcVq6gLg8K+i0BhTEDDkwFYjnR3O
 sFiQ6dcbf87ALsSZMH2Rq+GmTDbNWvoeuJdFOUwlqz3O55h4WlDwTs0Q9Hjj0EIXm5epHy
 I1ADsJCPTlU2fJAY5cAT3Ej676yuuvg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-W0641Y5SP3i7Wac-aQKtJw-1; Wed, 27 Oct 2021 06:13:02 -0400
X-MC-Unique: W0641Y5SP3i7Wac-aQKtJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1896889wme.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 03:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4InJxE9KGZBWCtATT/KerI0zI4GnbKV2Hy3ExzJQTQw=;
 b=YASuzjaB8xJ7wQzL9comMG85PSyAsCsgac8V/sI8HOdRKKAwye++Ga0AkbPPpbAi7U
 fZ/i0plng/al6C8oLJ3fR6bMwEEwGKkL+B5wR7ECYDRVeTWLtUs5dls6N25cYG7g8r/k
 271Oz9/84OTHKb9MegfbVsoc2e/IRia8RaHFp1cRZiex81akfBMh2kLzT/iyybLplkPs
 dUzECPD5TXQrkWKVBZoCl2AkX+kLou4ECPva2iSHQDqwY6q6ELWmVJ+shrRjwapbLpS6
 zhSMa2sxZi6BRejblOytoJurvbSvyGjkonHg1GnhkFRRshH2nCX5cMAwd067rfK/d8Gu
 20Uw==
X-Gm-Message-State: AOAM530cEZQY0rgpZ4FNcvNMJJbOgHrvo0veq4+QWkk48RTY9fUlCYpL
 FynngROY79VqULwdyT6KFSAVfMaKUOCxKfrPTZHcR7ETX3IgUHdbF+C1acKV6igEQRzsW4Ie/p9
 v4Sj0N79gc0Evex4=
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr21857644wry.387.1635329580991; 
 Wed, 27 Oct 2021 03:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnd95zdnvGbMWjKg6tmN/EBpgV/dBgtg2hq95KjCRzvhjwsWg0bjI7rqijtLSevDYkXOeyUA==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr21857618wry.387.1635329580814; 
 Wed, 27 Oct 2021 03:13:00 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x7sm2798114wmi.43.2021.10.27.03.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 03:13:00 -0700 (PDT)
Message-ID: <3637a463-7934-3c0a-15ec-b1705ea72ed0@redhat.com>
Date: Wed, 27 Oct 2021 12:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] failover: specify an alternate MAC address
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211027095945.86710-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211027095945.86710-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:59, Laurent Vivier wrote:
> If the guest driver doesn't support the STANDBY feature, by default
> we keep the virtio-net device and don't hotplug the VFIO device,
> but in some cases, user can prefer to use the VFIO device rather
> than the virtio-net one. We can't unplug the virtio-net device
> (because on migration it is expected on the destination side) but
> we can keep both interfaces if the MAC addresses are different
> (to have the same MAC address can cause kernel crash with old
> kernel). The VFIO device will be unplugged before the migration
> like in the normal failover migration but without a failover device.
> 
> This patch adds a new property to the virtio-net device:
> "failover-legacy-mac"
> 
> If an alternate MAC address is provided with "failover-legacy-mac" and
> the STANDBY feature is not supported, both interfaces are plugged
> but the standby interface (virtio-net) MAC address is set to the
> value provided by the "failover-legacy-mac" parameter.
> 
> If the STANDBY feature is supported by guest and QEMU, the virtio-net
> failover acts as usual.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> 
> Notes:
>     v2: rename alt-mac to failover-legacy-mac
>         update doc with text provided by MST
> 
>  docs/system/virtio-net-failover.rst | 10 ++++++
>  hw/net/virtio-net.c                 | 48 +++++++++++++++++++++++------
>  include/hw/virtio/virtio-net.h      |  6 ++++
>  3 files changed, 55 insertions(+), 9 deletions(-)

> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5ea0b3..0d47d287de14 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -45,6 +45,9 @@
>  #include "net_rx_pkt.h"
>  #include "hw/virtio/vhost.h"
>  
> +/* zero MAC address to check with */
> +static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
> +

Eventual future cleanup, it might be clearer to declare it extern
in "net/net.h" and use the one in qemu_macaddr_default_if_unset().


