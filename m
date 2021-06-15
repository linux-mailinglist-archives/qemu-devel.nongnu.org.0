Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4182E3A86BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:43:30 +0200 (CEST)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltC9x-0000wM-C2
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltC9A-00005u-Rz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltC96-000862-OF
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUjHAzj+jWzgeNoLwWzzuFUx6puRPm5/uwHqwbMtefc=;
 b=Gy6KyByccIZNEYcGL0voMPpIGpNHccqix1kbL9XdbRhwcXZGdUZgwCBjN2uQlv9jEf8cFK
 pSyu98W3tzjSammfVKdRj82UgJqdSdjPvSOTr3xETnHdnO9nGXOeI7BxaWyOUnmGSmiRTa
 SwNjUsF9IAHDfEtL5LlTcQj7hl6xywQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-HMBkSN1qOsiFLcn_xwfb0w-1; Tue, 15 Jun 2021 12:42:32 -0400
X-MC-Unique: HMBkSN1qOsiFLcn_xwfb0w-1
Received: by mail-ej1-f71.google.com with SMTP id
 n8-20020a1709067b48b02904171dc68f87so4779476ejo.21
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fUjHAzj+jWzgeNoLwWzzuFUx6puRPm5/uwHqwbMtefc=;
 b=X87PfyxCkZDWai5Lyc8UGTidi2vSgWH3Ycxl8kxFxBFPwhV0weadcXHLWTsMbcuJCl
 zMU0v3aIycy76albwU2xA4CmZ4U+ODow96P7VPaKdmBcW6i1/7ki1E4xOkMlxq8ypimy
 WpvtkqKp3yOYlriSYRSbFWtuM+V5gYK3Tq7CGsUQ8on3X6xKLKRlJRh4SzY95hvBn6B/
 VQPxIemfSjzpMwsgm9USfraj1Pchy0bHa4zi0NuZU1ilnhP6YEmSzDuFMFYjv0W2mA7d
 S3vQCKPH+QtuR37plhCD1xXKJbmKHNrrTiPzTj2z17lByv6LMGe1VjJA4vrW4a46bK05
 bUtA==
X-Gm-Message-State: AOAM5333CdwHXiR5fauIXWkq7q2/b3OBky7RO5Q95KNp5Yueoa9VwsiN
 O9nqaYcQ9KDnV9UahRu4EOjl9YI0CLZru98yrHKtI+L6oombXbOfEfit2UgdDvuuRvnM9bmw55L
 s7aZ9SwhQLnkyCT8=
X-Received: by 2002:a17:906:3485:: with SMTP id
 g5mr494181ejb.174.1623775351613; 
 Tue, 15 Jun 2021 09:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoluquZF/5jPqXYazlcrizTfJ2SnWYBQKIAlo3JiLWceBsYU86wKMx//l5Qz1eWm3319ID7A==
X-Received: by 2002:a17:906:3485:: with SMTP id
 g5mr494163ejb.174.1623775351448; 
 Tue, 15 Jun 2021 09:42:31 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 t15sm8988060ejf.119.2021.06.15.09.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:42:31 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] block: check for sys/disk.h
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-7-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d7d5b3ef-026f-de4a-4406-9765cf63b1f0@redhat.com>
Date: Tue, 15 Jun 2021 18:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-7-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
> From: Joelle van Dyne <j@getutm.app>
>
> Some BSD platforms do not have this header.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> Message-Id: <20210315180341.31638-3-j@getutm.app>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block.c     | 2 +-
>   meson.build | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


