Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C43FCC45
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:24:35 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7Un-0000g4-TQ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL7SS-0007Jj-RZ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:22:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL7SR-0005mE-9T
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:22:00 -0400
Received: by mail-pl1-x631.google.com with SMTP id d17so11033475plr.12
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y06EPieyIG7Uq1AkogwEOeIK4zF8IAzB6ZcmKZTMs1Q=;
 b=rSjcwvxPCehDGPLQ+u2cLlg6z4wcDDhnl9yjMryU+JSCwMUAdNYpRHQXDc7Uyn70mI
 KiWgvZtatNPp6Z/jFM97WShge/5RMM5ViOqaSW/gzR4WrFV+EqTPjdfuhgaOTQDcw45v
 KEUYwgltF/+VmfDVMX/9RuSeyqxe4R/xhzIsqSNAa9+0qF1LpvJ1ienNbilVvtmdOEyk
 bJFzQ7g1qUeFNbDtc6sRZKEZmVvDmPSb9CvELHx5fvwWzqgeHJhJq/lpkAIL+ipFLKKw
 fHpguT2jZAmdgz5XJzk/ObfcaifIUJNLJVFaH0lOs6fClQBmptyDvRD2HgyaanFQQDq7
 BCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y06EPieyIG7Uq1AkogwEOeIK4zF8IAzB6ZcmKZTMs1Q=;
 b=aXLfykCqgs4IHpFkXzvZL3AvivkEjia7NEbq2ueb6ZdSU5luxpaiBJR0TTnbjJjQBq
 9+1I5W9FG9nQW8WICjLWx1/L07pQ8dvzOrVvPv83E79Ml9FO6uIOcni9vFPBnoX23Mg9
 QK/IvTAn3khJ/lpEyaPi7KzTB3uwGGpZ5yLn8446dbR2Z99z+DdjM2SNxeldReL7C9BO
 LlmSAgoCyNBdEQYqKNEd6uRDxzyzhmxCZUYlYforPi2RjxEYc/aHOenA5jfUYsSMbD0b
 sVbSrRtCCWvuaJ7xFidAmfkvV6+0kJF0j+wXz3QAjtI9pieBrkvEQJJgOpSlHbNtQeye
 oeXA==
X-Gm-Message-State: AOAM5335JdAEpCMmUeQ8QysuUAWkTzebBTKT6Fw6iN9Xy9xdGgXiaRw+
 3u/Y4hp36EGqLoBPt7YDw7jp6w==
X-Google-Smtp-Source: ABdhPJxzlHjy7+CXAqotaT6d8gPIqPNsNzAnP4KtL724eebTllHQiPFKZ/WhJhXQ7zc1baryyhVasQ==
X-Received: by 2002:a17:90b:1b44:: with SMTP id
 nv4mr6649616pjb.192.1630430517703; 
 Tue, 31 Aug 2021 10:21:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id n1sm6765255pfv.209.2021.08.31.10.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 10:21:57 -0700 (PDT)
Subject: Re: [PATCH v2 03/19] host-utils: move checks out of divu128/divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-4-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <984687eb-4d74-38e4-70ef-b8c527fe828b@linaro.org>
Date: Tue, 31 Aug 2021 10:21:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-4-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> -static inline int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
> +static inline void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
>   {
> -    if (divisor == 0) {
> -        return 1;
> -    } else {
> -        __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
> -        __int128_t result = dividend / divisor;
> -        *plow = result;
> -        *phigh = dividend % divisor;
> -        return result != *plow;
> -    }
> +    __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;

This is incorrect, before and after: *plow must be zero-extended here.


> @@ -97,13 +101,11 @@ int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
>       uint64_t carry = 0;
>   
>       if (divisor == 0) {
> -        return 1;
> +        /* intentionally cause a division by 0 */
> +        *plow = 1 / divisor;
>       } else if (dhi == 0) {
>           *plow  = dlo / divisor;
>           *phigh = dlo % divisor;

Let's not do two undefined things and leave *phigh uninitialized (e.g. riscv host, where 
div-by-zero does not trap).  Just fold the div-by-zero case into the dhi == 0 case.


r~

