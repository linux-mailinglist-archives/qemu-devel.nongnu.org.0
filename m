Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23B6DB09E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 18:33:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkp17-0003Rj-PB; Fri, 07 Apr 2023 12:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkp10-0003IE-Ho
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:32:42 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkp0y-0001Wa-V7
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:32:42 -0400
Received: by mail-pl1-x636.google.com with SMTP id w4so40370118plg.9
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680885159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ol3VuGCIGxaKPoYwQmo8ShsyaxboWcCOitXC4rLZuIA=;
 b=I2nF4Wu4Fw6Rf5EzUWwksmJPLsppffLbkAVguQDCkyv1+KyAn/zv37sRVRaWWyaj6h
 D6vYymMHQXK7mfdrenzlmdn45SWO6QXC4W8wReWAfgaJwrRMHHI3+Ii42OGWb4WtNha1
 2J9ir3AqVphNFSzKRmYAEGUYkecyhbg0KiG0Aq5ZpwDQQmru7FVY726wKjZUuWTxt5oc
 qJTyxprrcmN4w2h9G3KsXa0hx1ztj5PGwI1DlEuJMqrp3zV1ZTibzsDggZu4pid9LEFG
 TD4to4Cd+jqbp+hDTCJWvkC+wjefGGflUugdLaAzANLZ1SOWsrQLZlIPTwb97MqmwkpI
 w1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ol3VuGCIGxaKPoYwQmo8ShsyaxboWcCOitXC4rLZuIA=;
 b=qB5tk+MDmFStNcVo5z/AvGDy5kT21siluBeI9hW3yKIltmrQwyQx9fTvjmXr4fo1/j
 ysYf+q0NjbcebDXTdn3sIltbNN2mfWggjYNgtKdPvwa8QVllcueLqpdWXjATqyzK7rf/
 iB4dsUaIMHwjTLIiuiWwtW2YEq7K48ERBt1DlTHzagAbbURlSY3a8n+2nH6a4CE77XjT
 RXm719Nf7ubLZA7YFRJ2MIXinTkW/Zd45znnhVIfM5ShpII8hUtsybb1SCHpipgYlMEd
 36ZyQh7ePnvYoPmbflFI1TTgX4+iud63y6pmCfmrSFYcj8eb0dU6hXhcqEnfOubSTi+C
 lytw==
X-Gm-Message-State: AAQBX9dWkk72qI334DHuQexQBRnoLzq/JdLn4TrAzytV2W0EfZFd7rBS
 PQChduFQMOgPen13eyHE4k04iw==
X-Google-Smtp-Source: AKy350a3qDu6/fYxOSmlJyirWMC4Z1iM/402nJxKGqryEqkXdPEWgxqAjpb+APMIJy/9BYRKlh9jSQ==
X-Received: by 2002:a17:902:e412:b0:19f:3b86:4715 with SMTP id
 m18-20020a170902e41200b0019f3b864715mr2841511ple.8.1680885159593; 
 Fri, 07 Apr 2023 09:32:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170902bb8800b001a19f2f81a3sm3113270pls.175.2023.04.07.09.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:32:39 -0700 (PDT)
Message-ID: <d15bb9e6-071d-dd04-2677-4ace7578ede0@linaro.org>
Date: Fri, 7 Apr 2023 09:32:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] target/riscv: Legalize MPP value in write_mstatus
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
 <20230407014743.18779-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230407014743.18779-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/6/23 18:47, Weiwei Li wrote:
> mstatus.MPP field is a WARL field since priv version 1.11, so we
> remain it unchanged if an invalid value is written into it. And
> after this, RVH shouldn't be passed to riscv_cpu_set_mode().
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c |  8 ++------
>   target/riscv/csr.c        | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

