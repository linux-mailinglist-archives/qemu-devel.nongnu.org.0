Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42058631EE1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:58:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4Ug-0006X0-K7; Mon, 21 Nov 2022 05:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Uc-0006VN-14
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:57:38 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Ua-0005Mm-4Q
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:57:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 84-20020a1c0257000000b003cfe48519a6so6200825wmc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 02:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SWUbHWd4TO5bFnqf8aMomB0nQ7Yi2mvUzqnfMM5mr80=;
 b=f/E5FSmL1j6uJyfH2FHxE/VesO6QcuyZq6jonMOKG+ZyiT6yNoT7xQLppFMD4h+X7W
 CO38N8/QydLM/p0PWupLmshIPt1cdB+s9BD0P9gPLFE+yh2zDwXSH00pKCNgqhKUWCHO
 qMgKS2MG1JZnT02qX0j7yUFvQ+tKzR/dNbG4FVPWenF5NhMWpsFS9tTTA1XVmYTHnl1W
 +1Zsih2kv+cOi+vsSiPFVcbtj/p5nFGDypeeg9g5aPzLYjZJ5a1yZwnuxhkQrts/2QaQ
 2W2f7O3J3VZphoSKAgzT1zpe7b8cjHT4eN1QEbu4xmjaeleMqPVl2TxDrgCZ6TqMF9+d
 WnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SWUbHWd4TO5bFnqf8aMomB0nQ7Yi2mvUzqnfMM5mr80=;
 b=DJ1AgluGveQZn6u7copYWeYxYxhO4o8aY9ZgK+DFVl2UiYXMaiHwTEeYvcJLXB8hqR
 1TuD7Mua2//TMn/viYtUxOuBbBUNYlGI0CSzU6EuKAxRGK9CyCpimH7j+7X9dmpANcOT
 8yd7IH9ZNUD1KXwV9CtZgDlQ86GjrVL9mOb1VCXOy9SMKJgWiSMrvP4iEeWvagK3ta0M
 sUYmyKs8nE87oMSjjo5SxrB/Om9b5pFdhWMoMCLF6PAWX0xBVn3VBzKMRElZiMGhABQu
 ecyEoEP6fd8rk7G1ck435L08mtQj+2U41QuIptGwhd4AqsqUsDUa3eB4H/8Ob4hH6KGq
 Imaw==
X-Gm-Message-State: ANoB5pkrQeDSJGak166ghKAVuFFikASi3FHEYzJxfkOzBQ/nxpSbHz8/
 pBCxLIK8sMhIVIOnOit+c1vNwQ==
X-Google-Smtp-Source: AA0mqf4nOEos/rQhB+8XJuWHda/gTxFjXDt6Qx8ql9Fx4Abxcn5HCSL2w52HvP2XTM4Yj0SeKoo2FA==
X-Received: by 2002:a05:600c:4fd6:b0:3cf:d952:db2b with SMTP id
 o22-20020a05600c4fd600b003cfd952db2bmr15052200wmq.19.1669028254617; 
 Mon, 21 Nov 2022 02:57:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b003c6c1686b10sm17079252wmb.7.2022.11.21.02.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:57:34 -0800 (PST)
Message-ID: <bc877803-399b-3668-8d99-1b38faa85b83@linaro.org>
Date: Mon, 21 Nov 2022 11:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 4/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/11/22 10:18, Richard Henderson wrote:
> In addition, use tcg_enabled instead of !kvm_enabled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/helper_regs.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

