Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91869488BC2
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 19:53:43 +0100 (CET)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6dK1-00082N-VY
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 13:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6dGJ-0005ld-Jp
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 13:49:52 -0500
Received: from [2607:f8b0:4864:20::435] (port=43806
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6dGG-0002oU-TH
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 13:49:51 -0500
Received: by mail-pf1-x435.google.com with SMTP id 78so846232pfu.10
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 10:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aSIFaL2GNRteZBQuyiZjHdY1T5y1aqT1lu1Is2yTZDU=;
 b=yIVDzQUrZol8xraAl+xg+N/Z3UaGg3mcC1kfThDFc+jMOpJ19iTiTZuqospGvOxPka
 e4JaRfnZJMBPJ+r35/1qayWl6QVq7kVkNgo52BN6P7qxTifVvwcODl4p/P3PvXIcEjsO
 FHkInHWpPrzxAyDP2KvuloD9G0nOfcJO73b2NorboIh+H9FjWI481uL3gfSQomkvp1+J
 CdC6NnmKX8ZgERsAIdNcjmcXoDv6aeu+3GK1iIboRDpoWjhoomkbzBtHthS2apJzQUL0
 Fvldqzl2aW8erF9U+gw5QyfI8Qxa6ovwi8/yJYPdAc/ZliXlMaYG5x7su2X97PLF4mVi
 TBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aSIFaL2GNRteZBQuyiZjHdY1T5y1aqT1lu1Is2yTZDU=;
 b=YZ6q5nrI2CNUAj2djDDVhnZBXFDG/92YBfvIxLGqTbudsKkK9i9YNOJfaU4X6aFe+y
 DVwbTPKu3SoqpSnMcUObr3nv9JF9rmEScD1K1Q93ueAmIb3vufo6MVj9yNBIALVLbfUO
 jzVae38C7ujOFvYtnfix2D8WX/FsjZVcD7imnOGS6OMCcLHcxXgWJnrgJuRGVFVD97oy
 KduFtWDGkMUX4CtwtQf9J5TM3aUd4czyWttzVKV+3j+tdoc2iKo0Mpu8tzwDPxOc9PTP
 rS65wlcu17VX/UoHZvk9fVwlA80xtJDvpjjqMs19J1u6kxyj67IFz3ES+lKyNwLXti7z
 D+ZQ==
X-Gm-Message-State: AOAM532pzPHEN+GGE6Fp0Qo+YtjxPrjFpKo2ipWn6WeAykwOezpL56c4
 vTy5TqiXCtD4c0FwfN38PDu3pA==
X-Google-Smtp-Source: ABdhPJwjDw2ppwhwc739fgDlr10LjCLOWSgm83Y1pX2PhyjMTpOl+vztASC34GN+AH5pY87Xxvx3+w==
X-Received: by 2002:a05:6a00:23d5:b0:4bb:332e:a244 with SMTP id
 g21-20020a056a0023d500b004bb332ea244mr73215710pfc.84.1641754172035; 
 Sun, 09 Jan 2022 10:49:32 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z12sm3316612pga.28.2022.01.09.10.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 10:49:31 -0800 (PST)
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
To: WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org>
Date: Sun, 9 Jan 2022 10:49:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/22 1:25 AM, WANG Xuerui wrote:
>> +#define TARGET_PAGE_BITS 14
> Aren't we capable of page sizes up to 64KiB? Minimal feasible page size is indeed 16KiB 
> though (due to cache aliasing, although 4KiB pages are supported in hardware, they don't 
> work in practice).

You must use the minimal page size here.  64k pages would be handled solely within 
tlb_fill, as multiples of the minimal page size.

>> +static bool loongarch_cpu_has_work(CPUState *cs)
>> +{
>> +    return true;
> 
> Note: this is only applicable to CONFIG_USER_ONLY, and needs to be changed in the 
> following commits adding system emulation. To better convey your intention it may be 
> better to use an #ifdef guard, something like this:
> 
> #ifndef CONFIG_USER_ONLY
> #error System emulation TODO
> #else
>      return true;
> #endif
> 
> (I'm not sure if this is okay in QEMU coding style, so please correct me if this isn't the 
> case.)

Prefer positive tests over negative tests, so

#ifdef CONFIG_USER_ONLY
     return true;
#else
#error
#endif

>> +    data = FIELD_DP32(data, CPUCFG2, LSPW, 1);
> Do you support the SPW extension in this series? If not you probably don't want to set 
> this bit.

Correct, you can't expose features that you don't implement.

>> +    uint64_t lladdr; /* LL virtual address compared against SC */
> Similarly, do we explain every field with comments *here*? I think if fields are named 
> according to the manuals, people will naturally look up names there so there's no worry 
> for misunderstanding.
>> +    uint64_t llval;

These two fields are not architectural, so they do require explanation.  Not that there 
aren't other targets that lack this documentation...


r~

