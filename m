Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE705BB743
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 10:36:54 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZTJk-0004wI-OF
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 04:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZTGf-0002D2-Sf
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:33:43 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZTGQ-0005iA-78
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:33:41 -0400
Received: by mail-ed1-x52e.google.com with SMTP id e17so34607880edc.5
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=q4SRzcwcSalxtTyVkwVel6byYhpjWbRsmzP5G8GpKHU=;
 b=Avx+z9S1U7WhkusdjpMDUrFsiRY7sqXtUnCwnokgOq4z2XT2Yct/qW1MG9rz/yZdWj
 hpofPxk0w0UhZhES0gSDD/zGlsAkw8E1g3v/EVX25iLvN2IyAvHc7rF9v2uY1W72Ls1Z
 /G5GxzZJODkmA51AONWLJu5m/h4KCbREk5B01gLp+hZKHwHqsWGLG5fX9Oqjo2DoP+eq
 guvygnOlC3BfWftIH8lXZ+rwDdUdmUA87LXAcdHt70/6aWXLQOWTwWwrOMId3wzsvc/z
 +KDu1DjI+7B1wDmcVdej7Oi/weCnNkYBXu5uW1jGsWpp3mmXlWDUF4VjcHqQdumcIXO3
 AYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=q4SRzcwcSalxtTyVkwVel6byYhpjWbRsmzP5G8GpKHU=;
 b=g8jHf1aZWptLe038J4gpS5OQ5ZLkIjPsCdWKnFsOf5yga+PkgqyasJJQFnBkMal3L4
 gS8DnvLGJpHsNQepNaQzr8dUqPGaBlEHhwqSZH9XET18+q34YTmerzu1Z3SF3hezPOHW
 122yxvf/vse4dI2l+Mt79XHUQCAgfdGhmzxDagrc9T6A6K41+tdfzeG0fbokdWV4FuQS
 48iqYYMFzHzVf39v5+7D8nW1NGJwkTmwKhrd0nLsaxow+UwZTRzN79GCrRpKKWnTic4x
 5EzM93MYcgbdYE9/L+vIMT7JAINfT3wD7uFA+2YrjGE8Nry7nE/LCapBfWQ1kN92Uvpo
 JzKg==
X-Gm-Message-State: ACrzQf0njV4RULbw8EnMnq47m+1Wu4blaUVXdk/EbgdmeBVxHhmknrPQ
 I0uWLs1ejFOZ+z5gIWjIXkIVGg==
X-Google-Smtp-Source: AMsMyM6ich318pxfppnyoCATm+JJwB7xxihfcnbr6PkDoAEvFtvUXnWJjte8/ynMVARpXCa7+ZwjdQ==
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr7020995edc.86.1663403604445; 
 Sat, 17 Sep 2022 01:33:24 -0700 (PDT)
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a056402101a00b0044792480994sm15165554edu.68.2022.09.17.01.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 01:33:23 -0700 (PDT)
Message-ID: <6af8867f-2d4b-3326-950d-b1e12a2b087c@linaro.org>
Date: Sat, 17 Sep 2022 10:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
 <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
 <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org> <871qsb8h9y.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <871qsb8h9y.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 9/16/22 17:28, Alex Bennée wrote:
> I pondered boolean but wasn't sure if that would blow up the size of
> MemTxAttrs so went for the bitfield.

You can use bool with a bitfield.  Though Phil's suggestion of .requestor_type has merit. 
  That depends on what comes of Peter's hw modeling suggestion that might integrate the 
types on any given bus.


r~

