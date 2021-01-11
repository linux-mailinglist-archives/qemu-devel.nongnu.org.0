Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00472F1A03
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:49:01 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzRE-0006lc-Hw
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzOc-00057f-0X
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzOZ-0007cL-02
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610379974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xRYk4aYqXFkNtZPxQXZaXbFCshIPXtqYxoLwPPDwhs=;
 b=i4gJIpGiJZHzxPxlMhnzv+lMZuZKXJ4VggBA2bROKC9bWrm74apO4qphfzR/OY2cC7yFgV
 voKxORJtqAcqg43S23j1pMYEjTnoOI0lcuoJ7TTikqJWf63h8oMHfJNYmHpZmi9iOeq4ek
 18F9tHTesKEzoS4k1kRXKZivWpUOAMc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-ZdjDxJOBMWicspS4p8qhTQ-1; Mon, 11 Jan 2021 10:46:12 -0500
X-MC-Unique: ZdjDxJOBMWicspS4p8qhTQ-1
Received: by mail-ed1-f72.google.com with SMTP id dc6so8387950edb.14
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0xRYk4aYqXFkNtZPxQXZaXbFCshIPXtqYxoLwPPDwhs=;
 b=CsjsgyE+qmJt/qspyPJYbrWXkDHjDyDHlGz2VTtLPM6K//r6/Si/xw9amkQOHorQR5
 GUDKp20oet2bTT16OxwIUTdZss6YxL0zEovtbvti7LQGUu8wGtgq1eVlvPPKhiyiQ+B0
 ZvX35Ylax2bzI3PDH/+DveoqfqCw+lyO2Rv4HtkzPQ1XgrcPs8q0Kt4OQpeXOqsK8Iaq
 3dHpxX02U55lQbkuSxWnVk5VXY/Bxr67/4LVxLsUh0bkwQs0lQgrI/NuAHlB2EJCGigT
 DwbmLvajevx060AcyVt5jaWEYdrPrdR2aoDY3CNWVaXKD0JaNlU952RC5UMhc2laRH0A
 U8pw==
X-Gm-Message-State: AOAM531TPkkkE5d1wfSh5gKgiNwPak6yEGSyEbI/3xa/6Xbxp2uJeayx
 FZxlnV98IayI5wQ3/+yntJuG6tAEJzGQ/LLOqgYkfVEU44BqPh3KGxY+U6nILdAyXvq6tlTFIji
 8l3tElPCcLH3Jyq0=
X-Received: by 2002:a17:906:9388:: with SMTP id l8mr89939ejx.22.1610379971146; 
 Mon, 11 Jan 2021 07:46:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIIBXjYeFGZXiQLnQBwv8zhnz2UzaOY8kmn8fD3rZQbbLl+SoQ+OZ4KRJ7n4mYUxNeGNqezg==
X-Received: by 2002:a17:906:9388:: with SMTP id l8mr89919ejx.22.1610379970926; 
 Mon, 11 Jan 2021 07:46:10 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id d13sm7204083ejc.44.2021.01.11.07.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:46:10 -0800 (PST)
Subject: Re: [PATCH v1 12/20] semihosting: Move ARM semihosting code to shared
 directories
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <60effd22-55a1-1021-ecbe-4899e68ea9cd@redhat.com>
Date: Mon, 11 Jan 2021 16:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
> 
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
> 
> The build system was modified use a new config variable,
> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
> softmmu and linux-user default configs. The contents of the source
> files has not been changed in this patch.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
> ---
>  default-configs/devices/arm-softmmu.mak               | 1 +
>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>  default-configs/targets/aarch64_be-linux-user.mak     | 1 +
>  default-configs/targets/arm-linux-user.mak            | 1 +
>  default-configs/targets/armeb-linux-user.mak          | 1 +
>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>  linux-user/{arm => }/semihost.c                       | 0
>  hw/semihosting/Kconfig                                | 3 +++
>  hw/semihosting/meson.build                            | 3 +++
>  linux-user/arm/meson.build                            | 3 ---
>  linux-user/meson.build                                | 1 +
>  target/arm/meson.build                                | 2 --
>  12 files changed, 12 insertions(+), 5 deletions(-)
>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>  rename linux-user/{arm => }/semihost.c (100%)
...

> diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
> index efe0a30734..4c30dc6b16 100644
> --- a/hw/semihosting/Kconfig
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,6 @@
>  
>  config SEMIHOSTING
>         bool
> +
> +config ARM_COMPATIBLE_SEMIHOSTING
> +       bool

This misses:

          "select SEMIHOSTING"

'SEMIHOSTING' is a bit confusing. Wondering about better names,
maybe SEMIHOSTING_HOST_CONSOLE is clearer? (question not related
to this patch).


