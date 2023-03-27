Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5B56CB180
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:16:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgv88-0006Gg-J6; Mon, 27 Mar 2023 18:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgv80-0006G6-81
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:15:48 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgv7y-0000y9-M1
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:15:48 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 r40-20020a05683044a800b006a14270bc7eso2048500otv.6
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679955344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rtw9gHV6mdR8gX9XHlLFMKjsydb6YJnOaKLb1TGPd2s=;
 b=CmTSh3T6gwjwkB8A+7Wz1M95vl1Tc8sCyNjdfKAjTEAHJmIxd8UGKb6IihfiK2hhe9
 m5ujrLDO8gRzU/5lQ00tuxQa3tjKDo4Rmk+mXtAjXSoZAuZISGT3/RlCfzqPfjV8iB7v
 Rrue+jZKPZ4eDJekPogR4ihabnIUHfppvFaIj8nv7EqCGsTAu8soycFJsWRTFa2FojTZ
 olbyyawt6q04MSXqs2SWnbbIvv+Jui5zde+dxABWlD9djF9ffSykk+FtazBYoZ7MINeb
 DAiZCiV7udWOBRl8k5kN1K7i9R89BLIHjKr85DE/RhPUVneUlEH7Gq2EEOCdrE/6rAvA
 xGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679955344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rtw9gHV6mdR8gX9XHlLFMKjsydb6YJnOaKLb1TGPd2s=;
 b=2t4ti3CpKAjgRgNoai/sgZyA00SuURgxiFUahyr+OWi+04Iqgms6Py6rlg9MQ6h5oG
 d1eGifH2YKeQ1rm/LuKJ0Xpak+0DpihMvdxxiRS/NTnLzWcsd5+13q84thKyACZnKlYW
 Yk0evG+bew87Q5s9AeR9S7Lnp7fsHCfI23iQ5reUrVpJi0X/jSPErN/DKZ2KR8rxvaCn
 xATRGQClaTa3FgTzz1ww0uRoDl44KPgaDU7v7B0+lzXMV1z6ZLkmwIV5l6gMztJ6GItI
 PMPmDxNTwm2PXeg55qrB/reOxC3sh4IghLoCrQWt/bSxk0BFLOzqBIb9hEIvUA63wP9x
 ftQg==
X-Gm-Message-State: AO0yUKVgsxyHdMi29ZO4wtqy70yDJaMm+aoe8kmerYf4LZYWdtyylqKw
 Rdqv/CRhhkBQMYT9rOG6n1iKLg==
X-Google-Smtp-Source: AK7set8RcGKhIkHPHZ1I37b2u644WM23Bbs6dcp5sv6NhZNXveoNCV7+McLNkQ/vsOiDv5xBUGKElw==
X-Received: by 2002:a9d:7c8c:0:b0:694:298d:408a with SMTP id
 q12-20020a9d7c8c000000b00694298d408amr7170287otn.8.1679955344702; 
 Mon, 27 Mar 2023 15:15:44 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a9d5e12000000b006994465665asm12233642oti.80.2023.03.27.15.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 15:15:44 -0700 (PDT)
Message-ID: <e9189845-f713-2ec1-271c-948d73f20e4e@ventanamicro.com>
Date: Mon, 27 Mar 2023 19:15:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
 <20230327124247.106595-4-dbarboza@ventanamicro.com>
 <a5a3e653-c58b-8da4-106f-2913235a44ea@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <a5a3e653-c58b-8da4-106f-2913235a44ea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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



On 3/27/23 15:52, Richard Henderson wrote:
> On 3/27/23 05:42, Daniel Henrique Barboza wrote:
>> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> +                                 void *opaque, Error **errp)
>> +{
>> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> 
> const
> 
>> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> +                                 void *opaque, Error **errp)
>> +{
>> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> 
> const
> 
>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
> 
> const

It seems that I can't use 'const' because the object_property_add() API uses a 'void *opaque'
pointer and it won't take a "const RISCVCPUMisaExtConfig *":

../target/riscv/cpu.c:1454:35: error: passing argument 7 of ‘object_property_add’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  1454 |                             NULL, misa_cfg);
       |                                   ^~~~~~~~
In file included from /home/danielhb/work/qemu/include/hw/qdev-core.h:8,
                  from /home/danielhb/work/qemu/include/hw/core/cpu.h:23,
                  from ../target/riscv/cpu.h:23,
                  from ../target/riscv/cpu.c:24:
/home/danielhb/work/qemu/include/qom/object.h:1067:43: note: expected ‘void *’ but argument is of type ‘const RISCVCPUMisaExtConfig *’
  1067 |                                     void *opaque);



Daniel
> 
> 
> 
> r~

