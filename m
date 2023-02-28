Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0A6A593B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:42:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWzJF-0005wa-Lo; Tue, 28 Feb 2023 07:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWzJ7-0005i1-LL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:42:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWzJ5-0003Qo-TA
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:42:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso8990872wmi.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c5hJ+eTqZrxz3dDPsvOutkkWilrj1NrB+BKXpY9G/MI=;
 b=SOuwLi4NWy2Is8TFRYPyhjZRqvwXTQuvQb4wWkN7/8oEAR8/fqx+J1wiWxCHod2/WG
 Jed3xVcc2tXblRFBWcFhm8Dcv2yanIyms+KW8+lx4cBfWHS/RN8BZ64sgSpliMwuZR6j
 xBVXvWPKVDtrooecuewutFdqU804yKNtD96ujBcMPlLUXhrA8zqGoQkAezqkZ/nZ9OpQ
 pRj0h2G7mngPbCetI3Ie5KTu9FPizajApv0owcl8WP4FZb1YCAtCIfaEKSlRtJi75R2A
 yN9SgFyig4cpAzL69XwvbxGXHK1d9GxZRSvgJxfn+r2RNlmXkwgNSRASgx8atCAjnFAM
 6c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c5hJ+eTqZrxz3dDPsvOutkkWilrj1NrB+BKXpY9G/MI=;
 b=o/ZYcqCDecGD60EcAs0FFc4lMeADth0p1c9vSRRgFU5dIQdpc5KO8HKzxi7XpPvvwC
 6aVeCqB77DSewm8vyzup/zuuTxwijwYsfU1UiI1USc8Ij+DdQ9HgrGHlTw99i2K9n+fM
 tI6WAFM1iYSx3DKjny35AtG04yYGcVhDwFEYT9EXzxvvN8g8FG2a0l6IJ2aQflLIZjm2
 ubBJ/euGZBb4WVM1NiipqkiGqE22k27MaSbbnsH1VPfQkmFLCX1fYEn6skTFyo+Wj4Z9
 5G/duVNiSc+lhV/R6Zz3YS8ZiuRXV27TBtnY5Wra4716fbkU+TQ0FcNmW1JZdcgas9Iu
 6R+w==
X-Gm-Message-State: AO0yUKUEJjI69K3FEXpzPccWtNh8ZX1SuEi5dM02+W3Siezm8dghvZD+
 TgT/AOC87m8QU7qY+h2+r8D7gg==
X-Google-Smtp-Source: AK7set+uOv8KB/WFsC7VRZ+FhuikWbE8cjk2p9KbeS5mcvAVtNo4t8naJHU0IYFuzdm6M7m50fHwlQ==
X-Received: by 2002:a05:600c:a695:b0:3e2:f80:3df1 with SMTP id
 ip21-20020a05600ca69500b003e20f803df1mr1888130wmb.19.1677588128842; 
 Tue, 28 Feb 2023 04:42:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003eaf666cbe0sm13161048wmq.27.2023.02.28.04.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 04:42:08 -0800 (PST)
Message-ID: <e18377f5-5a8f-20a5-3c32-30f360b0475a@linaro.org>
Date: Tue, 28 Feb 2023 13:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC] CXL: TCG/KVM instruction alignment issue discussion default
Content-Language: en-US
To: Gregory Price <gregory.price@memverge.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <Y/Cm5nuJl3G2CG2p@memverge.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y/Cm5nuJl3G2CG2p@memverge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/2/23 11:22, Gregory Price wrote:
> 
> Breaking this off into a separate thread for archival sake.
> 
> There's a bug with handling execution of instructions held in CXL
> memory - specifically when an instruction crosses a page boundary.
> 
> The result of this is that type-3 devices cannot use KVM at all at the
> moment, and require the attached patch to run in TCG-only mode.
> 
> 
> CXL memory devices are presently emulated as MMIO, and MMIO has no
> coherency guarantees, so TCG doesn't cache the results of translating
> an instruction, meaning execution is incredibly slow (orders of
> magnitude slower than KVM).
> 
> 
> Request for comments:
> 
> 
> First there's the stability issue:
> 
> 0) TCG cannot handle instructions across a page boundary spanning ram and
>     MMIO. See attached patch for hotfix.  This basically solves the page
>     boundary issue by reverting the entire block to MMIO-mode if the
>     problem is detected.
> 
> 1) KVM needs to be investigated.  It's likely the same/similar issue,
>     but it's not confirmed.
> 
> 
> 
> Second there's the performance issue:
> 
> 0) Do we actually care about performance? How likely are users to
>     attempt to run software out of CXL memory?
> 
> 1) If we do care, is there a potential for converting CXL away from the
>     MMIO design?  The issue is coherency for shared memory. Emulating
>     coherency is a) hard, and b) a ton of work for little gain.
> 
>     Presently marking CXL memory as MMIO basically enforces coherency by
>     preventing caching, though it's unclear how this is enforced
>     by KVM (or if it is, i have to imagine it is).
> 
> 
> 
> It might be nice to solve this for non-shared memory regions, but
> testing functionality >>> performance at this point so it might not
> worth the investment.
> 
> 
> Just tossing this out for discussion
> ~Gregory
> 
> 
> 
> 
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 061519691f..cd383d7125 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -171,8 +171,16 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
>           if (host == NULL) {
>               tb_page_addr_t phys_page =
>                   get_page_addr_code_hostp(env, base, &db->host_addr[1]);
> -            /* We cannot handle MMIO as second page. */
> -            assert(phys_page != -1);
> +
> +            /*
> +            * If the second page is MMIO, treat as if the first page
> +            * was MMIO as well, so that we do not cache the TB.
> +            */
> +            if (unlikely(phys_page == -1)) {
> +                tb_set_page_addr0(tb, -1);
> +                return NULL;
> +            }
> +
>               tb_set_page_addr1(tb, phys_page);
>   #ifdef CONFIG_USER_ONLY
>               page_protect(end);
> 

This is:
https://lore.kernel.org/qemu-devel/20230222020023.904232-2-richard.henderson@linaro.org/


