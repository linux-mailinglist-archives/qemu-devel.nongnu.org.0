Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0D438557
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:41:59 +0200 (CEST)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNq2-0005BN-Cp
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNnf-0002y5-Uc
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:39:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNnb-0005V8-M3
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:39:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so2745031pjh.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SqDEPZN5IJTM6Jtwo18/eCb7NL5CBYGiTrvoOq7kqAg=;
 b=GcoTgQiExvGzbEtLq4yhq5CqnIJtYodnDLiiY29KV5eGay4LcxpmmM/rK/19qw2m7j
 a/RZBcWYh1epPCGepKT9W/NTujcvdAJseqO2glxgAsZvOFlwYxHpF8VctjBbqEDzDHHR
 MQLtJJh5Uv/+2Bf0Rh3N6jzPtG7csxRII5TzyAc3BySwZCYOphQZD4hc3oKuZutWRxmP
 wvdwrLNFDth9t9XedhCYEq41yGXRz93kutxTsGcjqacTDWkhrz4dvw7kalEPv/ay8G1Z
 hFMTK//MInaa+nvSQGPRyuKEY/CUaBOIDfzBJMwpnuLfvvUBX1wi0ooL2QMzsYtFp0xt
 Uh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SqDEPZN5IJTM6Jtwo18/eCb7NL5CBYGiTrvoOq7kqAg=;
 b=rCOdD93CrdBAzQX3HqkBARr7ISUX6Bm3N7kNn+AFyR5Y1zi0U/0WnGy9ZzrjLUZUNl
 4ftuhlGr9mwrvO7Lbp0JJDJA5S1MYEPwzujoa6zUPFhMImXJCndlvPexugPQ+kTppnDI
 1n9JAGGNF0l9EH5aOJoCR+HiTKs4vp2XxxlVAIVF/OlUlvS6a4CQ4UHJGHQAcoElA3w8
 Xqri5bMw7pUFKyFoJj2PHLPeKnK3Gi7lUmyhttB2mbfF+zAO0Lr0Ha2SGdkrhOfGgJ/H
 TGP3/3d9de7lJmBeYOv7LAxyA58F8I3u477Vtfsx1lnC6OgHFcFTrdkDy1q9OAGJSJ59
 1YUg==
X-Gm-Message-State: AOAM530xVl2v9/Z4LVs0BRYxex61MBD89k4o2ppZjY9lBevdVtwdUqGO
 TM41gT+apXoauSAR6r+mYlknLw==
X-Google-Smtp-Source: ABdhPJxXYXZiY0Pi+hidFKFY8kK2ZxaorzxJZrcWNuZyXDNV/icrVkob31iFFc7fNKbHbny8lQfGyA==
X-Received: by 2002:a17:902:8690:b0:13f:ffd6:6c63 with SMTP id
 g16-20020a170902869000b0013fffd66c63mr7605219plo.23.1635021566427; 
 Sat, 23 Oct 2021 13:39:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p9sm13464310pfn.7.2021.10.23.13.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:39:25 -0700 (PDT)
Subject: Re: [PATCH 21/33] target/ppc: moved stxv and lxv from legacy to
 decodtree
From: Richard Henderson <richard.henderson@linaro.org>
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-22-matheus.ferst@eldorado.org.br>
 <092b768f-5805-e886-f2ca-66e69a0af9bc@linaro.org>
Message-ID: <28559f68-da7c-08ae-8e23-cf3cf7a13beb@linaro.org>
Date: Sat, 23 Oct 2021 13:39:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <092b768f-5805-e886-f2ca-66e69a0af9bc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 1:34 PM, Richard Henderson wrote:
> On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
>> +static bool do_lstxv(DisasContext *ctx, int ra, int displ,
>> +                     int rt, bool store)
> 
> You need an int64_t displ before you add PLXV et al.  What happened to passing in arg_D as 
> for the other integer instructions?
> 
>> +    do_ea_calc(ctx, ra, tcg_const_tl(displ), ea);
>> +
>> +    if (ctx->le_mode) {
>> +        gen_addr_add(ctx, ea, ea, 8);
>> +        offset = -8;
>> +    } else {
>> +        offset = 8;
>> +    }
> 
> Adjust displ for le_mode, then you don't have to do the addition twice.

Nevermind, next patch fixes this one.
Fold the 3 lines back for a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

