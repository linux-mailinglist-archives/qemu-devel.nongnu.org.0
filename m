Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF8D69EA33
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:31:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUb9h-0007m6-M1; Tue, 21 Feb 2023 17:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUb9f-0007lv-Ig
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:30:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUb9d-0008N8-Nt
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:30:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so4040207wmb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d2Qti7qOcNvvIVJTRgJnAC2J2PFQEgF6grfaEpA3+Ys=;
 b=PPcTv5SkbGcrTX/irLHagfZ2bJyGWr2xh53rjdt/8+Yl4z44kngBLeDqO412UFV1KK
 h8iJrREMqi2Mxs01DEVCa45yyF9dGpUpa9b5osfs5Co+E8WPwoQtMDvvK5cFz00q+MQW
 OACBYxboNI52tzeu9hisZTBcmC0tY4TpZ9H7NNU8O4Vh0V7Kwdy4yIvrxau+04NBLYOp
 MgFpF1c6HUEYzhykZBnhD2yMuEpFI1zt6UVsr9ULpnUPhbxd30PkAFITYN6MHEhuwEUn
 Qmt0ToqD1BJI7cgYBY7YPVhMPYggmz5EdHmTk3KoRZy79/+WjfRV8ULdLhdFlJhZNaIt
 sgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2Qti7qOcNvvIVJTRgJnAC2J2PFQEgF6grfaEpA3+Ys=;
 b=iox2g3AHECzDiNUw/huiGSZFixQzXdgmDMi2KsCWw0KPFL7d2ksL54+dtjaLTf9vKR
 dm12345oYueTg9EhzyLb5MDh4zqSX+Q1UYSHNhUatCBHPuR0D0zQOsqx+mXR2FURdLg8
 /74arsgB1kHyJpLnL3RhVUFaueuWUt29c5BDleOJtIqyfVbNTInQh3slKKYdSZcCl9WI
 knXp29MHCuVMQfUufxey3ZNLsv+6Qh1V/GUuBsHEBU2sU8X2es/3BtUjr9ra+017YTYm
 pUC98A6LqHHicqDq02sDgxzQ2JyfRXaMq09eYPXDTgMsHaT7sjzR1Mf4xjlKisJCEABF
 vLGA==
X-Gm-Message-State: AO0yUKWAvbBdv7QOgJyqoQPO40dk/PVsGgtinyGgYAjPyZDmDeHsJa3p
 kthAuksxpaNbqJh9yFY6H52kAw==
X-Google-Smtp-Source: AK7set9JYtieswaiZHhLpcQHwYjDgStRsmFv9knwp3lXZTxjFWC8N/R76SXAh7THk6J0dx6K/9qyQQ==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac16 with SMTP id
 i48-20020a05600c4b3000b003e2147fac16mr2408424wmp.10.1677018631670; 
 Tue, 21 Feb 2023 14:30:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 15-20020a05600c020f00b003dfe5190376sm4846068wmi.35.2023.02.21.14.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:30:31 -0800 (PST)
Message-ID: <7ddd5f42-8536-47a5-5e4b-096221460f2f@linaro.org>
Date: Tue, 21 Feb 2023 23:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-5-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221153006.20300-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 16:30, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert(0) definition.

$ git grep 'assert(0)' | wc -l
       96

Should we mass-update and forbid 'assert(0)' adding a check in
scripts/checkpatch.pl? Otherwise we'll keep getting similar clang
warnings...

> Change code to g_assert_not_reached() fix the warning.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/dfp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index cc024316d5..5967ea07a9 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
>           case 3: /* use FPSCR rounding mode */
>               return;
>           default:
> -            assert(0); /* cannot get here */
> +            g_assert_not_reached();

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


