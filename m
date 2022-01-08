Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF97488565
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 19:52:15 +0100 (CET)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Gp4-0004MX-5n
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 13:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6GdW-00005m-Fq
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:40:18 -0500
Received: from [2607:f8b0:4864:20::1030] (port=55890
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6GdI-0007B7-8s
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:40:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id hv15so1921281pjb.5
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 10:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qB/NZ1C1Y+NFG1J3bxjVFbXXmP/TbmzDAOLXYfqEkwY=;
 b=p5uNfowFjvbcU7QSPaXerO4+TBev57HpGGShd+cLagkMefxUlJHpoLt8sl/h8EA6N6
 6n5IT/ei/68CMWpodRpDFnfM64N8xsM0/xGXQUdGvUDQKWs1NcH7fshcZDvmy3BmwnQs
 FNydGFLpsCm0YKH2Zw2M063jRA/KWeUz6lEtsH41iIIDiIXdpSCgWmJHUmLWUyZhWOIU
 sv/84vL8wr71/6e1IyYj6hEunbXgVSPDtLQK2U4KIMcg98lprAO2iAFiu0fQOx/6R8KL
 Rs1GRxi3+6/Dqx37eTAWlXgM2A+145TMjKIIl6elGW2JKXGAzA2FuGjsgAlptFzbnwyQ
 lgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qB/NZ1C1Y+NFG1J3bxjVFbXXmP/TbmzDAOLXYfqEkwY=;
 b=fCALxmrNZIXubAffvMOeMUSiK1xLS604xrH+oGd5F+LjSFin5sIZnbmqZCzkHS8ySh
 cIgTnPK2ieTvkVPl95mAGjY1/6S+oJCRad7vFP8FLlgD3VagIjCBw7ILhP26VAPFCuHM
 SA/9vEfx3Yrz8H8zUZWjhLjg9+zp0c0lW3uZJUTnqwzLQQvRkfNJuzpIQFJ0uHbdRhZM
 Eh1rlXaFa4YhtQFasVSiU1j38YcTgoWQu1cGSRjzr31g9hxR0eLO4GkUc6A3Hi7CQdlD
 DxAdzr9ftJrF8SFhXcWCDZlxNNwgkkpqUD5/M0BHLxpASFoyQQv5aFtmSnTxNcNjZ+YA
 V8ig==
X-Gm-Message-State: AOAM533KFjsBdUBcdKh5qgqA+IKgYY/9zHsFZ/I5iz2IWJ081+uOWk+F
 w/W62kOdgUiZc/C/sLw6lMICag==
X-Google-Smtp-Source: ABdhPJxY7botuxnhf+jcGYMwB2shbyGFUqus04na8RhuCKeWW50MVoiB6dF1Hfymj+3BySmmW2eQ/w==
X-Received: by 2002:a17:902:8b89:b0:149:9c7d:2fb6 with SMTP id
 ay9-20020a1709028b8900b001499c7d2fb6mr45834040plb.68.1641667164484; 
 Sat, 08 Jan 2022 10:39:24 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id np1sm2719425pjb.42.2022.01.08.10.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:39:24 -0800 (PST)
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
References: <20220108150952.1483911-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff1fd702-957b-5ba1-9e31-3e58819d8774@linaro.org>
Date: Sat, 8 Jan 2022 10:39:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220108150952.1483911-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/22 7:09 AM, Ard Biesheuvel wrote:
> When running under KVM, we may decide to run the CPU in 32-bit mode, by
> setting the 'aarch64=off' CPU option. In this case, we need to switch to
> the 32-bit version of the GDB stub too, so that GDB has the correct view
> of the CPU state. Without this, GDB debugging does not work at all, and
> errors out upon connecting to the target with a mysterious 'g' packet
> length error.
> 
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Cc: Alex Bennee<alex.bennee@linaro.org>
> Signed-off-by: Ard Biesheuvel<ardb@kernel.org>
> ---
> v2: refactor existing CPUClass::gdb_... member assignments for the
>      32-bit code so we can reuse it for the 64-bit code
> 
>   target/arm/cpu.c   | 16 +++++++++++-----
>   target/arm/cpu.h   |  2 ++
>   target/arm/cpu64.c |  3 +++
>   3 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

