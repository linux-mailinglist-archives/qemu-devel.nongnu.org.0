Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B443CF6B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:04:05 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmLM-0007Ih-GY
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mflu9-0004NR-3D
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:35:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mflu7-00055d-4o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:35:56 -0400
Received: by mail-pj1-x102c.google.com with SMTP id gn3so2513141pjb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sy9A2C9c44Z7DqToSbhOY/J4AKgcli3iN4QoTbuWlQM=;
 b=BJA2IpDPW8L88POaeQ157I1cPieLZ1M1hDAyHImPXgtkkAacMys1/SYX6dLtfh0wkN
 dvNSiItPvMYEKV+OjU/04i21EqWR2rtRUNKAntozmnCTYdorOGWWymPY6oeh7Z/zY4wI
 jfqlJEMApSY5wlPeTXO0lsNXbdhDZjlTLwo6Ya8dtzAqyZehzcArbvplf7Rqer8wWIVy
 pOf1icwGrPmoklWjAWYRb5iqQXhrt5Yigr99GDaYCq39DPxFjJMnoKyQZuL89LirKuWZ
 Opw+oirfXw3oy7K4Hw1EnlZXJE9yKSvry09EwQMwtgIz+rThfZ1dqoW1RiQc/Q2pRGkb
 OPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sy9A2C9c44Z7DqToSbhOY/J4AKgcli3iN4QoTbuWlQM=;
 b=JlS1kJHo+C7ZClCybnoTwJ7YH+Q2dZ/CGB01IxOx11D5FAlGz0r6/jxsSjqJpKMOif
 QR+re33n0dd5fi+yRkiERERAYDI3F9CPHIrJBkf8+o2Bop+4UFlOXEauDjhuJQCBYphl
 WEBkB5ukmR9SmPcWopIULs0ktEq9f9vySFw6dWtIGG7dqr8tHauVn/JHLtO33Aij7kt2
 FLkWxwYMUj3A8xR50wARi+jlpRf4dfgBGUpkbTNxjWdowZK1gXKoeovbLkFluMc1X593
 XFVd4DPKR0EsV4KFbhNZWQfT/xXfx5iUnOQToAzeovhBLqU6uyeyXGXLdfJ04W4LpaE8
 tipg==
X-Gm-Message-State: AOAM532IyFMPJXbu04DBUspX06wCe8EhvRoEGF0tKAjv0b5PeQdyVy5R
 7qdjsuuflKmMKGSEhbhvwpZaBQ==
X-Google-Smtp-Source: ABdhPJwpp68zGzH6Zj6dddtygiaJD33J89DRGM9Dnkb+4H5XcSpR3+Oo2MyMInkzg8K5Qq8ZPEJi2Q==
X-Received: by 2002:a17:90a:1d0b:: with SMTP id
 c11mr6861227pjd.207.1635352553593; 
 Wed, 27 Oct 2021 09:35:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y14sm447017pfn.80.2021.10.27.09.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:35:52 -0700 (PDT)
Subject: Re: [PATCH v4 38/51] tcg/optimize: Split out fold_masks
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-39-richard.henderson@linaro.org>
 <CPXPR80MB52242F3B72B2C0FE3319BDDDDA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <194049d6-535e-49f9-43eb-ca14ef8690c1@linaro.org>
Date: Wed, 27 Oct 2021 09:35:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB52242F3B72B2C0FE3319BDDDDA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 6:37 AM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -1084,7 +1215,15 @@ static bool fold_extract(OptContext *ctx, TCGOp
>> *op)
>>           t = extract64(t, op->args[2], op->args[3]);
>>           return tcg_opt_gen_movi(ctx, op, op->args[0], t);
>>       }
>> -    return false;
>> +
>> +    z_mask_old = arg_info(op->args[1])->z_mask;
>> +    z_mask = sextract64(z_mask_old, op->args[2], op->args[3]);
> 
> Should this be extract64 instead of sextract64?

Quite right, thanks.

r~

> 
> Otherwise,
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> 
> --
> Luis Pires
> Instituto de Pesquisas ELDORADO
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
> 


