Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9838C6CF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:47:59 +0200 (CEST)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4ZJ-0004JT-TQ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4Xh-0002ZX-Ji
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4Xc-0005cR-0w
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29eXm0nsZm7FoX0ZAN59FNdI8//LqCYo60UZSKzoiFc=;
 b=MprxjmqvRVj1d6OytAYBCe0ozi2+2jLLGy7S1p6i7KjTElMV4q8nAFniDLsfAhc52Z6cc5
 AtyCNDv7ZQidbUWr9UO7PNUneb+WJGF0H5HPKOp+hNcJiqgVTAxzjXbjdNC583duB0F5oE
 fN++gIh+tIilrLYf5gb6eYcv9alO7XE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-DGS1NNBLM8Ga9hRH8dJkdw-1; Fri, 21 May 2021 08:46:08 -0400
X-MC-Unique: DGS1NNBLM8Ga9hRH8dJkdw-1
Received: by mail-wr1-f72.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso9425050wrq.21
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=29eXm0nsZm7FoX0ZAN59FNdI8//LqCYo60UZSKzoiFc=;
 b=HqPJXQvkHG/6lo3iHMvcWuOtsZQEsoUqYdBgXrYPk+YLRJlt9CMXOOSaM1CrvbSIdY
 VRHsuB9QSmu8c2ee71j29QSdWVdM9+dLSqV7W+WmmATZVpzAt+n2uIPUd62VH7J+sbYr
 ndKww2OXP4pSHmyYvCFJCwA+8ZhjqDZQ5ISHHe1E1P3xbJU9WwD8EMdAKRoH05J+CQz6
 dOr/8kB7MzFYnyEKR6ecIuh4rIDeEa8o2dOyiUxxEvTekCrTpuj8MtxMO3a2OhKZhVJh
 ROe/6vknmpeH/zlmhepPq2n+q8AXtqNWA5q1Fq5b38yXAPTJs5SOyZ3+ArdWjfsiXfiI
 cEZQ==
X-Gm-Message-State: AOAM530pztDmSAdCTyEfEJTvaihqI2dX8ZWXrvFQ4mHUZVmB2aDuBEKp
 yGYcrf5F4ly5G20eCPkhqpnKZ336N8OSpedsOdRIlndOVqxVjzJLBOxU2bKgpe+GXhsnG0OlT4g
 YU4cnij8Im4UJWmU=
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr9494893wri.400.1621601166979; 
 Fri, 21 May 2021 05:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDvwc8L+bwh3Mwwm3m1n6+L0vQI8RbmnBYeQltruo8xsT04YIzhwqaysgioOTBElRBhheMqA==
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr9494878wri.400.1621601166845; 
 Fri, 21 May 2021 05:46:06 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j10sm1995728wrt.32.2021.05.21.05.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 05:46:06 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/usb: hcd-xhci-pci: Fix spec violation of IP flag
 for MSI/MSI-X
To: Bin Meng <bmeng.cn@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
References: <20210521024224.2277634-1-bmeng.cn@gmail.com>
 <20210521024224.2277634-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7feeff48-6fa0-19bf-eb72-09caaba8cdb3@redhat.com>
Date: Fri, 21 May 2021 14:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521024224.2277634-2-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 4:42 AM, Bin Meng wrote:
> From: Ruimei Yan <ruimei.yan@windriver.com>
> 
> Per xHCI spec v1.2 chapter 4.17.5 page 296:
> 
>   If MSI or MSI-X interrupts are enabled, Interrupt Pending (IP)
>   shall be cleared automatically when the PCI dword write generated
>   by the interrupt assertion is complete.
> 
> Currently QEMU does not clear the IP flag in the MSI / MSI-X mode.
> This causes subsequent spurious interrupt to be delivered to guests.
> To solve this, we change the xhci intr_raise() hook routine to have
> a bool return value that is passed to its caller (the xhci core),
> with true indicating that IP should be self-cleared.
> 
> Fixes: 62c6ae04cf43 ("xhci: Initial xHCI implementation")
> Fixes: 4c47f800631a ("xhci: add msix support")
> Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
> [bmeng: move IP clear codes from xhci pci to xhci core]
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/usb/hcd-xhci.h        | 2 +-
>  hw/usb/hcd-xhci-pci.c    | 8 +++++---
>  hw/usb/hcd-xhci-sysbus.c | 4 +++-
>  hw/usb/hcd-xhci.c        | 8 ++++++--
>  4 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> index 7bba361f3b..98f598382a 100644
> --- a/hw/usb/hcd-xhci.h
> +++ b/hw/usb/hcd-xhci.h
> @@ -194,7 +194,7 @@ typedef struct XHCIState {
>      uint32_t flags;
>      uint32_t max_pstreams_mask;
>      void (*intr_update)(XHCIState *s, int n, bool enable);
> -    void (*intr_raise)(XHCIState *s, int n, bool level);
> +    bool (*intr_raise)(XHCIState *s, int n, bool level);
>      DeviceState *hostOpaque;
>  
>      /* Operational Registers */
> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
> index b6acd1790c..e934b1a5b1 100644
> --- a/hw/usb/hcd-xhci-pci.c
> +++ b/hw/usb/hcd-xhci-pci.c
> @@ -57,7 +57,7 @@ static void xhci_pci_intr_update(XHCIState *xhci, int n, bool enable)
>      }
>  }
>  
> -static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
> +static bool xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
>  {
>      XHCIPciState *s = container_of(xhci, XHCIPciState, xhci);
>      PCIDevice *pci_dev = PCI_DEVICE(s);
> @@ -70,13 +70,15 @@ static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
>  
>      if (msix_enabled(pci_dev) && level) {
>          msix_notify(pci_dev, n);
> -        return;
> +        return true;
>      }
>  
>      if (msi_enabled(pci_dev) && level) {
>          msi_notify(pci_dev, n);
> -        return;
> +        return true;
>      }
> +
> +    return false;
>  }

Could be simplified as:

  if (!level) {
    return false;
  }
  if (msix_enabled(pci_dev)) {
    msix_notify(pci_dev, n);
  }
  if (msi_enabled(pci_dev)) {
    msi_notify(pci_dev, n);
  }
  return true;

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


