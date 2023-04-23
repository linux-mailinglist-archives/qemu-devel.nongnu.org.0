Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08516EBE2E
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:11:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVjS-00034o-R4; Sun, 23 Apr 2023 05:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVjQ-00034L-Ua
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:10:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVjP-0000a9-Cw
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:10:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so3201275f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241002; x=1684833002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PV3ESzBfssqRNMpXaz+ubrUwn3VU/6TJ/+CK01sijEo=;
 b=k9pRKu1fOjhK0gduSkv8g2rRgcYqdutHk3Kmt8pwAPf7AYBfwuZJ6gx7e/2sjxrOXq
 Iyn4zLN8Hb33QGI/UcNqXFrV844trMnU6RUMEzYPZugUM8P0eFDTF1Y2w/99pedgS6c9
 xxQAVoJp8V0WLfHPTP+PS1g+++UAVmvcGEJdcr0TdM6K+LmTBlFK3N1VCl4aBlsGsqFo
 +rBKn9NndsoWOeVEJFTGIELyFtVCqMG0pEYr2iMghpc9YTX0mc5UosMZS0jawaAfP7VV
 2j2tKTBhfDzhWVDUaahNTgFlwvxmo+Y9lhH4C25XE9o9vkj0gCRtEFdwUac9vf8MajnB
 rJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241002; x=1684833002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PV3ESzBfssqRNMpXaz+ubrUwn3VU/6TJ/+CK01sijEo=;
 b=Vh1wFMsScJ0Aw7cQwGPmSzrlrct1f9aMXlQ9yM0A+SVYCK+i07JsfJv33zvERvPiv4
 lXpuycM+kp8k4hriZZYuQRRNicmdt8W2muTwB/7SLpEzjn+zQsNqOUPTrihZJ/wVceZ+
 1xdP403bHsc+sls4rOAvjQVkVnsWXFpcoM/q+5XEHt96lBe/+0BYUlzFKYTfANyK6cel
 M/tqO9ZknXKwXAIo/PFaoLpB8zHV1dcD3/fGsJEzoRzwnKgufRLqPveX3vTODg2bf+SS
 YIT7kIuZ+lNNevU2HPLCGC017b8N/sw98YLM/1+u1sa6sbDlWGvTES29vUdnanbePfvL
 Q8pA==
X-Gm-Message-State: AAQBX9frwECtlQGJkplfWNK4Ikp3yvK5534E5gvYrSlV8shsESUwHtD+
 5atiWQsXI7Soouu6Dhshq7oSRw==
X-Google-Smtp-Source: AKy350b3ihdGNbrGrnZ2dpH27SFgthTh88I3RAOswYRx2mNYGz5fa1csnoulvcPjpED7g8HxtVUmcg==
X-Received: by 2002:adf:e0ca:0:b0:2f4:311:c877 with SMTP id
 m10-20020adfe0ca000000b002f40311c877mr7692431wri.34.1682241001757; 
 Sun, 23 Apr 2023 02:10:01 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 s2-20020a1cf202000000b003f190dfc404sm6316330wmc.18.2023.04.23.02.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:10:01 -0700 (PDT)
Message-ID: <7e89924a-23f9-2164-fea8-f092dc41606e@linaro.org>
Date: Sun, 23 Apr 2023 10:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/8] accel: Replace target_ulong with vaddr in probe_*()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-3-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-3-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/20/23 22:28, Anton Johansson wrote:
> Functions for probing memory accesses (and functions that call these)
> are updated to take a vaddr for guest virtual addresses over
> target_ulong.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/stubs/tcg-stub.c  |  4 ++--
>   accel/tcg/cputlb.c      | 12 ++++++------
>   accel/tcg/user-exec.c   |  8 ++++----
>   include/exec/exec-all.h | 14 +++++++-------
>   4 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

