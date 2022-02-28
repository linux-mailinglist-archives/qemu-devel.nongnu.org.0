Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F204C78D6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:43:12 +0100 (CET)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlvL-0003fs-EW
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlt8-0001Zz-0Z
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:40:54 -0500
Received: from [2607:f8b0:4864:20::42d] (port=45675
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlt6-00081A-GQ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:40:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u16so11927427pfg.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 11:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yZw1LvtoqlpWDEgVBZpwRMYoNnqtyA2R97ror7ln6Uk=;
 b=oqeURccO2ai+Wttk3HByYllDglkg62ChnO2hzubg3xv9Q49Wu5vkJLkMEfQnAaCTOk
 jwmQkJWWlNOokniVouXsHXudJif1Me/QwB8uRtWVBzvhT1yVMkovgX1xzj58yT0GGL45
 yfFPv8tIipU12uBJ/hzYWET6/HsXxfPJ/ozhWRAnUJrGvWYHrzMqM6AsuXPqShUEkpfe
 ddky9OK/VFFSzb06j+nTvsYmHMvjGUWFkpoDvg1XZNay3T4J3PwYjK2c5tTMIKL9y2Gz
 ghSmvcK2W6YYSyAqBCjL4r3Vkfc7eeDp8Tb32cuaeoXlmgBMOerG+bMR1T+xK1la9WRi
 9RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZw1LvtoqlpWDEgVBZpwRMYoNnqtyA2R97ror7ln6Uk=;
 b=uHqNYwwCfRQ2i3m6p7S9e0AkC1FqSvpCCxWS5FKb0PMhvfSIau11diMz2Vq0RUuwei
 aGsOl3CJ01c3uYR3PfqFx8Z14aQXACyKXYs+pp43dboCkc39GdLO1akxYGZwumI2DXX6
 cQjL4AknJLc91ybFVnAFAvTcuhyJscOwPpYHCxjVhGj+SuMiay27bHj4SXNn/KkEIQJx
 3HFQezq5ELY6ZfIN7O4Wj3KN2fKwApaR9xWvG+Exa4NTkSORlbo+F99l6bIoioYQfO2A
 /7ol7Nkn4/39IS8ZaCqkZ+Vc4wykHEvh5VmRC+zxfwqi8zoe4fqcZDxcIuX9/fBN442s
 eCPQ==
X-Gm-Message-State: AOAM530+65nLl5uhTmzIqYox/nZGx89GextlWLSkhFvErFSFUdXJwOhS
 HOCv1x9g9bm4a3OIHLVvBKLgqw==
X-Google-Smtp-Source: ABdhPJxZJSv57QGOguAC2AMy3xUp3tKuf7Q10ot8IUE1thWT/kX7suxEvok9LQ/pRj/rgSXXVU5dow==
X-Received: by 2002:a63:2a53:0:b0:372:cb6d:3d61 with SMTP id
 q80-20020a632a53000000b00372cb6d3d61mr18475830pgq.575.1646077251274; 
 Mon, 28 Feb 2022 11:40:51 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a056a001f8300b004f40e8b3133sm4084560pfb.188.2022.02.28.11.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:40:50 -0800 (PST)
Message-ID: <fe8b6323-adcf-0bec-06ae-02f468fe4afa@linaro.org>
Date: Mon, 28 Feb 2022 09:40:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 10/14] target/riscv: rvk: add support for sha512
 related instructions for RV64 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-11-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-11-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 04:48, Weiwei Li wrote:
>   - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions
> 
> Co-authored-by: Zewen Ye<lustrew@foxmail.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn32.decode              |  5 ++++
>   target/riscv/insn_trans/trans_rvk.c.inc | 32 +++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Same comment about the macro, though.


r~

