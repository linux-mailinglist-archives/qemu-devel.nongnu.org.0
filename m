Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C642FD3C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:09:35 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUSM-0005fE-4n
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbURR-0004uL-VY
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:08:37 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbURQ-0006pq-F0
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:08:37 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g184so9663361pgc.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xMsdR9HSOMgsilWpyBEY9jcUF4Zbxt1y7Stdqclr4E8=;
 b=wSJWdqqMqptHztSqHniTFWNrixPyIzfO4ZCnq6lA/4rLcsXesHtCxbkTi8cXgJ/TUo
 vz3j8qXMv1rRNW7hM2boXY3l/W3f5z+aK0HM4NGY8yILj/lMOUvIEonyiRG9p60rgSqb
 icsNKNH3MMyYr1m699XediuQZPrbswkg0pPG6H22aNRRbVJxcarmo4hGQsbqG5QeXv+z
 aR5MjmNdymX7ZX1ye8fljvOMOVh7iMXKPCLQ8hCVuJCHdu1R30ytdkztTLKQ6B7vi9i/
 GIAkleLAcpuLl/w9+/fUi3cFvCRTpON3qDqba9PYVL6D5wU9RaqErHPLZLjDLqJnEobE
 /udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xMsdR9HSOMgsilWpyBEY9jcUF4Zbxt1y7Stdqclr4E8=;
 b=6S0Yq6M80a5oLzDKKpYoFcEz2ZeHkEhRVkg/FBqcD9tnYkssXzN29Yn4LLgXsiM4iw
 FCAgvw7f6MY5+6xvI7+FOmrG7AfZKA5SAwosRTf7YnQOwxdJDkPNVP7qiTkKIOEhc6mJ
 6vRNYnLBMTT9je19kkGVpjRCb/IJaSd3b0X6ZBsacg4MqSMk+LDvnVkRh/Pg4ZJ3LXi5
 5ryOH7hm++qQ/irKEF90uddHevPeNDtl5O6XPrgALeLPNgGdwL0apUSSQmdSRvCt1kBX
 gwP+/ifJTs8yeR9sb8cwBDUgHVtufcPLmMcsGwSfSvAypSrPxbbWVlg/JyJNVIteX5X8
 lM4g==
X-Gm-Message-State: AOAM5314AIURzQ4Z8jtZ5Fq/A4D77HuBXPS4lwDEimFwKKBfXCP1amMB
 IzJvGc0h5soViL8AuV/JhbP+Fw==
X-Google-Smtp-Source: ABdhPJzHeqPAReWaytPiLQh4OAwQLb2X5VOiQi+6Fjl5D6nQGKyUEJOyHIQOZTpOzNSWpATOSpPTnQ==
X-Received: by 2002:a63:4f56:: with SMTP id p22mr10920214pgl.134.1634332114684; 
 Fri, 15 Oct 2021 14:08:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n207sm5904714pfd.143.2021.10.15.14.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:08:34 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] target/riscv: zfh: half-precision convert and move
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2121307-7394-16a8-d5f2-4ffba5968626@linaro.org>
Date: Fri, 15 Oct 2021 14:08:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng<kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/fpu_helper.c                 |  67 +++++
>   target/riscv/helper.h                     |  12 +
>   target/riscv/insn32.decode                |  19 ++
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 288 ++++++++++++++++++++++
>   target/riscv/translate.c                  |  10 +
>   5 files changed, 396 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

