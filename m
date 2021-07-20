Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8C3CF94D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:04:42 +0200 (CEST)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oUL-0007ax-Gw
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oLq-0002iP-7Y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:55:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oLo-0007Kb-2U
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:55:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id c15so2102595wrs.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2jebMeAe7CtjOznyPOrDiCAJJrol1sv5lRFaj4mVog4=;
 b=fvrwJTdBiJdR5JXssmLI61e/fxFXoYQDDEQNPMd7sw4XjepRebCquCj/zZNmJn37xm
 qWv9E0nz9+yJH36kx+QsoB0BCL5pr+9+Yh4DQ8lRtLp3d/cBVpCUbzg/vGwjY/x+sgVa
 QCID45L9rnbywEgXPUeMqQ2GKwjbkXsBPYkqhwGSUAueSepGOJPfIPFAd/sOk3jxYXGr
 rhu7egSp2Vv/5z8HufY4iXvieCk7L5w1XKVE6mpXAoMnusDeqX4Sujd0+8YOUANBKJGP
 e0Z0dCf/vuKHqdYO8yRO09r5lvXgQi33lRkYcDdxr7SeynW/Couxd5jmCiwuu/MwF19U
 zaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2jebMeAe7CtjOznyPOrDiCAJJrol1sv5lRFaj4mVog4=;
 b=SCkEifNbzu4UpDewoi3OPI5y2nGpLeDVXgnGSsdiTXANJHXUDtxnizPllhMYuxh+Gs
 +L1O1knLOx/Tdv2BWEhD0NcRiVVcTvWWxMEppYJMmsud99VTeGQjWho9CBIkvjvMEl9S
 vPBCXRdYIIgeGkVrd3SMstX0t0VFPSI5KNFAhtJLOT1nufm93MrlkU8Dwh9V7h995Iff
 pPqj5OVixBOHYq5X3DCW+U3cVaCwAaItgOL1gqHvm2LG6FGPKki46/zEb/JKbRM2dZeX
 ixuBU2Mqs3b9CKAXdPNqY7y+ofRYBVcwHRyUni+zz6sn4jXJ1DyJKpq79UijPJBb6wcK
 qpBw==
X-Gm-Message-State: AOAM532TmScqYdxIMBNe65fnbdOMPq+NYLyRIi+z4ilUl0rnJZTiWMrS
 Is7yu0jjmUEpGM1Tob3avoE=
X-Google-Smtp-Source: ABdhPJwXo5m6bE9pkHDEeOmk5zUVhNkG4NfqCpLRMnLhh+yhZFYn2s99PLwJXjxGh644QYIZkc1f/g==
X-Received: by 2002:adf:e552:: with SMTP id z18mr16654315wrm.79.1626782150600; 
 Tue, 20 Jul 2021 04:55:50 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z4sm9539707wrv.40.2021.07.20.04.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:55:50 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v5 03/15] target/alpha: Drop goto_tb path in
 gen_call_pal
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <866dcefe-e0f7-5c13-8f55-e1b159c510c3@amsat.org>
Date: Tue, 20 Jul 2021 13:55:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720011800.483966-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:17 AM, Richard Henderson wrote:
> We are certain of a page crossing here, entering the
> PALcode image, so the call to use_goto_tb that should
> have been here will never succeed.
> 
> We are shortly going to add an assert to tcg_gen_goto_tb
> that would trigger for this case.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

