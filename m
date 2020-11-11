Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D852AF6A5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:36:24 +0100 (CET)
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kct6d-00005Y-2s
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcsrJ-0003VJ-Gw
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcsrH-0000B6-74
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605111630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/vRJ2RllFvFMmBYqjG/z5rV9dX53YhvjUB8h0SqF+0=;
 b=U4RM1opStdd+0q/EteAdxixZOCAre6aNU5b8c1dyKWy0VdgspticLLoa87hlW/t3jW0ngQ
 V+t+lldfwk0fh1burF/9SS92Q6fhORzM/lstm6oDvu9s2eiG2vPJrYMj4ISNcnVY5fuW82
 KDYNaM4mnsjzSL+zP7DyxsPope8OCDU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-s09JENJ9PByE2Mc4naav0g-1; Wed, 11 Nov 2020 11:20:28 -0500
X-MC-Unique: s09JENJ9PByE2Mc4naav0g-1
Received: by mail-wr1-f71.google.com with SMTP id r15so764465wrn.15
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/vRJ2RllFvFMmBYqjG/z5rV9dX53YhvjUB8h0SqF+0=;
 b=jMoi2pFh1K4dftLa4Ef+2EKjOaks2anagxi2+TwKoFTG9rJ7QDHRo4LixTeer3Xbmd
 HtjKgf1F1tIULxrQydkxuBzBwiX6gK290mHXD5PzmvIWt23vepPpNa5Nn/vMEtjRWXry
 095w6bmSRiUOofZkK7Bs/3Cs7lS6LqEyN4DikYYFGoXMAq4iiBNaRI8u0hbH8QLpt9Eq
 IGYoePu3iD93q8Q80KxlOEpfigFPBBMf6J7IW0iHz2uNU9ZV9c+tRK0pO0teXx1fZDHQ
 +s2K9s2ew/XvlExbCxUC4aiikwcX3swtjU3HSKhy+GG6/boUfxq8Xot3FlWasDAJFmbR
 Fbng==
X-Gm-Message-State: AOAM5300DXZpOZJuHMJXsM/ggE9hAKQD9GONBxix5AZTGt6c96OfXbLk
 jWH37hVc6WXQecnbc1uQSlC9othwLyn4BMrGRpApNN4HdwH6kbi6KhBPR12Vk9DI0xdQ62eZnx8
 rIi0JJh58q5zcJgs=
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr4979220wmc.176.1605111627243; 
 Wed, 11 Nov 2020 08:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOLwD/4Y5ndOm1GOqRd8IGPpxF8GcC0M/FwffWlisg5SoJMDEMVF+DmyUcjRbgRy3IA/Qm5A==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr4979208wmc.176.1605111627100; 
 Wed, 11 Nov 2020 08:20:27 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p12sm2983692wrw.28.2020.11.11.08.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 08:20:26 -0800 (PST)
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20201111143440.112763-1-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2601029e-146f-5b94-6aaa-c0d6ec90227d@redhat.com>
Date: Wed, 11 Nov 2020 17:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111143440.112763-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: peter.maydell@linaro.org, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 3:34 PM, Andrew Jones wrote:
> The removal of the selection of A15MPCORE from ARM_VIRT also
> removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
> 
> Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7d022eeefdbc..e69a9009cf0a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
>      imply TPM_TIS_SYSBUS
> +    select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
>      select GPIO_KEY
> 


