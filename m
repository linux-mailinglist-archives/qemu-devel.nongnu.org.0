Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47B436D8C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:36:12 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgfS-0002VZ-St
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgWf-0005q3-5H
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:27:05 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgWd-0000WF-MV
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:27:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id kk10so1557184pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x6UC3RtGH4/ZhBedRplFo1uVwwrOYjrrogjpyP1VuMQ=;
 b=HJkNgDoplGWxSjlNYlR3Hdd72pTufujS0C/iyNNzidyDSv/uQSOBQsw7DmREajtvVC
 YhxcMeheuqTUAi3tnJF6hWFk+lAFeqVacCVxePxvueZuDofymV7NQ4baTz1tnxpPWicx
 Po2OmeyzFZqnA4yDgLVoncml+M1HuJzxZD54z15fr3j1/e7raffg0MuqPKZA4Lx98CB9
 N4FOGWH5FCKPQaW89rxedcRKQocZvJ2JihLA5MngOcAAuqOkD9SWfU1nC4A+2aJv8ChF
 A35bexs0klWWKSKM0Ju9zzO1hXC0gACpIDccYAw4qtRW0omQH5iqjQmdjLDTQkmK9X6o
 XlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x6UC3RtGH4/ZhBedRplFo1uVwwrOYjrrogjpyP1VuMQ=;
 b=RmQEVZ9nRc7HKhwakkJdNDQWgX9OabxY82riIvAaCx6Y+NG+9h800MFzwUwfOIVipe
 E+8cocxKPCNrZJ57mwQ8J2+SQfaFfkdov1sSX33WXG8Ut2gwcBNDs4Mh0lqALu0tn/zo
 Yzv72+bnjt41Pk4XKm96oUcDO2JKf3WkPF5H0T1zvQe2rOTbPxt6enYqb3/6arwTjRjE
 6uU3oCcONDUlNVnzWIR359RIMW3aHwebO3LFSFgPraXuW63a5r+O/wdu5gTgmOAy70O4
 mGut4MlRdQ6e1BEHwCYkCNNjPp5m2MJgsWYZrIJt4+fRFTrfgXgjxCx7R8mtgfmdNb4y
 TCRg==
X-Gm-Message-State: AOAM530rS6ilZbNjnrXI737IVfe6pznkZ9vlGXLcnHkHryjpxiz+tuvX
 +9SEf2WPqvflLPf5rqhdI4ZoYg==
X-Google-Smtp-Source: ABdhPJwUf/leBLnvtX1YAIFq/XIpxFmFSfWad9JcNZ3hwW8m8xJQW/9FkKZXt7S8tYFTD9O+DQ92lQ==
X-Received: by 2002:a17:90b:2248:: with SMTP id
 hk8mr9727628pjb.102.1634855222205; 
 Thu, 21 Oct 2021 15:27:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h10sm7724829pfi.208.2021.10.21.15.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 15:27:01 -0700 (PDT)
Subject: Re: [PATCH v3 20/22] target/ppc: Move dqua[q], drrnd[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-21-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebebcc5a-6e4a-609e-dfd7-667c5f8a71e9@linaro.org>
Date: Thu, 21 Oct 2021 15:27:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-21-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> -#define GEN_DFP_T_A_B_I32_Rc(name, i32fld)       \
> -static void gen_##name(DisasContext *ctx)        \
> -{                                                \
> -    TCGv_ptr rt, ra, rb;                         \
> -    TCGv_i32 i32;                                \
> -    if (unlikely(!ctx->fpu_enabled)) {           \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);    \
> -        return;                                  \
> -    }                                            \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);  \

nip.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

