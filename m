Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0896998D9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:26:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSg9h-0006cl-OK; Thu, 16 Feb 2023 10:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSg9c-0006ZY-6M
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:26:37 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSg9a-0005Sh-GU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:26:35 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-16ab8581837so2926763fac.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gLe9VdrAVuynxZe13mGGpYv13doHDVgfBuUK79r5uKg=;
 b=oSKl6qjuC7uDiSQvm4kGaApyWjEdHliu61auG7BjMWbPArW2IOaK4nU72xYXUTCFtz
 flkmee+GovK2u4SNikYFnRdFpmGiphiiD9En2Mbe+fc8fvBKqH8Xd1AWuvu2r3cPwedQ
 KcGxk9MivtHgKrCIibA8AY0UcXKs4gh+iZhz7/y2EnOGtDOZdWY6Wqxk3SPmbmHt/W18
 8UgZEwxPvezU0IgffLG3nDKzbegYIyZ7sxVwcF/6qptU0QDSLa4CboTF+hHe7ZHJPTWB
 YWATKBmz329vAqxTf9mlIGTFsiyjyjzzfSZXhzhFlsQF6Co/dQcYaC5eyBG2ulR7M/H1
 qBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gLe9VdrAVuynxZe13mGGpYv13doHDVgfBuUK79r5uKg=;
 b=GyBexBSh5smJsJPDXYFq2Yr/cQXfjqw7wXf5cafBKmT4pPx1YEEpQrtyhMXZdMQytR
 6GyEbZHvR3PZG70pybTWbw7v2qC1gCLLdy0iVhc6mpg35bJJiAADZYHquBPcGb6M19zX
 5cltHmN7AEzwh5qqAJuyPHufrwFSyCYhSplS7m3T+zDCF5zcW/rlvVQZd2jdfIiE+DpE
 Mze3thT70DTAS+RQc1aJsjUToXqESKphdfYINqA8pKB25yFSKP0xwepWerxJrhJPZKry
 U+P/FY/zzwa6txY+Gyuc/SznMzJRMGvYSgOlHeUxlg1he3CAN3A7aAxYSNgB+1z881rg
 mSUA==
X-Gm-Message-State: AO0yUKVe6wCt3WBZeY9wzERjpfMNltfpEVJ/7BgRbhrV2QXWsPSmXNYf
 eM4fdozp6wYBYs77IeHadXweAA==
X-Google-Smtp-Source: AK7set9PmSjF2ljvm4H6sZxBO723hp+laztRe/79oWWGhSImOwLuYu+j6GHVMR8PDSalpjwPyysF0A==
X-Received: by 2002:a05:6871:5ce:b0:16d:df7b:b762 with SMTP id
 v14-20020a05687105ce00b0016ddf7bb762mr3397284oan.54.1676561193218; 
 Thu, 16 Feb 2023 07:26:33 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a4ae506000000b005177c244f31sm719456oot.41.2023.02.16.07.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:26:32 -0800 (PST)
Message-ID: <014d3ae9-58a1-9ee1-0aea-df4a81a9a032@ventanamicro.com>
Date: Thu, 16 Feb 2023 12:26:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 02/10] target/riscv: remove RISCV_FEATURE_MISA
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
 <20230216130444.795997-3-dbarboza@ventanamicro.com>
 <20230216145212.dvgb5isazcx52w6i@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230216145212.dvgb5isazcx52w6i@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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



On 2/16/23 11:52, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 10:04:36AM -0300, Daniel Henrique Barboza wrote:
>> It's unused after write_misa() became a regular no-op.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 7128438d8e..01803a020d 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -89,7 +89,6 @@ enum {
>>       RISCV_FEATURE_MMU,
>>       RISCV_FEATURE_PMP,
>>       RISCV_FEATURE_EPMP,
>> -    RISCV_FEATURE_MISA,
>>       RISCV_FEATURE_DEBUG
>>   };
>>   
>> -- 
>> 2.39.1
>>
> 
> Probably could squash into the previous patch, but anyway

True. Since we have a typo to fix in there I'll squash this in.


Thanks,

Daniel

> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

