Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBA5EE28E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:06:35 +0200 (CEST)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaW3-0007Pi-12
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYnM-00043X-3E
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:16:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYnK-0005vW-27
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:16:19 -0400
Received: by mail-pl1-x632.google.com with SMTP id x1so12024424plv.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Z3DGjCOmYVVCtLjmY3HRGR02z4NrLASMdCDLN6cJ78E=;
 b=gmK8rAUMBdT5Li0v3/GyTr6XPSnaHa1B4RUnD89/rHpEnTKCyi+n0g/1ny0iiSls84
 KOUiK9tY9R6XI/P3Sl3tLM9cDJBkp68ifAfEfYMJ5n6xraI24mH8TCXM0SMSFtn9A2zt
 vA9/U/4z6KBhLLSvOzUs/ZQj3FbEjPh6zCfKn250BUghvKmlMCVrGoZv5wi4+2cgqrzW
 X31uZLSI4WAs5ijXBWatzTlI0lKIzyB79wfnQN5dIvXwSyWj6yijVEYoqA3eaCxCsI3U
 OWVjjKU3iFJgKSDPCcSilqzdS8y+YxN0kwDxZDM7WJW6MUVJ0WYUxJ121A2qmZxVogfN
 sRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Z3DGjCOmYVVCtLjmY3HRGR02z4NrLASMdCDLN6cJ78E=;
 b=LrzuzrEdUDDcW/qvSlc4J75MYLfLBuj0rrrxu7sejQTtvds7l7MgTEgjpGN4F4yIVO
 MKBH1MASHkRGIf00RMJv0uneGf5ZoyCuNT0ENazJrtQm2hi0uHKS2P7/E9px9xKTnSO4
 Wq76yJrfwBPLBlxKOdOJwTps3qalf1oE1+j3O2iMmJNh1vGnMb/+XVP0bqOHVgKwknst
 NH8df/MCTAKQGcb0/WXH3Qm4ILHQXjuZ/uLhdUIzi+tnMsM9L7OShCMJfGUJGddzd5y4
 +Zo5LlWaEu1DJVaZF8RnsHWkGklvt/bbPwRHqxD1OJZu+hzn+XxsoEAapnqYo9+cud68
 q0+A==
X-Gm-Message-State: ACrzQf0PXKYqzvz3RieLCVxOXaySVWAp9aM70oh7jDE82zY3JdYtmUOh
 fZ5KY7d/O9AR/BVB5TKL6q0PcA==
X-Google-Smtp-Source: AMsMyM5Uqj4vucCuC//y5jWig9WVGc1ZwaEv8of5btkd/ux8gssqTOSXBXaPnbh2ee+QrFUSDKIrmg==
X-Received: by 2002:a17:902:f7d2:b0:176:ca6b:eadb with SMTP id
 h18-20020a170902f7d200b00176ca6beadbmr280697plw.173.1664378176541; 
 Wed, 28 Sep 2022 08:16:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a1709026e0900b001754a3c5404sm1093881plk.212.2022.09.28.08.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:16:16 -0700 (PDT)
Message-ID: <f4a2b944-d3b9-ec95-16af-36ce23a6746e@linaro.org>
Date: Wed, 28 Sep 2022 08:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] target/loongarch: Fix fnm{sub/add}_{s/d} set wrong
 flags
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927064838.3570928-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 23:48, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_farith.c.inc | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

