Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E505E8FC1
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:59:15 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCF0-0002xY-LJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCDk-0001Xx-Fm
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:57:56 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCDi-0006mR-WC
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:57:56 -0400
Received: by mail-qk1-x72e.google.com with SMTP id s9so2091237qkg.4
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=nh2+VbsAk+ezKErt7Nt3xzL8cfWKVPPieBCEHCjmZTs=;
 b=z8ZPfFsy7hVa/qGt3MIPeEVn0/8m6i8VFPGRJWm3r1fTfXX8uaNQFW+Z6ipWR3p2Ep
 UBQ5nMHfaie1bbeiUQkmSQkU78dNNV1fUluJzXM3KE/b0D/S58kEUFDga67KmYThkIPC
 SiRSHQiWf+oC0alDgC8V11UTDbPGXJ2PqBiU0YREQah7k/QOvAOxATRyNvBCT7OIn6Fy
 YRuwWWLUCESUJdqOF/NyttJknNlAZ2/HNtdzJ1saZb2AOLCxIlLU/6JCsrKcxGn9GZLt
 LH4SfxpAHWno6PXqoWa0fBNRUEMtTDwQTDLP+s0iK27mm7GQW3l0nLBcc1vM1oiF8Upm
 CXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nh2+VbsAk+ezKErt7Nt3xzL8cfWKVPPieBCEHCjmZTs=;
 b=2QhgVQPwVBeNOo1CHadbHRoBbe/7kxYg2FzEeJXR6Wf/zkXMjaszPad4Z6yOSDg+1x
 1q8bDBAu09o1z+AOtFv5CNrmGuX9nJN6mhVOt1Ia/FGAQzz/SARwomd1npNuQk+U2DGC
 vMrE3uBwEDR6zMsOcMCIwkN9hI7W1BAm8EwSnzdZNuQxMx9uDUp+5JlFGTvOp5BHSw6k
 FTbfVO3fOMxZTB8fk6RbNEaG7lq53BKL/S7arr4CSwonQRb37RAGU7abrWnUuFlzvrZZ
 Mvr08ggC/+tLk3CYn+TSqRW/wb97ar0K3d9bg1tlaKf/gkw/hDZZi6ApXeXlSD/nX3xA
 jcaA==
X-Gm-Message-State: ACrzQf1WeAKvq4K35hWu1nuIQm6JlXzEoynUl5fwphYq6MFEO4amCS45
 jryP8xq7pscfI6DHHJ76G2MiLA==
X-Google-Smtp-Source: AMsMyM5fTfPF9BVub1BgnbSGcpqSzFb99OBrrOqG5Lyu4RXXeeijJwOFF7pEbVko2PASzwoTV7PTSw==
X-Received: by 2002:a05:620a:800d:b0:6ce:6f69:d629 with SMTP id
 ee13-20020a05620a800d00b006ce6f69d629mr9710240qkb.594.1664053073933; 
 Sat, 24 Sep 2022 13:57:53 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 l27-20020a37f91b000000b006ce580c2663sm8522864qkj.35.2022.09.24.13.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:57:53 -0700 (PDT)
Message-ID: <ac2bfe74-45fa-a528-00d8-5de67fff41e5@linaro.org>
Date: Sat, 24 Sep 2022 20:57:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 25/37] target/i386: clarify (un)signedness of
 immediates from 0F3Ah opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-26-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-26-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> Three-byte opcodes from the 0F3Ah area all have an immediate byte which
> is usually unsigned.  Clarify in the helper code that it is unsigned;
> the new decoder treats immediates as signed by default, and seeing
> an intN_t in the prototype might give the wrong impression that one
> can use decode->immediate directly.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 8 ++++----
>   target/i386/ops_sse_header.h | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

