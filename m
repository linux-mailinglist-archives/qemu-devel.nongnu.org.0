Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AE5EC69E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:38:27 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBj8-0006vL-Af
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0e-0001mF-1Q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0c-0007HC-KL
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ch0jVZlnqry2hPnT/PWAtD5RRCFBYK9ePwmLiCa+Rk=;
 b=OiJd4pxkDGWmXfB794RJUPnlt6Sd3IQgoG+zjeYk6yhfCclEtwqBKhcMSpKUiMu7ZDbv+y
 61GBlcovdNMf7CRQOmSYV1t/WY384P2ynvTm272KDOJkKuKFE28SoYBaRIwX3UF+zsSDEN
 i4hlN/ocXZRkLqxgtE/QyzB9kL1O34A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-MCkorAsWORSphXe9p8ktCA-1; Tue, 27 Sep 2022 08:48:13 -0400
X-MC-Unique: MCkorAsWORSphXe9p8ktCA-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so7677925edz.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6ch0jVZlnqry2hPnT/PWAtD5RRCFBYK9ePwmLiCa+Rk=;
 b=DaRNkQpS2Xj19viEOuaZS14aZpRHxWjb+AoCG8UKnMFASTldXoiDK268ViSUwclp3G
 Y+ERpa5FBkCpUZ69SwLj+ZZCAWMkfwLrLZO6tlpFCC4+jgOMY5pJcxGbCK9z8+MklWft
 spqv+q9hdthC0+T6k3YNVkOk248VnIOlPDDk6cZEcGhZWs2MiIMBmDNJiG/SqzlF45UY
 57hOyvWUTdm3qK8ESAQAOwE7a/zkZqWCaZ+Lg77ptHglQ640kqbDICG7w8ts/6iJqQtH
 Dp+M4pHQlGNkNfIHavijhYRTrGNXxZbFNLmWXq/qQJSGCiMl6NMfG9nL0/M09yw2dr5F
 KmTA==
X-Gm-Message-State: ACrzQf3oXmI/ZjuT04TQry2tjyujBGTuXg4j73hY3p8fSg6YMPFlgdsE
 DA7kaP4vRUdGuQwyMYRFLngO81p+QXA7WodRtiU6VhVu+SlIuCP21Vn8u3UWnpZXVIqoNvR0hF8
 pcHVrdsNOQNcyecw=
X-Received: by 2002:aa7:c158:0:b0:457:1fb3:fd63 with SMTP id
 r24-20020aa7c158000000b004571fb3fd63mr14416383edp.263.1664282892301; 
 Tue, 27 Sep 2022 05:48:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Qfd1m9kM05MTBEO9PBtYQAqLw7SJBWgE0IyId7zfR/cSrtCrrHDwEQx3MB2lQkNNyYPsq8g==
X-Received: by 2002:aa7:c158:0:b0:457:1fb3:fd63 with SMTP id
 r24-20020aa7c158000000b004571fb3fd63mr14416363edp.263.1664282892079; 
 Tue, 27 Sep 2022 05:48:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 la5-20020a170907780500b00781dbdb292asm749956ejc.155.2022.09.27.05.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:11 -0700 (PDT)
Message-ID: <06ff4ad0-a37a-f0e5-c3bf-9ec8f05c6368@redhat.com>
Date: Tue, 27 Sep 2022 14:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/8] hw/arm/virt: Use "msi-map" devicetree property for
 PCI
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-4-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-4-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The "msi-parent" property can be used on the PCI node when MSIs do not
> contain sideband data (device IDs) [1]. In QEMU, MSI transactions
> contain the requester ID, so the PCI node should use the "msi-map"
> property instead of "msi-parent". In our case the property describes an
> identity map between requester ID and sideband data.
> 
> This fixes a warning when passing the DTB generated by QEMU to dtc,
> following a recent change to the GICv3 node:
> 
>   Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1
> 
> [1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Effectively matches example 1 in [1]

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ed6f1ac41e..8605f5058a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1489,8 +1489,8 @@ static void create_pcie(VirtMachineState *vms)
>      qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
>  
>      if (vms->msi_phandle) {
> -        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
> -                               vms->msi_phandle);
> +        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-map",
> +                               0, vms->msi_phandle, 0, 0x10000);
>      }
>  
>      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",


