Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B44976DD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:14:37 +0100 (CET)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBnwK-0002X5-7C
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:14:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBnuP-0001jf-Qj
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:12:37 -0500
Received: from [2607:f8b0:4864:20::635] (port=42935
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBnuO-0006Oa-24
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:12:37 -0500
Received: by mail-pl1-x635.google.com with SMTP id t18so13997929plg.9
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3F4FY5N4OI7/HINZd1Jzl7DlVEzNdJXrdq+DEzagSbQ=;
 b=ZQkdstfA61pZfmBpitCL29b/96u6ACGT7XyK6h7N4kKV0k6TZkRpRxY8UnvST4s1ey
 MyqeYHSXB7gRT52FfhZ0HXzJcPMymkaBdIMZm0IuIXSORIwtlCQSP+zhV+6HXsbS2m92
 r+hYm39+r7qHuhzCVtb0xLTlo4aXXMEExLPQrbmc3ju/06pCWeJJypoqUEqJV73WHdaR
 4iZlP9Pm4sbShmsX5psvSxdSsSG/dIT7aKQ1SztZMe1PtoSHw03T2w5UNTFwjIZ9gYEl
 0d+sZJz0BcUA4xfnS07Of8kNbRXUBIbMw40dOGZ6muyI8jO1Jr45gr4NZDEmmLdSRNL/
 qmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3F4FY5N4OI7/HINZd1Jzl7DlVEzNdJXrdq+DEzagSbQ=;
 b=azbP/rwiLacX8R111au6/ON3KGrx5tf6JqCXyoaverGeJL7zcK+7AT4LDHRQQ7GYFO
 SH4Ndg/jypX/RXDtRN2NlOh8bR8ebXHNMgtPy/8y0QEjM52H4RWd5zmbIpKOGEbK2nEi
 54L5LV9cP6HMJ1hriiNCQM8WBZkNuLhxNTZvYfw3XWKeMZbS2sEPGW34NdubD3d/d6nL
 EvT6BuWw9RPl72tpgKxjx2ljDM3bPCSz053Ll0HuMhZZkPh7nq0/jVXQCbR3HztITynJ
 JfGUmpzWcrnyYDBlrRN1MbS3gqg8us9xiwr0ED+lGnejPD9r0Gtg2/wMCmofB3K4Rx/r
 NOhQ==
X-Gm-Message-State: AOAM533CdJj84Ez7oSKZrSC4BfhKtM+TvY+Z7dMwaUN1THP2L8IVU3JM
 +7pq2v0E/3/xWKc5Wlng0Qilhw==
X-Google-Smtp-Source: ABdhPJy99BFi7jVTH/AcRMOhDzMfvxmM08sb0qiSBY9lneZMbcMihwDm1jK3+v/m7zI9bG5bHWB9Gg==
X-Received: by 2002:a17:902:d2cc:b0:14b:4520:9380 with SMTP id
 n12-20020a170902d2cc00b0014b45209380mr4840491plc.53.1642986754644; 
 Sun, 23 Jan 2022 17:12:34 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id x17sm12761949pfu.135.2022.01.23.17.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 17:12:34 -0800 (PST)
Subject: Re: [PATCH 08/30] bsd-user/arm/target_arch_cpu.h: Implement data
 faults
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99a534b9-b258-5dc0-b26b-0377237b17f4@linaro.org>
Date: Mon, 24 Jan 2022 12:12:29 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Update for the richer set of data faults that are now possible. Copied
> largely from linux-user/arm/cpu_loop.c
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 44 ++++++++++++++++++++++++++--------
>   1 file changed, 34 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

