Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438646050D0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 21:53:35 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olF8A-00037s-9g
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 15:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olF2U-0007D5-GF
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:47:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olF2R-00050p-Sc
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:47:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so766754wme.5
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=96VqFtT+2ErA9QeqLRO6vVNZ2/MT39O8jrapvVbMQKU=;
 b=c+0fBBGr6Tq8tBQ/0no6XT8U6+1/styjPGpg9ZgGx8IAy6FBViXJIyYB++QsWJ34EX
 aqVgPIWzitXL5f12zv869HhT4iiMu7Ti9MGoFXe/QllnpyLO+aaluom6mGOZiPlaS/4Y
 art9Vs0hQn/ypyYIdwmBJW3ZXkRNY5hhLBL2NiwrUxONXQTNtq1ZNwmsz9qNgf71K3b5
 3MXJLlQQIHjMiPVMldixwDb4qkxdNxN1y55DkC1pl6ZB/J6u4aHf74Qe+6iBx38jF5eU
 sG4DpgUGKPpdMfLnmwKWjxA4PWHGgD73eraBnQgEFcdeXBt7AGA8/8Q9EGr4biDeixit
 51qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=96VqFtT+2ErA9QeqLRO6vVNZ2/MT39O8jrapvVbMQKU=;
 b=PKhkKi/uBzEyu2MgGs1vIiZeaSM2WQ9R3BQASENIiXl3o70r5BGODU9ZZdhmAkLJiG
 j9qDxncZgrfKdl6TmFtjKn1ZjQ+5E1Qe/FFmjDMxzY8ytoqthBQQ3OzHzaAP2/xLFpjj
 zK8aGHd5YnnbVGt9/3NPsPSLNmeGiVRxX+FRdLrbW412e86sRPY5rAZrRn03hLACQLNK
 /YOOhE0fBWmvX/0EtXXVvx9D83UxnNXNWtR313DcJrf2BbofweEVP3a0ujjBoZ2HH9gl
 050ENDA61dIN2VY5ZHVZCDTMGE6J44i2adJYkuXfos2TdTBmdtYOS7k1XvQUUxtVjLV9
 QFJg==
X-Gm-Message-State: ACrzQf3B8aSGQG5KW09u62aQaEGJUWbK7heHU1wTC6BQ3LjrwBUB3naR
 uvrm6IUahkDy9k0Lmkr++A/hEA==
X-Google-Smtp-Source: AMsMyM5uQ3AQUPxxj9t7HDyd8/a/CPIrJc3B77EbfHkIGbY5pKkKUM3M2nRI3q7jqtyDUton2hQyzg==
X-Received: by 2002:a7b:cd93:0:b0:3c6:facf:1fa8 with SMTP id
 y19-20020a7bcd93000000b003c6facf1fa8mr7365317wmj.85.1666208858100; 
 Wed, 19 Oct 2022 12:47:38 -0700 (PDT)
Received: from [192.168.7.115] (m194-158-70-1.andorpac.ad. [194.158.70.1])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d62c5000000b00228cbac7a25sm14652382wrv.64.2022.10.19.12.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 12:47:37 -0700 (PDT)
Message-ID: <d29317a5-0ea1-bea4-412a-80ed432e112f@linaro.org>
Date: Wed, 19 Oct 2022 21:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 1/4] target/i386: decode-new: avoid out-of-bounds access
 to xmm_regs[-1]
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019150616.929463-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/22 17:06, Paolo Bonzini wrote:
> If the destination is a memory register, op->n is -1.  Going through
> tcg_gen_gvec_dup_imm path is both useless (the value has been stored
> by the gen_* function already) and wrong because of the out-of-bounds
> access.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/emit.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
> index 27eca591a9..ebf299451d 100644
> --- a/target/i386/tcg/emit.c.inc
> +++ b/target/i386/tcg/emit.c.inc
> @@ -296,7 +296,7 @@ static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv
>       case X86_OP_MMX:
>           break;
>       case X86_OP_SSE:
> -        if ((s->prefix & PREFIX_VEX) && op->ot == MO_128) {
> +        if (!op->has_ea && (s->prefix & PREFIX_VEX) && op->ot == MO_128) {
>               tcg_gen_gvec_dup_imm(MO_64,
>                                    offsetof(CPUX86State, xmm_regs[op->n].ZMM_X(1)),
>                                    16, 16, 0);

Fixes: 20581aadec ("target/i386: validate VEX prefixes via the 
instructions' exception classes")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


