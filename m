Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C55557E2F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:50:33 +0200 (CEST)
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OAC-0005RG-26
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4O95-0004MH-Ha
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4O91-0002i2-DQ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655995758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SI8xutk3gmYbsLJ8Tc+MzdPXoHGzso0b1vVVkRwkUCc=;
 b=JtOft56H30DonPit/jkRtLEbFd+kwh8GZrHOFnp8kDC4ojR0256eJ83+mOm3+2nxzg3a5X
 BaR6Qo5T5B1c6KNZXWAIiZBV5INLTIupC6ok89BzKX1DwPj+i2+QPiC7hSUVb+yPJQwV+9
 gNhH0YJlOVFMyh0+XFxsRII0yr9ccJc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-Q-MoarFaPDiC8ZZyrVggVA-1; Thu, 23 Jun 2022 10:49:17 -0400
X-MC-Unique: Q-MoarFaPDiC8ZZyrVggVA-1
Received: by mail-wr1-f70.google.com with SMTP id
 z11-20020adfc00b000000b0021a3ab8ec82so4523003wre.23
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 07:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SI8xutk3gmYbsLJ8Tc+MzdPXoHGzso0b1vVVkRwkUCc=;
 b=Z7IrYZkt0oR8urjCWltjVGTEZMiwxuiHLoPi7NsDLXF39bq/+YKprddQ6yar9MjZEA
 5zBo8TgoauJQgDlpl73OSAxALVZUPX75BGR7TPQne0Wk3zkhPVSvv0PnI0hwyJKtv2A4
 gMagHq3kdUDcV8++5XMwrj2JzWdDgNnLHpJtCzWzEc7auHlAriRWGRcyUEHBgkd8BU2l
 kPOR4K7MvTWVKBFxHQq5sJ+1zX5y9ePPUdeazhGqkHSoynsWuQEuF5qAnxPxhxpw9hkU
 mrLM882f8ZtqRarqxdu3gMCx1cRYfzy91FQX5oWZC85LU5sAXbIFIw3MO0ysc8GXbk+b
 qakg==
X-Gm-Message-State: AJIora+TOaRYYgmjngSuDKHIIsAy6P9DM2/9kWW4b9CvY5LR6GYj4X28
 RzLQJptoRUe1C/bCJzK7PWt/jp99TGqJC7bEzs8b+T6YU1wzBdTUnprLd1XWrifjkcDVBG91amb
 d2cPxOzaokE3cXhs=
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id
 g39-20020a05600c4ca700b003a03905d441mr686411wmp.159.1655995756289; 
 Thu, 23 Jun 2022 07:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5x2JBwpH2zWRtWlZ5BKlih8mFWla4BTPBzgW9aHA88MSCt6TQqeHfutSJYLBstiVinYS4UA==
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id
 g39-20020a05600c4ca700b003a03905d441mr686374wmp.159.1655995755954; 
 Thu, 23 Jun 2022 07:49:15 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 c2-20020a1c3502000000b0039c5328ad92sm3499945wma.41.2022.06.23.07.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 07:49:15 -0700 (PDT)
Message-ID: <95b9536a-12f4-2dee-918f-c673b3d296aa@redhat.com>
Date: Thu, 23 Jun 2022 16:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 alexandru.elisei@arm.com, alex.bennee@linaro.org, andre.przywara@arm.com,
 nikos.nikoleris@arm.com, ricarkol@google.com, seanjc@google.com,
 maz@kernel.org, peter.maydell@linaro.org
References: <20220623131017.670589-1-drjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220623131017.670589-1-drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 23/06/2022 15.10, Andrew Jones wrote:
> As a side effect of leaving Red Hat I won't be able to use my Red Hat
> email address anymore. I'm also changing the name of my gitlab group.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bab08e740332..5e4c7bd70786 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -55,7 +55,7 @@ Maintainers
>   -----------
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   M: Thomas Huth <thuth@redhat.com>
> -M: Andrew Jones <drjones@redhat.com>
> +M: Andrew Jones <andrew.jones@linux.dev>
>   S: Supported
>   L: kvm@vger.kernel.org
>   T: https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git
> @@ -64,14 +64,14 @@ Architecture Specific Code:
>   ---------------------------
>   
>   ARM
> -M: Andrew Jones <drjones@redhat.com>
> +M: Andrew Jones <andrew.jones@linux.dev>
>   S: Supported
>   L: kvm@vger.kernel.org
>   L: kvmarm@lists.cs.columbia.edu
>   F: arm/
>   F: lib/arm/
>   F: lib/arm64/
> -T: https://gitlab.com/rhdrjones/kvm-unit-tests.git
> +T: https://gitlab.com/drew-jones/kvm-unit-tests.git
>   
>   POWERPC
>   M: Laurent Vivier <lvivier@redhat.com>

Acked-by: Thomas Huth <thuth@redhat.com>


