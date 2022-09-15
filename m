Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A45B9686
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:41:10 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkQl-0008AG-SO
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYjuP-0001J3-5r
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:07:42 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYjuJ-0002yV-JT
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:07:40 -0400
Received: by mail-il1-x136.google.com with SMTP id b17so9305536ilh.0
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=e59Kdp7IusKVdXAHcR1y5J4qLxewCCFQwsbIuJRuj3Q=;
 b=OKuNvwdL0CCzLpxWWXGZwOz801RHT7VOZEUeuzIf6p4os7SswwuEP9IHGJbMgotQ8+
 r95SutEY9/jsZDXQDjTsGNgaDJFgb3qs3zQUQ9TK/X5qR08DaVJP0oOqDrbo82MnUTOm
 tHdBmhbPj9IppybYmbeClDmMcyamoStMjrxOiPnC5ALbvON0bmH9np+qD5+0I8xzxIlt
 2RRsfnue1plsZj9S6Vt9hoBogFlZ1jBDMP5sM1QIdDDUfICt7Iu/cSI5jxHHjRZzjCn+
 LElkR2/NtFOV+lQjfqjThOjhv7dz0SZMJSfk7EZFBadgeMc38a0xwx5C8z7UnZYNCXBG
 MTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=e59Kdp7IusKVdXAHcR1y5J4qLxewCCFQwsbIuJRuj3Q=;
 b=BERz3+EUvNV7dJBxMb0RaoCXut+yfGmqSVZT/QpLVjQxnkKNevefSU0BW555DyTWbr
 6Z7o2f+TRAoJlQGsqLt7HmdJsdF7ay8QoYZA7NA9IjLUFDNeL9NmnIHByf89hVRsZAay
 V2DTodIs0IsN2LT3jDq2HnWVYSWMgOzXtW5RO0KTFMdQ6hRXbkNhJJK8+PZW2Ga5E9N6
 iw6C/FYHYyBzejG2pKL5N32cgtQ8lfBdMc/Hwg12xeQ75k/+ImPysf0W0QsGdUuxxU6h
 8FWmcvIIPd4iJSFWHeTQgCn/NnNuOthCWToLI8pYpXqEUtcQ5TFtcDdCCRIx6PUwzDxE
 XkDA==
X-Gm-Message-State: ACgBeo3lq60EMOioemHbxuvCUffewtyjIk6v2kJ34UWvu7KItV5dpVgO
 MIP5AGkmynKj6fKQVwEmk7wHTw==
X-Google-Smtp-Source: AA6agR6dkm6FtFyFjDJXJ/C8H7ai6wj7SzjQkege+yqCeydV5TVaDf4mruM/SLw+SClz4qXXR8U7dg==
X-Received: by 2002:a05:6e02:1524:b0:2ec:71c6:7b85 with SMTP id
 i4-20020a056e02152400b002ec71c67b85mr17168929ilu.237.1663229254383; 
 Thu, 15 Sep 2022 01:07:34 -0700 (PDT)
Received: from [192.168.85.227] ([172.102.14.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a029992000000b0034c0b4c13c2sm817595jal.23.2022.09.15.01.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:07:33 -0700 (PDT)
Message-ID: <f7de79e4-a0f4-c212-6960-afa0a82bc80a@linaro.org>
Date: Thu, 15 Sep 2022 09:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 1/4] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 17:09, Alex Bennée wrote:
> @@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>       uint64_t val;
>       bool locked = false;
>       MemTxResult r;
> +    MemTxAttrs attrs = iotlbentry->attrs;
>   
> -    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
> +    /* encode the accessing CPU */
> +    attrs.requester_cpu = 1;
> +    attrs.requester_id = cpu->cpu_index;
> +
> +    section = iotlb_to_section(cpu, iotlbentry->addr, attrs);
>       mr = section->mr;
>       mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
>       cpu->mem_io_pc = retaddr;

At first I was going to suggest that this be done in tlb_set_page_with_attrs, so that it 
could be done once and not duplicate code across read/write.

But then I got to thinking how this ought to interact with MEMTXATTRS_UNSPECIFIED, and now 
I think that we simply have to leave this to the cpu's tlb_fill routine, where it fills in 
(or doesn't) all of the other transaction attributes.


r~

