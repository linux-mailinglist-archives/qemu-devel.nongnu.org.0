Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BC4C7870
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:02:19 +0100 (CET)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlHm-0003cO-3f
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlGh-0002gD-Un
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:01:11 -0500
Received: from [2607:f8b0:4864:20::62c] (port=42575
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlGg-0005pE-Dc
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:01:11 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p17so11543010plo.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2zzHocgKy1f/ROtjSScnz+V3WB0xI99V5VDrcNXoEDw=;
 b=o0Hjvr9Z2jF4sMIN7NjEP+NAE2KuuaK/GETo6n1mzG1I660XMhiBOWy3uCWdy9+LAd
 zAzJXrcxoV91vkpnexkNuhPdzl8ZMa9Au2RwNuc55nbdpnDXB5xUUkunfYltctVvrPQU
 zIRE0lQo/zwi+i908U90AefqJQdrfXdh3zLeqqpS6PJGppdhpJpISw5lc8Jb/kpLJWSE
 2tuAwxskpghrG0huSX3mTU64fGeYS2M20oH9cdeyJr3JRqdBzB0ybZwfg8F3jLd46T04
 uqkifTySRsliG2qimAVkbnsRo9LsMkWQmbkOkM2f+Rppx+b10glhN1whG+Ul3Sw/ZkBl
 beDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zzHocgKy1f/ROtjSScnz+V3WB0xI99V5VDrcNXoEDw=;
 b=GsXHlxD2aDI7zi15RAsygTmpLqNhsCcjW5R4qLNkXvebxdXsTTlRWW8x8QyMDUw1sq
 T6D+GGNOt5DIGWxC+CC9bQayhgXXi1PqG6ANfOwm3Hs3cjdg6QZxJH/4R4HX0FxcANXv
 C4R+1TMzrWhBjrsjxZH+7yo0uwdKX/yqAU/qCXaDj4velLLvX21q8OaV9PNYKjWVSnG7
 F4NKDB2eqpCRew7JfoyL8Ug18xXIjpxeGP/1hkGhocq+Joytqey2U7Y8KbqSze0/A0Jx
 LY6Cwls1bilNF7V/WNb/CUTfsoCnHuAZXF7egmteV2YevRxTV8xqstYgNRDXaDtKXPsl
 Agug==
X-Gm-Message-State: AOAM530YhXFfef4VPl5GQGsMeM6KjKhfDM8SqRZMM+YFegcsp8pr4GUp
 yurZprKLjgXa3pBcpmGAdcTW6g==
X-Google-Smtp-Source: ABdhPJyWc35aqCQw4rJvBMVOUqAr/Kca8wN//WzGae0uROET8uUO0jyLY9nfdFrPmCSYQj3UeimtYw==
X-Received: by 2002:a17:902:da88:b0:150:f47:24ac with SMTP id
 j8-20020a170902da8800b001500f4724acmr21925178plx.73.1646074868655; 
 Mon, 28 Feb 2022 11:01:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056a0015c300b004e17afd9af9sm14976706pfu.92.2022.02.28.11.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:01:08 -0800 (PST)
Message-ID: <173dac88-5972-8f96-0363-e2268f0a7815@linaro.org>
Date: Mon, 28 Feb 2022 09:01:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
>   - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i instructions
> 
> Co-authored-by: Ruibo Lu<luruibo2000@163.com>
> Co-authored-by: Zewen Ye<lustrew@foxmail.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 169 ++++++++++++++++++++++++
>   target/riscv/helper.h                   |   8 ++
>   target/riscv/insn32.decode              |  12 ++
>   target/riscv/insn_trans/trans_rvk.c.inc |  47 +++++++
>   4 files changed, 236 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

