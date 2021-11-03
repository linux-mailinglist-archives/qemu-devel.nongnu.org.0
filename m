Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6164444EA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:48:25 +0100 (CET)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIUx-0007Mg-Op
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miITd-0006fb-T6
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:47:02 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miITc-0003CS-4k
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:47:01 -0400
Received: by mail-qv1-xf29.google.com with SMTP id u25so3257663qve.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fB/3eilnHZ8mHHK75h5WYhK2X/qfe30VgUzY8n++FYw=;
 b=xKwmoTAOVDfMIbQ6s4Vg1enMiTrYiBOBRjvhFvraVfJdKpPi+m4SlOzRwB3rhEUgcv
 NACqWxjCe5+jax7kFs1CW34RTFr8soOJzq/q/JIbJnbvRyTqgUaySx0yDXDPhM2BEMUz
 MNxRnadgj1FoOFyZv6vss+gMr1e/Gq0u+xIpXvNbAyTNCdA+OPbr/+K3DnPaaS/qBoob
 fW55au5MNNznxB77aWEJYWtwIqr+LYzjpXiVT2SHM1CfgZeW5At+10HU7nluf67gqcfR
 UK+FmJRPThFyhv6JT3n1lMw0/GsEmQjTFDwZQYwSCAAC7ww/RVjND5Dgdj3KInZKkuER
 DDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fB/3eilnHZ8mHHK75h5WYhK2X/qfe30VgUzY8n++FYw=;
 b=ZW2pPgJ2yuVjzQThdayqnOOS8JjfbE+ZPpLy3RFBDpzwQUCWdPufXUTvr4NofAaZTe
 drRXIzC+SSR2sP6qCjdlEDp+x2W8vT1kmnMzyWoaNCBWA+wlq7x80uHUNrrmuMyPzQ3R
 BKc/XtGzL1239SAhkpdOTYqAClM0l6/6xSGIu3/q52H332JWw1uhZhBUpKZm9/TQ2hfM
 HxvSkbrVjdAnke+VkvsjRXsyx++1xhcZoPTzSK2ndq0+2k4ZehpCnb0+9SncoGddIvx4
 5zw63bFuk5jl4s9U6o1oiTxQb5pjepuMtEk+d5/mKk2JQDRkeaEKNcbvArEINBo2TvsO
 SgOQ==
X-Gm-Message-State: AOAM5316p3dpIN99ghnfn5+l4zKslZL+mal6kCyy7TGlPxTlSKWB1Nxw
 hUzYIhyaIesokM/qyo0QYN7yXQ==
X-Google-Smtp-Source: ABdhPJyTaE12rMbRyO/xBd5W4rqtZn3F1FFprG5nwdjHf8MH2oixTG731Nb1LVa4Qu0rI08bjqtUIA==
X-Received: by 2002:a0c:f9cc:: with SMTP id j12mr198143qvo.2.1635954418997;
 Wed, 03 Nov 2021 08:46:58 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id w5sm1829060qko.54.2021.11.03.08.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:46:58 -0700 (PDT)
Subject: Re: [PATCH v3 16/23] target/mips: Extract trap code into
 env->error_code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-17-richard.henderson@linaro.org>
 <13397f73-9594-d363-e7ab-860477a832b7@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6d8504d-8bfd-bcdb-9912-65ffdb052c25@linaro.org>
Date: Wed, 3 Nov 2021 11:46:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <13397f73-9594-d363-e7ab-860477a832b7@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 11:21 AM, Philippe Mathieu-Daudé wrote:
>>       do_trap:
>> -        gen_trap(ctx, mips32_op, rs, rt, -1);
>> +        gen_trap(ctx, mips32_op, rs, rt, -1, extract32(ctx->opcode, 12, 4));
>>           break;
>>   #ifndef CONFIG_USER_ONLY
>>       case MFC0:
>> @@ -2439,7 +2439,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
>>               check_insn_opc_removed(ctx, ISA_MIPS_R6);
>>               mips32_op = OPC_TEQI;
>>           do_trapi:
>> -            gen_trap(ctx, mips32_op, rs, -1, imm);
>> +            gen_trap(ctx, mips32_op, rs, -1, imm, 0);
> 
> IIUC the microMIPS manual (MD00594):
> 
>                 gen_trap(ctx, mips32_op, rs, -1, imm,
>                          extract32(ctx->opcode, 12, 4));

No, there is no code for trap-immediate.
You can see the 12:4 code above for trap-register.

See the 3.05 revision of the manual, which still contains TEQI.  Note that all 
trap-immediate opcodes were removed for R6.


r~

