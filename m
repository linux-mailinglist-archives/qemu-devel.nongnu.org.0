Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F17450371
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 12:30:44 +0100 (CET)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmaCB-0008Rw-8d
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 06:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmaAz-0007lZ-Ga
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 06:29:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmaAv-00014P-VB
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 06:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636975764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=895uTcacAxB0rrHwiAyJZG0VWFGBNp31mRsxXwiKsFE=;
 b=iZ/JRq1u+jjwCAKe0qK7B9FC89BggxUk0lFpKCK8HI4nZg5wp42g6XcearY0GBUA/nLGV+
 zvYn8V/lkLBONaTr6u7DPNSS2fnxeOcrp09RTzS4vhat/oolCR5yuEGtDR34LXoNyZuC53
 YuhEHuqYpzKZK29RMkaB6g0Y6Ik3eWU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-wESFLUANN_azYJLOSXStUg-1; Mon, 15 Nov 2021 06:29:23 -0500
X-MC-Unique: wESFLUANN_azYJLOSXStUg-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso13645648edj.20
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 03:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=895uTcacAxB0rrHwiAyJZG0VWFGBNp31mRsxXwiKsFE=;
 b=0giIC6y3x4R66DyIxS1lH+BjetRWoNX0vkbX/4zGF1gvOl56Micc5O/Fx3vPNMFaCh
 m3Ul3mo5+fO77EcAibxQ1hI0wL8IDapGgzmloWG/RqzOfDmNMa0oAcs9M8XVag9Wp8Wq
 pbufjCWnjT1gZBle/6Po36qh4iuaae2/+VUWeXRgdYla3Xrh71S8azThfaarI3+iaFbA
 F7dst4OFkACN1+naVkxuNOG9iG2Hwtx04ggFjuxN1iv930t7GUvNwPeQ8tNqSljYjT3C
 RpcfFsopJ8Vx2581oHa6HjDuUgVEfq5hO89lAy164gEAqudm+9aSL2fZbJ5jsKHuaBvJ
 MVnw==
X-Gm-Message-State: AOAM533kKUC3qSOOMadrWlcju+X8B1hXeHuGBC25N4T333cZBL3ncuDp
 ifpaNN38XoNUGRf6/PC8r8VrCu3CGEFHc5r9J7S+n2Y58tw9XXMY8jh5oBZsQ3L4777Eer1Jv8U
 +JuUoNkGd0cDvFKI=
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr55274350edd.12.1636975762081; 
 Mon, 15 Nov 2021 03:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfqlKcT1h/94wiGZysSFynQyCE0O7B9T5G6kLrBJueat0mduHtWoxqZhlz9T49POfwJjTYPg==
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr55274318edd.12.1636975761902; 
 Mon, 15 Nov 2021 03:29:21 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107f:5ef5:cae3:cade:5de7:1613])
 by smtp.gmail.com with ESMTPSA id gb3sm6466245ejc.81.2021.11.15.03.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 03:29:21 -0800 (PST)
Date: Mon, 15 Nov 2021 06:29:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/6] pcie: add power indicator blink check
Message-ID: <20211115062728-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011120504.254053-4-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 02:05:01PM +0200, Gerd Hoffmann wrote:
> Refuse to push the attention button in case the guest is busy with some
> hotplug operation (as indicated by the power indicator blinking).
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Can't we do better and press the button later after
indicator stops blinking?

> ---
>  hw/pci/pcie.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 4a52c250615e..c455f92e16bf 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -506,6 +506,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>      PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
>      uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
>      uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> +    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
>  
>      /* Check if hot-unplug is disabled on the slot */
>      if ((sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
> @@ -521,6 +522,12 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>          return;
>      }
>  
> +    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
> +        error_setg(errp, "Hot-unplug failed: "
> +                   "guest is busy (power indicator blinking)");
> +        return;
> +    }
> +
>      dev->pending_deleted_event = true;
>  
>      /* In case user cancel the operation of multi-function hot-add,
> -- 
> 2.31.1


