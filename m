Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945F5FE2B1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 21:31:08 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj3v9-0004B6-Fw
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 15:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj3qi-0007Mu-Lk
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 15:26:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj3qg-0008PL-Vi
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 15:26:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso5830682pjf.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QriyJY+q6oNslRDMASokv+BMRHywQh8ZJ6x+/2lctAg=;
 b=XnqtLScmU4IQixSUFWMJUQFtDlgqwlH9hUkUs9rbM868Pa4LgIAWTUP28vnLt9D8tm
 B0uJuG3mnQH8NAl+thbTS5q1hmBZaIGLfO40PkCL8PD5YQ8gq/zUQdM6m+cd8D+sWhCZ
 fbj+sJV0U+X1V0hrS7GomR2cRjI5uQNYgRHRVKUhGevy2iRyApfwptxZ5RzLru1MfKW2
 To870+A4iKm2wWVYyFn2HJJEbo7Gz88WE1xWjDlAO66YAG7RNchWHsbZXsM9O/aoWVsL
 ZIrPHiCCeOWUycQpcjhMomNpkBEbJ4qKGkX/oRLSZCHVwWtGXKcebKAoQsAVttgEgrs+
 ZO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QriyJY+q6oNslRDMASokv+BMRHywQh8ZJ6x+/2lctAg=;
 b=AIZhlqa3iUxtEnvZpiwgbepo+c8wFo8XvUwokCLTuYFuAKnJZaG6tIf4k1v1ddvH+a
 R8K8W0gqyxkFlzxKu2pg6XudgcIGVjLqLnfiOpyGLFBuPBFtU8JzRHCEF+zpH86VQr5A
 o29YG6Av51W/cvRLy6Poa+JTKF506faKpKWTMt3Chqz1xdjULUMiqv7YbqE8wNuCk5C7
 Z3XzeLkMSvgpGVkLQ39YQVKJiLA9O2BnnOQDxBk1RwopLx30MmOyTm1Mp8NfApODw3n7
 BSupecHltVlFl5u5a9v4W5nbM/ugRo5qYESw6Ow0sIaIzg67uaQ2V44oUP6gQjHVxyVB
 tTlA==
X-Gm-Message-State: ACrzQf3rnJmnANm99EnsN76pKa6Sdw7kdBt+yG58uf6TEYKyWHBuJqp0
 5kIVVyIe1lFqSQRXeY+LlOraWQ==
X-Google-Smtp-Source: AMsMyM7id21LMao/Z8kRIkhqWyVRV2P9e1+BnjLnclvgUKz4g/HLHirFYCCzr7eTnWxOeKVlSOlmog==
X-Received: by 2002:a17:90a:5308:b0:20b:1eae:c94e with SMTP id
 x8-20020a17090a530800b0020b1eaec94emr12987976pjh.88.1665689184669; 
 Thu, 13 Oct 2022 12:26:24 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 i18-20020a17090a7e1200b00203917403ccsm153695pjl.1.2022.10.13.12.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 12:26:24 -0700 (PDT)
Message-ID: <423f0bd9-8c43-46fb-04a5-292e8385b69a@linaro.org>
Date: Fri, 14 Oct 2022 06:26:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] disas/mips: Fix branch displacement for BEQZC and BNEZC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>
References: <20221013145246.4922-1-philmd@fungible.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221013145246.4922-1-philmd@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/14/22 07:52, Philippe Mathieu-Daudé wrote:
> +                /* Sign extend the displacement with 21 bits.  */
> +                delta = l & 0x1FFFFF;
> +                if (delta & 0x100000) {
> +                    delta |= ~0x1FFFFF;
> +                }

delta = sextract32(l, 0, 21);

r~

