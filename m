Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9B69EC4A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 02:18:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUdl2-0001El-Tz; Tue, 21 Feb 2023 20:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUdl0-0001Ea-Ta
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 20:17:18 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUdkz-00042U-Dc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 20:17:18 -0500
Received: by mail-pg1-x52e.google.com with SMTP id d6so53902pgu.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 17:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fKqfXcL8mKASQ8zauu2bq4tXL9xDytMquxgv+8KojlQ=;
 b=C8gZUVhy7S+r/irc5cp/z7fZtjMIqsnlXiV2Q1p53Uu6SFTy7NuvrQUib2BM7hBI0M
 0itGv9i1H+IhzydnVJzf32E7gC/T50hTXmmuSy4VDjQ2TY0yJp9wZO1zQ1/NfYL4OJcu
 TH6WJWFiTqh0vPQ3RNuMxXv2yG1EVEcNpxYYzBTDHqmcY8Mj6sgLF1Bm7baXlmL1l3T9
 NiVwNQnWvmW/JAAr+7ER1B7WiWXn7oPEVam9yl362EgzlBM3WUnJcQRyE+S8PETNTSL1
 pWHQTGT2L7UNn/M9kfn/YOSHbtIL1vPPfwTzpBTiI+fkf2O+SIl45cKQJ3ckHGX4keX4
 06rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fKqfXcL8mKASQ8zauu2bq4tXL9xDytMquxgv+8KojlQ=;
 b=UdD6S+NasWbDXFdHU9mFFW0PzmHtcjoHMoFiiNLKDo93gsS5ccs2k3WbiI5KACarZQ
 cBClFeWmGtuytAIneojl2FAufbXJmKcs19OIA/5U39x+3idGOuhyJ85/thLpIVxGK+bG
 rFz5R1S1ojKcnB5EjszRhWEM45u+3pQDKADCXoF8zV6h7+c6MW4Lp8gzE5UvnPNyWYcl
 k3AWglALpSpgXB0yE6Oy4o3zPObD57rl+5d/YM4u7K/HPZiTupIwIfoXWEGZMBzSMQ/L
 WZ6MsQiyysm/YW8X74/8wo1hF7PNArK2wyg0EL/DJhPapLQiYNOp1OvrlESpTmSmx3sX
 3aWg==
X-Gm-Message-State: AO0yUKV5PqKd0zg1ewRNz8CWPxN51LeaChQmBSD3YMFuglA10pD6B+VD
 91LeAlYpUOEAY7FjN1SLJouxHw==
X-Google-Smtp-Source: AK7set8LHvDbgh4sfwfNh5o2VUCA9cpLMy0yKNXhqp1TkVCS3yHVT2f7cDSNOm77f5JRI5yRGOUHcQ==
X-Received: by 2002:a62:64c7:0:b0:5aa:6597:507b with SMTP id
 y190-20020a6264c7000000b005aa6597507bmr8649801pfb.12.1677028635682; 
 Tue, 21 Feb 2023 17:17:15 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 n9-20020aa78a49000000b00592543d7363sm3552139pfa.1.2023.02.21.17.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 17:17:15 -0800 (PST)
Message-ID: <09d684f0-4a49-9963-5b16-36a463002544@linaro.org>
Date: Tue, 21 Feb 2023 15:17:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 23/24] include: split target_long definition from
 cpu-defs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 2/21/23 12:52, Alex Bennée wrote:
> While we will continue to include this via cpu-defs it is useful to be
> able to define this separately for 32 and 64 bit versions of an
> otherwise target independent compilation unit.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/exec/cpu-defs.h    | 19 +----------------
>   include/exec/target_long.h | 42 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+), 18 deletions(-)
>   create mode 100644 include/exec/target_long.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

