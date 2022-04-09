Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E14FA96C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 18:08:17 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDdI-0005xl-2H
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 12:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDcN-0004rW-Hw
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:07:19 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDcM-0007TH-3N
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:07:19 -0400
Received: by mail-pf1-x434.google.com with SMTP id s2so10958648pfh.6
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Ll9CHFc5CeFufvqZ5gYX5HIKuUYQViLGRI4S8ao2lK4=;
 b=FR5nOXziIPbOWpQsi7VgNoaRHiLcMd8+b5fl/khjls9pi2EuiOwpAca8ddMfvfxoml
 U23YlTxL/ftdnwZsWU5A/uMjyePHQI2guD94uC/sH5/TN682GxtI16+6tSLYkUS9jMcW
 mIXSGOPmJOrS2+dJ5Jc6XULCLNojsTcwdpj46xGZkwldaxZDy4uXn5++YrdrMdcaMwOJ
 neEcRZnCf4DK+1uWM7YBHtUoB14CL6+/Vy9o1r6PXjmIFxneJwParodQM3iBNkPdz1FI
 IwLYZBFLPr363A83j1BvMCMkethiOVqxVJzglUQKZAlH/5eBzSJeXT4buQiTIA7AnRST
 WmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ll9CHFc5CeFufvqZ5gYX5HIKuUYQViLGRI4S8ao2lK4=;
 b=L/YP/iCZcQ1MbFcQMB7rvmLiTBr69qNpoqj8FfEcyB95+aLpThJadbWHFWGoHCUNnF
 /bhKafQfHqbfYWCRtpsz1XjYlYBCSfAqzdyr7WJA1W/Rq/Akf7QOoJP5ub+D71yvh5wM
 U7TEfGqAbqS1XSWmtaXSL5KHVKYh5DSlZMfaYE7dcZ6f3iCZY2YZTQcq+B+XkTsSA3Bd
 rtI1VXY1UAGMXBTBlvL4q8LfMYImb9uu0FyLMnYPwM6SV3EoZGJ6OONKs8YNGPVQP2T4
 BboTK6R1y13eQ5TIRl/BmyqzVQ+EsmspOKRjVmIvOjL9fhzrX0axvVGUF1j6+M57vDvS
 34bw==
X-Gm-Message-State: AOAM531FQS+BhOd7eqcpxa+h/Y8LCmslNOM38a6h731m/sb44D0VATFI
 Jg4Twsmr0vxx3pGbXcz2hEcNDQ==
X-Google-Smtp-Source: ABdhPJzomlpfGQGlhoWM/CLCiLRXqZtkRpGR7b1FbR3bXehnno0dNfJ2XHjzVoUyO37Kqmp9UVrqjA==
X-Received: by 2002:a62:c186:0:b0:505:a16b:f21a with SMTP id
 i128-20020a62c186000000b00505a16bf21amr2544414pfg.60.1649520436643; 
 Sat, 09 Apr 2022 09:07:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 pg14-20020a17090b1e0e00b001c75634df70sm15084897pjb.31.2022.04.09.09.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:07:16 -0700 (PDT)
Message-ID: <0dc0b3bb-4bce-1ff8-8f02-e72cebc1be6d@linaro.org>
Date: Sat, 9 Apr 2022 09:07:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 08/15] disas: use result of ->read_memory_func
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 4/8/22 09:47, Alex Bennée wrote:
> This gets especially confusing if you start plugging in host addresses
> from a trace and you wonder why the output keeps changing. Report when
> read_memory_func fails instead of blindly disassembling the buffer
> contents.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   disas.c          | 20 ++++++-------
>   disas/capstone.c | 73 ++++++++++++++++++++++++++++--------------------
>   2 files changed, 53 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

