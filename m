Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056575AD20D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:04:35 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAq9-0005US-Vc
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAVv-000887-IT
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:43:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAVt-0003PF-GG
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:43:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so7640389wme.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=aAd82yseCjuEpwTDjcKkoWtPeyHa4Bx0pV8Upb13f2k=;
 b=WKsK32OwOc7KrJf0HgOiWvXJ1hsfDZDvCjQcm/t7hX+py6wMKdXuuHH7M172Y+6hrN
 HqatYJIObRz/6wAXBPq6weo8daalxvlVtZA2OLsjZskv1fIJMwsFL/TDTTApxftqVmd0
 Os9YCJbt1OvbUTU03+ymdppHHgG70nBaHTGv0ItgjcJjKLRO25XEPooxMmLFPgAwNx67
 a1FHdPGm452bzodlZrcZlQkgbecgzB6ex6yZUkjlbHPZ0EAXvM7W9kU/MYoAXfxyhzTv
 IqmV8Im6XW+FSg7Nc4Q7Ejo2fIqavamifgwyJVBY/eqRe8mQSXtUP56CGwXYGHKzNdSs
 YbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=aAd82yseCjuEpwTDjcKkoWtPeyHa4Bx0pV8Upb13f2k=;
 b=lmYmTHgqg5gV+xJdTdt9cbHHrtGfcAwgVxwDaWt+H5/9XbDZ7XuS9LxxIyi6yw197y
 mdy426pVusv7qcNtPREeRvmw8mgt/xiQKMiVEKTmT20ymrWle0raVa5E9Qf5aCDv6nr4
 3TaQ3emNTu4fxsTlkqXjhVZZ2V3AAp2UyNXfstmFC0gUSpDQBq5+2ykhPA8gMgNfaGl3
 AzGLHSsbKW2XssUpImHUug2cZZPqy6NLXFgM5GoMdmqKUarAKOaHNCp/1bu8dCWvdmyS
 2V1MyACeo5HP1C0qUnyw2VCQ2TVkZlFJuMLtkiyzrhm4xJ2JTg9Qsf/WRC6Ocwo+ois4
 JOIg==
X-Gm-Message-State: ACgBeo22mg15i+4NEoggJufrKb85B/FI9gWiXaoixVlC28k+fB+Gj0X6
 BoAB847goaxf+8TprvudYXcPXQ==
X-Google-Smtp-Source: AA6agR4E7QLyV5acjucH0hDzuKL8jdtRtgSeHTG3Yw66C2hF6xHRftShokqGN7xOMXx7Yh6z9InnPw==
X-Received: by 2002:a05:600c:4f4f:b0:3a5:a530:4fd7 with SMTP id
 m15-20020a05600c4f4f00b003a5a5304fd7mr10716020wmq.36.1662378215836; 
 Mon, 05 Sep 2022 04:43:35 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a05600018c100b00224f7c1328dsm8618983wrq.67.2022.09.05.04.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:43:34 -0700 (PDT)
Message-ID: <de6dd7b9-0ea4-240f-8d29-5305b3ff29aa@linaro.org>
Date: Mon, 5 Sep 2022 12:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 14/20] disas/nanomips: Remove function overloading
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-15-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-15-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> -static uint64 copy(uint64 d)
> +static uint64 copy_ui(uint64 d)
>   {
>       return d;
>   }
>   
>   
> -static int64 copy(int64 d)
> +static int64 copy_i(int64 d)
>   {
>       return d;
>   }

These functions can surely just be removed.


> -static char *IMMEDIATE(uint64 value)
> +static char *IMMEDIATE_UI(uint64 value)
>  {
>      return img_format("0x%" PRIx64, value);
>  }
>  
>  
> -static char *IMMEDIATE(int64 value)
> +static char *IMMEDIATE_I(int64 value)
>  {
>      return img_format("%" PRId64, value);
>  }

And these would be removed by the previous conversion to direct use of printf values by 
the individual instructions.


r~

