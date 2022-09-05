Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F3A5AD4EA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 16:36:26 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVDD6-0005k9-5G
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 10:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVD9o-0002VJ-AU
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 10:33:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVD9j-0000is-Jo
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 10:33:00 -0400
Received: by mail-pl1-x629.google.com with SMTP id p18so8678231plr.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Rs+w1/3QxvZ6m2H1grHkx4Z/qyda28NzQks6VS5zzJE=;
 b=TIdZ9Kd5AW3ZqNnnyGXIBsUqr3Jh5EUYCNheRHcCT1ko9fhH1XvRez6kqJ1LKFc1cf
 YQbxjWyvKkqTH3kyE50zpWSQs6slo+MFR6YmA4macAzXGo08bSjWnjVyP4Gux5MXOahO
 8diitq8RDnfi060X7/qyy2O1Ld6SBCXNos2S5nMALwMse2EbgpGpDTItqBYQZMvX59qL
 0jo6pUdf6FCUxqAaVpvzOWEOfVhnu0ysHl1CaO9inXNCdiKYmt9rgm3wCMWl7f+puoKH
 WoRbIWSvBX3sz8C6T8tx260vHD6xQ9rZjejwxk2sEiNehacI33ylNaJhZu4zTqqo6log
 Jq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Rs+w1/3QxvZ6m2H1grHkx4Z/qyda28NzQks6VS5zzJE=;
 b=HXISnbJ6Gq7xAgIAFyUJsWjh+twOsX0GtWF607H7tQjN2iVJM+E/dtstVx4tYEKGKW
 rMYIpZKX2YSsgAsYkzF2QFroCOzRW8hkd6nkx0yXtXWhorrQRUGvlblYn6jrcy86h0Ax
 LWBooNqtOBWUbJFd6Z5LA4gPi7HjP6eEzUuLn/OpDqCTKdcWbivkWHopuJzBtCi2ahbd
 5ADa4LRq30A0AwQouWdP9LJOGyrTGYv2FIi+Wr1snFs4wiqI6KCtVYaLhO+Jk3vlRd7y
 1Uw4GbArvQforw4E7R/QaNZ48EEn3o+92h2+nfXIQv6JE8HvNtFN5rhfMmwBjxqLxx+i
 4bHQ==
X-Gm-Message-State: ACgBeo2L0uZyk+6AebpaOlxspb4kRaXu82BIJCp4GJqIMH6F3JLpwb+A
 wtOHDyVeO/mZRTq1NyepNb0=
X-Google-Smtp-Source: AA6agR6e5eNlPULmDNhFFWTeFHCekGJIa5sSTFb2iJe16bKBM6hCozXqEx6BvzNBJXvFU3s9dFb8wA==
X-Received: by 2002:a17:90a:ac01:b0:1fb:8956:7942 with SMTP id
 o1-20020a17090aac0100b001fb89567942mr19734579pjq.107.1662388374071; 
 Mon, 05 Sep 2022 07:32:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170903228600b00174a4bcefc7sm7671343plh.217.2022.09.05.07.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 07:32:53 -0700 (PDT)
Message-ID: <5e515526-dee2-0d4a-d21f-563404ac5ef1@amsat.org>
Date: Mon, 5 Sep 2022 16:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] smbios: sanitize type from external type before checking
 have_fields_bitmap
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220905103606.27978-1-pbonzini@redhat.com>
In-Reply-To: <20220905103606.27978-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 12:36, Paolo Bonzini wrote:
> test_bit uses header->type as an offset; if the file incorrectly specifies a
> type greater than 127, smbios_entry_add will read garbage.
> 
> To fix this, just pass the smbios data through, assuming the user knows what
> to do.  Reported by Coverity as CID 1487255.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/smbios/smbios.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 60349ee402..485fa15202 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1205,7 +1205,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>               return;
>           }
>   
> -        if (test_bit(header->type, have_fields_bitmap)) {
> +        if (header->type <= SMBIOS_MAX_TYPE &&
> +            test_bit(header->type, have_fields_bitmap)) {
>               error_setg(errp,
>                          "can't load type %d struct, fields already specified!",
>                          header->type);

Completing the diff:

             return;
         }
         set_bit(header->type, have_binfile_bitmap);

Same problem  here ^^^

It seems safer to check header->type range before load_image_size().

