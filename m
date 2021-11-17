Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1EA4541B1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:19:09 +0100 (CET)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnFDo-0004nO-7k
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnFCi-0003gt-4I
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:18:00 -0500
Received: from [2a00:1450:4864:20::42c] (port=40679
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnFCg-0008Dx-6w
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:17:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r8so2652660wra.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 23:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UimUYulxuqwAWyETPD6cM/frhZjII6aeUj9pNtfEs2I=;
 b=DQeYtbtv5n9ZFcEvXjXcsmzO+BmMlsCkzULQC9dnScBGF7hhdzGwjgBN6mt3kqYUW4
 QEi3Wsf/i/6GXy/TckTBPNcoT/mGK0p0jPoziA7t8YvetO6MrXq42gLk/WJ2W6gSHSKH
 1Vd+DBk6+X4XlfcvEuqSB1T4OBiVCgdcRgeibhIel+z29cjAjSFWcL59NqrLSwcEawIX
 jxVmrNEjITzZCo4Ol1RQ7spAJG06fO4wjMXwecgZ9Gfe6Q8psgBCKKZ8zjWXWNfM+NTy
 K9VaQvQ341kX7vSdNj7+EC7Xzkbkr7u3sTLSWacFhzf7rY0kH2UA0vpew9D9qlwVM6kT
 44kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UimUYulxuqwAWyETPD6cM/frhZjII6aeUj9pNtfEs2I=;
 b=IO6XbgA5OWnfB51i5CnFZk/20ljjH6W2ZFNbZLLklbwEN/k+hDhVvMjhm/ea/vjucB
 uDwDf8r6OdVuw/yDJwDN6Mb2iaNZVkxfaOQtZKKzGXfVUAH9mBIKkvUPF8BBKuxdrS2s
 cgJETLbfmS0owhGDnIS6QnkqRw01h8sjtwRrmAZDrFi/ER3e5W9lvi9pWbbmyj3roZOk
 q1a0wje+nCTKZc4yie4yZAsme9CsWzCTKGRhxHbwfrucY1ug6bTKUMt4WsVezTvqdlxb
 rkWxHIJHu6KSOG1L2MWRw9JQWGOk2FjMinO85cEGatIwsYC+2DEmPz0Fhnltcq16fLn9
 QaaA==
X-Gm-Message-State: AOAM530RzADiMIwuNIonmBv+Up+4xiMdnIHY6ECYO+j4kRyYHJTOtZIB
 8DCZ/c99zJJ9FYIt7Agy6Ala9w==
X-Google-Smtp-Source: ABdhPJwsGDNmtgGJ8xIj0N9IPqkAMf4PJTklxf5FSOAivhax5O6EanbwZSEfZMTWsLXnkMBqiWB/+w==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr17994137wrr.143.1637133476875; 
 Tue, 16 Nov 2021 23:17:56 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id r17sm5375087wmq.11.2021.11.16.23.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 23:17:56 -0800 (PST)
Subject: Re: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211116210919.2823206-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9c0e14e-6aee-06ea-dc5a-3e96e29bb2f6@linaro.org>
Date: Wed, 17 Nov 2021 08:17:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116210919.2823206-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 10:09 PM, Philippe Mathieu-Daudé wrote:
> Linux Hexagon port doesn't define a specific 'struct stat'
> but uses the generic one (see Linux commit 6103ec56c65c [*]
> "asm-generic: add generic ABI headers" which predates the
> introduction of the Hexagon port).
> 
> Remove the target specific target_stat (which in fact is the
> target_stat64 structure but uses incorrect target_long and
> ABI unsafe long long types) and use the generic target_stat64
> instead.
> 
> [*]https://github.com/torvalds/linux/commit/6103ec56c65c3#diff-5f59b07b38273b7d6a74193bc81a8cd18928c688276eae20cb10c569de3253ee
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/syscall_defs.h | 28 ++--------------------------
>   1 file changed, 2 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

