Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1CC64D771
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:53:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5j3D-0003Y5-Uc; Thu, 15 Dec 2022 02:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5j3C-0003Xp-FP
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:53:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5j3A-0001tc-FT
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:53:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so811156wml.4
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 23:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S/7FpTJMcfRUlQhv1T5zBz4IgLqOQKLAX7/T1z2+2dg=;
 b=nOYf+/fR4jIcQO8q5DMKb/suAyBYHOH59QEtt35XuVFeMtJ4kr7ILvN7ex8+lBNTox
 JItQvHk0nAUEw8EzuOL9H3dsRii2rHng84ctU/0ggQuMyG85KghGKN20Cv7422Zx22SE
 tn7Zwxxc93jRdL5Oec3H5bhG2TEqIbo8a65H4ZueIwqs19d8KYAbnysd1SRsZQrBZ8BN
 2MKw3IYhpp2kKrW+gGsMvZrL5EKNeG8s5463mrL1/dzoeFhv2ofFj+zMDzGYRO1bAE9K
 hqst0VT5ve6V5TjN4GD5FwBYGq0Bhfh2UGADqeDBVvEEAx5LLc2Ben1onwuimbMLkupD
 uMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/7FpTJMcfRUlQhv1T5zBz4IgLqOQKLAX7/T1z2+2dg=;
 b=HwM8EmRtJdty/IC6nY8AAMyOjEwTmAx8srFnbMI2+ZHokiYqyn5qp4+V+Are5m58rT
 x1fJvNBcbw12gupZPYuOMDQfIGB5MKJFvhW8uxPLUfd2t7Lj7AKxcnpDEX5ZIf+hyEpZ
 nwl2OZ044sBG++6OK2Y4xLAj2xT4QGx3u+Dfhs1ncv/ELTnKmWB+R7z83ZQj7RqoEyzd
 PFf2Or5Pmyl8ljxgO+JwByMba+2uIwqaoXFXt/2DB1vC39kdj1rRPFK8ztNBu72jlzVL
 6rKzocmjnz6c5wR9jDBFEE0MbZvAvHGThiK10L3fvmYFXGP/F8EqU4s7NWJ6hbEyDYDD
 nPzQ==
X-Gm-Message-State: ANoB5plFKtXPVrcWLQ9aeOp3Og+IrX4cWKBlmuMbP1LMVDlF0EllqnhB
 2DPMfI4GB60ZZGIc300+gH/N0wgsWh/o/+7KRxI=
X-Google-Smtp-Source: AA0mqf41vjgHLCOv7v9XrSon4fmXM4fWLwhyUPmon+/u79YYe2DzLjPtqjZ5p30sU3h2ojZjZhyJLA==
X-Received: by 2002:a05:600c:4fd1:b0:3cf:a08f:10a5 with SMTP id
 o17-20020a05600c4fd100b003cfa08f10a5mr21718952wmq.31.1671090782845; 
 Wed, 14 Dec 2022 23:53:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003c71358a42dsm7439287wmq.18.2022.12.14.23.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 23:53:02 -0800 (PST)
Message-ID: <931bd5c1-ece9-2a83-d3f2-04b010c22075@linaro.org>
Date: Thu, 15 Dec 2022 08:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 0/8] tcg/loongarch64: Reorg goto_tb and cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 WANG Xuerui <git@xen0n.name>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/12/22 05:40, Richard Henderson wrote:
> Based-on: 20221206041715.314209-1-richard.henderson@linaro.org
> ("[PATCH 00/22] tcg: exit_tb tidy, goto_tb reorg")
> 
> Includes:
>    * Disassembler from target/loongarch/.
>    * Improvements to movi by Rui Wang, with minor tweaks.
>    * Improvements to setcond.
>    * Implement movcond.
>    * Fix the same goto_tb bug that affected some others.
> 
> 
> r~
> 
> 
> Richard Henderson (7):
>    target/loongarch: Enable the disassembler for host tcg
>    tcg/loongarch64: Update tcg-insn-defs.c.inc
>    tcg/loongarch64: Introduce tcg_out_addi
>    tcg/loongarch64: Improve setcond expansion
>    tcg/loongarch64: Implement movcond
>    tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
>    tcg/loongarch64: Reorg goto_tb implementation

Cc'ing co-maintainer ;)

Patches:
https://lore.kernel.org/qemu-devel/20221206044051.322543-1-richard.henderson@linaro.org/

