Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B86A8CEE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 00:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXsFS-0001Vc-4a; Thu, 02 Mar 2023 18:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXsFP-0001QW-Fl
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:22:03 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXsFN-0002Ww-RH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:22:03 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so4455368pjh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677799320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hapeU56zLLLNjl6HwhImjBgWSq2y96TgwzZ7koOYKLg=;
 b=K9kCb7dL9jYpDJhtsGvty8ZsasQ+jleXUla0MZsLDxL5SoffMoWbiqs2r35LuZENue
 WU+8xGg6xhbSztVB3n9SQOzq1yGv6CF9kr8sLH7R3W3xSTn3qXKORslZ28xcXDg67ywc
 mWM4tiWCdYxVyoNQN3qXdDe6+aVBdSNqqGEqPMqMKEZLW5KjCEBmYPNg/2KURageWYLN
 CyjQSyFV76Exq0iCgs3ap40EG/VvWCmJJ1doFGwHsYsLE2C6oj+ySyQTw8ASTZF8OPNH
 1cvc9RBTw32pwfc3a3oxp/dxaFB2ZDT29xIIfQts/fpsAXs9UcCQEf+SC0snhobtr1co
 SvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677799320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hapeU56zLLLNjl6HwhImjBgWSq2y96TgwzZ7koOYKLg=;
 b=UuYn9P3mr+7kCBLrLZANZYcSAP2YS9xYoeOqMWXmmMw/R6HLVIDU79y5GhxCoLZaHM
 ZrWqDQQzdr56pO2nl/NcdxWhPzaHS0B1D5tWh3d9jBOjr38VdM4AKNwkkfdHH7dxSq42
 QK+cLyi7nrCmYR8aF4MddwbqvCy6wpsxEMf5BrvL19sHvZCslNMGL5jkeOTR7dIYjYZ4
 ByPNQNhJIoli8WSqANvvUJbe5WjpT6RH3kHEuuIRhqyGzDm39Lbu/1X3BtDWvGD6shPr
 2Gpoas7YlGetp6jd09y/qTcoWG9RnyxUjmVNRHc6Xbo9CwDz1ijgFI2QDEQElJAMA96k
 0+pw==
X-Gm-Message-State: AO0yUKXlaHJuOYaLaElGZIeN1LTPzmb802r9iuFe+0Ny6NUCiTTBNCob
 abtEQ2c2f+CjrEqihsHE6i29UA==
X-Google-Smtp-Source: AK7set8aL2l0STxDGd3uPFznG1UQA/zaf2EhbM34stLKLBx8CoY8/iVuQ9xK9x3e0/XNKbOYeUSb8g==
X-Received: by 2002:a05:6a20:6699:b0:cb:6f9c:166d with SMTP id
 o25-20020a056a20669900b000cb6f9c166dmr106265pzh.43.1677799320224; 
 Thu, 02 Mar 2023 15:22:00 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a63af12000000b004fbdfdffa40sm185427pge.87.2023.03.02.15.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 15:21:59 -0800 (PST)
Message-ID: <97d3a552-2bac-6cc8-345c-0b5a50a772e6@linaro.org>
Date: Thu, 2 Mar 2023 15:21:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] gdbstub: attempt to split gdb into 32/64 bit targets
 [!WORKING PLZ HELP]
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230302192546.2617633-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302192546.2617633-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/2/23 09:25, Alex Bennée wrote:
> -# These have to built to the target ABI
> -specific_ss.add(files('syscalls.c'))
> +# These have to built to the target ABI but are otherwise target
> +# independent
> +gdb32_ss = ss.source_set()
> +gdb64_ss = ss.source_set()
> +
> +gdb32_ss.add(files('syscalls.c'))
> +gdb64_ss.add(files('syscalls.c'))
> +
> +gdb32_ss = gdb32_ss.apply(config_host, strict: false)
> +gdb64_ss = gdb64_ss.apply(config_host, strict: false)

You don't need the source sets.

> +libgdb32 = static_library('gdb32', gdb32_ss.sources(),
> +                          name_suffix: 'fa',
> +                          c_args: ['-DTARGET_LONG_BITS=32'])
> +libgdb64 = static_library('gdb64', gdb64_ss.sources(),
> +                          name_suffix: 'fa',
> +                          c_args: ['-DTARGET_LONG_BITS=64'])
> +
> +gdb32 = declare_dependency(link_whole: libgdb32)
> +gdb64 = declare_dependency(link_whole: libgdb64)

It appears to work with "link_with:".

Both comments apply here and to your gdb_user/gdb_softmmu libraries.


r~

