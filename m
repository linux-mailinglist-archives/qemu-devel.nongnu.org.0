Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB660A993
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:22:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxJB-00079E-DE; Mon, 24 Oct 2022 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxJ8-00078X-Hh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:15:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxJ5-0001pP-Pz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:15:58 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so6654878wmb.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pixVClSuXySeqZbm7bA5ESsb+HG9ONV7j9J+/0Fjiao=;
 b=P1GgggKBLm1DYljUyROBeYWQPzv9sVO4u3ga9Atp8cIApuuj9xN7dOTYKLBJbrNvtI
 u7txPodvqVhEeh0GCsmk21CRoNGrpAwC43NSVTN/0lKHXgF4cxsZBKl7euF0IFbFSg33
 1210hVD61gKoLLlC8DhV6VdPMQbxGAoXpD1/YBzWPws4O0GosgI9n/eLczOxNodb28U2
 cEQhbPNtxIl97T31RKHg2LN9zCOHZFSfxRp5LM0DwA7HinDSRfne/fX5F8raw+1RUvrO
 G2HlvbzjMAK/YMFR5eN4Pvmbg44Ztay91dYiXmcKq+Z0rD/uXT9Fn3Ul5efrZM7Cw+Il
 6lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pixVClSuXySeqZbm7bA5ESsb+HG9ONV7j9J+/0Fjiao=;
 b=C8zUoshGjk+7/XxWxlyxspwpnWMOaFlMTmuZpFhMBsUQCqWdAuxqSYnppTtmh1/j1h
 iKkgm9uSTC5r6mxpDdVxzv/IK87NFIY7fVcheQ0d4c2+d0j/nlzNRFxVia7oUw1uUJyo
 Ogz3lok92H+mKlilnvgmclzGDhNw7qeagNDXvfupdXLjrws68z+WDXQlrrty7xm1VOuL
 xGFqDYhdO/LR+sll10HMlQ/qkImsb8ldX7K+64E9JK/3A8P3OBXATaggyZ5tKq1TfpUQ
 pp+5MfjNUzkBNOHPyYN6HYBpBUPulPtrBXdsgReoPCnX5VAezSWMaM9GRAz8pgKqxLIT
 TEig==
X-Gm-Message-State: ACrzQf2Ftp9rGaSMTn4ewPKM1K26gW6bam8AESE2NxsEugPdNzrW7cqT
 UP4PSgJH8ACvWI7LzGiedgZjLw==
X-Google-Smtp-Source: AMsMyM4asGUT/UiZoh1VNcCiy352afFx8wsuQAiE3LjrhKRuxzPHKpKjKD9GAmeYikLjar4CICoMew==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fbb9:caab with SMTP id
 u12-20020a05600c19cc00b003c6fbb9caabmr24001451wmq.182.1666617354073; 
 Mon, 24 Oct 2022 06:15:54 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a05600011d200b00228cbac7a25sm6765019wrx.64.2022.10.24.06.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:15:53 -0700 (PDT)
Message-ID: <58ec5d8f-851b-7cee-7aeb-8a1e94c66998@linaro.org>
Date: Mon, 24 Oct 2022 15:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 3/9] target/s390x: Use Int128 for return from CLST
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/10/22 09:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h         |  2 +-
>   target/s390x/tcg/mem_helper.c | 11 ++++-------
>   target/s390x/tcg/translate.c  |  8 ++++++--
>   3 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


