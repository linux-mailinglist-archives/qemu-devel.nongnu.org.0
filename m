Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6103AA80F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 02:23:32 +0200 (CEST)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltfoh-0005Bb-AJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 20:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfmx-0003ow-5T
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 20:21:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfmk-0005eO-L5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 20:21:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso5078036pjb.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 17:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZrIXhjlZHpMoQeNLSKhMMo81EYzMJ4GWtWtxwudmjaw=;
 b=LPGgWfCzOr5AVjxYfHYHukQgS5MKCAJNsZ+j0JmbBQxlt4whfAL488KuaHj0lwM71u
 mTgKaODS7OY3C+UNt0MsNpZwbkB0TJF6SgRb3xYKcyxdCFU4RuRtKidTFJ5BxrGlO7ON
 7dd9cylLq/4Nq9HSv+o0qCGmZ1an3hPUaDNaJK36CW/2DCEjKIe1Y2LhoknR50OG1m6A
 BKjNy0KymnBWk0w0L/+BVO1eVe7cbSBFXuIekJuc/cbNBK2XbYRCsWzMn4Dw/+SQABw2
 6uJyr7jzZce8OY5Nbal2YC0JVoyFnCPz8pVL/eYpGVeVFg4Tn/2PGF56zIuvBdJ5GBmY
 JPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZrIXhjlZHpMoQeNLSKhMMo81EYzMJ4GWtWtxwudmjaw=;
 b=Wc5mAdPv56UU3Ssq528Td6AOwDQbF+Vw0ZOxBGcOkohof1QasmsRjlGaUc9MNiWui3
 71bAY17xihGm6YavRl9j6iQ34H7XHnSAtxs53gm92dY+uyQ7HR73suBvlIDcKfmu+9LZ
 5uSKbBUPL4g9Wr2TwnTkhRD3t6cet4QDRZMh2FDq6/fVlyknwXbutZNVR2NMFbNyzD+m
 Dah8q/JR1tsOChjjRU9MjmZDcNLCKwOT1rGu7h9XrgPX6GdD8Hv3hiCdlaHRwmc4bGJq
 1K0Z2xp6+XCHwexmQNjGs3ML5g6zjT7rjsN8nTbj1OqNqB1+8moL86S81YZ0Dj4dgmPX
 g3Pw==
X-Gm-Message-State: AOAM531y8rsElfZbpKKHxv7aY6kyIXTYqCzOAQw50kNTNXhXhJk1pQx6
 sDxka3HMp/xiQOJJuimJ4QaTUg==
X-Google-Smtp-Source: ABdhPJyQjnbeoCbA1tCq9HX+5w+vujCK5lFEEBxze8yPIIKjzhqi+eXKLuhC9bK2JyYab/uL52sUkw==
X-Received: by 2002:a17:90a:6b01:: with SMTP id
 v1mr2650131pjj.10.1623889288786; 
 Wed, 16 Jun 2021 17:21:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o139sm3398270pfd.96.2021.06.16.17.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 17:21:28 -0700 (PDT)
Subject: Re: [PATCH v4 14/15] hw/i2c: Extract i2c_do_start_transfer() from
 i2c_start_transfer()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616214254.2647796-1-f4bug@amsat.org>
 <20210616214254.2647796-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55fd40c5-363d-cbaf-95c6-1d1d7cf21f9a@linaro.org>
Date: Wed, 16 Jun 2021 17:21:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616214254.2647796-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> +static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
> +                                 enum i2c_event event)
>   {
>       I2CSlaveClass *sc;
>       I2CNode *node;
>       bool bus_scanned = false;
>   
> +    assert(event == I2C_START_RECV || event == I2C_START_SEND);

I don't think you need the assert, given that its scope is limited, and there will be 
exactly 3 users that immediately follow.  Document it if you like.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

