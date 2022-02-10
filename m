Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CB4B0922
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:07:13 +0100 (CET)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5Q0-0002Gy-0l
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:07:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4uG-00068d-US
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4uD-0008GO-Ix
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644482060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8Z4/u73WcTAbRBQAt6lJZa00PxzNAbHl3tAc4layOA=;
 b=dF1zhQ4YEfTPGju+qBGQhHLk6W1ESsiD8n/VxqHICOaJTVhjTmV0Nkdeq6llNVZtiDMWun
 SY17YOV5jIPxhs7iAoMj7ru39ayI71vUg++5RovH7Ih1dZOSk4WYlfRGIrvgPcgFNXrD90
 To64lAwmLnNPXka4UCu9+dz+YPPohwI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-U8PR7fCuMU2J3R2_fScJnw-1; Thu, 10 Feb 2022 03:34:19 -0500
X-MC-Unique: U8PR7fCuMU2J3R2_fScJnw-1
Received: by mail-wm1-f69.google.com with SMTP id
 w5-20020a1cf605000000b00354d2d83490so528399wmc.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 00:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E8Z4/u73WcTAbRBQAt6lJZa00PxzNAbHl3tAc4layOA=;
 b=POB72de4szp+OMO/VnkETysmhC971/6PpS9nmhfN+dzSYoMPEAhOQ4DNOK4b2blaX9
 47+Tm3bJyd32vlVTphnZagEf5VkM+40QhE7OKcNmgpwQjZzLBgAasHzsM1V3ym23vEdo
 6GpKnAPp/pbph1khWTH77DVX8vKLa2dCoi9ofYJG//0M+U/YdkkKBD6Dpn13Syi7CXSI
 55ZYoKfAsv8G7BiVxkknTXUj0f1jV7tPYZZaY1zaLuKynAX16a4iiTv4XcQyzHCYm0GP
 GuLRQ8mNOeaIoYRzVR6OUcd/Fp0ZRNrNe2J4OBTZNaeFqQnMXUm8FLdtrBsN834NVmz6
 b8Cg==
X-Gm-Message-State: AOAM5313NZP88Y2FKKad/W2y+v/0atxt4cz7DyV197s98X9aYjh+b8pi
 d88vLTVIvXHzh6mlqlisizU8/ops+AxFS0GEkSvdO31OnRWpyAhykkOV/SIeDU0oPJKWtbtk9PG
 vWtwax2E91nCVMns=
X-Received: by 2002:a5d:5988:: with SMTP id n8mr1487039wri.193.1644482058376; 
 Thu, 10 Feb 2022 00:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1A98GhlTzYjKjcAoFmocTOEF3tdCkWO+1GT16fi8ZrsI55mXkFGzNQfrUIRpMxoShSrc/6w==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr1487019wri.193.1644482058112; 
 Thu, 10 Feb 2022 00:34:18 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id f2sm19431178wri.49.2022.02.10.00.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 00:34:17 -0800 (PST)
Message-ID: <3d648897-99cc-4078-0016-0b4a0856dff1@redhat.com>
Date: Thu, 10 Feb 2022 09:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/15] hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220209215446.58402-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/2022 22.54, Philippe Mathieu-Daudé wrote:
> hwaddr type is defined in "exec/hwaddr.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/m68k/mcf.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
> index decf17ce42..8cbd587bbf 100644
> --- a/include/hw/m68k/mcf.h
> +++ b/include/hw/m68k/mcf.h
> @@ -2,6 +2,7 @@
>   #define HW_MCF_H
>   /* Motorola ColdFire device prototypes.  */
>   
> +#include "exec/hwaddr.h"
>   #include "target/m68k/cpu-qom.h"
>   
>   /* mcf_uart.c */

Reviewed-by: Thomas Huth <thuth@redhat.com>


