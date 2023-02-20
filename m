Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97969D213
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:22:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9qk-0003za-0t; Mon, 20 Feb 2023 12:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9qi-0003zP-5e
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:21:12 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9qg-000685-CP
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:21:11 -0500
Received: by mail-pl1-x634.google.com with SMTP id ky4so3448187plb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lv2SVaGsUUwP0I4E2wKLr5VW1ELYQTfRpsGjhQfsxEk=;
 b=RjTqCfvUW9fHStLIqxJ4fWFx/o9ZVZP6dVjlRt6hIrTE1NEreNtukWxKEE/tlhBE9u
 y7xIO+Ey9BTZTeJ7cjFpASDneNhTmwcVicG0y0/DkyioVcRX4753Hc/1PoZ61y48Zjnc
 M6sCczV9WmMvbfNzVhTjBGcepqARGJVAVqO5F3ae9M7dbXUK1aT/ISz1ARvEul4ki7R1
 HvCsH+oFWVTE6CS7immc+/nZt6uipGkdGUcClXgydd8wwmalejUIAOZPOPPwIyTcPRSM
 3w0SohDQLZIy39x5JS7KadGKLXPBLUdr8opla9qQ3wk4z/uWVV+CyFrVZ/W4tqXbRRJz
 TBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lv2SVaGsUUwP0I4E2wKLr5VW1ELYQTfRpsGjhQfsxEk=;
 b=mMMhLCjuHMwlGH2PdkemqRgH6ojgQ8EZ4W/y2CUQZUaiR4emz4bfvght4bMIPxc2DZ
 m/m5+ur5TQqejU5QkzTstsv9qvy7kbAx0PT0xbWXmREC1dpM3TM0vupobDSqeYAMshwE
 I7S27Xj1dDxrUSsOitQn5x4lomgudmIo/Pg0Wp2/xs2rZAsCKiR1UprwSXJIfoV/lYi3
 74BndfDzE7T417UVjT23HIJ8ZW5awShI2gRs46gg2g8mi41tPPUTrukWduEkbCyViDsB
 XHU9oNCOYr3BeZHXOtQWPjH0Z4wyG1JAP5g0+JcL9lZq4/NVPCgBVWvUC+l5jsnFt5dq
 7ybQ==
X-Gm-Message-State: AO0yUKW8kIbwcoPyvCfqKTKOBaaHYyQrD+bBdrLbcE7QBJPc4olEIbAx
 eq3YYVJwJK8GmB3G7hSTv56HQTIq4RTtYDHF8MY=
X-Google-Smtp-Source: AK7set8HuN9yO7hWu0O65eCU0VJQMbv9T8UeOO63r9XMly4B2khlLWMuWRCItW7jzVEdjSu/qQaczQ==
X-Received: by 2002:a17:903:32cf:b0:19a:b7c0:f097 with SMTP id
 i15-20020a17090332cf00b0019ab7c0f097mr3459985plr.57.1676913668824; 
 Mon, 20 Feb 2023 09:21:08 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 jf5-20020a170903268500b00196807b5189sm8203404plb.292.2023.02.20.09.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:21:08 -0800 (PST)
Message-ID: <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
Date: Mon, 20 Feb 2023 07:21:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 2/19/23 21:47, gaosong wrote:
> I have some questions:
> 1 Should we need implement  GVecGen*  for simple gvec instructiosn?
>      such as add, sub , or , xor..

No, these are done generically.

> 2 Should we need implement all fni8/fni4, fniv,  fno?

You need not implement them all.  Generally you will only implement fni4 for 32-bit 
arithmetic operations, and only fni8 for logical operations; there is rarely a cause for 
both with the same operation.

You can rely on the generic cutoff of 4 integer inline operations -- easy for your maximum 
vector length of 128-bits -- to avoid implementing fno.

But in extreme, you can implement only fno.  You can choose this over directly calling a 
helper function, minimizing differences in the translator code paths and letting generic 
code build all of the pointers.


r~

