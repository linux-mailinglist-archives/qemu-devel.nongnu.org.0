Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D658F399
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:39:56 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLsUd-0007aZ-RA
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsKY-0000ZE-1z
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:29:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsKW-0006iZ-DZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:29:29 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so3310184pjm.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=iDWb4qG3wPQd38s/nTqo0Biw2U78r1X88qKmiKopL3Q=;
 b=fpWLjkbHCQZF1RUHAeMlwr9wWzdV8ha/CNJ+2fKfuqp50PO9vRPtmQpsHlSkt5MCHJ
 5B0tHKWY1op6YtJCsLR7Vn7HJwIQItVZ0FNsnO5tUUCbOWIL6d5kX3N0oAG5pDq4cUYD
 leHERIz7rJ4SqV+CKaHEp7KNrkdq2U8daayJIjx7srQwQMTGYKXZjRpto2x18PYLzxmN
 xF9eugbM7GmVICJCzoUN+j/Oz38seyd0dcq2w/LgVfJLaMNMjnONuiqQMgNrwcGccdyf
 1cNa+ZXzWlWYKhC1TPavM8pTpuXasUTqvcV4vlwP0oA2xG7Zy4fDWQLTPk+MFIBQak+w
 NWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iDWb4qG3wPQd38s/nTqo0Biw2U78r1X88qKmiKopL3Q=;
 b=Od6y8e/mzrktaNZ5iSIqOzNnHcPjKAWgcLPUo4OdpcTKRtCqF8GYgbywdHfeuXlw+N
 TXUQcwqcJDbavhX6geFv0kSzx+XliInEy4joECXB15An5etuwyX21eZlxfZD/2zaukIY
 h60VY/LDFapeyCXlauQwEF/Mb9fibddv40IVsQohCr1gO9cvkOS8gxyJSU1ZQc0N8xHh
 9VFO6B/wJh8XZMDWInhuE10hlPdC5/+hnLQPknK3WL4zIEaV+Qzo7pkkMVgzExL9RlBS
 juZxTvDDDvffikRPzPa04dA540Ki8xrYAja2yO1NDO2+SPG4YBgx6YAQiW6jLPMKRk35
 9MEA==
X-Gm-Message-State: ACgBeo060sXMCnP/X+qlvTTKwozj6CKI3M/tQQKZhNxPpy9ZnSJyjl7E
 m1igJd0mncuhp+lbnDh1neJJcg==
X-Google-Smtp-Source: AA6agR6BNQzK1eygfLVqafi+IKj+5SNoQRNFvFjsSXQ9SrsYA48kx+oq4JtFsDKzyMdo2GfcWh5Uxg==
X-Received: by 2002:a17:902:a416:b0:16d:4cff:269c with SMTP id
 p22-20020a170902a41600b0016d4cff269cmr29298810plq.5.1660163366834; 
 Wed, 10 Aug 2022 13:29:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 t188-20020a625fc5000000b0052de4886706sm2495906pfb.10.2022.08.10.13.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 13:29:25 -0700 (PDT)
Message-ID: <6e3e5974-15eb-05e8-a005-942884732fef@linaro.org>
Date: Wed, 10 Aug 2022 13:29:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_EXEC
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
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808171022.49439-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 8/8/22 10:10, Ilya Leoshkevich wrote:
> After mprotect(addr, PROT_NONE), addr can still be executed if there
> are cached translations. Drop them.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   accel/tcg/translate-all.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ef62a199c7..32ea5f0adf 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2295,12 +2295,19 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>            len != 0;
>            len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
>           PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
> +        bool write_set, exec_cleared;
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
> +         * If PAGE_EXEC is cleared, we also need to invalidate the code in
> +         * order to force a fault when trying to run it.
> +         */
> +        exec_cleared = (p->flags & PAGE_EXEC) && !(flags & PAGE_EXEC);
> +        if ((write_set || exec_cleared) && p->first_tb) {

I believe the bug you're trying to fix is in get_page_addr_code, which for USER_ONLY is 
currently a no-op.  It ought to be checking the page permissions there, as we do for softmmu.

I have a patch for get_page_addr_code in the works, because I was working on pther stuff 
in the area.


r~

