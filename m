Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27E4825B6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 21:06:42 +0100 (CET)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3OAj-0000Lx-6g
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 15:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3O85-0007pf-1g
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:03:57 -0500
Received: from [2607:f8b0:4864:20::62a] (port=35479
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3O83-0008VV-Cu
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:03:56 -0500
Received: by mail-pl1-x62a.google.com with SMTP id n16so20848807plc.2
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 12:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gG7RXgRlm2AYt1ljvPE4NwgBPrdvl/u/jy/2qZB4Ik8=;
 b=u5pmnuKjp651FqjorS3+QRp+PgXilV47QVe0pa5XOqiXgS0sXb57LTtF7gP898HItW
 HYVnlD3ZQ4mIvKE/QkRIMVhvi3J4ucz8NffXwP768P1k4RR08YB9dUUgAyn0o6zMSs5I
 0KAfP7LlsbaVKvJ0TJZwNxcGXm0EY7AhEH/v9aT7EE0JNghqyuZCUKx0cuX4u4Orznku
 /7o9z3U/NEma1HlSZ2LcJhHmpIKYv0B53mhJPMyiQ3dgi4GoV4gE1UQ58gG16Hp36QBs
 swM4pdjYj+xi7ubGBqze+HwlKqBVA0uHmrJPdi/gN0fgEuiD96WLj7Z+K+73nCGpFw3b
 RPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gG7RXgRlm2AYt1ljvPE4NwgBPrdvl/u/jy/2qZB4Ik8=;
 b=UrLAIE8Hj+DJixn0voTgkAZQuV6gt0Z1hTyo5D2D05JkF7nJGVwMeGixmC0gT+LCom
 FGR5ygHNgaZdYbZKywXettcTHnLd6dWazVCu8bZQyggE64nfBmFO2zz2a8HR+AuuGsJ0
 TA8FpK2CbIUMS+7ttQ0ISyQrdQaUkZRYKYBlWgFu3m2247xpJpPbnzjmBCzv12V387tA
 Kn7amUswPwsqJTtADj9PDNlCk8T5bkG/QG9YWFxozJ9mePqveCI4lGXDaoAmwpW2QRyA
 5ZePONWxPu+GEtdXATOTavZHfUdYGTLUdGdc5pXe1UNpX4RrB4xDt96Kpx8+d0BHsQkj
 Z4Ag==
X-Gm-Message-State: AOAM530+6gKqmfPtSx63HRBNLiLSGMA2mNdAce2mvyEz8tsRqACc8A3W
 31mWqTA5h4CV76zwrjVNfgyGbw==
X-Google-Smtp-Source: ABdhPJw5nXiXhqS/VHbfV08kteHOLoyklDUMZ9T2tHCIc968K+KKzqR4zJgiDu2mGUW7SlVUInvdlA==
X-Received: by 2002:a17:90b:2249:: with SMTP id
 hk9mr43336614pjb.246.1640981033172; 
 Fri, 31 Dec 2021 12:03:53 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id j23sm25395488pga.59.2021.12.31.12.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:03:52 -0800 (PST)
Subject: Re: [PATCH v2 3/6] target/riscv: add support for zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20101077-e471-fc29-2c83-92778f24bfc4@linaro.org>
Date: Fri, 31 Dec 2021 12:03:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 7:23 PM, Weiwei Li wrote:
> From: liweiwei<liweiwei@iscas.ac.cn>
> 
>    - update extension check REQUIRE_ZFINX_OR_F
>    - update single float point register read/write
>    - disable nanbox_s check
> 
> Co-authored-by: ardxwe<ardxwe@gmail.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/fpu_helper.c               |  89 +++----
>   target/riscv/helper.h                   |   2 +-
>   target/riscv/insn_trans/trans_rvf.c.inc | 314 ++++++++++++++++--------
>   target/riscv/internals.h                |  16 +-
>   target/riscv/translate.c                |  90 +++++++
>   5 files changed, 367 insertions(+), 144 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

