Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D14EA208
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:53:17 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwMW-00017m-02
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:53:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYwJQ-0007vr-DF
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:50:04 -0400
Received: from [2607:f8b0:4864:20::32a] (port=44891
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYwJO-00088a-Ll
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:50:03 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so11481737otq.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tqkPzXx96mG2EmHagbaPHl1g2ihGJDTsI/xhqnjHtpE=;
 b=DgUI4faf6rjV4DvIEaeVIUy/EsmlAU2NZON/j0CWD4/UdLQeBzLy+LGqz3dmCXzaHr
 AGmRLOU8aRFWXlxB/0Ekjtby1eIHGhhLjt12FMq0+5g85GiQpcxa4foMH3RKydQs++I6
 bJ8+CSqABxzXZU55KajuZL7sdwOWWi8r6N4M6l6wSkDlaxlKCSbcpGtQi7kcxiGwBpfy
 BSrt1uvIXKYx1alxTE6PQ+pbTsQyVFG0lvLUxJKAViSX5tRPlJS7tD23Rc6hU0upY/VS
 xXgvJ6II9fqAtsvRv99Nn7T5YdW5x5GumTSdca+8wqySrDKXfJB7RT5J5S5yK03hNnsN
 TZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tqkPzXx96mG2EmHagbaPHl1g2ihGJDTsI/xhqnjHtpE=;
 b=AlWM7Ayk+oeDXzYkzMxUJKMCPLGqSbTm0Ia1X3DtndFao3HQBwlrnnOEk1iLSEEfMO
 O68/z1ZecqEpcCyV75V/4X4U0tvV/njdoM2oFeNc75RfsTfM6yg7TqeapCayes823jr0
 /S92AWaaCFy4hfPB0rW+9maqNOAs/WSNIT2gHI0B3yioE9+1nK6vytAHtgzOXMyeHEIN
 JyhBtdR/LxJml2CX+mOL/5Cx0JTYTndGydICw5hbFlfaEIltWjexn6KU9TkP9i26uJW8
 YGlwmvUsNFIyf0KV9uyLJSG/3cAW6Jz2buhuMPAHIkrQRTu5aPWeKUFihhUpVFGaxLIW
 kTFw==
X-Gm-Message-State: AOAM533ElAr8pChpPx5P13Kj1bWvc71R5NyfUspzv53xBk11uN9vB3Ho
 DcRVq0IvEHEN2ujBdIjkJbMj3g==
X-Google-Smtp-Source: ABdhPJx5LRAv0mZFOtnNiNlRkYPQCb3VmLGYJ3/mjWbptuSzNhYrheKjU5yLV5kXzYsls2eRmiKG6g==
X-Received: by 2002:a05:6830:1047:b0:5b2:3173:d781 with SMTP id
 b7-20020a056830104700b005b23173d781mr10589266otp.178.1648500601276; 
 Mon, 28 Mar 2022 13:50:01 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 w22-20020acaad16000000b002d9c98e551bsm7564769oie.36.2022.03.28.13.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:50:00 -0700 (PDT)
Message-ID: <dbb17042-55e6-b9ba-8037-0b2f9013c194@linaro.org>
Date: Mon, 28 Mar 2022 14:49:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 14/29] hw/loongarch: Add support loongson3 virt
 machine type.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-15-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-15-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    uint64_t feature = 0UL;
> +
> +    switch (addr) {
> +    case FEATURE_REG:
> +        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
> +                   1UL << IOCSRF_CSRIPI;
> +        return feature ;

What's the point of the feature variable?

> +    case VENDOR_REG:
> +        return *(uint64_t *)"Loongson";
> +    case CPUNAME_REG:
> +        return *(uint64_t *)"3A5000";

This is definitely wrong, as (1) it depends on host endianness, and (2) you're reading 8 
bytes from a 7 byte string.

> +static const MemoryRegionOps loongarch_qemu_ops = {
> +    .read = loongarch_qemu_read,
> +    .write = loongarch_qemu_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },

The implementation above doesn't actually support access size 4; it only supports 8.
It doesn't seem like this should be a io region at all, but a ROM.


> +static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
> +{
> +    CPULoongArchState *env;
> +    env = &la_cpu->env;
> +
> +    memory_region_init_io(&env->system_iocsr, OBJECT(la_cpu), NULL,
> +                      env, "iocsr", UINT64_MAX);
> +    address_space_init(&env->address_space_iocsr, &env->system_iocsr, "IOCSR");
> +
> +    timer_init_ns(&la_cpu->timer, QEMU_CLOCK_VIRTUAL,
> +                  &loongarch_constant_timer_cb, la_cpu);

This timer belongs to the cpu, not the board model.
This init belongs over in target/loongarch/.


r~

