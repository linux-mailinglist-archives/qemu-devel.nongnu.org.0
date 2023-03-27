Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF96CB1CC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:28:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvJm-0008Up-3u; Mon, 27 Mar 2023 18:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgvJj-0008UY-Vs
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:27:56 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgvJh-0008GB-Tn
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:27:55 -0400
Received: by mail-pl1-x62b.google.com with SMTP id ix20so9893121plb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679956072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwQbhx4Cnry/9POA4uDfBXRMadWgD/fQMyqaH/kdnVg=;
 b=hW6+SiU8VXzYwKWNCFKBLS0yNNFUVYYPMTft7sdaYpI2AmdwvPxWssfdxMgHXB1QfQ
 9W1vWl40i5WaVWtPirI4YPslJfmtXmmBRHM6D1JR9qoD2vhh599Qv73qjH1/PWJdpeam
 qSBM5F9Dd4icKLRFljHafKKxczfDc7fA8jPzeYc+ly2q7mpRpMprOI3uLFynnAk6VGNV
 VrZ9dII40gW9R0M7KGMlUaSsVOALvmklwj7AkwWZslxnTyHSIGVU+3D6Pluixng0n3EG
 R+bokrGVu5Bv739/pI8xBlERzwayleKo2onUfD3QMzeG9LR7i6SmjdsNN80FA38B5hRZ
 RHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679956072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SwQbhx4Cnry/9POA4uDfBXRMadWgD/fQMyqaH/kdnVg=;
 b=WDCh4pY12MU5ymWuK4CwCxHZv1JPblUnsDCLvYDFLLGarZIDnLGrL3uQ37HcoOrb1q
 NpgIW9+BKV0DXnnFSll0frPbaH9ilj/xZb8TR7OojscPFOdYwov6o02x4VH75MZhyGQW
 14TJvFzjEQyFLD1yGwX3IdK6g+rWhR5bJgBVix8p43JXk2GGk79QxF0Pz5YDe70fA5vE
 azll6Kf++72Aw3sLUitOFNvzGjVfcI6BjfVYifpBy7YQitAFto3RZWbWRcusnYvRDBWX
 HX7XWIipysz1bXY+akPTMSgfr0lsQ8Tbl8y+3G5OsFNJGP2SU/dUy35SS6+550CugVty
 Nv5A==
X-Gm-Message-State: AAQBX9eGLM+YdqDi4t+bIwO9nJzYdzA38IHurRStmafFowV2fgfvP3KT
 igHcwFg0cxKXLuG0VukIbFHqtw==
X-Google-Smtp-Source: AKy350ZLaSA63jIOXMUPMXiUjQyZUM1kV+YP8jpoLlVK32OMxhl6wi2TlVEUpGt/VjqLEzHJ4UBDGA==
X-Received: by 2002:a17:902:d40a:b0:1a0:57dd:b340 with SMTP id
 b10-20020a170902d40a00b001a057ddb340mr9484542ple.64.1679956072355; 
 Mon, 27 Mar 2023 15:27:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1709028a8600b00194c2f78581sm19653729plo.199.2023.03.27.15.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 15:27:51 -0700 (PDT)
Message-ID: <b88ea0be-11de-1ccb-ed87-6f4d6685c738@linaro.org>
Date: Mon, 27 Mar 2023 15:27:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
 <20230327124247.106595-4-dbarboza@ventanamicro.com>
 <a5a3e653-c58b-8da4-106f-2913235a44ea@linaro.org>
 <e9189845-f713-2ec1-271c-948d73f20e4e@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e9189845-f713-2ec1-271c-948d73f20e4e@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 3/27/23 15:15, Daniel Henrique Barboza wrote:
> 
> 
> On 3/27/23 15:52, Richard Henderson wrote:
>> On 3/27/23 05:42, Daniel Henrique Barboza wrote:
>>> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>>> +                                 void *opaque, Error **errp)
>>> +{
>>> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>>
>> const
>>
>>> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>>> +                                 void *opaque, Error **errp)
>>> +{
>>> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>>
>> const
>>
>>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
>>
>> const
> 
> It seems that I can't use 'const' because the object_property_add() API uses a 'void *opaque'
> pointer and it won't take a "const RISCVCPUMisaExtConfig *":
> 
> ../target/riscv/cpu.c:1454:35: error: passing argument 7 of ‘object_property_add’ discards 
> ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>   1454 |                             NULL, misa_cfg);
>        |                                   ^~~~~~~~

You can cast away the const.  There's no need for this array to be outside of .rodata (or 
.data.rel.ro).


r~

