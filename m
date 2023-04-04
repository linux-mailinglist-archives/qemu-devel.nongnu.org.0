Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF456D666D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:58:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji6D-0002CO-6V; Tue, 04 Apr 2023 10:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pji6A-0002Bs-Dt
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:57:26 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pji67-0004Gd-8Q
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:57:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o2so31534772plg.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AlIMbFDr9iUgp0I8bC1VIUUbikAePRjLep+Ruu0fJ44=;
 b=k12l5ec+BHUCc3xITheDluiJUm7ItvihyQ1NJHXHJ83nAbFP7kPcDy62am48pEHpaH
 UJkP9zWRdQ6CRw004eZ3XA8V5bNTabZhzHtCpKp+fwwYeiIaHrA+OSqLZo8Kv4HSm2XQ
 MjHbH6ILyzpH3ssca+mezSg5/FXx/ftwk1OZgdfIA3ir9jT4AyyDQ8XOil1iHNM7EIzr
 todlln976eYKiIGnslYCuTnNm69d+DDa0jd8RXicx9zzCLhmVS8Oajb01W57Y+J9InEE
 8ChcvlEF8dy72fTvK3V6ZTevk8dOeSb+mcFqEH2AKlbNVBYwuMQMqLE6Mun3p0DSNLQq
 qfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AlIMbFDr9iUgp0I8bC1VIUUbikAePRjLep+Ruu0fJ44=;
 b=qToZvtz1GKk4tdtNNTMFJ71pU7NpDKhNRB1r1ZyA0CfOvrZl6GT7LOg4AkqoMrz4tJ
 cxbKpvrJFJkdsoxqS0fjc1no9ApIj98FsZzPr5UDHhuqhNbyqlnI5kzAl35oO5GJ4T/z
 s9OE9bjMfiwpHKl74YS6udVjASBlSs//KZB2B/rDbBq3IaghL2FJVlQfVv2ggrKhWNc4
 6mZ245JmUkqa8PxRs0+L1/wsxCpfYl3X4BpdVvoKK/nHNtss1a4i4MImm/zdWvHRQF1t
 hl0BNKspwfkoMI+9NCeNKt/D8JOoNzqLWG8wkERj/G3G5OTWLGtC1hSr6G/qqAjcVbS3
 C43A==
X-Gm-Message-State: AAQBX9d2bgfn3vDbmyJdXVm8A13w6ucUcUrzI7aHde/iQCY6t22HXl6c
 PZYeRAwPJx1XDXnSB/J4DmpY0A==
X-Google-Smtp-Source: AKy350Y0+EW8ZfJCsrU2GCJEt2roOOPJQeCQc6wStkIANDKcGA/9RnMqcAAqd+Pas7HrLQmpQFuN/A==
X-Received: by 2002:a05:6a20:3148:b0:dd:b941:5d90 with SMTP id
 8-20020a056a20314800b000ddb9415d90mr2351014pzk.60.1680620241394; 
 Tue, 04 Apr 2023 07:57:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:1d41:7730:d7dd:6f41?
 ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 v11-20020aa7850b000000b0062db20e63a8sm8560789pfn.156.2023.04.04.07.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:57:20 -0700 (PDT)
Message-ID: <24d824ed-4018-302a-9c4b-22758ea1f64e@linaro.org>
Date: Tue, 4 Apr 2023 07:57:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
 <f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org>
 <f466aa0b-1312-d8ba-c2d6-d386038df781@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f466aa0b-1312-d8ba-c2d6-d386038df781@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
 PDS_TONAME_EQ_TOLOCAL_SHORT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/4/23 07:33, liweiwei wrote:
> If we want to hide all of them in gen_pc_plus_diff,  then we need calculate the diff for 
> pc_succ_insn or introduce a new API for it, since we need get the successor pc in many 
> instructions.
> 
> And the logic for gen_goto_tb or gen_set_pc_imm also need update.

Yes, exactly.


r~

