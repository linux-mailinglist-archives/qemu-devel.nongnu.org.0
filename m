Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3027D6CAC2D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:48:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqwO-0002Mo-5j; Mon, 27 Mar 2023 13:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqwL-0002M2-7Q
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:47:29 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqwJ-0006cv-Ku
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:47:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so9719393pjl.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679939246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z6vLD5zSNsteUANfSX16dODqX7LPGEXn66Zr5GNXe8k=;
 b=Z0cGVbjHSCEsbxRI7eFwvNC1lJZ40Hz4mp/0iSOsp6sIWInVP/C6mGWDWfBi2yWsbL
 bArBrAbUzeMm+UFoVgF9RInHf0E2g9XoOU7OHYVcaF+UmQm/chTBRGEWFd5Fj7Omxz5v
 Xpk72qMlFhYY5D5jugpQ0/dLD458tdyRRQQW/5eZFwVC/7bupavxPxGlZ3UpvCp5406/
 e9iL46cRxZMcP6OXJy26vw/TWpaFQQ8O1DPw8In7BRwZ/QeZGkxEA0K/t2a54O140QLv
 5mNpO6AXVr1JQEyx8mZQszEHb+xkibaIrxXmQIihlvv9W7GLIib113dk9rN32Bq401In
 ijag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679939246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6vLD5zSNsteUANfSX16dODqX7LPGEXn66Zr5GNXe8k=;
 b=DavELAF62Xbly8ui5xSgvQG7nSaP/1DzF5F6sdKGRQeiVkOsRBVtlkyH9CkcIrwvhA
 TQBJAkLXlQBIE6aeTXUZu2ibNCSlTZ1H0wYH/PGjD+GM3+GXbwsoHCFuFxB7si/CrE5v
 z+fFLAZQyrBB27OnR4k8laKuyHSQ0p1J0tqAY/wspo8u91RYvRiFsk9Giewc/rjuFtcz
 bcCgSOEMpkWSDdG5/4lVFQ8VKXwhDvLptLkRb1Ce4YB8f/5J9TZqBruQIWS6HtmwfCfJ
 ELhpyImRrmrkyad/A11MRQHVMArC6KXRq+h/xwddohh4tAisHKXXnHbO5kCKjootljiY
 qevg==
X-Gm-Message-State: AAQBX9cOVbUefBGDJpjodFPtHqlQuuTf4QLekvmmK+re8w2mkqYg0YcK
 HcOgnugeWGTBSjnHfZv+mdnfPETxGU/idD6UCdI=
X-Google-Smtp-Source: AKy350YNiInhbG9Yy6t5W3FMjAum5PoarVkEnGKpexfy89M3csKe6o/eyaZS9E3mDJWV3mDcjj5yRw==
X-Received: by 2002:a17:902:ecc2:b0:1a1:f95a:2505 with SMTP id
 a2-20020a170902ecc200b001a1f95a2505mr17683253plh.29.1679939246158; 
 Mon, 27 Mar 2023 10:47:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170902b41100b001992e74d058sm7375238plr.7.2023.03.27.10.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 10:47:25 -0700 (PDT)
Message-ID: <d5cf59e0-ee23-7b17-6ade-03760e17d655@linaro.org>
Date: Mon, 27 Mar 2023 10:47:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] linux-user/sparc: Don't use 16-bit UIDs on SPARC
 V9
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier
 <laurent@vivier.eu>, Gregor Riepl <onitake@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Zach van Rijn <me@zv.io>
References: <20230327131910.78564-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327131910.78564-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 06:19, Philippe Mathieu-Daudé wrote:
> The 64-bit SPARC V9 syscall ABI uses 32-bit UIDs. Only enable
> the 16-bit UID wrappers for 32-bit SPARC (V7 and V8).
> 
> Possibly missed in commit 992f48a036 ("Support for 32 bit
> ABI on 64 bit targets (only enabled Sparc64)").
> 
> Reported-by: Gregor Riepl <onitake@gmail.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Tested-by: Zach van Rijn <me@zv.io>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   linux-user/syscall_defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 614a1cbc8e..cc37054cb5 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -61,7 +61,7 @@
>   
>   #if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
>       || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
> -    || defined(TARGET_SPARC) \
> +    || (defined(TARGET_SPARC) && defined(TARGET_ABI32)) \
>       || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
>       /* 16 bit uid wrappers emulation */
>   #define USE_UID16


