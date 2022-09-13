Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A365B6BC3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:38:25 +0200 (CEST)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3JA-0005it-RM
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3D8-0001Dh-GY
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:32:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3D6-0006Qs-HZ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:32:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bq9so20070909wrb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=EVlSojIf3UOUTpz1aqZThH6IbuCpdVrNq9KvNKmp6q0=;
 b=JX18MWRMw+tXojbJKt/cx4AvTqSSc4DIqKBxFyCFQfYjB4FM9NuI+Joa4AHq885pB4
 EerHPXrzfND9TloJ0LOMHEPDS5MVRSQNrurfm4pAW54wE/25dx0SIaWalE3G5igZyS5H
 nCwVTbV0zv3to+pD7p+ePTIvvvPBg0n2QULwxofCQJXSLOBO+3J7Deb08HyZMCVzK8pc
 xH/7Ibsjw1qbdfBT52Q9RJ4AabgUUWLIc2MSr4u+jWLkpNnGQcWi8ZioJNmdiCXLvz9G
 TEi2yGdRTIxTz/uXCcM/+YjicchRInIwJRXfwtHfwgAE5zqt5iKi3+PNEubb1wSjfQi6
 ZAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=EVlSojIf3UOUTpz1aqZThH6IbuCpdVrNq9KvNKmp6q0=;
 b=Y7DtLOJNrDFBV0UuN4PuZS1G8ARgVDO/arRj+BcbvCyLO7raYUPpV3nSOcSU1AAxLv
 6y+FxlsMv7M215UqiCredAx2Inm9gBpPrXvozXMJscmZn7mwfZr8J31NYrEpeqwSFjJ/
 6FaKvRIgF2Sycg4BOKu1Av7fC13hx/blNwlY8jx21Qu++jBmoE/nIZWMYYM41Ev3KbOP
 AvlBz845eklGFGe686yLvo3TMrXvGPeq73PCCsk1f68eshWShC+wZpQEeZz61RuhjU9P
 jaUDuHLoFxAgVH7/sAZCUWTmybB3Pk00DPs9CFl6hodvOd67WebT5WOfEFcyh7qQ3sA4
 S6LQ==
X-Gm-Message-State: ACgBeo3QX6LjBnrclhGUuX0s++hwkhmc7EIX2Bha7NoOahOXMlBs8faK
 DLmyRR5eksvQMVr3AlpI09KEnw==
X-Google-Smtp-Source: AA6agR497epNZemcEWHX7NEhHh++XS7HXyhb3HV0Zui3SlLxThsND/9qxcYcVH5cjCtwpiPSGVVBPA==
X-Received: by 2002:adf:fb05:0:b0:228:6463:b15d with SMTP id
 c5-20020adffb05000000b002286463b15dmr18113408wrr.534.1663065126923; 
 Tue, 13 Sep 2022 03:32:06 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a7bc387000000b003b49aa8083esm403011wmj.42.2022.09.13.03.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:32:06 -0700 (PDT)
Message-ID: <72151372-5335-ac63-2d18-c16309f39749@linaro.org>
Date: Tue, 13 Sep 2022 11:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 34/37] target/i386: implement VLDMXCSR/VSTMXCSR
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-35-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-35-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> These are exactly the same as the non-VEX version, but one has to be careful
> that only VEX.L=0 is allowed.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 25 +++++++++++++++++++++++++
>   target/i386/tcg/emit.c.inc       | 20 ++++++++++++++++++++
>   2 files changed, 45 insertions(+)

Needs to be sorted before patch 33, enabling AVX.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

