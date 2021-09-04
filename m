Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE97400A6A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 10:57:06 +0200 (CEST)
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRU1-0004Nq-7L
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 04:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRRB-0000kj-6R
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:54:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRR9-0000or-PM
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:54:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1001965wml.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AdIA4RwjFsb6MkXA6eO1lncdEigTXj1+bGmr5lUKsYs=;
 b=zLRocgVcMnswhqyG3kOGEtDGn4DwvGdcr/GucL/2bGyulmwAKBZGC640eIFNHSru5x
 +hF4dM36IT+vnZYIAN6JDPVsYAaJS0dlzoGjRsZIIPaReMkaV3f3ZP27zpPKgYvp1ucL
 9iFMRy3hFYDvts+Ya9RGeJErQmyMi7NF4Lbt7dwxMUa0l0W/L5JxAQ1XzZxziCY7on8x
 WZ3af37ilAYkfYftVjL6lLDsKlJe0yUrXgxvCKCNspDtO9IissMQ5M3+aJrabzLDJ+ey
 n/cxVGH/9ovz9i46lWQqJR0AbpXa7b3h2phEo18AV+g+bK0x8sCU0cTMkJkKiSum1SyP
 42Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AdIA4RwjFsb6MkXA6eO1lncdEigTXj1+bGmr5lUKsYs=;
 b=Zy0CvBSDvtHpPQejvErwiWgGsbBrMQDdnBLNiM4hH0xTgCCmZqgH6N6rUkwVcQsCBv
 8VOlRLR/vS5ucPOuJXgVQsQzdyd2LJA0vLmjKMrpxIQ5bL71IgLqGuFcxVJSCKSkPZfY
 e1kzOXNH4KEuTQ+x8QQNmF4g4FoAfme1ZBSB4cSVA+xeN1DeviQTH3nT3Gj+TizQQ1Ol
 a3poiFtXWZpNNzfITYNzihqkRCQD1ewLEmH/QaCEONNAzdmKzuYmKskt/9+/SmC1eG4n
 anElz3vOrGIbEcwl8Vl+DL2rVHcGE5QCDtXOecU6Fb/FDmmGJ9DinJECNj1j0zmqYhWQ
 58Zg==
X-Gm-Message-State: AOAM5313ccvkKwxFFQs1TDAX8OoVGMNgQBlUkKOdopEb1XwklLxn/64G
 rO0t+wvNguUzlDVGbvqj9upuSw==
X-Google-Smtp-Source: ABdhPJxePpqtZySsN+Jz9rRKbsZyfZYyOf1MzQa4xKQShfo9tPnOOlX3DsVImi1dd65Y37G2fNpk4w==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr2395485wme.173.1630745646254; 
 Sat, 04 Sep 2021 01:54:06 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id d5sm1604770wra.38.2021.09.04.01.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:54:05 -0700 (PDT)
Subject: Re: [PATCH 4/4] hw/arm/mps2.c: Mark internal-only I2C buses as 'full'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58dd4b39-e856-6638-49d3-3a762db4b028@linaro.org>
Date: Sat, 4 Sep 2021 10:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 5:14 PM, Peter Maydell wrote:
> The various MPS2 boards implemented in mps2.c have multiple I2C
> buses: a bus dedicated to the audio configuration, one for the LCD
> touchscreen controller, and two which are connected to the external
> Shield expansion connector.  Mark the buses which are used only for
> board-internal devices as 'full' so that if the user creates i2c
> devices on the commandline without specifying a bus name then they
> will be connected to the I2C controller used for the Shield
> connector, where guest software will expect them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

