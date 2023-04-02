Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BAC6D3596
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 07:20:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piq8A-0000ib-Cp; Sun, 02 Apr 2023 01:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piq88-0000i9-0a
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:19:52 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piq86-0000NF-7I
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:19:51 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 184so1049345pga.12
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680412788;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wrff1ev1LQayWge5YI0VQlv0HUlTEaadwlhJamPOC4s=;
 b=r+lurR5sgESh9Cq3Y7+Ngbkls18Iclh6++9Brpto8lcFoAIt72ginkqBLlsBXp5NSY
 Qdt3B9PaNNqdYPh48Z8WrOEoiCHLA2zaxV3EbWWOo9ghH3jjQRCJR3RciRryWkr1Fbtw
 CAmA92+B/lkySTeGg8J2eyejBLpaV5mxXE8N6tAIzOdW6OlnD1LpU/QHjsZ+wF6c+MBl
 vsntGnqJw84Nq6qbc0vnEePa4BZZ6j3s/14UfsBD9CoUkXpbm3GyE85I+sgpMY3BIMhq
 dlaNgc8n0M7pN9Xsj94JAhWdMKcNCoMfMWFnKfXCdeZy8e2bRa+uIUZsGu31ukgi2lL+
 ZBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680412788;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrff1ev1LQayWge5YI0VQlv0HUlTEaadwlhJamPOC4s=;
 b=HamwWFiQdfAynDkixM3oNvsWfir2HFMqv0CsnXODWRwvQmh6w8WMmLmZVmiKiZqjpZ
 YfTgicIG6NqC0uXKLpcYt+JoxSy5kTEZrWU+NWf9Q4JUVoD1F3t32LIsWV6EPaa7JCLO
 lpACxXhPTRaeQPzWHFSJlDTaJ+wMQrGG2pkYImwAKFEx6iBK/QiBEic0hfutcEALrcbw
 VacC9uE16OqWgG9sFNTBNztoXuCLvto32bvfIyiAHTB8YMkbJ9e25ZGodCPYBtJ/f1zd
 vl+t9kPtLJ2Jw8u9i8iEqPN0z+zkR5LeakiVOnlCYJgzH24CXR5z9YnYfFa4DaARMdno
 P1+g==
X-Gm-Message-State: AAQBX9edLUVvP6w7i1xNmoQ0BUer7oXLNTWDNtWCuBEvAZkMFmh0jSPt
 xYFJ8R2DEpn2Ul/AtXzm1rb7yShaLjBoCpFydr4=
X-Google-Smtp-Source: AKy350YzKp4jxb0EBXAPTnZt01I8T6uJk6o0E43wQOnW7DwBIYSNsY4QNWXBBBHvxUcF8x3t7VnNvQ==
X-Received: by 2002:a62:1807:0:b0:625:a34a:89fd with SMTP id
 7-20020a621807000000b00625a34a89fdmr25816982pfy.16.1680412788083; 
 Sat, 01 Apr 2023 22:19:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a62e213000000b0062e0515f020sm948839pfi.162.2023.04.01.22.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 22:19:47 -0700 (PDT)
Message-ID: <afcab21c-f596-cae6-ce3a-2ba2244d8ac1@linaro.org>
Date: Sat, 1 Apr 2023 22:19:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 34/44] target/loongarch: Implement LSX fpu arith
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-35-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-35-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VF{ADD/SUB/MUL/DIV}.{S/D};
> - VF{MADD/MSUB/NMADD/NMSUB}.{S/D};
> - VF{MAX/MIN}.{S/D};
> - VF{MAXA/MINA}.{S/D};
> - VFLOGB.{S/D};
> - VFCLASS.{S/D};
> - VF{SQRT/RECIP/RSQRT}.{S/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.h                      |   4 +
>   target/loongarch/disas.c                    |  46 +++++
>   target/loongarch/fpu_helper.c               |   2 +-
>   target/loongarch/helper.h                   |  41 +++++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  55 ++++++
>   target/loongarch/insns.decode               |  43 +++++
>   target/loongarch/internals.h                |   1 +
>   target/loongarch/lsx_helper.c               | 187 ++++++++++++++++++++
>   8 files changed, 378 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

