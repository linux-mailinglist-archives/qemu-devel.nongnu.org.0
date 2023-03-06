Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46F6ACC84
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:27:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFXr-0003KV-El; Mon, 06 Mar 2023 13:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFXo-0003K4-LA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:26:44 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFXn-0000DJ-3W
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:26:44 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso14006830pjr.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678127201;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H1R50zVkfvm6SrfYPbZqvQc8OSJN6luDG63F+yAWbXI=;
 b=m+91wglY+bVCkLr+6znDiyfeBaDTtlala0HLLRRkE5wNL4XiZaGXsBOHi9hDg+gGtY
 SRJo63Sw+yhBbwH4eNS+GqPHZzeT3tCThe+D9b0IERxwvlS6a5aP4WmntN4kChugZzCL
 kDgkE4AvcIgvUOQREQjWtymbwvEqwj4bORe3FBP7GIMvL1W6Vintcf4CK+LTrkQqngB9
 w2+xfyU1JuoAVIYP2D8f5eg4As7+5WlL3MH+Ql4ksdHLgQcn5hsx9cOf0DziIjiE2vV2
 e/gge/FQOptw0DVFDGEhRwGFGSFcp0L6eGpjtxhAv2iIynQV58lL269BZ3b4G+7v5PEy
 2nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127201;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H1R50zVkfvm6SrfYPbZqvQc8OSJN6luDG63F+yAWbXI=;
 b=Q+bdi6iCdXVeSqRyg9e2IqC8LF0LzwLnZbyYFPCvQUCo96+DBgYCgb0T+ijSp7C5Ke
 MJkj0MkRIFOS3pnuVVXoouuHWWCpf0LUHB9hcH3EeugqWHTRfEMD9Wqj8TmQ9KdyOqXY
 ylBqd0u8VcaCYyqgsoracRt5tvey9/cCjDETe9BgnGe+U9I4hQBUi83VX/WuIvAxN5Cc
 4M9Y/buFviN+m60aArOKidX7jL2hROx8wFOyX5F9Q5u3ifM3d0xh5qyiLCV+n1clCFXe
 0f+x0Jzdz6bXFDtmHAsqA+H0Tjim2hJsoErqGS+LDuTybK1j+3iqNNipsW1nG3pwFxVj
 Qiaw==
X-Gm-Message-State: AO0yUKWrKMf8VHAsqqY8j8EipS58+YhQ4VuwnGqSCWncUvsM0y3K3l7I
 NvNwCH4daN1VVoca9dFM9co/mw==
X-Google-Smtp-Source: AK7set8fa4V2GF1zrlHaXPj29ZbMAF3+//ykUmzkmCiJSinUwSLukISk+CKAwZCx2a0/WY3RtzTw7A==
X-Received: by 2002:a17:903:41c6:b0:19a:a6cd:35a8 with SMTP id
 u6-20020a17090341c600b0019aa6cd35a8mr17315894ple.25.1678127201405; 
 Mon, 06 Mar 2023 10:26:41 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 ji3-20020a170903324300b0019a9637b2d3sm7038807plb.279.2023.03.06.10.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:26:41 -0800 (PST)
Message-ID: <b52ea430-0055-52c6-9b6b-38d8c1aa3cb8@linaro.org>
Date: Mon, 6 Mar 2023 10:26:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230306152303.281313-1-philipp.tomsich@vrull.eu>
 <20230306152303.281313-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306152303.281313-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 3/6/23 07:23, Philipp Tomsich wrote:
> The Zicond standard extension implements the same instruction
> semantics as XVentanaCondOps, although using different mnemonics and
> opcodes.
> 
> Point XVentanaCondOps to the (newly implemented) Zicond implementation
> to reduce the future maintenance burden.
> 
> Also updating MAINTAINERS as trans_xventanacondops.c.inc.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

