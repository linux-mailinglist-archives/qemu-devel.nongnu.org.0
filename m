Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F875B5681
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:42:46 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXf1h-0005Y9-1F
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXeyv-00043J-Q7
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:39:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXeyr-0000Ha-2g
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:39:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so6687624wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ha+VbWIPu1yrttWK476RWzcjRdjqeRiFdkU2gI08oGM=;
 b=ni8z/enal0ifW6heomCFCO4CkEajQbYjGSR5gaK4PEvBPooLIiyqniFMKiOeaOhthn
 iLluQtKBmgKTWWZExbSjGNhbWouuLFyekSgutRpuxvRtJ6oMhQML0vXY2JWkUBdwlO7V
 OoD3sdEKWqYuQauc6my+DGeh9Fk6ypRFoMukr3jp5vWH8YzuKJzUkxAxvyJnzvpQuEkk
 P7xPIodzpdw637wojuvnlsu39NCjyVIOp95cNZ07hNuLd36OkloTBC2ujCwa1ml3sNMe
 lhGSAeTxRXE0pJA1hs1mG0g/XbR/RWP+Pb1GPO9kR8pcMaHMKFpQPlIgTfWQGOlyrXUQ
 yuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ha+VbWIPu1yrttWK476RWzcjRdjqeRiFdkU2gI08oGM=;
 b=4kTyONQM4iJEaCSnYcdLKTBH7uSEGARz3Q8flfFapnlKADGckXhQg9OvzJ0+HiZ71/
 F3t+MzBC7AqRSNfVnp+QVxjDlrP/k3qPHb7hwPOP9Cx5FvKUPB7++CoynpvbJw3hNj31
 5x9tzCiEWhRWQL1SWPVDVnOHwpuAJ99ssPmrY/7PmUvbaNSG72cWe1Ul3uUbQjerRxoq
 grLIotWdAihOuJSa72XuJwbqSvvXGcr5JNJ/sx6P10H7K99+hzffFdDeIO/blAWwM76L
 eNC77cxz4w4zVoxPxFTXpJFjrwcZVEWOkX2H6JwPppcjtxQCjH2jPOrbgal9/YpKPusV
 c3XQ==
X-Gm-Message-State: ACgBeo1AeKM+cYjt2JNgqUu5Rmj+LE2n2aRWxJkhNd/MCCSPdr8l9kRt
 BDujkGwxaOvVPEs6uj1J41bvBw==
X-Google-Smtp-Source: AA6agR7BvsXo5IYyaBVncC4KDE0PlOxOx081qBv0+RjMN9MI0sqIbZb5TDRZ8rO5YtY8HSN9X3Knng==
X-Received: by 2002:a05:600c:4ec6:b0:3a5:ff4e:54d4 with SMTP id
 g6-20020a05600c4ec600b003a5ff4e54d4mr13127791wmq.25.1662971987440; 
 Mon, 12 Sep 2022 01:39:47 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a7bc001000000b003a5ffec0b91sm8817739wmb.30.2022.09.12.01.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 01:39:47 -0700 (PDT)
Message-ID: <2c441cb0-2cfb-a6da-528e-d7c7b577ebcf@linaro.org>
Date: Mon, 12 Sep 2022 09:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/37] target/i386: introduce insn_get_addr
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> The "O" operand type in the Intel SDM needs to load an 8- to 64-bit
> unsigned value, while insn_get is limited to 32 bits.  Extract the code
> out of disas_insn and into a separate function.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 36 ++++++++++++++++++++++++++----------
>   1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index f8fd93dae0..f1aa830fcc 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2308,6 +2308,31 @@ static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, int modrm,
>       }
>   }
>   
> +static inline target_ulong insn_get_addr(CPUX86State *env, DisasContext *s, MemOp ot)

No need for inline.

> +    default:
> +        tcg_abort();

Standardize on g_assert_not_reached().
I should probably zap this macro entirely...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

