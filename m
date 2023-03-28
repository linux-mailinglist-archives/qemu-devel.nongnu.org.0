Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33C6CCAEF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:51:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFLP-0004BM-3M; Tue, 28 Mar 2023 15:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFLO-0004BE-4V
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:50:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFLM-0007wo-AB
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:50:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so16272536pjp.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680033054;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uqupupxv52BnYFkYEuXGSga7xG/5ZsXexVQZTU7j0do=;
 b=TOIHfo7UoyZNgAtXCD4/g9XRS1r5ZD87ZjEOg2eWAfGykrBBAdplrbZdm/aEWiywnN
 iLZK1z19ueY5myKm5aDAkMQojoSap0HBhebRGYD9M0mjwzhLI3StPpfcED0mMOpzNf8e
 BABfkXP28gWQye5jXfd3SGZH9GIOpmfindkeoRgaMW+vgUGblYRc7FI5/ZC2WzQdM/ri
 SQALal4dHjW8Xy7q1e2K8tHih74GMlsn4SmAwqYDm6n1NR0wCdRLx+IzPadm06OfWaBl
 sL8kwbYOSgoOad5LFdAH+FdT2pVr1QLrMoGkFKWyQnipunJlTVxMHEIskcfg42VWlhku
 dUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680033054;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uqupupxv52BnYFkYEuXGSga7xG/5ZsXexVQZTU7j0do=;
 b=g8oNW4ymgs1/9qRlFox8yO9oqda6bocdJfRTsgW+nAmJW6UPUl9u6gYQCDR4Uubl2Q
 kKV9a0IPccLXFEUgG2jCoPBGhhUWCZEtWKbaQauWwSAJ4a3CMfScAVfbgFHMPOHMC0VJ
 3ZNbTeD6I1Fx41QnUNC8g1+oWiU5y0NhQ96ctH41xME7vROzqIM52SYcYBYtym88mjJL
 BxqKfa7xZc1h09f/48mZRar/CFm4nXdj0vOVuhEqzjNAPrljPKT9YdtIms8PjxiGhM9c
 HhBWFSRZNH7PpmTMJLGGgR2WUL8tDY41yBqSTuJqgawIFfckSwnnL/fCx8xmSirMMvNX
 usNQ==
X-Gm-Message-State: AO0yUKVFy02NnJQNyc0oQ8z7pS2a2y2xLnX92IJ/BC4mX0RJTfrM71OF
 zd1qClv1ADbuGg+PCJU5jGOhQA==
X-Google-Smtp-Source: AK7set8C5Yu8iGQwd1d7JnAfGNU2Zy137pe71xC+qpX9Yb2kcWHvXND+mYHfpxJhRr4VhvLT7nrAtg==
X-Received: by 2002:a05:6a20:4890:b0:cd:1367:3b69 with SMTP id
 fo16-20020a056a20489000b000cd13673b69mr13019846pzb.17.1680033054230; 
 Tue, 28 Mar 2023 12:50:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a6552c5000000b0050301521335sm19733617pgp.11.2023.03.28.12.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:50:53 -0700 (PDT)
Message-ID: <3b2392e5-bab6-a9a0-adad-36c338d785d9@linaro.org>
Date: Tue, 28 Mar 2023 12:50:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 05/44] target/loongarch: Implement vadd/vsub
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-6-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> This patch includes:
> - VADD.{B/H/W/D/Q};
> - VSUB.{B/H/W/D/Q}.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 23 ++++++++++++
>   target/loongarch/helper.h                   |  4 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 40 +++++++++++++++++++++
>   target/loongarch/insns.decode               | 22 ++++++++++++
>   target/loongarch/lsx_helper.c               | 25 +++++++++++++
>   target/loongarch/translate.c                |  7 ++++
>   6 files changed, 121 insertions(+)

I did mention that you could use tcg_gen_{add,sub}2_i64 to perform the 128-bit arithmetic 
inline.  But that could be improved later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

