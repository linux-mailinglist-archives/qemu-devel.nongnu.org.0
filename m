Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9C6A0EAC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:27:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFN8-0001JH-56; Thu, 23 Feb 2023 12:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFN6-0001Io-Lv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:27:08 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFN5-0000IT-3c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:27:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5722746pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 09:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VyASiPaET0zIPAdQqxkCI7+3F5Exh4WbIhnAE3msLYM=;
 b=AidAtHbknL+WmwqtNu9xFMotMn67GxeG5gBr1YPI6WJzi6l095BO9xTrJF+LE5oUrU
 WXEdX1byRnztFvqS1+EndnB283SsnJWZpfXy9jkmEcwq74ROKLHHuDDMnx3ONxyCPruY
 wN1mDAinL9zq/AmuWCnyPV8IgMDQoJL+lON39+mWGSEoCT0RqlyEm2f6jwWZSbWfYRQo
 wrRjEZSrJnEmN+LuQu++gitP17RAVO6pBIZPquYXQt5LNHYS+iCsjjSAXzshQEoAjwfK
 SrnGijoo/oZUOqj6CFPulo2Jl56y5ckdO7NBBzBVJ+5/ZVny7St1KGHid8EItIdI9wt1
 lzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VyASiPaET0zIPAdQqxkCI7+3F5Exh4WbIhnAE3msLYM=;
 b=zH22FF/k8wLyAf3qUIWPPPL15wUYTasajrJRKCaJSRV/OL+OD/2tlXNv4Tw11hxs3O
 Z02pIyhzIOrVOiEJonpEaGXgMCdoBa/NURdblxux4nIUQj/QIr1E0e+fIFkPyyNrV+jx
 XPZ7rVc1OznaYVEag+tgXljc6U8vaF2ob5zIzUPidzbPPI1lFhtVkdsCMVt2b8QJJRrJ
 rq666NkuOt88x4tqVw/zLx9nzykv3+7A2+EiVkIJEP7t6DNso5oLridtQEn9s0VdrDo5
 fJBBsSuN5WgS345E5RAhKl2/3hhccNptOdKwNrFxm3dxVPv8Vu27HqW9h5L197/sl3Mx
 Xf1g==
X-Gm-Message-State: AO0yUKUdO8cs4EMU3quzstUenM7kHjuNDiwMA0ONvV08ewc2s+qA9lNf
 31XHBGIJKlfPULrZdpeooG31jw==
X-Google-Smtp-Source: AK7set8sUM6B4pgCVv6pPRfTkrgCX+96voR1kvj3404/x0VSTWg4c4blxfC//ea1Jq4VhUHOWjlZ7g==
X-Received: by 2002:a17:90a:1c5:b0:237:39b1:7b7 with SMTP id
 5-20020a17090a01c500b0023739b107b7mr7910873pjd.11.1677173225391; 
 Thu, 23 Feb 2023 09:27:05 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f35-20020a17090a702600b002311c4596f6sm5237237pjk.54.2023.02.23.09.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 09:27:04 -0800 (PST)
Message-ID: <cf144649-270e-8cd6-3433-196953e9e695@linaro.org>
Date: Thu, 23 Feb 2023 07:27:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
 <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
 <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
 <CAFEAcA-nAdnugbDPgwAknALzSzjN5nhrvVYjuBKuShEqJrZxKw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-nAdnugbDPgwAknALzSzjN5nhrvVYjuBKuShEqJrZxKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/23/23 07:22, Peter Maydell wrote:
> On Thu, 23 Feb 2023 at 17:16, Richard Henderson
>> xzr uses tcg_constant_i64(), which has no lifetime issues.
> 
> Hmm? cpu_reg() calls new_tmp_a64_zero() calls new_tmp_a64()
> calls tcg_temp_new_i64(). What am I missing ?

Whoops, bad memory vs other target/foo/ -- aarch64 doesn't have separate 
get-register-for-source and get-register-for-destination accessors.


r~

