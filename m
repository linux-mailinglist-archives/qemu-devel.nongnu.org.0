Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96F3A3440
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:44:55 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQbm-0004i8-HR
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQb3-0003w0-4V
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:44:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQb1-0003Jw-Ih
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:44:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c12so2496472pfl.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IDeJJqAicTET79cVnU7e1vV33kaFd105MsQQ7wAmM20=;
 b=XBxoAxyegyPpOn7oNb5gZLtMU61BxrdhryS/0BuEQTZ8krItc0LipmSw80XmLmn79B
 Wz2+ZCEz1r8jpqtgCuM6l9WxtjLXQvVOjeyFa7lY53LLKDNPn0JYpBrfU2sCv0oGU6EY
 vkuQygBluai8v5NEVlGDXcZUxbIprrRS2rgJPlZn6XKNfd814gxZnTJpp/SzPV9oWEb3
 wg9Yw5uQAZ6yp56KWlgqL0xGm4hnRvgW+JUKkhzjOwwyTMjBlamH+I2vnYTzzg9yVM2u
 /lrh5MlDJxolxaWzDk7pZXP8VwUR1TA3j5huy9kd0NaoSaQNHH9Fs2BdZWPnu5DBMjDX
 OETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDeJJqAicTET79cVnU7e1vV33kaFd105MsQQ7wAmM20=;
 b=WBn3JoR5j3Tb0Mz2vpKsUgjF1nt/OuK9mbFMNI1Tw/pM7lLQmvfutElgWyVDjk3Mye
 00oeEHHbL/jQfKmsD3CDPIqSUI51i4CP/pqbRU0nawu/24zZ9EftapucVcAoB/3875wl
 CAnVKfOTcFylrEeyYtJ2y76lxL5dEwejeD28Ev0hOKP6T0Wvns0ZYPnsqSbgU9hCqq/v
 Y6Dj9wBpztztXmMMG0Xze1+7ngWgc3USV8SJdDa/ccI3EWe02tU9FM1hbdf58wemWCam
 zENa4gjP4LV4yomxlsjdvMj5cxt40OSi4Sj3CEQBeXEQ0x75AOii2fS9TSKT+uO8oVkM
 14vw==
X-Gm-Message-State: AOAM53064oJzSL0GSDvJtXx7gaEOv2po1wpDwoYorFvE4/nLazRbIvNj
 iDHN1wsBUlIzUBKvGAAehtIrgQ==
X-Google-Smtp-Source: ABdhPJwCFo8lVTPHTSrYrEGyoKYcNQ9rSqcZGILjDp9dfoACYkSkCt4NSOzMS1dV2iAX98vALjNVEQ==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr4527457pfe.37.1623354245923; 
 Thu, 10 Jun 2021 12:44:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 23sm3208807pjw.28.2021.06.10.12.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 12:44:05 -0700 (PDT)
Subject: Re: [PATCH v2 05/37] target/riscv: SIMD 16-bit Shift Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
 <20210610075908.3305506-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93574407-7802-5ac3-1407-c4d4e2883838@linaro.org>
Date: Thu, 10 Jun 2021 12:44:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610075908.3305506-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 12:58 AM, LIU Zhiwei wrote:
>   include/tcg/tcg-op-gvec.h               |   9 ++
>   tcg/tcg-op-gvec.c                       |  28 +++++++

Again, should be split out, with a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

