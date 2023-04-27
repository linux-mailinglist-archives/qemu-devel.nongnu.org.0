Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED62E6F0387
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:40:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pry6O-0007nT-Ei; Thu, 27 Apr 2023 05:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pry6N-0007nD-7Y
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:39:47 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pry6L-0005w9-Fb
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:39:46 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9505214c47fso1548357466b.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682588384; x=1685180384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XiBinv7Jr1ux3djsnJZq8dnDxnySf1F2dAjdhyiKtJw=;
 b=Wz3KZKQvtWPQyRCL1LGlnZ//56GQkIFxtVgVJFtRZh2nfnUxgE1OdcYUVTersgkYc4
 o6p+mkEealMuHAe0pBVzwxg7Qs0qbjwcPOJQUGIZr15kXjdsgfdRM8bJ5e3u6ClO1zHk
 vP7XJZuTXvjcA5jhadQJWQIjvuMRI7Ma+xKHvhTGlfNNv9oOwNcASt5h8wN8SkjR6klf
 WISh8Gey5K9dfRaT5Y7UUUsfOwpxDNKVN3jjdFCwJyVvUkkJDezA4j+1VpCqLf/6+/fT
 MpqatX8sorQ0hvPG/CFg5ojO8MWDgVpePU3Q2dQBFg3qCMOO5zdHroBy7l9TDfZs7kqC
 ET4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588384; x=1685180384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XiBinv7Jr1ux3djsnJZq8dnDxnySf1F2dAjdhyiKtJw=;
 b=d29YNJwppbY+svziaj0OuJtnvphhs5mQgRfQF/zRtZVBBdIcD8A+tbCQrgGnUCByFg
 LflMOLwCxG0WL47sFVxMRnjvBQI2U30+L8Y0SzfzMfDtzvMTM6qvp8RLRvpxjATDjZlK
 FGQon29BQsYajka9DyV4LMnOqt2BJK9KQgFMuwqKwuUSpCb6iPL13jlquC977PMU+/E1
 gHbhhh/a06HJniGfzTNYQFWMHWVIJTl1TYov4UGMgOd4m8UU15RTl7w2Au+30i7afu0z
 ShhMDfO3UAkhHjj3MN2sBJMWzXooeyxQQhGWpsXeeFKF0DHK8ttWyXAD3IWd7Y3iOf5y
 xYLg==
X-Gm-Message-State: AC+VfDyq+UdzG1kc1ubI6wCkV4IHyxReOKwog32dhQmLgymNjZN6BQp9
 M6KVVg+ksLsJIIUMZm9JXHvX1g==
X-Google-Smtp-Source: ACHHUZ6u5I+67KOYjsNlDa2RNo5Rf5h9GjyV0d+S59hNK8jVIfw4nTBntZuWiBeW47OTBDJqwbxJQA==
X-Received: by 2002:a17:907:3faa:b0:94f:6d10:ad9f with SMTP id
 hr42-20020a1709073faa00b0094f6d10ad9fmr1260181ejc.42.1682588383956; 
 Thu, 27 Apr 2023 02:39:43 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a17090694d500b0094efe88a037sm9367304ejy.9.2023.04.27.02.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 02:39:43 -0700 (PDT)
Message-ID: <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org>
Date: Thu, 27 Apr 2023 10:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 19:00, Fabiano Rosas wrote:
> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
> query-cpu-model-expansion test to check against the cortex-a7, which
> is already under CONFIG_TCG. That allows the next patch to contain
> only code movement.
> 
> While here add comments clarifying what we're testing.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Suggested-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

I don't see why you're changing the cpu model here.
Neither cpu will work, of course, but why change?


r~

