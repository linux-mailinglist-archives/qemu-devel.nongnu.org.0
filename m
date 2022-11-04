Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC061A3EE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:13:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or4uH-0006TF-4z; Fri, 04 Nov 2022 18:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4pS-0002q6-77
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:06:22 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4pP-0006R3-9P
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:06:21 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-13b103a3e5dso7006907fac.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7QVdHhGWMg06XVCBwuPr4aU6JANhS+CWd+TwQLCYYM=;
 b=r/Fj3DhLMdaD7yvXjQDIjoqxe46/gcZNj3bqpV25yoj3WDRkaCusDEkRja8rI66gpD
 svubwLrLDo+ZC2fWhyIRg4fZOOs+T1E0FPFTxIWdW8uIrLJhZVCPMpLxGH+SuGq6muSh
 UjLiSGodzs8hgEhYW0srqzwsjoY87QzgFNkxxZaWBn5AG9MQXVQkDeO3+SgnZA900nO1
 /MJoeBSMxvQx/87y2fXOjpFfY2feQ0jvizcdvob95sOfdZKCClCpkpnRnYyfE+uw7+nv
 15kIUcAQC7bsCuJZBAWrBFweZh4OVnOMazBcxjah6Hc07sqCPYrpS3+2LcCnYi2Rim/q
 8YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7QVdHhGWMg06XVCBwuPr4aU6JANhS+CWd+TwQLCYYM=;
 b=PDjx8zKo2T4UrRlaxhR1Wvc8IbgBYAf8p/JFvLEZdmtQLXPoedoGRgCzuTzk/fxqak
 y7UN1HrSGvgIbDGhhnnmsxSH1EQMrJepgTnTL8kV1t4uG+O9vF1G7bb5mjUhqg5Rp/6a
 xijdBO/sflc0Nmho+kCZD+ZW+/R94Uc1jezIreFk9POhlJsmTK13BRL/gFEgeaMp7rZS
 NWOIr1mAqWpfh5ZIWoWe0ny9k6/C+c1PhYyP/FBtrD1dZTwX7/bdhkCSi2hp9ubo4Jnw
 pdQK8/grDxbVZF2IvyPMMFqKfG/YeofDLb6/qxpYVSK8+S+ia8YxxOaFo3TdN86IZg0B
 ypeA==
X-Gm-Message-State: ACrzQf1SMhtgrkHdyVIM8Rx2sUO0oTTI3pjITh0FTpnzfLfgL2WTEaQ2
 MpetUJAIoco1HRtTRtjkX/PZng==
X-Google-Smtp-Source: AMsMyM7MTv6EpxzQ6rsKocS7ctcA3xXCtCcL4STWicQ3TrLteE09vWGVMY/U8msfZt75dteYBJVRoA==
X-Received: by 2002:a05:6870:c34e:b0:13c:19bc:6e41 with SMTP id
 e14-20020a056870c34e00b0013c19bc6e41mr33069676oak.115.1667599576945; 
 Fri, 04 Nov 2022 15:06:16 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a4aab05000000b0049ded99501bsm118791oon.40.2022.11.04.15.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:06:16 -0700 (PDT)
Message-ID: <4075c55b-3b1b-9fb6-c4fb-000c2d0a4591@linaro.org>
Date: Sat, 5 Nov 2022 09:06:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
 <2d9a7f5e-0ec0-89da-53f0-b5624f540ae8@linaro.org>
 <CAFEAcA-XqHm+bFk4QSzG=QJCwUncGmD43qxK0FBSXZbVaPY4pQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-XqHm+bFk4QSzG=QJCwUncGmD43qxK0FBSXZbVaPY4pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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

On 11/4/22 21:58, Peter Maydell wrote:
> OK. Do we ever do anything with the attrs for a phys tlb lookup
> except use them internally for details of the stage 2 tlb walk ?
> I guess they get used for the memory transaction to do the walk.
> That matches the old code that just had a local MemTxAttrs in
> arm_ldq_ptw() to do the walk which therefore implicitly got
> user == false.

Exactly.

I can't think of any reason .user would be apply outside of the stage1 lookup, which is 
what records the setting for any future mmio.


r~

