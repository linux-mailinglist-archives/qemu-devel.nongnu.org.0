Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773058AF47
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:57:42 +0200 (CEST)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1Zt-00037G-6h
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK1Xa-0000Mp-7X
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:55:18 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK1XX-0008Iw-8x
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:55:16 -0400
Received: by mail-pl1-x635.google.com with SMTP id x10so3261398plb.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SUp9GqOsjv/S8NhZwpp2aTcPo9Ld5sy7FqhWY00dvQs=;
 b=j0MwvoL0lQZXKn6HOk2RVOr7ckQNPiv2CqsG9+z+IQGPpkt53xJcFguEyJBHlNYUjY
 POggYR4zCn9miBa2YJU0xzYRcx67BCzvtc/0a6+NOd3D+zGApyszE8SaO+heLlGaf41z
 bqvJmZS8LZAD6DF1bjq8d73CzSYLmaWBU1r6pA5TQrj+w7q2HusqsxxSAupti7lZo+/8
 qtNzDMN49TcSxLy39lEy/CLO4C0wxc0Mt8cAZUDvUU05rRjDJgWtGICkXDKvkTByAxUv
 ZiN8TIAToodzOiZry7kDAAWrJgWKtAx7hG0lYyMDAqk+s+a7ORwgOcNCH0Dl7N3MYe9i
 DZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SUp9GqOsjv/S8NhZwpp2aTcPo9Ld5sy7FqhWY00dvQs=;
 b=12dJFNyO/OBOg0XIkM6fE0YKYh9v1AZR6v+lMZEG5UwYpvR6vZXQQkpnDBZZ7NK/lH
 nzMik4Ufb7ES88cCOURzk/XyMkZtQDknJTD8T5/v1Qob9NJor00yg4Wsz0asZDVedrJn
 UhORxzCZJy0bkL8pb9KSJ2zhRSc3k5JWolqTxHUm+cQBbWFDcrJ+ORBOM8STOIh9F2wi
 EMEklxgNf3IFXlZI6sQzc6q3/5NRFzR2IzCjFoSiX5ayl3TiZ3nhveiG6gZyUZQsseqa
 tzpv7HEB5QOehlb/hRO5+6SWF4ZlYNbZ3c6IfjaH825iv3MnwQ1ad+JXSkCII8H4nGkH
 z6uw==
X-Gm-Message-State: ACgBeo0lXJ3gcHZ3RzPa7z0lhJJf9y6Nw+0bEDw1rm7gSsN+xwQn8Uht
 uU5wX/OkZMH057Vp0Dg2RY/O0A==
X-Google-Smtp-Source: AA6agR6AwVuoHf5AsaNPlW5wMSWPKeI/zLACWxP1A2tqXq2odpZnt0lz3b0MYnqxzNYFf5oIdwbJdw==
X-Received: by 2002:a17:90b:17c8:b0:1f5:31c:4d93 with SMTP id
 me8-20020a17090b17c800b001f5031c4d93mr17600946pjb.53.1659722113597; 
 Fri, 05 Aug 2022 10:55:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a656147000000b0041cd2417c66sm1759655pgv.18.2022.08.05.10.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:55:12 -0700 (PDT)
Message-ID: <c8856fb8-4ba4-506e-25b8-ec80a789a017@linaro.org>
Date: Fri, 5 Aug 2022 10:55:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_READ
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220805160914.1106091-1-iii@linux.ibm.com>
 <20220805160914.1106091-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805160914.1106091-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/5/22 09:09, Ilya Leoshkevich wrote:
> After mprotect(addr, PROT_NONE), addr can still be executed if there
> are cached translations. Drop them.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   accel/tcg/translate-all.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ef62a199c7..9318ada6b9 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2295,12 +2295,19 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>            len != 0;
>            len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
>           PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
> +        bool write_set, read_cleared;
>   
> -        /* If the write protection bit is set, then we invalidate
> -           the code inside.  */
> -        if (!(p->flags & PAGE_WRITE) &&
> -            (flags & PAGE_WRITE) &&
> -            p->first_tb) {
> +        /*
> +         * If the write protection bit is set, then we invalidate the code
> +         * inside.
> +         */
> +        write_set = !(p->flags & PAGE_WRITE) && (flags & PAGE_WRITE);
> +        /*
> +         * If PAGE_READ is cleared, we also need to invalidate the code in
> +         * order to force a fault when trying to run it.
> +         */
> +        read_cleared = (p->flags & PAGE_READ) && !(flags & PAGE_READ);

PAGE_READ has nothing to do with it -- PAGE_EXEC does though.


r~

