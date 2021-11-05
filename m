Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FA4466FD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:28:31 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj24r-00047a-Vd
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1xx-0001Fw-Gp
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:21:21 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1xv-0000cb-L6
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:21:20 -0400
Received: by mail-qk1-x736.google.com with SMTP id n15so9171315qkp.12
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=huoWU+bLsFmq9Qc9gpoWbqUBiyxAh3soyh9s99dJ5y4=;
 b=wSp9aaHwusRLpC4D791vmB91o+88L8N6RhtqbKmXwmka1h5GgTKTMIKbVKQbOtfuK2
 YZjyQ2KKQNeC87uW5oqvPqw+MnEnYuBBg1YPu2MqiyJa1WrbUgNh7k1TsDQxIzsxob9H
 wLMdPhPB+Hjw1v6MoI5o2OPp1bgUY3OXV4Pk8uMbka8juw0MYqBMWZsIgraposrxdAN3
 lVvQPpNCnbI1fORdNWCjwXLxekg9J3xmGMCJRDUK22qvlAhQMhbCI1xrK8JAO+qPefxv
 SX2Oo7dJWjuBKWHWZ/r34NVxHciaoE3ppzoBWVJN8Z5YxS/uNuLxtFcaZZt4OnoCNGbF
 zLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=huoWU+bLsFmq9Qc9gpoWbqUBiyxAh3soyh9s99dJ5y4=;
 b=7vpjL3FrQqk2A7GiMP2+TBvLUm3Qaq+ANqNuG8ZQj3sHOpjqdhAbitA8rbQL6Xp16F
 vbx1x1EN84YptLi8NjGUGI1HrdDhys2+oNTc8v11L28kzh83VJS5eqetIn3rXngAf2vg
 cpqbg1NbXQ+Xmbe69mT7A1bKu8agb9K9iZfPCvcxv+IenUaFl5x/BvfOUHO1LrLAlNFV
 iCdsznPXd4mkt5v+46ycs6PNmhJm42HuJbNVRLdIywvUiyZ0WKChPczDrlmQH6zdG/Q6
 uaDgqu8YDD8WyslD6g85X1ILELgtkpWQlzP8A9UbqAwlafYpqtYyTcIB/FSZVOoo4Kj0
 nyUg==
X-Gm-Message-State: AOAM533mnWiUuIqwRJSz/UZ5pQ0w+V0yopi4VvBdLBb/cMUVIrLL0y7D
 bzv5jBYaN01cvuMSXWZrwADEbA==
X-Google-Smtp-Source: ABdhPJzvs3nBkqcHMzxFaV4bESdkDXXemWrFWaiZ3QyssDfneeswtUT/kkF7hFUAcKhHuiTbH4SNeQ==
X-Received: by 2002:a05:620a:288c:: with SMTP id
 j12mr47316830qkp.103.1636129278580; 
 Fri, 05 Nov 2021 09:21:18 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id o2sm6166085qtw.17.2021.11.05.09.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:21:18 -0700 (PDT)
Subject: Re: [PATCH v4 07/36] bsd-user/i386: Move the inlines into signal.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba0e1487-ec74-1d8b-b371-c33ea9ca0d74@linaro.org>
Date: Fri, 5 Nov 2021 12:21:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> +abi_long set_sigtramp_args(CPUX86State *env, int sig,
> +                           struct target_sigframe *frame,
> +                           abi_ulong frame_addr,
> +                           struct target_sigaction *ka);
> +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
> +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
> +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
> +                                abi_ulong *target_uc);
>   
>   #endif /* TARGET_ARCH_SIGNAL_H */

You should use the CPUArchState typedef, instead of CPUX86State directly, and place these 
declarations in a shared header.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

