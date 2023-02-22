Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC169FD3E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:56:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUw9r-0001v9-5A; Wed, 22 Feb 2023 15:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUw9p-0001uR-5y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:56:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUw9n-0006Fb-L9
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:56:08 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so2172195pjb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hm6gZqMrVLJHNBocnV8Og/i/0BEfwFH9ls5LQ1lmtNw=;
 b=MYTVtrT2Kuq2AiiBploMAYsdmcmrPSOG4qnP3O0dGkxqfUHYpUyZ2ajDlRVlPTcp0b
 +tG7Bu/aptkKln4ywuzYFt6sSXQYyh1n2hxIWs1XsUln5pb65aywEoVI1kRoBDBQyKpH
 bjN3E6TrEdD878UXEDVRWs7Jpu5+xkrpUNYVRbDijF+5lztJz+86NX5xyYbnB1+asHck
 ib1VL9/zJ/lC7RBV8j5LMSUxdwfKvew4mXY/FcK+cjv5jZwBoIxWHEP/OJjfSCYkmSfs
 Q44eZ5AyyFKAttuGcqhDUTId4umJYNtL9ggIggyr05wWM8JX5guvvt8SJVQS5/cxAYSB
 qWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hm6gZqMrVLJHNBocnV8Og/i/0BEfwFH9ls5LQ1lmtNw=;
 b=QteDKgxFNVQGUDASlc0Zf2Uwh2BYpNBvboMvwcEpAwshLTt2xOJruRZLzbgKB1LomO
 N1dYX5ud30lGFNV4M3OvUJhw9+lUQKjoPZlsSYo5NbvQNtHtF28jzRQ82qP71XuyKBkU
 FVY1t14jKvhpm40bwhAXGhsPESSxpvEq0SJCDYn9Gd8ULeYYSYHW/A97dyPvnwQLZSrh
 mf4PYrJQ31pgxNeE4ctAlSpkYRHjWPt5YN39aBBpMuY+8UxKaKPA8PaK3fGQsUdfbNiG
 6tqGs5vjLgXIocbwwiYPsLIKhXp3UUWh9Im8NmdgCOBdNKYNvBghjk7lbOG22x6gcFos
 PwCw==
X-Gm-Message-State: AO0yUKXKqERQNjp7MlvxG1HM6LvJCtHktaUJITdwAxjXhMkNUwxFoV2G
 vmT8zC2Wi6ragyE2TxYDQAUEfg==
X-Google-Smtp-Source: AK7set/d3+RkOy3uZaLMl9uRqAllUhKfKjI+lgUvR3QpsCDDLI40KSmf9WHwaR5ExgX4Jlm6YLQnhw==
X-Received: by 2002:a17:902:ea11:b0:19a:b6b1:ca82 with SMTP id
 s17-20020a170902ea1100b0019ab6b1ca82mr11086528plg.10.1677099366006; 
 Wed, 22 Feb 2023 12:56:06 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 bh4-20020a170902a98400b00192a3e13b39sm5708639plb.264.2023.02.22.12.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 12:56:05 -0800 (PST)
Message-ID: <e3662d65-5f41-5d78-b7b9-1cf5a39ae5f7@linaro.org>
Date: Wed, 22 Feb 2023 10:56:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/7] targer/arm: Inform helpers whether a PAC
 instruction is 'combined'
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-6-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-6-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 09:35, Aaron Lindsay wrote:
>   static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
> -                           ARMPACKey *key, bool data, int keynumber)
> +                           ARMPACKey *key, bool data, int keynumber,
> +                           bool is_combined)

Add 'ra' argument here at the same time, to avoid modifying calls to this function in 
successive patches.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

