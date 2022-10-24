Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D560B0DB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:11:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyvk-0001gr-K8; Mon, 24 Oct 2022 10:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyvh-0001gT-UV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:59:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyvg-0003hw-JF
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:59:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso10170212wma.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CY35tqBwzeFe2ptbAjycxI3afYyOTIq+IGb/Hnbb8EU=;
 b=OSwuukM4kUONkrfKywDlRgeY6RxFerG5E6LfSvBFQf7nS757wDUGINoUjxEFv+GpAq
 Fxn1sb6QQfVxbKeTe2Re7eyDgWRKG7ffbEpsPdzznyzCr34wa2k7DdTCqs20kS9Ov7yD
 6AJ1fuVvENdIrwaH5fd4cmMGY/cnrL10DToMFgT+I1EPNZGT7lTq89wlJlPveAinHBFp
 UE523LIwO7AHdIy45y31+OKuU7DDDJ4Nr90tZh90BApVQAKsSSf5UpSq/D73a3ml92cG
 MEYPUsYQI8eClEkTmMhPduYvfc/YVaX/bPrPY09YCypJ3NKlV44+u03eH/oebj6ECABV
 5LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CY35tqBwzeFe2ptbAjycxI3afYyOTIq+IGb/Hnbb8EU=;
 b=klVvD4vBx4BzunoBgfD8pd9DPdE0DQ5Cj5aja9XzbSCPJoWaWVZ55bixZtNDtXjn87
 C9SBD/gZCdZGo/Eu+Pq6eJIJfAO9wriGHx1+D/NIJuUcRLef7dGQhN8Q4Vol56ImvByi
 +vp91xSFFLiSqR3MyzePacaLqf8swUO/6Er1vBEMsnOMYGZBoEbKiHWc9VMEv43TM/FH
 fokMnKAUar4G7yKgt4xZcfwbxQK4WuA2jKlDZwPG3ONsUZSHxkxIDJTR6MAScVkGRAWH
 7MzomJDI9vd7YlW6FdBDys+h74CiedxKgjH7sDCunv6ZNDi9RrPP+6+nBQQvSwS1PJan
 t7ag==
X-Gm-Message-State: ACrzQf36qTLYqQXXWa6WxtAE/p7I44wTgRMq2h0u7wQvqi9lRNQkQI5r
 uXbXHIezL41cpiIZ4hSYZZKf512lRj9M7A==
X-Google-Smtp-Source: AMsMyM4qogDWyLT3nZWccyW4u2pj20N+CKEIaCyMfgvcLUF2JxPkP7mggfX52BjCXNMPFH57tyz6pQ==
X-Received: by 2002:a05:600c:4e8a:b0:3c6:de26:9d6e with SMTP id
 f10-20020a05600c4e8a00b003c6de269d6emr23133938wmq.117.1666623590964; 
 Mon, 24 Oct 2022 07:59:50 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b003c6edc05159sm8730757wms.1.2022.10.24.07.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:59:50 -0700 (PDT)
Message-ID: <55d28ccd-287d-82d0-77b9-df11918cb2f5@linaro.org>
Date: Mon, 24 Oct 2022 16:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 09/29] target/loongarch: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/cpu.c       | 11 +++++++++++
>   target/loongarch/translate.c |  6 ------
>   2 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


