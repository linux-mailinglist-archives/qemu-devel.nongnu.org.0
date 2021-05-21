Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174C38C721
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:52:44 +0200 (CEST)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4dv-0004ZZ-Gg
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4cN-0002Q0-8S
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4cK-0007eg-FS
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfIcv7gxDQkKKKRwXODMP7BNXv0hlXL78G/4NFg6nbI=;
 b=OGlknxTg3O5cCJxsGyJ4u2rTeq5TBX5ysSzxYv2h/Umch+pXorDW5wpfLz8hPWzg10wXTu
 B5Fi6vgJd9mf3oQ20IyQASeLc2ryv9NwGTZw/6PDqEu6tiWK1+z7w+rJrmRAiPqD22FFvq
 8Qf9+xrcSk3ZaY4o+hci/Mg7DY+GxIU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-dSz1yvLBNOGNn9spAREFDg-1; Fri, 21 May 2021 08:48:32 -0400
X-MC-Unique: dSz1yvLBNOGNn9spAREFDg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so3783557wmg.0
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tfIcv7gxDQkKKKRwXODMP7BNXv0hlXL78G/4NFg6nbI=;
 b=clMZ3Dy8yNbNWcetfvwClqn8X/hOdPq7rKMsdF50vVGH9pPB4cWVnLRZEzj9BExCR7
 ybbuDDFayyyo4PghK4M89OYTMLaA0pAVUr+hNj69BPkzjrl9MSLIbdn37CIthQcKG+1X
 jbklHXhRrV7xFBfEJyoWnZhOlrPPoTbSaCE/DX/ohKKOa4HCl3aoXFXBklWBxs4Skh3A
 o+wX9cVx/+fBox1fJ7AOoN/dKruNgC0O5wffKRpmYBid7pRKIBr3nPXnl+vK5tRkyWwa
 vS/s+zU5ltexGqJrP4NSRdfbzvegP9LU5YEGeM1Ww+oGMU0X7n3Himrpuj9B1zl1WWhJ
 ENLQ==
X-Gm-Message-State: AOAM530Pn2lQWvKvf0RrY2l/uopkIOa9iAIlkAEYl9qn19nlhb+8fEvx
 cyvBUtM0QzpkjMupSt/ebxWFZG4OwkJClbyI59ykb9CxH9LDIkRTJxow9Q0H0t2CC08HU0r4eDb
 VkSZ/waukfihYR9I=
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr8558164wrq.344.1621601311469; 
 Fri, 21 May 2021 05:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7JOoBLjXc4jiVahRKXpSCDQqV0Azt6tkJLof7xQz2g13PQrcsyOppwlEd7Hg17wr8Thcw6A==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr8558155wrq.344.1621601311349; 
 Fri, 21 May 2021 05:48:31 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k11sm12058248wmj.1.2021.05.21.05.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 05:48:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only
 when told to
To: Bin Meng <bmeng.cn@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
References: <20210521024224.2277634-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <295bd1ad-3177-8bd9-37db-7cde60dac3e2@redhat.com>
Date: Fri, 21 May 2021 14:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521024224.2277634-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
> At present MSI / MSI-X interrupts are triggered regardless of the
> irq level. We should have checked the level to determine whether
> the interrupt needs to be delivered.
> 
> The level check logic was present in early versions of the xhci
> model, but got dropped later by a rework of interrupt handling
> under commit 4c4abe7cc903 ("xhci: rework interrupt handling").
> 
> Fixes: 4c4abe7cc903 ("xhci: rework interrupt handling")
> Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/usb/hcd-xhci-pci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
> index 9421734d0f..b6acd1790c 100644
> --- a/hw/usb/hcd-xhci-pci.c
> +++ b/hw/usb/hcd-xhci-pci.c
> @@ -67,12 +67,13 @@ static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
>           msi_enabled(pci_dev))) {
>          pci_set_irq(pci_dev, level);
>      }

I read the next patch before this one :)

So please consider:

if (!level) {
  return;
}

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> -    if (msix_enabled(pci_dev)) {
> +
> +    if (msix_enabled(pci_dev) && level) {
>          msix_notify(pci_dev, n);
>          return;
>      }
>  
> -    if (msi_enabled(pci_dev)) {
> +    if (msi_enabled(pci_dev) && level) {
>          msi_notify(pci_dev, n);
>          return;
>      }
> 


