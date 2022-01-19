Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77949395A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:16:50 +0100 (CET)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8xN-0006vt-4U
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:16:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8u5-0004VT-7C
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:13:28 -0500
Received: from [2a00:1450:4864:20::335] (port=39890
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8u1-0000RL-W2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:13:24 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r133-20020a1c448b000000b0034d95625e1fso176193wma.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 03:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4/K5pUgNzxFQ4LV6fWye9BfMFDIJ/OcFswunhdhs2MY=;
 b=dQRkWvteb2kpMGltkSwl4ll0VGtEUrrVluHKpvHrOZHbUEQH5UVPGthIKEJfvTgPz5
 w/T+l5y0U6EuMWqo9XbIGGT6y+6T1vJjA3Z778ELmGqtJe/BleLCsVsNwUuKwAeBHnR9
 B8111esH5v6uGbv3/7D/bB58ZZlEgQbblLWXpF57ClTxT60PJ9u8w+/B5kWip5Q/gf9K
 RTpQI1xreN4mzHftQRAIiqQU0AVKiSCOeKJaj4Strn92EA4DH7KOI1P16pbTKhTyQMth
 /qeTeozH8NZk2VxplPqAZt0j0Prz7loP6HkHs3Y46Rg5Rs1Irq0nTcTepI1oKrZdsRZ5
 9oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4/K5pUgNzxFQ4LV6fWye9BfMFDIJ/OcFswunhdhs2MY=;
 b=qACgOEJoqLShSvjJ8IX0iH6LpazXqmUJax7RiwvXPD8EfgxX94LgJDoJ2VJm9xZYta
 kiBofZlqRAol2XbmrWfHI398dq4NWoEfsgsRn5IOx1iCcbFEXfQmGW88dLcsFOrC0g8L
 vrZxckH7EHIRc0u4OSxal63TwBZUfaDshHiVWdAEGWMkMF+fvyMB7ZZDVXM7/8YDvrk0
 RM1zC+mJLEAD7/QPplh6cCRw1Bj7bW3LS13pMGn6Xl9IRnDCa2Uk+HLgtzyJRcxhpQKZ
 R4bUyVk4KYXbNHgGvJsleoJ+6d/hkFe5grneHmcoB1VGMNlEW93tj4kOb2UO3JzrsKbn
 7Zdg==
X-Gm-Message-State: AOAM530EqkYKsQMRxnHFn0TpDrw7XYDp3HzUby+/TODquszjDkcGf7R9
 7j/Wr4VGyZmZvxbpz530U8Y=
X-Google-Smtp-Source: ABdhPJwlUsrwxoSQtp1yMVk2YMdHzPvZkHFUoSIHJXcOjSLq5Nit9KrIGDgLJNvWVKev/wph724UGQ==
X-Received: by 2002:a7b:c14b:: with SMTP id z11mr3012224wmi.67.1642590795457; 
 Wed, 19 Jan 2022 03:13:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f5sm20546459wri.52.2022.01.19.03.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:13:15 -0800 (PST)
Message-ID: <04f36e62-1a66-1268-859b-e3ffdb520fd6@redhat.com>
Date: Wed, 19 Jan 2022 12:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] configure: Use -mlittle-endian instead of -mlittle for
 ppc64
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <20220119095641.6729-1-mrezanin@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220119095641.6729-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 10:56, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> GCC options -mlittle and -mlittle-endian are equivalent on ppc64
> architecture. However, clang supports only -mlittle-endian option.
> 
> Use longer form in configure to properly support both GCC and clang
> compiler.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e1a31fb332..e63c78ca67 100755
> --- a/configure
> +++ b/configure
> @@ -658,7 +658,7 @@ case "$cpu" in
>       CPU_CFLAGS="-m64 -mbig" ;;
>     ppc64le)
>       cpu="ppc64"
> -    CPU_CFLAGS="-m64 -mlittle" ;;
> +    CPU_CFLAGS="-m64 -mlittle-endian" ;;
>   
>     s390)
>       CPU_CFLAGS="-m31" ;;

Does -mbig need the same one line above?

Paolo

