Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE7352E10
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:15:41 +0200 (CEST)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNOW-0001wi-RD
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNN7-0001FN-F4
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:14:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNN5-0003P3-L5
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:14:13 -0400
Received: by mail-pl1-x62b.google.com with SMTP id g10so2772656plt.8
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kPfCR5fDxe/i8JuWACBXzfatERL6QbW081elbanOeG0=;
 b=GhBvM94SqkwCv8Ud2iL2cjxaNjWYumKzqiNSmqXXdKrDJgtuo29iZPP6XtvqmX6tDV
 11kyUus1zGS31xSEblOfYDue6yh/8nVmvI6usEfwUaw0BTCyV6oqZ6IV3ixPB8M/cBs8
 AU/5HDjJhFrfvvA1BH4vjAh9NXuW/s+XFdevaPdUnYTjdogpmGGgo08sh1NO7q2MKImL
 k0YYN+5D3kSekvARyTBgX6jho3R86oQjn828gUCLjEpvlC6hruB0M32UB3OVKFIk/JMa
 PgfqRzLDOEIjREwieZIy7pdqgsjISPu0mcqJpuVp2mxxEqnq97YC62mTwa4nCg6TAfMn
 OluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPfCR5fDxe/i8JuWACBXzfatERL6QbW081elbanOeG0=;
 b=oidUR4DBj06oMhkchSgcnV47FvKFU0+m35WF2NWU8gle5Iq4ezhrxc6aLYUdAPcT/P
 2Cwnia+1Mb86IfVP59s55oQOJnQwyp/GkREpRK8lQMcPjapaYN08bhAWbTgiGAdRWrER
 Q1ZY8SZGQa9BWtyWrSQI0wUgGj5X2gTH4jnc1/ZR71pCheMEcd0hq2fN/SeNChn7uKpx
 x/m8/gyULYi0Mko7fvshekjKht5/uUOG8Wn2t9Q144WcWXFgMKWtSBAStn96XOJO7QLQ
 9SyLSU8T1hxsF2Nbq8t8D1pJH1Y2E5M1MiI1RciEvDUeAZbPzRsbzPOJl3/AqgY36cH8
 EmEA==
X-Gm-Message-State: AOAM533Kq0GdEbI8XrEDwVUGNQmPYlEc9uX4+VSDjfD+z1fpr35bjAqB
 HO2GJH9u4ZNy3TGR5W1X37AlxQ==
X-Google-Smtp-Source: ABdhPJwBxXRhj5uQBF2nlf6ZW2AU3qdpuAvl4Wxlj+LXDW3vMAymmZ4QPW115faMOD6oi6ebD4tQ1w==
X-Received: by 2002:a17:902:bf46:b029:e7:36be:9ce8 with SMTP id
 u6-20020a170902bf46b02900e736be9ce8mr13883584pls.34.1617383650178; 
 Fri, 02 Apr 2021 10:14:10 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id w79sm8677705pfc.87.2021.04.02.10.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:14:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] target/riscv: Use the RISCVException enum for CSR
 predicates
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <105c80a7-01b6-33e3-9ee7-927528e7fb55@linaro.org>
Date: Fri, 2 Apr 2021 10:14:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 8:17 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h |  3 +-
>   target/riscv/csr.c | 80 +++++++++++++++++++++++++---------------------
>   2 files changed, 46 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

