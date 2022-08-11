Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E65905F8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:37:35 +0200 (CEST)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMC7i-000131-75
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBp5-0001W0-Eh
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:18:21 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBp2-00019P-J5
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:18:18 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b133so17030767pfb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=etwgxtAmfri+DXfZdFYu/pPyIk3QQsiulBPQHWDUwN8=;
 b=hr9wUmh/NUooCRX8WgTFssquh/V9H/PBvufUMagGWdYGjOO7JM7whWt+3oaWWV/2Bq
 y5UndkGxAwuaFfzkZ1bZ3Z+MjmOWHZehd9eStm7LJ2FaWDoTV8bpUsx1WIVyAAR08Rlp
 tPX2NzH3wons98LAHXz6duH/M0MKwryg3mwFQ7U8ZHvyd0DZMqNVTAthfZ6YWTMCRIt1
 PEJEZKKpXSr2nIkp9POh4N8dJW5kgF8VZHvaUSLkiqWmXGYN2jMGABLQWbICfVDXt4+1
 2w0kSgOLCk837UPfRnxbd16usz85PahqUwOu5xcPnL3q7ltpJ9kdF7pi98CT/KMs/B77
 ieBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=etwgxtAmfri+DXfZdFYu/pPyIk3QQsiulBPQHWDUwN8=;
 b=Sv2Dd30xj9DrZuJet1MayL902Q2JSO4yBF2vdcrYSWtfyPpx4oqDfH4NaKcSKL/2NL
 0fMUkT0UHbpqdVIaboQxPkAiTLiuQt9dCD1lsUSexhFGABYNzIt3c+NZ2nk5Yzpqex+V
 /IMTGSo3SqHwvA2leE8ZBG1E6hno3j0bkgz6cQqtwGPQwimMAZBq1vExzsvx7e9552b9
 4qL6WbFSE+veM94vhDeMwhMwuM5mKT+R3iMFnuB0XfSUaKURwAjlrCu5RmXfUSkj3IKX
 EfUhyfU8O6QZwy2Z2KIMukctFe0Pk8gFvx/pTl+jSAbeVo4JzJ8tHNEkQBm2/N3SQ+wZ
 uQAQ==
X-Gm-Message-State: ACgBeo0G3IXKfHsoGDImmGQev7qqAK/gAkLkrL2TQgA0Vc1oAUkYEDA0
 qY/pQbT/eBuJnPRggHFm/zi1fdxqPCPObw==
X-Google-Smtp-Source: AA6agR5R8dRpxEVlAyDfkb9t3mT/Z6PSG+ahUPCsYJO6Z47of01gyoO78DTljjMiAIvg/I0BdhI+8g==
X-Received: by 2002:a63:318a:0:b0:41c:b82a:dc6d with SMTP id
 x132-20020a63318a000000b0041cb82adc6dmr72192pgx.319.1660238294580; 
 Thu, 11 Aug 2022 10:18:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a656c01000000b0042194bccb93sm131793pgu.56.2022.08.11.10.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:18:13 -0700 (PDT)
Message-ID: <a2c91476-2a97-904f-cd2a-6b0d9566fbe9@linaro.org>
Date: Thu, 11 Aug 2022 10:18:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 4/8] cputlb: used cached CPUClass in our hot-paths
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811151413.3350684-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/11/22 08:14, Alex Bennée wrote:
>    Before: 35.912 s ±  0.168 s
>    After: 35.565 s ±  0.087 s
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/cputlb.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

