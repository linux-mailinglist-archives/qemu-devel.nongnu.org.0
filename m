Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A758D6D2C73
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 03:19:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piPtU-0005fu-Sq; Fri, 31 Mar 2023 21:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPtS-0005fJ-NG
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:18:58 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPtQ-0003Sa-TF
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:18:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id x15so22285540pjk.2
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 18:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680311935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gXC/VCdc+dvVE7dTFsNO2McLEihGqVq5qip5L/HC9N8=;
 b=TlEX/TKQ6Jt7oHVHbhp4dFjLg3bb775gJpKholl6iXrj/n/hY2+zj/KDUMlQTliLGd
 RQa+r32+CPL63Wv2RBiwqVa8izByftzyA8hB3OXIiiUarzL8rIWQqSzWomM1LOzCgjj4
 0ar5uuppqdkHyW0yqv0AK5N0tjzSYV3ZjGmO8hSOAu4ixEpMuRaFD/WaMi+YgmlgIM9i
 BfldM7D7kJppMaHHD0ZMLLsp8Qz3pG/KpQ8XVOSHzQn78bLR99KDMBYn47/yIqherMgm
 PBXqDUveCbWa+N2KHIpOVgu12CQ8y6Xv1v8t4IClQJ59c7uGYSKa0vm5NrRY1eBxlgGf
 aiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680311935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXC/VCdc+dvVE7dTFsNO2McLEihGqVq5qip5L/HC9N8=;
 b=fGenxF0gddKVFB63richDLVFwp7nbo2w2ChZhOgT1iYrUY2huSm9S8G8iP1hZDomxH
 Y1PAEQnXIUcUt1964P3khJoV7F10z/FhylNdif0vm+Gpd3s2iCnrHz96c1UlpYzaLjXV
 syes+PyDKAF1hEPaaU5ctZ/GzYQfAhvPYoTkN9ZOuLO35WMRGXGZg5HtvqQVmsr0sdWy
 2h1+wbydt0kXvvnGAUd+zwWgac5QNwoZn0HHj0JVLMm6rUgfgUCXqD4x5ZOlsM/F8NHe
 iVv05Ht00pU04JXOLGWC9GGK+82EI/BJ/Vf3udZwp8Qn6ZkApTeozY4liCrG43JOUEO6
 VJQg==
X-Gm-Message-State: AO0yUKXT6+bYOsstuT97I25RCwrLkiNPe9EGMRpqYDBRKYbkzlKF06v3
 rDzzecVKHqGuj8QlHjL1q5RUrA==
X-Google-Smtp-Source: AK7set8o0xNZwl0pKNW6g6QZ/OJpf7UUJysTUrpVbXZec/mH4mM5njL2FLOoVNuu7fiayBB2lC5+Hg==
X-Received: by 2002:a05:6a20:671f:b0:d8:f312:b3b with SMTP id
 q31-20020a056a20671f00b000d8f3120b3bmr23796539pzh.3.1680311935214; 
 Fri, 31 Mar 2023 18:18:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a056a00408b00b0056283e2bdbdsm2372762pfb.138.2023.03.31.18.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:18:54 -0700 (PDT)
Message-ID: <054b85f3-5ae8-9215-f9af-d3c55126e552@linaro.org>
Date: Fri, 31 Mar 2023 18:18:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/8] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
> CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
> tcg_cflags will be overwrited by tcg_cpu_init_cflags().
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   accel/tcg/tcg-accel-ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

