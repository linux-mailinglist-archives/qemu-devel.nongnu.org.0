Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7741180A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:20:36 +0200 (CEST)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSL5v-0002fm-4h
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKh5-00086h-DT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:54:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKh2-0004FO-RZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:54:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so144793pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dHjjHUGCsuyxTXVnN10py8RUGOL8/zZ7UoA9n+O4IKs=;
 b=GloKLUuwLsTpUjr2V/95NA86QQGRTxKr7nQo2bTBrToOXZmPr1Qy83nOQ3g+EJ31za
 dnL85+vIIG8PyhIEdMvMhKmazatDeQeYxMqpwMCyEQCx0CnTnh02CtwUVdDu3H9jbE1d
 gUKRD8I8mAmcqcRouVsII0ipKCM5jzxQCMkHQ5djyTJRPX9isOtlPbXxyyIy6cMhkfS1
 DM1XKCVJMbpCV2a3V+jGYu34m9M6hGEXpwtcHo75IX7UyhQbOztuE+Ma0Dc/HaJSxjYY
 9R6V3r9iNYA0MsgKH2xF0ezZAeIcL931lcSmCJ6JG+6I16/kxbqrR2OOb3rXBt2jmRpG
 YUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dHjjHUGCsuyxTXVnN10py8RUGOL8/zZ7UoA9n+O4IKs=;
 b=tAqPuon+nTtwEIwa+o0JNimUvFAINnHRF+C/RHjFpBfQzCNKqXGh0mLcms3BNLRHfc
 eDOx/V29c8xKjECdPqPY4nLB+yVeP7FELxjhFdcIRhknBaEc+/OfNapjEtQi2oqrLcGR
 SipMZqMw0IngPpCmadqspOiyHLKH5QK47cc7meygkWFsC+D0ubjWc1I3vZd8KRmPFYlO
 //Bh0ZSTP5UbCn/xqIxi9Xjn23LLN/IuzZ5gkwscri2kOnTXvzh6QdMxVazF3gSfOor8
 Gsg18SaOPJ+855H+D/nHeR9vSJvthybxVyDLRLQoolGAM9OwYbqbb8K4EWOAjIF/nZHG
 +qQw==
X-Gm-Message-State: AOAM532AtKBr9kNHvTM5cPmf96bj0nSjcWwaz/9m4ZrA7cq0Vc4vTUz3
 emNDoy6IqCKKA5tOdLaIzvx/QeM09spXOQ==
X-Google-Smtp-Source: ABdhPJxvwfBESTHhpd4YWnVQDUoxfQSCpNmb0LgbmGYRDPfOn2wPiWw6G8U3UzBGmn+9W6MVfI6vGQ==
X-Received: by 2002:a17:90b:38cc:: with SMTP id
 nn12mr4144286pjb.108.1632149689622; 
 Mon, 20 Sep 2021 07:54:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e13sm10445452pfn.212.2021.09.20.07.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:54:49 -0700 (PDT)
Subject: Re: [PATCH 12/30] tcg/loongarch: Implement
 not/and/or/xor/nor/andc/orc ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-13-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af412115-5fde-7dfc-f409-af9695711b6a@linaro.org>
Date: Mon, 20 Sep 2021 07:54:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-13-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +    case INDEX_op_andc_i32:
> +    case INDEX_op_andc_i64:
> +        tcg_out_opc_andn(s, a0, a1, a2);
> +        break;

You may want to add the constant case here, implemented with andi, with the constant 
inverted, similarly to the negation of the N constraint.  We do not (but probably should) 
canonicalize andc/orc/eqv constants to and/or/xor during optimization...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

