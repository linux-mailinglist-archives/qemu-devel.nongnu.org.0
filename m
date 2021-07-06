Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE823BD7DB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:36:42 +0200 (CEST)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lFh-0007m8-6h
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0lEl-000761-QE
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:35:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0lEh-00082r-BH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625578536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkhfrzKum7FBRHQXUBFenPdwxgikJsV+xY8tK4RLXLE=;
 b=eDlAHsYnwDH19hyzIXLgSj/2RJ8zxXJCrneOuqPhehiV6OtfAYhcin80izwxZXagWfi0/R
 +NdfixUlBrPwVahI7U3cVj+m3yzqGeOHGlY+BH9/Zsf5tW6Lb59Lw8+O6GUsG/374T608c
 c8kei7Vtoer8k+HqsIqce83R3M2+pGE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-HLXdDTZJMECRto5ycyWbgg-1; Tue, 06 Jul 2021 09:35:35 -0400
X-MC-Unique: HLXdDTZJMECRto5ycyWbgg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1fb02902082e9b2132so1105720wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GkhfrzKum7FBRHQXUBFenPdwxgikJsV+xY8tK4RLXLE=;
 b=A9glvwAEBEKEDIyiuXkkMlCmhCoLO9mnXcCQufzdWkHL528nxwecYHJFU6S/5dBSTD
 6PwiU5fE+J6E3+DyO4u03+2NeMAJ8Lics0BRCUOgS5oMP3Zf+Lf1TCy4J53dBMgbnqxp
 LWE8iNOdPcy60f6Wj7cxhb+GTBVlu0OlwdCPB6i9Yf8xwkdgwSY0UbLcLrS3Adx4wi34
 g8fgtCgVTfRIClFaKx2cp45EjHetCkcnflVDkrQVYca2ZK5SBbDTRcd8viKxfaqGlFOA
 Jq0/xhq3YxplTCjDaeDKillqtpZCuDDc3kb03uMW3dudO5NpuATmQs+dfpjFsr0wZ2cR
 0M5w==
X-Gm-Message-State: AOAM532AvF9DWkgEyMVTMtWFGtwAg67umxFE8YPFzcFp0uQaITFN10iK
 IwY0Dmk6QXYSRaw5n2etraZOmeQ3yMp5IUJWZj+646kXAAo6cK7dBPxKeQTUxl1DrP523dCXeh9
 UkZdtVAOyWRkNiEM=
X-Received: by 2002:adf:ea46:: with SMTP id j6mr21000368wrn.81.1625578534121; 
 Tue, 06 Jul 2021 06:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh9c/djbTkhMXZh/aRQ5SUJm4gQxo7ztyAtFg+sc7jrA+EI9+LW1OLCIuQDhlqXsEgy3Dpqg==
X-Received: by 2002:adf:ea46:: with SMTP id j6mr21000340wrn.81.1625578533886; 
 Tue, 06 Jul 2021 06:35:33 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id n18sm2702929wms.3.2021.07.06.06.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:35:33 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210706130723.1178961-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] target/mips: Rewrite UHI errno_mips() using switch
 statement
Message-ID: <143016a0-710d-90c6-4dd8-d7be4d4157b6@redhat.com>
Date: Tue, 6 Jul 2021 15:35:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706130723.1178961-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 15.07, Philippe Mathieu-Daudé wrote:
> Linking on Haiku OS fails:
> 
>    /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>    error: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is too large (0xffff405a bytes)
>    /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>    final link failed: memory exhausted
>    collect2: error: ld returned 1 exit status
> 
> This is because the host_to_mips_errno[] uses errno as index,
> for example:
> 
>    static const uint16_t host_to_mips_errno[] = {
>        [ENAMETOOLONG] = 91,
>        ...
> 
> and Haiku defines [*] ENAMETOOLONG as:
> 
>     12 /* Error baselines */
>     13 #define B_GENERAL_ERROR_BASE              INT_MIN
>     ..
>     22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE + 0x6000)
>    ...
>    106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE + 4)
>    ...
>    211 #define ENAMETOOLONG                      B_TO_POSIX_ERROR(B_NAME_TOO_LONG)
> 
> so the array ends up beeing indeed too big.
> 
> Since POSIX errno can't be use as indexes on Haiku,
> rewrite errno_mips() using a switch statement.
> 
> [*] https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Supersedes: <20210704170736.617895-4-f4bug@amsat.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
> index 77108b0b1a9..b4a383ae90c 100644
> --- a/target/mips/tcg/sysemu/mips-semi.c
> +++ b/target/mips/tcg/sysemu/mips-semi.c
> @@ -74,25 +74,19 @@ enum UHIOpenFlags {
>       UHIOpen_EXCL   = 0x800
>   };
>   
> -/* Errno values taken from asm-mips/errno.h */
> -static const uint16_t host_to_mips_errno[] = {
> -    [ENAMETOOLONG] = 78,
> +static int errno_mips(int host_errno)
> +{
> +    /* Errno values taken from asm-mips/errno.h */
> +    switch (host_errno) {
> +    case 0:             return 0;
> +    case ENAMETOOLONG:  return 78;
>   #ifdef EOVERFLOW
> -    [EOVERFLOW]    = 79,
> +    case EOVERFLOW:     return 79;
>   #endif
>   #ifdef ELOOP
> -    [ELOOP]        = 90,
> +    case ELOOP:         return 90;
>   #endif
> -};
> -
> -static int errno_mips(int err)
> -{
> -    if (err < 0 || err >= ARRAY_SIZE(host_to_mips_errno)) {
> -        return EINVAL;
> -    } else if (host_to_mips_errno[err]) {
> -        return host_to_mips_errno[err];
> -    } else {
> -        return err;
> +    default:            return EINVAL;
>       }
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

I assume you'll do the number fixup (your previous "target/mips: Fix UHI 
error values" patch) on top of this now?


