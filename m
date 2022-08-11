Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0858F6A7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 06:10:50 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLzWs-0003NB-GI
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 00:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLzUp-0001gm-HR
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 00:08:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLzUn-0005pj-T0
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 00:08:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id pm17so16633922pjb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 21:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NGHVAGsB2OuOTAXdlJJ80qpvBGM7iS5X9CKn2XknuN8=;
 b=TcLNVNU9rVF1mU/+h6Zz2YG91PaFyT8vd1OJdKJYdy3BoOTmtL65ibdIbA60ZlOq6Z
 veW7NNlzRpzQ/g3rAE1J9fUJgtTj2tTZio1B754/aXOaLUfWqsx1lnffv1LfkcNdlSTI
 O0YGDrD6TTrWRrQiY1sFkSDOM2mLGTNaT1W7gotrj0Ca6gOzUTdaeoIi3uZzmhE/4KkF
 mAIA8rgox+XKkDXbFuPAZ6rv6pf5hD/bYGqPbAl5xISH7Ubtx5k7tmwksDBe0d353sGD
 PNfI9cLxaB6xNf0woqR89l5I+EYR9MePuejmZrIfr+F2r1FVaeQzr2MSZkUzJuUeWUg5
 se6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NGHVAGsB2OuOTAXdlJJ80qpvBGM7iS5X9CKn2XknuN8=;
 b=wfdp+yrltdAREMUaPS04+ZeX/WzTYWROO5OJIU3GlLZebz8bZuNhvQj2EnpIouSuXB
 f6ZHmTMIWI9H49XSXHCxyhf6ZBg0oZUVEc1RXpoPlc+8FNJy8yRuB8awTceXqmWPuxvN
 gixJ6PJU9Ju2SDVOc8T6AFy18vsz/zwDhYW5J27xewaSgyRMllwf2Q2FAPqw3lAERm43
 sfX/bItdb/VO3tygbtidt8mj9N/nNOUqZT+1IWaR38eZoh4jzd8CESF5z7SQzbJ/5+xY
 hUXIZVbLaVGf18OnKT26J9EQJTXGeOSmnP5MVnR8p5PFRk/FsqkaxsrqAzi+8kD3XUpi
 UySg==
X-Gm-Message-State: ACgBeo0pmPOGzeZa2SMFhAg1OdQQWSZEK1L+3VUL3DTnOX76YSj6/nIE
 nxQ0PheF1naX9akUEtMzZXGddw==
X-Google-Smtp-Source: AA6agR4fip004JbLGJPpc0ROIoX8Vn7jlr8e2QjBMF2IjgyK+cd9sOd0AhBAixUsp8zyLA9uWbxvkQ==
X-Received: by 2002:a17:902:f70d:b0:16c:50a2:78d1 with SMTP id
 h13-20020a170902f70d00b0016c50a278d1mr29947059plo.34.1660190912254; 
 Wed, 10 Aug 2022 21:08:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b0016bfbd99f64sm13963695plh.118.2022.08.10.21.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 21:08:31 -0700 (PDT)
Message-ID: <2a763fda-f8c5-5716-9d89-91232f66eafe@linaro.org>
Date: Wed, 10 Aug 2022 21:08:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/4] target/s390x: Make translator stop before the end
 of a page
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
 <20220808171022.49439-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808171022.49439-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
> Right now translator stops right *after* the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   include/exec/translator.h    | 10 ++++++++++
>   target/s390x/tcg/translate.c | 15 +++++++++++----
>   2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 7db6845535..d27f8c33b6 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
>   
>   #undef GEN_TRANSLATOR_LD
>   
> +/*
> + * Return whether addr is on the same page as where disassembly started.
> + * Translators can use this to enforce the rule that only single-insn
> + * translation blocks are allowed to cross page boundaries.
> + */
> +static inline bool is_same_page(DisasContextBase *db, target_ulong addr)
> +{
> +    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
> +}

FYI, I've had occasion to pull this out to a separate patch locally.


r~

