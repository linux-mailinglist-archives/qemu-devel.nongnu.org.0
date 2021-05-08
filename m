Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3786377344
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 18:47:59 +0200 (CEST)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfQ7S-0007oc-Sm
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 12:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfQ6K-0006v6-5U
 for qemu-devel@nongnu.org; Sat, 08 May 2021 12:46:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfQ6I-0007WN-Kx
 for qemu-devel@nongnu.org; Sat, 08 May 2021 12:46:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q2so10142378pfh.13
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pv5f4r8AVzNTxTbK2qo9dmP5mL6LlOL8gTSTOL3Evmw=;
 b=QAoQwajcPgceJxoS4qs3Kc/v8UhjiUCaK34aqESfru6UselHjZkZuXiA4TpF/jmczV
 EtOkI9OKpCRKy4LSqVoyLY34ygKidc2r81NSksAHY//v763schB0EyNqbHbZ/zVKJrms
 JSjmiBgVJdc7x4/yKiLQ2bTqFlfXGh6k0dEgwuRTfQGywp5oYJMK8eDyE08vtDqM4jGg
 G7UG4Dm3BERLqz9qSDmGGoHBfEmkvIefClXI1TGFEcN5jfczw01tWriMkhq/Tv1RlW4a
 PIIDuMpNC4BwQciQBz3RasVeHgoH4Bg/r93OCQrgj3eC0RP6u0xKj0wh6zRD0YdCKJsf
 FNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pv5f4r8AVzNTxTbK2qo9dmP5mL6LlOL8gTSTOL3Evmw=;
 b=CPuKLqKiZ4MCjyGq3nT5d0Ewom5Wc5+gscBLau9rRqIPE/cn8SP6CFv/tMKrvHx1NB
 73nt33eYq5TdQHApDyc63NeNYpVt9lpQ76muFSdydPF3XHbiEI8Xm11/cfzXOthdRuC0
 G+5UuK8uMXaip26XRO9i6pa7Ue5Mei/eQza2HFjWm1gWuUne+sRHHaBBOgG4fTMCzMEM
 2kzfocf0KL4mT1teNEeEqSGldCfRLa7j/db6VvPh2uAP/3HdKIsfvKlXUh14yBB/4yW9
 PkXUVoKopaHxBVeaZcowukdHKPjuZUqmuby/AHYPRmU+l0DzwV0PG7qAttj0qprNIfTG
 lmLg==
X-Gm-Message-State: AOAM531iYxDQZ2SCDhyLiXTKpGXqCRmcBJJstsmygjUV8Rtces78Jv4X
 BLX9FszXbIxzUefjjNIf5hFPsQ==
X-Google-Smtp-Source: ABdhPJyViuoEmhBFhQyXJfmNtgAnO3Gu5IUROOuB/lxQD099yv77szpwKhAVMtU2Khcm6/ROIqi2Ig==
X-Received: by 2002:a05:6a00:7d4:b029:28e:2b3:58bf with SMTP id
 n20-20020a056a0007d4b029028e02b358bfmr15958939pfu.77.1620492404950; 
 Sat, 08 May 2021 09:46:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u12sm7321767pfh.122.2021.05.08.09.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 09:46:44 -0700 (PDT)
Subject: Re: [PATCH v8 3/4] target/arm: Add support for FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
 <20210505030443.25310-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6017145-2862-71a6-7f49-751551e457a5@linaro.org>
Date: Sat, 8 May 2021 09:46:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505030443.25310-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 8:04 PM, Rebecca Cran wrote:
> +static const ARMCPRegInfo tlbios_reginfo[] = {
> +    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
> +      .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_vmalle1is_write },
> +    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
> +      .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_vmalle1is_write },
> +    { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
> +      .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_rvae1is_write },

All of the RVAE*OS entries should be in the tlbirange table.


r~

