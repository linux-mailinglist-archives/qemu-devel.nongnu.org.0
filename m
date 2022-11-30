Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623063E252
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 21:51:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0U1e-0006W4-Qp; Wed, 30 Nov 2022 15:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0U1c-0006Vv-LU
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 15:49:48 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0U1b-00045W-81
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 15:49:48 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so3521273pjm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 12:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HmaJwn8m7FalRE44emq/f18vcBcFnkin2hkreJQNEnQ=;
 b=qkr555JYdHQszUBfxVxMwD2lmkDg8MaXHmFJYFynncWY+vUKo2+W5N6myCB4GKfAfr
 ino5zPAHAMX6rY+1rz0xt+2AJ+GLVGIv/OgI94LyPnuD+/w9rNsuyHO/5QvubyHXjTW1
 z8HVSpgICEaR5YeRAtzZphPc+uldJOnZ9CLO1r8WOvMcuPFp4iKLPfu2qTlbwuRP7IrV
 0NBeJyl5F/7+abwKC5Gl4Uza4CD0TlJipC3fSkzCMHjLKGKbfqShs1Au8JZOaXTFS2Za
 LdkWiUdgYPsBH2QzTLkvm6rWApujFPb+Q0UIvxU2CxOPlSyLP8LQ1jGseaeb4XgllCIi
 N4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HmaJwn8m7FalRE44emq/f18vcBcFnkin2hkreJQNEnQ=;
 b=epi/p+qUpBJXtLABVJVpvz+CiC8PM5yzGj/+EOWjugM57YCV8RUhDvYJAo0p9KpyBW
 sfMxkBfLDIoBaY86IAVpgp9wy59yDvxeoNfHyuIJGyK/rswjn0IH9JWwRk2vrtN6Sd31
 Umumlo2VvsJAGqNm0QNj8EaPFRfcocNoDeBjir4x0uH76dmBAE1ng5CXJe1UdpUeUMFK
 VYJiF1a5hx88AT00FB0GVTPSGcav5S3nh1tcjEfy34sbe2JhwxSJxrbhaQ9h3Uy4o/Te
 WuuSi07IBlNOA4iz5WvUCjvAI9ZmO2Xj6Qm1P9qe0wOXirIs0r2/IX2y17bCXUmBO0XG
 p4zQ==
X-Gm-Message-State: ANoB5pnD2NhajQKDRdzVi1tu36ECpQohuOJjavXvzv4l73E9aPtx7zDR
 XofrDpJe5HXtByMLexWpE/SboA==
X-Google-Smtp-Source: AA0mqf7vc0Q0oeEdBU55Vva3yKGarvb1wdwpwRLyJjfvzJ8qY4K35/SmF4wabWeUGnWtZOaanEbLlg==
X-Received: by 2002:a17:90a:a588:b0:218:8eb8:8502 with SMTP id
 b8-20020a17090aa58800b002188eb88502mr59573061pjq.179.1669841383398; 
 Wed, 30 Nov 2022 12:49:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a622707000000b005622f99579esm1776604pfn.160.2022.11.30.12.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 12:49:42 -0800 (PST)
Message-ID: <12291326-678a-61bc-509d-5f3321009ea0@linaro.org>
Date: Wed, 30 Nov 2022 12:49:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 0/3] tcg: Replace tcg_target_[u]long -> [u]intptr_t
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221130132654.76369-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130132654.76369-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 05:26, Philippe Mathieu-Daudé wrote:
> Trivial cleanup (99% mechanical) suggested by rth:
> the tcg_target_[u]long type is redundant with [u]intptr_t.

Ah, no, what I said was that much of the usage in tcg-op.h should be either ptrdiff_t or 
intptr_t. In particular, e.g.

static inline void tcg_gen_ld_i32(TCGv_i32 ret, TCGv_ptr arg2,
                                   tcg_target_long offset)

should change, because @offset is an addend to a host pointer.  In this case ptrdiff_t 
seems more descriptive than intptr_t.

Generalized replacement is wrong.  In particular it would break x32 (ilp32 on x86_64)... 
not that I've done any testing of that in the past few releases, and qemu is exactly the 
wrong sort of application to be skimping on host pointer width.


r~

