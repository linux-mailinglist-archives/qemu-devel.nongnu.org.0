Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A1423D55
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:51:31 +0200 (CEST)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY5SL-0001sp-Kp
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY5QI-00008O-Ih
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY5QF-0002fm-Eb
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633520958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWZTOedo2k0AkSWTMVtBabKptViDfwHVzzjHlO4fVdg=;
 b=DZ5BK+USqMQOFtKdm5JQUpWeVfAg0Gv59xINC3iDyKAP+k6BWRAGCLL/2xFrvogU+cp9YY
 vC5y1VNG/BnuiA6TDMABcy2StwgomY9AND25jPnrvCtzIVgG6NjG/ddvnIlo4743AbYjuX
 tfXlKz1H+TIIdwCnI5Qf/dEBPNB8blE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-E1U3dS8yNiO0JJNFeWAsxA-1; Wed, 06 Oct 2021 07:49:16 -0400
X-MC-Unique: E1U3dS8yNiO0JJNFeWAsxA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so1809550wrd.8
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 04:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWZTOedo2k0AkSWTMVtBabKptViDfwHVzzjHlO4fVdg=;
 b=ajY80ec6IcqIGlzHWsOTDgaTpJQ5+Ga0lQKPqP2FspfKAhWwOCX9u+p6Bhj/4XG7MM
 r16Y6KCLCKjE01PSEVvZmcCAalYJoevhRDUBchvDiE3XfpsxkyRPP0TXr5ZrGMT/aKEq
 WNjDRaqNz84PwaAtSV77O1NAHpdh/8fZqfIJMh5Nqu3kVDnLoL5AE9Pc7DQRTdLOm2Tl
 xR0ShjfoZvtL46ucIfNonfKTau2yH/TA3/wJR0JVKJ2Bsm8wqOefBoC476XzDvEEAGgB
 VCWP5gQ+JHy12mo4+SWSEnAUW7hXCeBdriwN76IkAd0eLmtu99QzzhqIvH5JwZfc9Oh/
 Wvzg==
X-Gm-Message-State: AOAM5309hlPq5P2FCH2P4dMcP1VuHybvUuSwz3johsj+jaalpXIt6B4a
 VScFlat+quAYzuE++ZsFcPtglkkIz+Y2gH1VHUL/O2foSo816/TlEJHJPBMY209mn3blt/j2elc
 15LnTVS9GA2CKVIU=
X-Received: by 2002:adf:9c11:: with SMTP id f17mr5530019wrc.147.1633520954806; 
 Wed, 06 Oct 2021 04:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYxtFBpnIhpRNknjFJ7gnbz36Q77Yl69Ed5IXOoNv5crw3jZhGww1TYJLiyLs5tNwqrdr6Zg==
X-Received: by 2002:adf:9c11:: with SMTP id f17mr5529997wrc.147.1633520954603; 
 Wed, 06 Oct 2021 04:49:14 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z6sm7861288wmp.1.2021.10.06.04.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:49:14 -0700 (PDT)
Message-ID: <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
Date: Wed, 6 Oct 2021 13:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211006113707.96907-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 13:37, Damien Hedde wrote:
> Right now, we cannot load some binary file if it is bigger than the
> machine's ram size. This limitation only occurs when loading a
> binary file: we can load a corresponding elf file without this
> limitation.
> 
> This is an issue for machines that have small ram or do not use the
> ram_size feature at all.
> 
> Also get rid of "hw/boards.h" include, since we needed it only
> to access `current_machine`.
> 
> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Hi Alistair,
> 
> I found this while experimenting with a ram_size=0 machine.

Where are you loading your file?

> 
> I checked the original discussion: it seems to me there was no
> intention to specifically limit to the ram size but we had to
> put some limit.
> 
> See this:
> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04668.html
> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04681.html
> 
> Thanks for your feedback,
> Damien
> ---
>  hw/core/generic-loader.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index d14f932eea..102605c07b 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -34,7 +34,6 @@
>  #include "hw/core/cpu.h"
>  #include "sysemu/dma.h"
>  #include "sysemu/reset.h"
> -#include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> @@ -153,8 +152,8 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>          }
>  
>          if (size < 0 || s->force_raw) {
> -            /* Default to the maximum size being the machine's ram size */
> -            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
> +            /* Do not limit the file size */
> +            size = load_image_targphys_as(s->file, s->addr, -1, as);
>          } else {
>              s->addr = entry;
>          }
> 


