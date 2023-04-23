Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4A6EC1B7
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:04:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqexD-0000GE-LL; Sun, 23 Apr 2023 15:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex3-00005Q-2e
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:45 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0004SE-P2
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so22606575e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276441; x=1684868441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJILDGNLjVRjQd1j+SBea1d2py7wMKcHW5Ya8Mh6Ox8=;
 b=rLZgaxGykztrHKtDb7lxDfcuWftTA+vlJ1wwyEOcY8snoLWGiBVaGuu+XvOpJEKT7p
 mWBjmF7Vla75VMoQ2Fmir5TCzqx15iL5aYaIXyVY7QPTwBtsJ1wYRNPvmFWPBfm36OHP
 SI5Vj3TVysg/QFjhHcexyj1ppnJnAw9POiZqtqTzDp2Vh5512NdSJNf7Fiijx+kl8huV
 OhfNf8zP0zPnb7a1g2iSuCTL04BtrXn+BrzLB0i2EdllnHXx2UB9rWdJXwTlnDaEmbHZ
 QDpbYyqEpEt+vQfYttuvgVkmRYPRvzSoTiav3Wy4CnDtEAN9S2ikH06P0dG78bNVN526
 gn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276441; x=1684868441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJILDGNLjVRjQd1j+SBea1d2py7wMKcHW5Ya8Mh6Ox8=;
 b=fBxOUAlzcj2P17Ift+T1CV+U16dB3PrJDoofxL1bNnDvP7spJulC/mlMVElb0LAZ07
 rg6JsQ0Ie1AtA7EiBPcXgLEmsJoPbNTtB/+7NkVjwl9bzXRO+2I7pVZSpzle6QbNYa+D
 3uwg8ry6/B74DcCt+wruZBtYSbeDi+PUeHybNC4OoicxjRBfW0A9V1euF2ZG8RLMUQfM
 CeqhPITHc97nNtAxIr6zDr/g3Rq32Fr9POAzz3vtcjHbqEtHdRdVqff6xFTlHPCbsaWu
 cge0ZtBRUQm/xcYXWHJtsjox6V2kI6zsILRzlqEFZsY3KF8F8ZPZ5Rb5MFr7QNDCg8AF
 aWEQ==
X-Gm-Message-State: AAQBX9fcBl5aTwZE3i8X0ZsdW2pClhLowGIE48dDBcFRXB0ZzmbX4CFX
 Jzb7PEAcKp7OVSYrYHPqpredtV81xmvRzj1AP79ttA==
X-Google-Smtp-Source: AKy350Y+pgC+MoUzx5t36Cl9CQbHbTcRTY/YKJPH+6dEkwEAf/dg53rP1qV5+9A3+b9iyECoxcUlAw==
X-Received: by 2002:adf:ec8b:0:b0:2fb:a3e:7cba with SMTP id
 z11-20020adfec8b000000b002fb0a3e7cbamr7338549wrn.53.1682276441288; 
 Sun, 23 Apr 2023 12:00:41 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9198543wrz.25.2023.04.23.12.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:40 -0700 (PDT)
Message-ID: <18186e8b-2a7a-950b-8358-94063263210c@linaro.org>
Date: Sun, 23 Apr 2023 20:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 32/54] tcg: Replace REG_P with arg_loc_reg_p
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/23 03:04, Richard Henderson wrote:
> An inline function is safer than a macro, and REG_P
> was rather too generic.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-internal.h |  4 ----
>   tcg/tcg.c          | 16 +++++++++++++---
>   2 files changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


