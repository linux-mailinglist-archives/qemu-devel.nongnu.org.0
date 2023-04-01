Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714096D2D73
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 03:55:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piQSR-0005Of-CQ; Fri, 31 Mar 2023 21:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQSP-0005O4-GG
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:55:05 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQSM-0002oo-Pc
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:55:05 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so25305543pjz.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680314101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SjSXnjm5qi84eEs+q9sDAi4NhodN6CMX1wcTiQSdqu4=;
 b=gM179A+7oB2KvEUjqYeqc7LfJyWcV9C9VojApXKiszAkU++emgvfVRIjxjxHgT+L7I
 fDInPeP9cqFAj7JXp46ERlgWB2MozOxme7zjW390O7ej5fUpLYJqzP80gyTL0KEA7nAz
 GOVeImDOYYZh5gvYCmQ5zVQXEk67vZkewr7H8UkjU54cEGE7HNYb36SgIR2azsCstFII
 dlVM495/WFHHIovrpWTRAV4k2ALQg3MgLqrgqF8oayNtAvQEOJvFFOSA6CUPaCE7ykjO
 bW+/zreWk/eX+LB5EUKdY4/6V9O6kMtdfyJX6nUdJj2UyG+yTjsIbXRyK8ql9ShR1rab
 VmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680314101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SjSXnjm5qi84eEs+q9sDAi4NhodN6CMX1wcTiQSdqu4=;
 b=u/lKlHpNKeXCS/Ph2nKo86YJMjuXJOlExiHFOFvWjruKFyfUpbrFBjFbAYavKKKMZ8
 KPD83KH+XwNWUtBk5agV+jO9F/7fsS3yvB2t9XU8uMw5xmS9igTzKT7x6Qnpbj4R+MNk
 f3XBg8i5/pvP+9mtA3YlohUfh5+bqY4ZvQ0+Ez77QUDK1LExNoVZ5BIhM1WOXrx2w1RO
 i0Gwcl0qDAlKVsT01MyCiZ9d1E9LHiNTiFDM0I54vYojZgS5yPvbkQblVbuwMRuiEAnf
 T8sRWan55bm0sVzu7oynvhG2jKXVrd3ozCakj433aFsSBTKYFDK2oMFkw22Us+j/y69V
 v1PA==
X-Gm-Message-State: AAQBX9cSmcgNiBPepx3p4B9O6pkKc2P0g6ZhW7otnHLevMccNC581AHQ
 2CrVAdAPzksnXMW1l+648Ciljg==
X-Google-Smtp-Source: AKy350bgECNkelDnYse9yKmZTQcIvSXU2ptI2863eybpiwW7xdAC+KWqRivr4GOsbDzr8oNe6I8kRw==
X-Received: by 2002:a17:903:234c:b0:1a1:a0b7:7244 with SMTP id
 c12-20020a170903234c00b001a1a0b77244mr36316405plh.63.1680314101236; 
 Fri, 31 Mar 2023 18:55:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f7ce00b001a217a7a11csm2189091plw.131.2023.03.31.18.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:55:00 -0700 (PDT)
Message-ID: <c3a6fe9f-e771-5baa-4953-358e9330cc4e@linaro.org>
Date: Fri, 31 Mar 2023 18:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 8/8] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-9-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-9-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/31/23 08:06, Weiwei Li wrote:
> Transform the fetch address in cpu_get_tb_cpu_state() when pointer
> mask for instruction is enabled.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
>   target/riscv/csr.c        |  2 --
>   3 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

