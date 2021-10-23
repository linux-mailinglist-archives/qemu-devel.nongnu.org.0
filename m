Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F124380DF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 02:08:07 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me4Zy-0006iH-ER
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 20:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4Ww-0005hW-VQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:04:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4Wv-00056M-5q
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:04:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so1817435pjh.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 17:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pmzwQXieE2IwqusCu+4orxUCJV1yEeYA5lZ2ANDmzRE=;
 b=TNVXL0WQ53gF32Afd9Qq2bCXoK0C75oJW9gA7DkFL4UP1NKvye/2P3LuDy3I+RWjZ/
 cucUO1wF1/IsmAW5Juijxc9ZwWjEepdmuQDJNYh2i41RjoS+3ABcGRYYtCQaOdDWEeuB
 AKcnFfsLfIFXYcWfzv+8SgPxMJwQxjPK5+gIN+fkHyk1tjTYrSwxS0YEoxfpzWwTyzsN
 NyCAokIlJtMP78vdW1mU+Dhi5tTNdUSo/4dLc7/If2ufS5bTyW50nx++Y77UUpNcwpG+
 Yli2dhAD15L6omXQE02ABs0j+dgvJ2m6yOkP32Wh1+Lh5uycAyMbw3wkqHI4/e3gaeNl
 WR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pmzwQXieE2IwqusCu+4orxUCJV1yEeYA5lZ2ANDmzRE=;
 b=ukX3hI8G1Ynq31uDBVI9kyyHKHeeR2G10wMQFziRe2yacAC+WDXjvYtevuDyK1ap4w
 LV854/HLnuYrtmzUqKHNEruiZXLQjpZYdld5kIGNOysGnu2zR4+aInxamluJVhte36SB
 xzSA9CO++uWMQOe1fTQJ+rMfdbenHKEjLeRqfTOFDDBXxqOvd3HzfqSJgRQM+Fw+IeQo
 oOlaE1HmqOM3fZpockCfHt/aDjgtqmnOtJChex3UNfIpN9GiSs3P3uam6/A72W/3w1k4
 5lDQg5kuY5RLmygK6J3nItVxL2P38g122hjjQ5Uc6H007Ik7Ht4DguOOfzasRJWKNfbB
 9iug==
X-Gm-Message-State: AOAM532/ix6jxrmnNnc6+J3iIPSiQ7QqZusXNTxFf/SKHIZm/2Rtr8xp
 A4okyKFTeOeEYLHuI3pZqJsWHQ==
X-Google-Smtp-Source: ABdhPJxAPNKM6SG0ZsO2arYut59HatS5PZzj8qegWBaz/JA62iaMh7ezQssX/SbdiSLZzi35Z6IdGA==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr3417592pjb.48.1634947495518; 
 Fri, 22 Oct 2021 17:04:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x129sm11111875pfc.140.2021.10.22.17.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 17:04:55 -0700 (PDT)
Subject: Re: [PATCH 09/33] target/ppc: Implement pdepd instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-10-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b61f992-2a27-7ce3-81eb-69a1a14497df@linaro.org>
Date: Fri, 22 Oct 2021 17:04:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-10-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                        |  1 +
>   target/ppc/insn32.decode                   |  1 +
>   target/ppc/int_helper.c                    | 18 ++++++++++++++++++
>   target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
>   4 files changed, 32 insertions(+)

Same comments re ifdefs and target_long, but otherwise

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


