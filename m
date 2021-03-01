Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C1327644
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 03:59:46 +0100 (CET)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGYmf-0000m0-7c
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 21:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYl4-0008VZ-Uz
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:58:07 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYl2-0008WQ-Ey
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:58:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id c19so10106807pjq.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 18:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kigezuw/F7NkpHDCq9bpNuoxlo9Bbv+Ehe6b92SAjjw=;
 b=pZ3xZry1O4F2UIhKp1R1a4F4yI/z5G5/jOLzIFbrm3hJ0L/h+4eexp2qZK+3vvtnfK
 gPtGksOdXmaZS3SZPLaE8W18K3eq8XNQk+kEwDBLW1tgap2UXGvaAbZY49qt2pgECnmD
 +9e0qoCMkBPZVSmWgqwQ5TtovJUUXA0a7yZGIZxl7K/ijpAVAH+dzEBTSB0S3Q0dpCB9
 LJgThXrqlgX4DDl//a9Z4VKtvE1O/G2iTmp0InC1+wvOa1F1zZtTlgzuK/40v4ngTXKd
 eK83OYwWv4wCh55Sizs5ZIXKBtzBdCiPxTM3PM9hM4jStvc4YL2dZO0K1+nrNKSEP0IG
 TeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kigezuw/F7NkpHDCq9bpNuoxlo9Bbv+Ehe6b92SAjjw=;
 b=rCyx/FNgTCfVfRCYKcdtX1KXWIVfv5HyaoaZOA+SZKn2MZLLgJTe1g3iJzseL/7Lkb
 jmJy0/Z5EToasHjZQcJWXXhtQPXdsKwx8Eb/2npsOHvTvR3gE+OiUi6hQiVPew4yKJFS
 fHfmQWxYkFPDwTxpcoUHXhr1NwVc6JVQxtoVuxD45o3U7B4jKcBzHjjNBwwNMezCP7qZ
 OCkfNamQdBnAypbWme3H3HLf6SkGPtf/NnZOOjLf4GKguja+Y3DF3bPVTOmb68Ox+KA+
 eiHSycfyl6jvVs4O/pJuQ1GDmXDGJx5nGX7gCQn+JL/hSlmuDOA60IYpLBJxa/jQsPRx
 xbYQ==
X-Gm-Message-State: AOAM531T+eRJvgUt7E0fyH8xUThu5GCmdELteTkV5kxLuMDP6sbW13oI
 Nasl7oLI2z34KIzZu/YwMIDuyQ==
X-Google-Smtp-Source: ABdhPJzJxEvczf2r/OrN6P+4RGvgddLwcgOopt7VkiqAfrUZPVESFCK5f/5lJeJ1SVo3fzF0gM+tMA==
X-Received: by 2002:a17:902:bd97:b029:e4:b5f2:ef02 with SMTP id
 q23-20020a170902bd97b02900e4b5f2ef02mr1902753pls.68.1614567482983; 
 Sun, 28 Feb 2021 18:58:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y12sm1329640pgs.71.2021.02.28.18.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:58:02 -0800 (PST)
Subject: Re: [PATCH v2 04/24] hw/arm/mps2-tz: Make the OSCCLK settings be
 configurable per-board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d88dfb4-5d94-eedd-cf13-16c3a2469046@linaro.org>
Date: Sun, 28 Feb 2021 18:58:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> +    uint32_t len_oscclk;
...
> +    int i;
...
> +    for (i = 0; i < mmc->len_oscclk; i++) {

Shouldn't mix types.  I'm surprised you didn't see a warning.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

