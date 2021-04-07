Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE235782C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:02:10 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHBZ-0002yb-82
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHA5-0001mT-1s
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:00:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH9s-0001tt-Fh
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:00:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so2095625pjb.4
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 16:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sThgSVqDBHRrV8oXjZfSIrlOk0k2q29EOdiAGf0rjTU=;
 b=w60U0Ucc4h3XwaH2oDWn6MghT1GjaW4h/bgQqrHrYGb5xPdDkSaG1OCZ+J2fFZO6YE
 yswHinMN8id8Mk9ILcwGtj2K/kh05HzxDP3CT3YR5Jkx8iN0p18BzsKUk2Yt/niH/yMj
 Rnw5ZFJnvkHuaxije0PCVGJZAQP8q8ggvEHv+1f4yUSWXGdo99l5hdsOZW8s7NFcFR3G
 fP+oH4PHB6AOB4U6C+EGHOsp5DHn9yWGEL4u2syHIKOxqhSMEnAtrd75L7btMDjb45tq
 IBU946rRoaO0k5dfxvJZVFFBad94WcppxkLhs2CzDLF+Bzf6u6P4J+G0fiwzQyE7+5S0
 HBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sThgSVqDBHRrV8oXjZfSIrlOk0k2q29EOdiAGf0rjTU=;
 b=AhV/v+FG85nzCPS9WaCCgJSoR0gviTS8lcyctgRiuGBkXgic5dv2wIHCjb6bKlV5J9
 /CgyPVHmxpqBj4iKmVL/oaLKed9RztNxtQMH/KLHI+VZIY+fNKaQQaUHDB2CEx1CGQpp
 +qzh7wm9WD4VedSnKxHMcRWjagIDQEHDdi51rB6K9VQgPh6DkP7PF2HUlCOp6RkRKOwc
 8iRk08f66xKil6lcdQH9YppthF8xgQ/PEm+Tq/N32z4l+VN5s/79oH50QhEhQgJ03Q3g
 LGx7IJEvtaYkamJuW/Ivt0ln4/ffn+1Cx15cC1Xp/YQ3+cqEnui0zYF5uu+ltD1rrlTD
 RTkA==
X-Gm-Message-State: AOAM532WNJgWqhC9vzu+BIdfNjUM40ppVpU/QkZM+TYriJgGh4Nt3z0n
 /l0VYxX3Ho46kqn1oq5kEQfj2g==
X-Google-Smtp-Source: ABdhPJxFuNXXhQvdSHd1oa7Bjd6I1ykpxVMfcWyEOK2h9Vsxa+Ms8jYAyZUPjxQrl9RFUtD4VtaqDg==
X-Received: by 2002:a17:90a:fa7:: with SMTP id 36mr5281211pjz.80.1617836421738; 
 Wed, 07 Apr 2021 16:00:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x22sm22459031pfc.163.2021.04.07.16.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:00:21 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] decodetree: Add support for 64-bit instructions
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <CP2PR80MB3668E123E2EFDB0ACD3A46F1DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17641089-f0f6-558b-191b-4ce662e846aa@linaro.org>
Date: Wed, 7 Apr 2021 16:00:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668E123E2EFDB0ACD3A46F1DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 3:18 PM, Luis Fernando Fujita Pires wrote:
> Allow '64' to be specified for the instruction width command line params
> and use the appropriate insn/field data types, mask, extract and deposit
> functions in that case.
> 
> This will be used to implement the new 64-bit Power ISA 3.1 instructions.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   docs/devel/decodetree.rst |  5 +++--
>   scripts/decodetree.py     | 25 ++++++++++++++++++++-----
>   2 files changed, 23 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Queued for 6.1.


r~

