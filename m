Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0E3D4F69
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:17:00 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7igN-0003a4-57
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ieK-0002H9-NZ
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:14:52 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ieI-0001YY-LU
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:14:52 -0400
Received: by mail-pl1-x636.google.com with SMTP id d1so1689251pll.1
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pYBq0fkzpUJJtZwHSaA7momNQhe5XHofPt87G+4DNis=;
 b=oufxN63s1/SrTBUjkyq/VJ/diXtpoi6DlvSiLQxjrFyPof1YtakEQtxBYIHVwOd2Td
 NbqQY1r8GMqwCurVcCBD4AzqljDArc6FDL3M0scGp874WZyv8aHLMGcbD10oEOwpPirp
 YumCJw/aLaCQm74MVW871QREa46mE7rz8lPjvtn9hydodV41e5p9etMUC9lQtEE+aqrT
 KtWU7EsG9mp7V39XNPAyxamkWTbtHMmcYTgwJg1IRvRaFMe1ZLErNfYKm12s0NcSzhas
 hFUJfMKiAvtiFxLkLpBfHuw5Y6iYGlPeqlLTckwZzbyOMjl+DtdhPwa36/n6Kn38SUbl
 DuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pYBq0fkzpUJJtZwHSaA7momNQhe5XHofPt87G+4DNis=;
 b=K3fOECajWYyIQus1tSEp+p3vz9eUiwtxFKfmVJitzwnoziaEIZFk2Lz0xshfMr5HyN
 u123x5jI4o/Xit1yd1wGrpN9RYtej1bJNTdTDs9g8AiU5zA3TV8nX9nQlQeD5jqfuzWZ
 52+WCbogsqD//I/s6I2c9IE28dHar0TpBTyoN0MQju4eR9yQgX6teXGA/vD2od96dc9w
 UH2EzZ0o8qv3FzjLE7VdZ8Ahzw1ER+NtUMfiYFWXA8q42w6MEPEMCEkZ4CnlC6hEYvic
 h7/1zqNRyV4bIi73DlG0nzR/E/KgOtQMB72NPQjrqkb7+lTWH5Ui3g+0HxYYBcgmRfni
 LaNQ==
X-Gm-Message-State: AOAM531KCQsrA1odgP80cvXXn9XMv6y8LETMjDO5mkjmaV5u0Jasjjb0
 LIxcdBy6Mjurhb2fHYUSxaUIpS+Wd3fqVg==
X-Google-Smtp-Source: ABdhPJzP7kWIYune33emUoAVbhXlkI3DuAmBu0/8uSFNm5I1B26QKWE6pO/1A6E9T3LM2VWZmkCZQg==
X-Received: by 2002:a17:90b:1645:: with SMTP id
 il5mr13469349pjb.113.1627236889156; 
 Sun, 25 Jul 2021 11:14:49 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id t19sm16674870pfg.216.2021.07.25.11.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:14:48 -0700 (PDT)
Subject: Re: [PATCH for-6.1 1/6] target/arm: Enforce that M-profile SP low 2
 bits are always zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78c107f3-23ac-3279-99e1-84df8c5498b8@linaro.org>
Date: Sun, 25 Jul 2021 08:14:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 6:21 AM, Peter Maydell wrote:
> For M-profile, unlike A-profile, the low 2 bits of SP are defined to be
> RES0H, which is to say that they must be hardwired to zero so that
> guest attempts to write non-zero values to them are ignored.
> 
> Implement this behaviour by masking out the low bits:
>   * for writes to r13 by the gdbstub
>   * for writes to any of the various flavours of SP via MSR
>   * for writes to r13 via store_reg() in generated code
> 
> Note that all the direct uses of cpu_R[] in translate.c are in places
> where the register is definitely not r13 (usually because that has
> been checked for as an UNDEFINED or UNPREDICTABLE case and handled as
> UNDEF).
> 
> All the other writes to regs[13] in C code are either:
>   * A-profile only code
>   * writes of values we can guarantee to be aligned, such as
>     - writes of previous-SP-value plus or minus a 4-aligned constant
>     - writes of the value in an SP limit register (which we already
>       enforce to be aligned)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

