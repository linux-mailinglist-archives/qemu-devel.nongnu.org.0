Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB026F5214
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu72H-0006dt-BQ; Wed, 03 May 2023 03:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu72C-0006Xl-8f
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:36:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu72A-0000TU-7P
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:36:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so2912698f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099375; x=1685691375;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ScsK2kBKzhIRL5m8hbykOcR58W42FCSty2YTazqIrTU=;
 b=mrChas5ZddmR55A+jH+8582PnaTQurBfesp9Ozt0coGE8ZC9/k7bWpqqZOOySNcN7n
 tk9ro4VetivzQtPPGd+uSYCqI1pWBlm5FD1mS8AhTmWWquKJ20uSiuBaYlurls23lywr
 07sqQJ6/5nfmH0e/19gyItJj9yQXDqy3yX07aYW7M4/GRWD5cp9+NFywEdWphIQ2dLUO
 NEi21LmAUtXqwHrwhjPgMrpCGOfsaVcexuOnvFWmYF2cRljy8Ds4SagslJ0RKG795BW9
 UmqqPwDKcLP8lvQmnfgpRT5BwUirspK3Jo73efA9oQ9huY/RDYTh+vvXt+Q+p0kTfBcn
 BHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099375; x=1685691375;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ScsK2kBKzhIRL5m8hbykOcR58W42FCSty2YTazqIrTU=;
 b=eWEWzzObsgdUJ4J4/cDh/4cGUjlTGsK/pGPC24FIbc72jVHcYdiBrazdcNQTc4Mfpx
 Varm99wsV/DV8eaV4k4lXLedpo42FohKhDZuU/boeWMT9uk4RigTshtuZw178OP6RQZw
 ETDhdXSrbCNJzYsT6tT1nGJvx4OB1zI4dS2nxTfsrXAQOb1smq2WnjJR6eFsPAIUXjGL
 qyErDscx40FI6k5GGd4HlzGAYd3jDBHLmwSgUcD9kfLc+rdzrq3Dtd/RFgnYwhxN87Kn
 oDHfp/YBKl80umtJTqB11D/6Zzv7/e9+pQcec+t+MHjfolc6mHF4TDbpK7os8sB6bNUk
 3tfQ==
X-Gm-Message-State: AC+VfDxwSnsEQO2H1fDDpUVqWQg5mbpD2uQfRWqJ6YvJjdofJgnvF3X1
 ail0iSpmxtNCSAUkqDIW2PLaGA==
X-Google-Smtp-Source: ACHHUZ5u7GLD6VdqLOghvaGpv9qM0P2SRCh2OBAHVHPe/7UrPPivhZHo/wTY1ZMoqqf+SKZccDIxDA==
X-Received: by 2002:a5d:5186:0:b0:306:2b5f:8d0a with SMTP id
 k6-20020a5d5186000000b003062b5f8d0amr7225595wrv.56.1683099375547; 
 Wed, 03 May 2023 00:36:15 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056000120200b00306281cfa59sm9492602wrx.47.2023.05.03.00.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 00:36:15 -0700 (PDT)
Message-ID: <baea6704-7a22-6934-54f3-76ff4c0fc298@linaro.org>
Date: Wed, 3 May 2023 08:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] target/openrisc: Set PC to cpu state on FPU exception
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-3-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230502185731.3543420-3-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 19:57, Stafford Horne wrote:
> @@ -55,6 +56,9 @@ void HELPER(update_fpcsr)(CPUOpenRISCState *env)
>           if (tmp) {
>               env->fpcsr |= tmp;
>               if (env->fpcsr & FPCSR_FPEE) {
> +                CPUState *cs = env_cpu(env);
> +
> +                cpu_restore_state(cs, GETPC());
>                   helper_exception(env, EXCP_FPE);

Better to mirror do_range().

r~


