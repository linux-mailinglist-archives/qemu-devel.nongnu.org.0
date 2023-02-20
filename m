Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BD69D1D2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9XG-0000aT-VW; Mon, 20 Feb 2023 12:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9Wz-0000ME-QQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:00:57 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9Wv-0001Un-GE
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:00:47 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e5so3234223plg.8
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uN7OVPkibDK1mno7CMzh5ooGSAkxsejZNcElFWZs7ow=;
 b=Iy76agpCrjhGa/n0haDdtMOZh1uqSpEJ4jtc6o1ZZtJ/l18za1y7yoP4peieVy31XC
 B2Gm8lJ/FUmOk+pZa6WPLHO/qa9s02Z21G2wyDzr5jUIZCcoxBwHD+OKONm2D0b8soU+
 S+srTMWEd+rIUOG47l+uTmpryWPqzUvxVd1W6xdA+oiadFMnZZCvSEE3WP5sqv9W8dps
 gyAEZRRxmFYeK0gKqwZR9b12TAXhtjMmMty0+y5FTNORzKHxYyAeXJnz0qmbeNoQyqTB
 ApEmrObOF1zkZ1l9gCzxx9WYmvBAdTbd+/mK+qO6poeN7kqHaifP5pJ9L6IBSSNgg1zG
 QF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uN7OVPkibDK1mno7CMzh5ooGSAkxsejZNcElFWZs7ow=;
 b=Rubb8VsDJOndVf24UtcrpYRQBtQasCaYSaC6pG857kfo76QGH7D2P5+wCRaVGhDYSa
 3q6WKGyrWbURBZon/LsHw4WQZFvjXiNUDoe0D+4e11/8UIgB9WDNMdWKEEX8m+sLnSIV
 hXlPu2dq1jDNrEHHdr8VsI6WayfXdpmKqHIieg2maVlyaUj8tV+JrnS6G3YNIPmJ0GeW
 42PsLU2382ujt9BPvfWc6qP+ohr4Z72GUSiEoLdukHKtaWP+vDx1o1jqBDHjeiJ28FjZ
 0pxusVn+PsZuOrxJsJxDIQ254TgaaktJmN7T1ibJo8BrAs/SyQIK1ZaYhshmkvH6CD5U
 D7nA==
X-Gm-Message-State: AO0yUKW1H3hh6mZQEcXKd+BgNyvrfYuRGONBVQXfwWWHpvsTnC4k8UHa
 xBSGuSbS3Ia/EX6UOoMmW/4Qkw==
X-Google-Smtp-Source: AK7set+7uSRWYVmNKq0JpVj3tfHUX3++H8D1Se57YJ3UW61iPXaEqIDzZlD+uNPBBuH1+tAqc5w6Qw==
X-Received: by 2002:a17:90b:3e86:b0:230:b53a:fa13 with SMTP id
 rj6-20020a17090b3e8600b00230b53afa13mr3526540pjb.44.1676912443513; 
 Mon, 20 Feb 2023 09:00:43 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l12-20020a17090a384c00b002262dd8a39bsm1030341pjf.49.2023.02.20.09.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:00:42 -0800 (PST)
Message-ID: <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
Date: Mon, 20 Feb 2023 07:00:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
 <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/20/23 06:02, Peter Maydell wrote:
>> +    /*
>> +     * NOTE: MSP, PSP, MSPLIM, PSPLIM technically don't exist if the
>> +     * secure extension is present (replaced by MSP_S, MSP_NS, et al).
>> +     * However, the MRS instruction is still allowed to read from MSP and PSP,
>> +     * and will return the value associated with the current security state.
> 
> What's "don't exist" based on here? Architecturally MSPLIM, PSPLIM etc
> are banked registers; MRS/MSR let you access the one for the current
> security state, and (if you are Secure) the one for the NS state.

Copied that wording from David.

>> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
>> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
> 
> Half of these need to be in org.gnu.gdb.arm.secext.
> These aren't our own XML features we're making up (if they
> were then they would be in org.qemu.something), so we should
> follow the existing precedent about what registers go in them.

Now that you point it out (and I should have checked myself), we are kinda making them up. 
  The only registers within upstream gdb m-system and secext are MSP, PSP, MSP_NS, MSP_S, 
PSP_NS, PSP_S.  All the others are our own addition.

Should all the rest be in a third bit of xml?


r~


