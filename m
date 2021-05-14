Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957953802BC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 06:18:24 +0200 (CEST)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhPHL-0002s8-Ma
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 00:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPG7-0001uf-ID
 for qemu-devel@nongnu.org; Fri, 14 May 2021 00:17:07 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPG6-00044J-1u
 for qemu-devel@nongnu.org; Fri, 14 May 2021 00:17:07 -0400
Received: by mail-qk1-x734.google.com with SMTP id v8so9705919qkv.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 21:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ow2TPLpQaGi6HCtIyGujI1lTz32LG2X9sy1YBULdqto=;
 b=mhynes93EX+ZUf1QRQdyenDtARXirwLoQq65McuoiWDHeT5XLz5kjo94eGrFRT2FLd
 C4m/iOl0ox/sT1CcsEB+v6/NM2iP8LWKhQaSRwpHgDUiN8mYPV/Czk+SPYq6vhJ2slNH
 F2XP1tkwUjEa8Zvvj5s5D3pq9RrufkXgQNA3VFhTnyWZXNXd0mADENt5F5ASthJPp3Cm
 KoPsguKGRJoVN1/kIdcTbeohGT81Z2D2LVvAljUtGHIj1f9f37Cabo0RHFzuroLfVKbP
 4JCKKoSrfcOS1GE5zBxflYKP7SNQqd73bomgZhXmuEUCB+bHJ8ltB8ll6orfqWdw30Ud
 pIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ow2TPLpQaGi6HCtIyGujI1lTz32LG2X9sy1YBULdqto=;
 b=N4FqwfLSlnBWJIeHyKMOHQFvRwKzGEJsMmySwuubw+ysSoZj0fkwxGZCw2eW4QaGKL
 AXdlqR2g6Dc5ptzvC/5RcynhXEGgU1QWW8dqlpNLsK1o6UM140q1H4UCZj5Uzw5EkSAg
 EupdghYEgz69adfaYx9b/2pvD/QPD9tm/pqZB4F86uESxeSvzM3gRAqhYyINlKaIUCF2
 WAUGWoaXuT0I8CTRZoBfg+ZKCVbDMVRmpyeKAqXTg6anoki77AIlmtiuADyJQiDSAOHp
 715XohASgoBenMeRmAGmlK/WwhBqz77nncjG/CphXbNHH+d9W1vN7Dk19RFRCi8xm5kW
 fepg==
X-Gm-Message-State: AOAM533Syq9BSvDYzbFGNbt2CEAMF+TS6SghYDktQRKImhezDUPu8DD1
 aSZ8EujPCZtMjpcOGy/cCyMjjg==
X-Google-Smtp-Source: ABdhPJzrZDapcT+5IV/ynoV2O7u/rFW5+ZndnVA1GAQxmZ/GYfrB/lHxPMCUfg1CJ1ULn+A+yTpBcw==
X-Received: by 2002:a05:620a:12b0:: with SMTP id
 x16mr40612728qki.451.1620965824996; 
 Thu, 13 May 2021 21:17:04 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id d19sm3529582qtd.29.2021.05.13.21.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 21:17:04 -0700 (PDT)
Subject: Re: [PATCH v9 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210512182337.18563-1-rebecca@nuviainc.com>
 <20210512182337.18563-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8dc1616-329e-534d-53bf-2ab9aefde678@linaro.org>
Date: Thu, 13 May 2021 23:17:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512182337.18563-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:23 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
> maintenance instructions that apply to a range of input addresses.
> 
> Signed-off-by: Rebecca Cran<rebecca@nuviainc.com>
> ---
>   target/arm/cpu.h    |   5 +
>   target/arm/helper.c | 281 ++++++++++++++++++++
>   2 files changed, 286 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

