Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8CC438646
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 03:55:01 +0200 (CEST)
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meSix-0004Hy-LJ
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 21:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meSi0-0003c9-1v
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:54:00 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meShy-0004Zu-LT
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:53:59 -0400
Received: by mail-pg1-x531.google.com with SMTP id 83so932457pgc.8
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 18:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JkyQ9LvwBMInyMbN1aeO9HHDPmdPQc/vpS/Kb2xx7ig=;
 b=deDt+iUIfoYxmdh2fJqY7QdNo8xmOXbNVyf83FGqbdmDO8iVAIaipmK7Ud1zhLMtft
 L/R/HdK1E38kcb1sCo7JH4bZ8OEPTJJlISdenCBO4QZcggocZ36MH2uFpOfIHGCQXLp7
 3zSCHMVdbtI2gNyjhFPMYE0XMq+JRIJ+y9WlSPrGHCl0It0fomXKK8ENiqD4Cz8hYYci
 H9Zaml26zJbDoiOa8cQGQZ//j62uMs9FVyioyGRgrSULsrWmp2QHnhu797q1BAueUsov
 ItoVYkyB+SCZUBIYEN7UIp3aWWPtc7EyD6SnHhkFAjRvUmG0A5NeKYAP72Osb7jlOvdE
 FPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JkyQ9LvwBMInyMbN1aeO9HHDPmdPQc/vpS/Kb2xx7ig=;
 b=hw0/BmmVSrc1ueRsly6Ww76xBD/piNeKZUWcGaH1mG5NS56r2p0CvXKWU/iUGQHPbV
 La+8Fc0CF9cuHLLBNKNWD8C2dZM2XSjrE4HeHkLgfPZrlxTuRLN9szfbPiMRBZ59uRZC
 Mzcilms0iZaJ+Xoa/9q4a6GV2O4/ryA2Ng4cbjHdKfyosZIrmvwNb4FDvjn+U1DC6DFt
 nNif0W4ED/VSKfY8b6k+ZJabo2KNgkP/GxQDjttCTN03u7ZCO/kHP4JB4TbT5Zx+XB9E
 8gqJi/DF6dd2ZYyhBbUurfBfAkQO0wu87/873tqJ105U5RZhAnmh2mLRVJ+K/DKNubOA
 Zwvw==
X-Gm-Message-State: AOAM530+HimCSpcjEDL8QZ7QeJ3wfUVfIiV31mWWNzqPeE3UJS7myTVY
 jqKnU4KZ2Yty8nygSqhRpjsWhg==
X-Google-Smtp-Source: ABdhPJzEryNfXN9BSM+l+sWzm2a8HxYdfjoQHR46Z4x6URhI7u6nPNOsdu21HOeOEjRO2RRhiOGCNA==
X-Received: by 2002:a62:7752:0:b0:44c:eb65:8561 with SMTP id
 s79-20020a627752000000b0044ceb658561mr9600313pfc.43.1635040436561; 
 Sat, 23 Oct 2021 18:53:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m4sm6233355pjl.11.2021.10.23.18.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 18:53:55 -0700 (PDT)
Subject: Re: [PATCH 08/33] target/mips: Convert MSA LDI opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8f217f4-a18a-b3d8-2210-7a3d2cda420d@linaro.org>
Date: Sat, 23 Oct 2021 18:53:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +static bool trans_LDI(DisasContext *ctx, arg_msa_ldst *a)
> +{
> +    TCGv_i32 tdf;
> +    TCGv_i32 twd;
> +    TCGv_i32 timm;
> +
> +    if (!check_msa_access(ctx)) {
> +        return false;
> +    }

Return true.  I won't mention the return after check_msa_access again.

> +    twd = tcg_const_i32(a->wd);
> +    timm = tcg_const_i32(a->sa);

tcg_constant_i32.


r~

