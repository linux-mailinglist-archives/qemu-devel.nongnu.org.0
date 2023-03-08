Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259836B0034
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 08:49:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZoXa-00072P-Nx; Wed, 08 Mar 2023 02:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZoXT-000718-P3
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZoXS-0003q4-FA
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678261721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urjood+ALxBgO6jtzLINgHOUCErzb08oBRYN7jK/Ysk=;
 b=GYPMVipSqKX/wYFpPga2zVoIhBkuQNFWBBCiUfmcBnrVAWwPRZmZu1XbwJ/SofbDwubPYL
 53fxJiQ0HYxobatlrtRBRrkMJ+3CkpGdsA4k6pUyFhQhUOEoVULcAyfUuQ2fvWm7EHDHE/
 NjERUmB59g/YtDIGnlCu2vGKvaBX1XA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-CRZK6-qFNhmIJ3F-EB_I7g-1; Wed, 08 Mar 2023 02:48:40 -0500
X-MC-Unique: CRZK6-qFNhmIJ3F-EB_I7g-1
Received: by mail-wr1-f71.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so2674401wrz.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 23:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678261719;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urjood+ALxBgO6jtzLINgHOUCErzb08oBRYN7jK/Ysk=;
 b=CWoXBCzQZ4giejADt9YMUbUCxWAqGsI6JBYVocdFAWk1IzqvFvv+NcBpuwrV5LwdgP
 NS91pasZrAPcDw/LHcmTaRvkcffKEGjqOAVW62v8CPdphLLo3OAQ9Ky6Gn24ICPqdI0Z
 +kOp7gJCtsfsechwRVDJJIueIexm49XwEslh2UJHq6P3b1YuIpsQU6sjxWEz3Ya7m50Q
 IF+jpCFXyUkuFfwzOk5pIhgfsswGCo/F6L6A/xnxpI3ZVBx/X1rFIjW7FyItvqBxUTw0
 od7zKl49HP90RP1e/KmSkeYrqDzkswsKcAIv32MUicLvp4kii+7YoN+YQA973x5HIX0v
 EkFg==
X-Gm-Message-State: AO0yUKVnWKWDk0xH+jL6FRqwSXSXhRS//pIJRxkKqmDBmjSO7XOZf2n2
 SK+WspcmPkLfqwW82N4TaYRgp9Z7YzCUF22hep/Xn9zTOBVz5OMq+JZpycv52UMuaytbvuZm2Is
 /WZf6JVWUs8G+6XQ=
X-Received: by 2002:a05:600c:444c:b0:3dc:16d2:ae5e with SMTP id
 v12-20020a05600c444c00b003dc16d2ae5emr15054286wmn.32.1678261719374; 
 Tue, 07 Mar 2023 23:48:39 -0800 (PST)
X-Google-Smtp-Source: AK7set91vfDNfvMgTGspXylFgqzheruT11trEceBf7wcHiFCIjvCNwvenw4UKoQTYnmAMVmq36EmOQ==
X-Received: by 2002:a05:600c:444c:b0:3dc:16d2:ae5e with SMTP id
 v12-20020a05600c444c00b003dc16d2ae5emr15054274wmn.32.1678261719072; 
 Tue, 07 Mar 2023 23:48:39 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-166.web.vodafone.de.
 [109.43.179.166]) by smtp.gmail.com with ESMTPSA id
 f21-20020a1c6a15000000b003e733a973d2sm18446867wmc.39.2023.03.07.23.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 23:48:38 -0800 (PST)
Message-ID: <e46c6fd2-a0af-fc92-1333-bd737f268dbc@redhat.com>
Date: Wed, 8 Mar 2023 08:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/4] configs/targets: Have all MIPS targets select FDT
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230308000745.56394-1-philmd@linaro.org>
 <20230308000745.56394-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230308000745.56394-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/03/2023 01.07, Philippe Mathieu-Daudé wrote:
> With the introduction of the MIPS virt machine in a pair
> of commits, all MIPS targets will require libfdt.
> Define TARGET_NEED_FDT in all mips*-softmmu.mak files.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   configs/targets/mips-softmmu.mak   | 1 +
>   configs/targets/mips64-softmmu.mak | 1 +
>   configs/targets/mipsel-softmmu.mak | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/configs/targets/mips-softmmu.mak b/configs/targets/mips-softmmu.mak
> index 7787a4d94c..a5c1db82c9 100644
> --- a/configs/targets/mips-softmmu.mak
> +++ b/configs/targets/mips-softmmu.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=mips
>   TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
>   TARGET_SUPPORTS_MTTCG=y
> +TARGET_NEED_FDT=y
> diff --git a/configs/targets/mips64-softmmu.mak b/configs/targets/mips64-softmmu.mak
> index 568d66650c..398e0fc244 100644
> --- a/configs/targets/mips64-softmmu.mak
> +++ b/configs/targets/mips64-softmmu.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=mips64
>   TARGET_BASE_ARCH=mips
>   TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
> +TARGET_NEED_FDT=y
> diff --git a/configs/targets/mipsel-softmmu.mak b/configs/targets/mipsel-softmmu.mak
> index c7c41f4fb7..3ddebca575 100644
> --- a/configs/targets/mipsel-softmmu.mak
> +++ b/configs/targets/mipsel-softmmu.mak
> @@ -1,3 +1,4 @@
>   TARGET_ARCH=mips
>   TARGET_ALIGNED_ONLY=y
>   TARGET_SUPPORTS_MTTCG=y
> +TARGET_NEED_FDT=y

Reviewed-by: Thomas Huth <thuth@redhat.com>


