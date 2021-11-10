Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277BD44C023
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:31:11 +0100 (CET)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklos-0002rO-8q
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklnh-0001wz-Mw
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:29:57 -0500
Received: from [2a00:1450:4864:20::42f] (port=33724
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklng-0006zi-1U
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:29:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d24so3497065wra.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 03:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gUTkVha6SSPO/CY4p0t9c6x6bwRs/u1y1Klmhtasuas=;
 b=UVhTO9L6gPwSuDF+nxaEUya8/Qq3WBnBRAEwySM8zsqsr9nXgLhlWgfPjScgFovrbf
 x+cL5refsVohf/Daub/b+GecMOPsnfA7PjRq9HD9sHzAcSbsLUXdmoJhDRYZ5sxoYM7L
 3iOC1h7Q0w1kqWaUBrl+iTdmmbhgQwwzefM4J2hjmmeyI+sRpZIFh3sGL9AdgxwW1DGb
 i+cdNx10T4rJXXj1cUqGJo/2i7kTT2V8pAf8+bFcYYo8e3psZvGnmEKu4OKEJwgrQbLh
 KY/0LhHgDIJ2PJnYDCp8fUxJo7cjbkugywlWX5vr8e28wwHqvyyiSSjeZZbbmVor1EzU
 ZATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gUTkVha6SSPO/CY4p0t9c6x6bwRs/u1y1Klmhtasuas=;
 b=6HXljPqpXAmTWQEVzujiCIGHmdjlRJLdbZ4XkfgU133Gy6emE1tSKC0ybdynFkhv7e
 XNNOlcNaevxF5N4NnMzMd8V4KVtIh1uAwKDGCKSvuaRdSA6Mcp2BC6z8tVNb/APTD3E6
 fux3oBNyuZsAnZiNQsWF6J2xc7lO53pLMyKkIMtgzas9Bt3mnjUHq2u2cmRDAgrWGR/D
 VFMSe3XSV2mz7CgE3GGu05neCZcN2bQPKfPvPjUL6P0rCsj909cBDQxy8/RXH5sUh/iP
 vKrUJSwK9jE5ChStGbfQTs426OMdvvX+tcirwIwgSIZBmtnOkaeQ2WX7wWr3Qn9vHSfT
 +tcA==
X-Gm-Message-State: AOAM532cUiA4r1Wxf4JCBPbBmd1V3bj4Rr244m5Z3vK97sMKh+zgG3G9
 wJp1NSajImw2mpmDGO1RD4ThXg==
X-Google-Smtp-Source: ABdhPJyFQ2lyiAEA098g+4TM9OceWB160jaHS4f/jZHKcVf2yBu72OD8XlJ8vn7gW4W1mPUgpGxxsA==
X-Received: by 2002:adf:e882:: with SMTP id d2mr18864004wrm.389.1636543793640; 
 Wed, 10 Nov 2021 03:29:53 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id q84sm6506994wme.3.2021.11.10.03.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:29:53 -0800 (PST)
Subject: Re: [PATCH v2 11/14] target/riscv: Adjust scalar reg in vector with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-12-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f4cbf03-5492-3f5c-9e6f-6ff55bd1ba6e@linaro.org>
Date: Wed, 10 Nov 2021 12:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-12-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b15ad394bb..07e882160d 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
>   FIELD(VDATA, LMUL, 9, 2)
>   FIELD(VDATA, NF, 11, 4)
>   FIELD(VDATA, WD, 11, 1)
> +FIELD(VDATA, TRUNC, 15, 1)

No need for this.

> @@ -4756,7 +4762,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>               continue;                                                     \
>           }                                                                 \
>           if (i == 0) {                                                     \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> +            *((ETYPE *)vd + H(i)) = trunc ? (s1 & UINT32_MAX) : s1;       \
>           } else {                                                          \
>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
>           }                                                                 \
...
> @@ -4785,7 +4792,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>               continue;                                                     \
>           }                                                                 \
>           if (i == vl - 1) {                                                \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> +            *((ETYPE *)vd + H(i)) = trunc ? (s1 & UINT32_MAX) : s1;       \

In both of these cases you can simply zero-extend s1 in the translator before passing it in.


r~

