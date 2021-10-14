Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD4942DED9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:05:01 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3E4-0004Zf-B9
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb328-0000qf-KJ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:52:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb326-0000DA-ON
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:52:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso7254822pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ChxS2VNPaGoo9fvFLqmIiW0ukyQ6pBHf6405rReavZU=;
 b=kb1rCUiwl2d++3LjhoBJwrQ3CRqqlf7zncwqYDEnrrI7qTULO76FoqmqkP1jJZQCoi
 L7VpDVK1J781ahI0rL8HzfWHE1C3RQXCCo5QM6BZHwbaNzlgkoTYBK2ew3yfM1s/WaML
 fGD26KZ+J+4g/U/V2HKYqJevvPAPR3vJxCJjqA1hDNePDOiR8Cc1fPyzrZphmBUTWcLl
 Knp6zH735QGduq/+0uSmAKTuYeVEb+duEwY+pz6yPk/WwdkN73t5cCZnKILpEys24etO
 c2WijphOZSaSJcLJl5uPsXtQN6uR5aRBZSDDkJdpXet5cbw5Lk9nCxq614WpikYS63lQ
 u0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ChxS2VNPaGoo9fvFLqmIiW0ukyQ6pBHf6405rReavZU=;
 b=M5KnCg+ED8ECaK4QpAJWWgcfvv63XnAmj603TYOqRKWr3vpjvWfG3BrTmk4q60Ihao
 Xxw2Kf9t8tP/mPn3jI8Id4+sSiOPqSMtZb2ZyZPQ+xZeoDB5KRWmKHA8daBruu16WVjx
 b3DDy8nuWNuAQQk48d82qheMWX4F4MXQp5E5YnMhfCAIZ+pmjz71oql1y8UDZrqez+M0
 Z6R4RxPkvePCnSry65cUsxaYGqwmd/j8QrLIL8xEN12u04LxoiNab2lhMByOySBpz0pv
 n6hivjAuK6Fd0d+iDHXNgXbBVzIFs4oKwcPjCQIszQ8QRzlEFS6TgLlQYbwUHWFsB7N6
 2gaQ==
X-Gm-Message-State: AOAM530CPatEjf+/dv0rOksDDXUZcrOMeAzWmuJ7f6Ld2NF7dvs4hZnd
 ZnhxOhNWRJpg2E0c+pDNmbcn9A==
X-Google-Smtp-Source: ABdhPJx8P8cW/5EpgvH9DMFbQNSd0ct0rfg1oIXmnNsEgMuQFeGrvyr7yzCo6zU9s+4NdgzwC48r0g==
X-Received: by 2002:a17:90a:f415:: with SMTP id
 ch21mr20889106pjb.235.1634226756978; 
 Thu, 14 Oct 2021 08:52:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b10sm2831589pfi.122.2021.10.14.08.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:52:36 -0700 (PDT)
Subject: Re: [PATCH v2 03/13] target/riscv: Split misa.mxl and misa.ext
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-4-richard.henderson@linaro.org>
 <e3151002-6664-930a-bea2-c2d692338a86@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a123d4d-fee5-9d94-424f-b120d202e649@linaro.org>
Date: Thu, 14 Oct 2021 08:52:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e3151002-6664-930a-bea2-c2d692338a86@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 12:52 AM, LIU Zhiwei wrote:
>> @@ -360,6 +357,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>>       mcc->parent_reset(dev);
>>   #ifndef CONFIG_USER_ONLY
>> +    env->misa_mxl = env->misa_mxl_max;
> 
> As we have set misa_mxl in cpu_init_fn, why set it again here?

I guess we could drop this for now, but we'd need to add it back as soon as we can modify 
MXL in write_misa, as this is part of the reset spec.


r~

