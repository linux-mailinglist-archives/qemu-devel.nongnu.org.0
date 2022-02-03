Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D974D4A908E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:17:43 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFkQA-0005Xv-HH
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFk3m-0004nu-Nd
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 16:54:34 -0500
Received: from [2607:f8b0:4864:20::1030] (port=46653
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFk3e-0000WR-Tb
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 16:54:29 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 oa14-20020a17090b1bce00b001b61aed4a03so4284872pjb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 13:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QiZspjZRJMzSFGVuTLNakq6vwVIsLYsQ6T8xunMcGu0=;
 b=V2SwguRuABsaaFFARAK5R9qu+mt2sCH5ELE5cwpgUrUCZUzHAeIBNg/Ua1a5/mITsk
 ZOe2a4aSRQD6BADrwC908MdEjCgX0+k5ghajo0CyBQtxBz5rYmBZKyDagGUhCk9W1YrJ
 PUaw8qOQVDfC8JygwZO7iueK319CrwvuG73rg/VTxnG/J1B0ed34e7FT8kc8/cHaXdsG
 0ctxPZ+r/8lwxaB4fyhzPPcvlldRcmYsZ7FwEssTU6tLLW65VHxIIcoy87HPVN7/mDpl
 PN9VfyD2GrUENHwkFu6fqj1rJTe7xIuAmMZPb3PVGOsUvdDsk8YvOfJ8tlc+1n9fH+JM
 dbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QiZspjZRJMzSFGVuTLNakq6vwVIsLYsQ6T8xunMcGu0=;
 b=r/FiCmzJzSCe+2jk0TS9T6hogbGZ3q/bIO1a2FXc2vWE3amPuxhohj8aYKQcQUx8bh
 YdVefv+dQ4ITsSjzK4GA6qV8dLakmPRG/495orKQMpYttgJbVc0KZZHgp68HitW0o5k7
 WyYZaqWX2GZK3nL42V7eeTzFcxC9sxSJ/8ro6TI2PUCCIbbU7rftuUSTlTK09Fn2gB8t
 LqSI0mHszNq9PT6C4/07dK8p1gFfLWw8KGLziKiYu8om0NFh7shoMEWCUlBUncBkPW+2
 r4WI55kig7PRYbbh1mlDb3TBe759LZACwr0UFxHmCbzVpIpo1e5VioVQmc+JHGt8YKdx
 RT9Q==
X-Gm-Message-State: AOAM5308Ufz6qniYoMT4OO36g4Z5fzzrXmN2IliEddjCWS5btGHtGVQw
 AxMWI3dCcoLRy4pWxOUVhuiZKCd0mE4XUuEu
X-Google-Smtp-Source: ABdhPJzDu5QJpLBppF3sA8/LBC7R74n95NdCmIo3tpltIvsJX5giI/nEUJRuaqz0IJ87+FokH7EQZw==
X-Received: by 2002:a17:902:c941:: with SMTP id
 i1mr14215852pla.81.1643925262475; 
 Thu, 03 Feb 2022 13:54:22 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9?
 ([2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9])
 by smtp.gmail.com with ESMTPSA id on9sm11435378pjb.16.2022.02.03.13.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 13:54:21 -0800 (PST)
Message-ID: <9417ff2e-811f-3dfc-2bcf-c52a3d3e2de8@linaro.org>
Date: Fri, 4 Feb 2022 08:54:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 19/20] tcg/i386: Implement more logical operations for
 avx512
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-20-richard.henderson@linaro.org>
 <87leystebf.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87leystebf.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 21:46, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The general ternary logic operation can implement
>> NOT, ORC, NAND, NOR, EQV.
> 
> Can we not fall back to expanding to use SSE if we don't have AVX512
> available or is that done by the exiting fallback expansion?

Generic code does that for us.


r~

