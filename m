Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A370358D2FE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 06:42:38 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLH4f-0002PZ-7o
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 00:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLH3e-00014z-36
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 00:41:34 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLH3c-0008Qw-BX
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 00:41:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so11108924pjf.2
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 21:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=8iPSd8MuK5WphpGLMcQexh6AZCMp35RA/g499IlZsso=;
 b=nsVWam0vEJn6bDEkhZ8/zr8LDaOj9qbr8LsaUm0VVtoY3XK8ObXAmM4z0A4NSwOMM4
 +URgTo9EuLNgPHsqT2BDbHg4cgj5y64RDxLa89gSBPKNprt2ywZiI+DLv7MxnGoNiigd
 GXPxSCgxZcvI/WQGBKpZnZmGtUWJUKYkd+WR5LWxbbBE1GLSNvyZSGXSMXeahBmA0wHi
 5/EPqzKWCOV7+EGL9+sGaTK1EUGop0kJFk0TAviHWfOFjIx9P9zP5PCG2THvZdVqp2LQ
 NjDI2u1ZFN0F9lLo3uTXv8T2k5lJIM36KYK0gc51O6wB12L94+9dxPArfpYobYJPgDw3
 BiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=8iPSd8MuK5WphpGLMcQexh6AZCMp35RA/g499IlZsso=;
 b=qToUvP8veuZtiZgr5dA4jHOzHU7dC8EMdf1kFMiby9ale2nGbxAj3SBur1e4ggvLHE
 1VxeTeI9mppMss44huUhUFTS7Q3fq/DPeOLJoMIG46/rAeOqFYm6i67oD3uGgTkC6BHV
 N6UcXJ6+EkPchbj9r3GJtQ+MvHR4AWV17a5vz/B95Nl5LZqdj8SJ8cedlU6c5YfiVcbJ
 kVKQUorjOWrIcbTew8dKRWduodfh9MArHyoPeCGpQGKpvX8eDUlb3LVHIWg71e821KMy
 zpMYZjMPZV83ZhMdt7YeCGtBILcp5g82XQ88OD0lBCYNOMF5jY241e9iq/1T2hBh4L+j
 vDAA==
X-Gm-Message-State: ACgBeo3c6BkvqDP/HT04gpmcNoteLmi0IxOFs73U6oAfpTRhqy9nNZ2X
 VGGx8cLo4vmjR+uuYfyZfD/fAZPqKKS8fg==
X-Google-Smtp-Source: AA6agR7SNwBbvaJ9bViKpQi5Bn8lhafyj4yWRRzYISzWVFAju4pSMcohYhrkhkhfPawZOVaCCrh+Xw==
X-Received: by 2002:a17:90b:2382:b0:1f5:618c:6f74 with SMTP id
 mr2-20020a17090b238200b001f5618c6f74mr24159314pjb.80.1660020090529; 
 Mon, 08 Aug 2022 21:41:30 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:8c1b:1e6f:caf3:a217?
 ([2602:ae:154e:e201:8c1b:1e6f:caf3:a217])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a170902ec9000b0016c9e5f291bsm9695059plg.111.2022.08.08.21.41.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 21:41:29 -0700 (PDT)
Message-ID: <d3f34968-4002-b101-9140-e9421aa6ec75@linaro.org>
Date: Mon, 8 Aug 2022 21:41:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] loongarch patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220809025050.781846-1-richard.henderson@linaro.org>
In-Reply-To: <20220809025050.781846-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 8/8/22 19:50, Richard Henderson wrote:
> Hopefully the last such last minute bug for this new target.
> 
> 
> r~
> 
> 
> The following changes since commit 7b06148df8a22d984e77e796322aeb5901dc653c:
> 
>    Merge tag 'mips-20220809' of https://github.com/philmd/qemu into staging (2022-08-08 17:59:27 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220808
> 
> for you to fetch changes up to 10dcb08b03863221faa41f4f1aa835cdca441b96:
> 
>    target/loongarch: Remove cpu_fcsr0 (2022-08-08 19:42:53 -0700)
> 
> ----------------------------------------------------------------
> loongarch: fix emulation of fcsr register

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (1):
>        target/loongarch: Remove cpu_fcsr0
> 
>   target/loongarch/helper.h                    |  2 +-
>   target/loongarch/fpu_helper.c                |  4 ++--
>   target/loongarch/translate.c                 |  3 ---
>   tests/tcg/loongarch64/test_fcsr.c            | 15 +++++++++++++
>   target/loongarch/insn_trans/trans_fmov.c.inc | 33 ++++++++++++++--------------
>   tests/tcg/loongarch64/Makefile.target        |  1 +
>   6 files changed, 36 insertions(+), 22 deletions(-)
>   create mode 100644 tests/tcg/loongarch64/test_fcsr.c


