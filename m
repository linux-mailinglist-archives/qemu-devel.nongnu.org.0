Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46447F155
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 23:34:29 +0100 (CET)
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0t8u-0000RQ-QY
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 17:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t6x-00075g-Pw
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:32:27 -0500
Received: from [2607:f8b0:4864:20::431] (port=41860
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t6w-0001ja-C4
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:32:27 -0500
Received: by mail-pf1-x431.google.com with SMTP id m1so8612231pfk.8
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g/xzk76qJgEQKrpBfHFLJ/ww1pOt8DJdlgWZ/XEbBfk=;
 b=i2lHdKkMTpXfCP3kpFf7qdi0VHlnrC6jec8rHZ/OznZdGRLyIFErX3O6Mh2CEw9hud
 GMFT/x0N96WPHkmRVEp9Cc2mc9wRcNdTh2uKn3L+lExjobu6Nqm7t9NHhJ2AzgERrpPK
 xwyCJRDfgjFfdtz4elrhPD+83VsFjVBv9KiPIcYqt2DsWGlbTiDULFFft3nfhYV+ljhi
 GUMc8hojoIyufOvg6/HEXytUYdtXfuyAjXQYGTgK5dvZaB/J0E5YnVDsIJ2fNm1SydDm
 xYmbZQ8mtySGjFK4TJFE2EyiBpjv01DaNmNW+nTjOTnDz0ukSXx29+Uv/P1MPs53WerI
 e9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g/xzk76qJgEQKrpBfHFLJ/ww1pOt8DJdlgWZ/XEbBfk=;
 b=PttbQvBW1+IQ6C1MC4T/c5Mxws2HIhuqAvspY9MTT4igObDOzPUrNRGcXHunv2AwV5
 TM1GizqDI1I9E3a31WiKKz9yLXrA+KFYO8+u6RY8uDUxZQgNJEK5vu9pYTH1I4tI/ql5
 Bo6zkXUZ55P0ahydkIxjUNP/67onCx6gfKrxDO5zW00AVuDRO8Rehx/P/0YsQo1HKwIu
 NPCZkTwGw6LeB8Ozues+2InHuuC3aGOPzQf4kco2Nh6PeAhksknPn0l8wlr22q9Yg7D3
 VTkyu9qwdJd9vHGMUFzHuJYUfXeYfDU1/q9EKN7P9mdnZZHFofQFHmGutq5RJTrHVF6z
 ZJ/Q==
X-Gm-Message-State: AOAM530e7fWkgbHhRCxttYHEf7O5cw+M+g4qKrmlNuQEepfJ6YX1HkpG
 ZD4fM+TvKVE04aUN3gh5ZJHsxg==
X-Google-Smtp-Source: ABdhPJxTDBxRSg8ntxUxUYHcSoE1VdmiirWd2LJq2RAuFZfoJcRlK/F7fHj1BI9dBe4XE9VyJL8Cug==
X-Received: by 2002:a62:36c1:0:b0:4ba:da22:218c with SMTP id
 d184-20020a6236c1000000b004bada22218cmr8608827pfa.26.1640385144942; 
 Fri, 24 Dec 2021 14:32:24 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id m68sm8518153pga.30.2021.12.24.14.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 14:32:24 -0800 (PST)
Subject: Re: [PATCH 5/6] target/riscv: add support for zhinx/zhinxmin
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a1db384-de9f-ae96-ce63-0f921a201179@linaro.org>
Date: Fri, 24 Dec 2021 14:32:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 7:49 PM, liweiwei wrote:
> +static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>   {
> +    /* Disable nanbox check when enable zfinx */
> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx)
> +        return (uint16_t)f;

Braces.


r~

