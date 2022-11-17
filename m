Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055762D60D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovauT-0007Wv-Rk; Thu, 17 Nov 2022 04:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovauR-0007VE-Ir
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovauO-0001pw-BJ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:10 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o7so1120909pjj.1
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 01:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=76xVWsykw3cpvuY5v5DngD6NoCppogf8t6KYZkfJ0nI=;
 b=hta9fu4L/Hh6noK1HfhOCFm5ph8CguNY8DoTrtpr4i+mprVF95JbdrrFCk9/pV4nBG
 spPgVnzkInrHwPQeB/ZDndf4elfSVgZY+ChjesrcVHFGrJiYLO7cluWXAtmxa26/7oXu
 1jKNd9y8EazhQQUH47CMPCLv9iddEDphioGoBz5IrL4yS1kfhG5uUDA1s77e5YR+r5hz
 ONv3Oj+2Y6nN7El35T5vD0lAPz07c5S6NSZCsO6HlLGYdNVFMzP/nfPbbFtpFA0bSssR
 R0tCSjf7C6eR+ixZV6h4VZu+XfHnEca411LuBoLwWLz9zlziuoiabLE9fV0RKi2Suxc0
 d2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76xVWsykw3cpvuY5v5DngD6NoCppogf8t6KYZkfJ0nI=;
 b=H9wQf8+/gRd6HqYGfDyO4jrGQ2yeM708GkMWjGpZ2SDOiO+wpk8TN942qmpBKfXM6D
 g+p4PoXp/3Br8q1uz8ttby9mv5cnY8FxMuRoWYtEDLphW5k1srQhXlCKgSoEZsThSqqA
 RlFLK/qw5o5RORHDY7AebSwi//5TbOo/VpSwgNljA5hH958GwGEecl9V0KEcRA0pg6jo
 1b75HioJWd1KTohM9ZN8GNwJtLn/K9imFfQO3LeYPUeK80/NsxZqyEdFMtHNN/2Ce6eb
 9wZHNnHOvu+4UCvb69nsr0Mk3lw4vK3GRF7SoIgYPYiAfAuublwu4fhQrAlIr3GyGvYh
 Zq6g==
X-Gm-Message-State: ANoB5pncR/reA9Hpx/hbFc8TPcJuxuSn90N0eRAYl3ZyEKWdm7k0GDCu
 lh/xOX9AAcZ5trsh+uRIUV2MHA==
X-Google-Smtp-Source: AA0mqf5guqj/j66NBin5JfIQ4bDvsqGkTvfuVwQ2p3xD4jstk1Zu32zTetdhzoJKnXavWYkUQr88iQ==
X-Received: by 2002:a17:90a:39c9:b0:218:499b:bee9 with SMTP id
 k9-20020a17090a39c900b00218499bbee9mr1895873pjf.171.1668676206404; 
 Thu, 17 Nov 2022 01:10:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa79906000000b0056b8af5d46esm525631pff.168.2022.11.17.01.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 01:10:05 -0800 (PST)
Message-ID: <47d0245c-5e61-85a5-0015-ea1e187b37f1@linaro.org>
Date: Thu, 17 Nov 2022 01:10:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/9] target/riscv: add support for Zcb extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 11/16/22 23:03, Weiwei Li wrote:
> Add encode and trans* functions support for Zcb instructions
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode                |  24 ++++++
>   target/riscv/insn_trans/trans_rvzce.c.inc | 100 ++++++++++++++++++++++
>   target/riscv/translate.c                  |   2 +
>   3 files changed, 126 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

