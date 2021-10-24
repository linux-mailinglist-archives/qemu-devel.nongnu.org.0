Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEAF43870D
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 07:18:25 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meVto-0001rn-TO
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 01:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVsy-0001DE-5X
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:17:32 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVsw-0008Ca-5A
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:17:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id 75so7489772pga.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 22:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lJ9m+mJafMGKEv5FQiSSpPhNdYZtcnUJuoim34wisZg=;
 b=qP3nBR8BAp40jLFcIuqxOThhtGvRrGLCPQfYWT2lSRPRmPcnoJr1ZuNe2lmjURadof
 JTjkLZ6GCLlFPK3jEGMuLtlvvMdBOY+dLUV6HfC6q6JKpKVB/el7rZNUeD0/v/8EfgO2
 /0KFlJIFG+TBWqXNOWDv5KEfWFtOi5CglKXwHpS1eA7HqmQmhhLEPwOiEIyGLsycOMNl
 IVDNP9gdfITGUsRJNeIhW//GOl4tEPqL9V0hXI9Bpsiupq0+WJ/mjbh7p3KiorfoMYQe
 Oip6EAsKbyarsqk4sOPZyHwXKVqhntI/wB0FJHyTMxKW2j2CpRJRLwdyf1T8z0g6fu/0
 a3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJ9m+mJafMGKEv5FQiSSpPhNdYZtcnUJuoim34wisZg=;
 b=ZBs73D6XTxkEDMPGPW5C5qKc38pPybwJA/FzgXv6LVB5qyWw39T6DAtRrSVRYSlY+c
 3AdhzVnXFWFpyzgBtupRGfgMYbwyoRr7Y7vLJdvzDdbKJMc3f+7M+Z4K4ezzkbrgUaug
 Usw4Tw70JMI96LRMyCjqr9UvgDS9MdJqSEyFLmFrpOy5gFJwmqtGq9gQrNte1QAwsyPn
 sbQF3qS9Y/an2Y0X3VjdV5w86KaYltIxVAgtPyHMwbetRjslKnlXXRWFY9Ze+1gwSlmh
 oKo7mqKa0doCXh5q2CytEEIYXIqUW+lbuH/8KWcmom0391GLwbRgp/dpG8PhgjYSdflN
 y/gQ==
X-Gm-Message-State: AOAM530ihIQyto3kCV9Kab/xAktIfQaIiccNCQaOrySjDe5k8hb+uZCP
 Ge6CdYK4p25HMJQ1F8C+c6IZVw==
X-Google-Smtp-Source: ABdhPJzcIKGX0vek/htT8NEWvPRJof+Y13nToR2c1F7XdR2GD6lvjfDzsNN6paTXooC3Rh8LqE/Eug==
X-Received: by 2002:a05:6a00:a96:b0:44d:a0d5:411f with SMTP id
 b22-20020a056a000a9600b0044da0d5411fmr10491391pfl.65.1635052648566; 
 Sat, 23 Oct 2021 22:17:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id kb15sm15141198pjb.43.2021.10.23.22.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 22:17:28 -0700 (PDT)
Subject: Re: [PATCH 19/33] target/mips: Convert MSA VEC instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72b9a96e-9bed-89f4-a9b4-87ae0c055038@linaro.org>
Date: Sat, 23 Oct 2021 22:17:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 twt = tcg_const_i32(a->wt);

tcg_constant_i32.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

