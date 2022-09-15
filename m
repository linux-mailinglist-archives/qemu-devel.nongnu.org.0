Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E985B9521
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 09:21:54 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYjC4-0000Lh-TJ
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 03:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYiiS-0001q0-TX
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:51:28 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYiiR-0001ed-7z
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:51:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id g3so8367975wrq.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WNBlluiLZnjmi2SyrCCldTF6T4BZQrkJlAYD7u4qe40=;
 b=Rd49xvmvdziee6t0GWD59ThUp2FP9hBiUyc2jBNRe7LELHOG9jLr4RSf25DQBsD13s
 ujJvbuIbE/ZDZIxL/w1fMJz6gXhHmpBK1gZdik4McXk5zLp2HisaZF2Y7mIKYZ3B7aZG
 Oxvuc+5KSvF0vJxotgvS9i99PcFNQ78gdQyVOWHPu3dcCSY/vFE7vJVKySUqeNryexqT
 dBasyLFOD2jMcfhQFms2yLxmGm7w1O/uUVRiFCQagTknmITlPvokhKnfwh2rd+mOpBUM
 Javn62v25BB5/YJCL6x3KJKhu0zmnwY7VGPyyS4hGPXUL6zBvt0W+lzCkoALjTF+5Nx8
 0yyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WNBlluiLZnjmi2SyrCCldTF6T4BZQrkJlAYD7u4qe40=;
 b=oZ1CCAzAS4BVH7CI+US2zrTFemUfnl9jbacbh2ht/aRoTNpZ0Pibz0LMjO3UOMt6/W
 qhCEpDWdah+4XCD7Eb4EztecEybmZA1Edzkw7wu9SQLmPKOVzAafJtVV2rcadbSOGcPE
 o8amI/Ebe6R5QR4pO5PEniHl2KWmCmHT/K9GCBuGmUav4I71Xug5dwFrX+MYwm2AtuBb
 ThEAVaGxbtWRvoz72u+9ticNBLL2Xe22Jgy8Mlwfm1LIHLvKF9FWLE+osBf4E4BRK94d
 6uonBzPeDWrMJZ+PPDXsinsjBwiOeSxVCfJxUh9qymtHz8XrPWu3clGjVtVBxj/2pb8A
 uyYw==
X-Gm-Message-State: ACgBeo2CAlF1+fTVvy7kF6yQbAE8489ZVGlKO0rburgNrTB9df3O0V/2
 5HR0VL80YxAI0UqHepk0qPvhp7NXNKDKfmAG
X-Google-Smtp-Source: AA6agR4xybGng8TxF1afCA/cEDkcK//9QKCkDER6pve3i2BacZr+MNi9FJrEpXKD64jVsItays0qiw==
X-Received: by 2002:adf:dcc8:0:b0:22a:b9e3:bab8 with SMTP id
 x8-20020adfdcc8000000b0022ab9e3bab8mr8599439wrm.341.1663224673913; 
 Wed, 14 Sep 2022 23:51:13 -0700 (PDT)
Received: from [192.168.85.227] ([185.122.134.1])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d67c2000000b0021badf3cb26sm1756238wrw.63.2022.09.14.23.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 23:51:13 -0700 (PDT)
Message-ID: <e1d71209-e6d6-a5e6-00b4-c83fc303929b@linaro.org>
Date: Thu, 15 Sep 2022 07:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-31-pbonzini@redhat.com>
 <a877d694-e4c3-5875-a628-76f2328d3242@linaro.org>
 <CABgObfb1KL2T7uvB7fZbagd5mZzdYoJYy8AEV3F_WY2yWYQppg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfb1KL2T7uvB7fZbagd5mZzdYoJYy8AEV3F_WY2yWYQppg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 23:45, Paolo Bonzini wrote:
>> You've just been moving i64 pieces in the other functions, why is this one different using
>> a gvec move in the middle?  I do wonder if a generic helper moving offset->offset, with
>> the comparison wouldn't be helpful within these functions, even when you know off1 !=
>> off2, due to Q(0) vs Q(1).
> 
> Because this one is the only one that has a VEX.256 version (the
> operand is type "x"
> rather than "dq" as in MOVHLPS, MOVLHPS, MOVHPx).

Ok, then a comment would help.


r~

