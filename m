Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D7701CCF
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 12:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1py8YW-0003ut-EN; Sun, 14 May 2023 06:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py8YU-0003ug-IP
 for qemu-devel@nongnu.org; Sun, 14 May 2023 06:02:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py8YT-0003Vn-0G
 for qemu-devel@nongnu.org; Sun, 14 May 2023 06:02:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-250175762b8so10106574a91.1
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684058535; x=1686650535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T5svcYrDgWzzeCb3Gx7K9secPhyPCWNCIhTPSmEj500=;
 b=NeXwNLdfc8bVdUfHnAigo/5ZehitQHAE3zmD2STXWMOEyApyQl+k94e2Vqp99RJWHq
 TB0zaeMEl6xlwaQk3Ft++3b6A+1OE83+HCNUs4rQrXtXMAfAKFH9UgPmYnA2CsQRPfag
 3kxWk4rHM+/ZcirF9RmLOTtR0EotHrk4ttVIJBpDiy7HmP1vrz4rPibmy6b0PQBqKPEb
 TISDJ0oTmBnxvrqCk+RTKGLi0PgMVSWHM5miFm2bISLzHR7FsULJ3zW9Azj5FzlQNTYQ
 d8mhD2ak1xDNBD/bc9nVachQvPJ26bSmlUdHMktp1E80N0mJZixnutH3e3tuBMkP9eKj
 2aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684058535; x=1686650535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T5svcYrDgWzzeCb3Gx7K9secPhyPCWNCIhTPSmEj500=;
 b=l5yyaO/krkLSZs++GaemmS5HjcjypWeax3qgY1VPf3PSyKGmXnxfC/jWie0ejVc5SI
 AOPEcRTI2w2NGz7w3sMRQI2abnbXEgyFrAHJyo+xPhLKK4HPOr8b1Z08CiPPNPsuFP/t
 gi75dhj1TJ8Dkal1yaYePah6riUoQSmFVd0rIGYFjyFUWyMXjlUp4673mW/1eDMg5yWs
 K8dJYMC07C/Bfmtl/6ZLCjaeNjZHX1+pQTGZeVMt1d9fknyzjyzwyl/ptAdW1uv1tWwX
 67zta5xxQAKTinQeqw7QbizUjnPMNakXHGjuYaO1gy5G/MJa3qsuo9wvcN669U6kedyE
 fDqQ==
X-Gm-Message-State: AC+VfDxDiFa7wzMMn2LXhC+ixAOc0zoGEzvggIH4SL1tSFROwDLgoDXt
 srOMFpsxGBCfwPnFXDbgmnRpBg==
X-Google-Smtp-Source: ACHHUZ7Pq42RynLtE/uplGuAR6osTc5LX/q/rK2ckQ3TBwOELgwmirSdk3SSKRK9VEsJFxq/XckFVA==
X-Received: by 2002:a17:90b:4aca:b0:247:4f32:d108 with SMTP id
 mh10-20020a17090b4aca00b002474f32d108mr30924222pjb.13.1684058535160; 
 Sun, 14 May 2023 03:02:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:1836:b4ca:fe24:b474?
 ([2602:ae:1598:4c01:1836:b4ca:fe24:b474])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a17090a024300b0024499d4b72esm20578192pje.51.2023.05.14.03.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 03:02:14 -0700 (PDT)
Message-ID: <136af23c-558b-614a-92d3-91efd8fd00e3@linaro.org>
Date: Sun, 14 May 2023 03:02:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/3] hw/intc: Add NULL pointer check on LoongArch ipi
 device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230512100421.1867848-1-gaosong@loongson.cn>
 <20230512100421.1867848-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512100421.1867848-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/23 03:04, Song Gao wrote:
> When ipi mailbox is used, cpu_index is decoded from iocsr register.
> cpu maybe does not exist. This patch adss NULL pointer check on
> ipi device.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c | 40 +++++++++++++++++++++++++++++-----------
>   hw/intc/trace-events    |  1 +
>   2 files changed, 30 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

