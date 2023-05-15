Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB8D702A86
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:33:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVVC-0007T0-4d; Mon, 15 May 2023 06:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVVA-0007Sk-2W
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:32:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVV8-0007Yj-BJ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:32:23 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-965ab8ed1c0so2106581866b.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684146740; x=1686738740;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1dQNzAhAMICyuaUlp3QZt8dpZVBzS0bz4gGXnrdBr7I=;
 b=NMXKozM+7TzkJ7fKq98DSA/t6N6Zjc9dZ/fUlwV3OoPDdJbRNvVcoy/jxvBGDAERD4
 c8AkDCs/1q/Gm2Agr4/ky7lj0dU77pnlD4lW+O8kzevhQIJiWVq3ronLv5veT9WAJ+k4
 YJOTv/mjTUmQ3LzGKSljtsLAgZbiTwXO/d5nL1p2WjvwzlzlFPGuEiUK/J0dDxFhslG5
 c9GyWHBTQe/RCxwzoSGnMor/UsPoL0VSrY1bgmAighfXbH0fGDkaAc/pS1Sknoms0g7W
 kqwzzzavunO5jbTXr7BsXOckEGcutdkVtP/Y6TyY8tmZ5JK/fTRn5C1T0Nhjm8lwzgNF
 jVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684146740; x=1686738740;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dQNzAhAMICyuaUlp3QZt8dpZVBzS0bz4gGXnrdBr7I=;
 b=Re56D03eLbyeojX+EfqNSi//HlIvVUEK463Vbu/RKnfkr6iFL67/dHviAO2Q1Og6d0
 ZX1XsZgxNaTybPDjWU1Z73lOii2KBlVcmkA1DjL3pMK23ZR3VvH9JMO3UInwsvi5CRpp
 SJemJg6wCTHXQYbKFJj4JNoa1j+rsQcrsjfZtGeFoAmEVFkIdylG13M0mK1NFkUnU3Fq
 QDeIBKKLNtOviGVpcYCZMvNEPBgRKCuiW69X9IFECJ2sdFxBu5bN/rO804isw627E9IT
 K9rDpTxTlQJYIl/2AlobIMaVgaf52njrCv5UiYWyRps6FlM6BYRfOphGTWvAVBq2DMN/
 Yp8A==
X-Gm-Message-State: AC+VfDyEHvDjFp2bKqMeX0CVhA4ty24jJQBTqrv9lfwPTMol5GwdeWxr
 Tlz47t9uZ9vKCvugbRlz75PkEg==
X-Google-Smtp-Source: ACHHUZ5aQJvskI3hAKl3k8ZCJnHqRH0AyAvEQDRT0wYmtgFP39m0UuuN7XHHYFkWZhSzC7GgF9EG2Q==
X-Received: by 2002:a17:906:db07:b0:94f:6058:4983 with SMTP id
 xj7-20020a170906db0700b0094f60584983mr26121119ejb.76.1684146740392; 
 Mon, 15 May 2023 03:32:20 -0700 (PDT)
Received: from [192.168.200.206] (83.11.34.59.ipv4.supernova.orange.pl.
 [83.11.34.59]) by smtp.gmail.com with ESMTPSA id
 tl14-20020a170907c30e00b00961277a426dsm9166244ejc.205.2023.05.15.03.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 03:32:20 -0700 (PDT)
Message-ID: <5ecddd25-09ef-b6b2-3673-70e819e8cbc7@linaro.org>
Date: Mon, 15 May 2023 12:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
Content-Language: pl-PL, en-GB, en-HK
To: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
 <55d7cfbd-7256-2780-59e2-11e532e08cfe@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <55d7cfbd-7256-2780-59e2-11e532e08cfe@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

W dniu 15.05.2023 o 12:27, Leif Lindholm pisze:
> On 2023-05-15 11:15, Peter Maydell wrote:

>> Why do we need to provide a full GIC DTB node ?

> Longer-term, I want to be able to present different specific gic 
> implementations through this interface.
> I believe the 0.1 variant needs only the Distributor and Redistributors 
> base addresses.

TF-A uses only those from this node and ignores rest.

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20953

