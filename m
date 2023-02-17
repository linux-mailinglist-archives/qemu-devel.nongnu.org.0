Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2C69B221
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:58:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4zA-0005Ak-2d; Fri, 17 Feb 2023 12:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT4z7-00056c-L6
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:57:25 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT4z6-0002KU-5k
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:57:25 -0500
Received: by mail-pl1-x636.google.com with SMTP id p8so2230509plr.4
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6dTckcmqYpoAhWQv+LWva+K8cG2h93qjT54Po/IDQw=;
 b=aCEq7q/fN1b4OTXBQ8QTYqAjrtvjSCsK2g/+ks7yLflPnIGIb5p9RRF7WZ09629H7g
 Kr7kBS3p8zdSdWUQYkeTkLubcF9s5LuasqoKKHxmaXLSASHeNW8PsamJpJNxa6EJOWIW
 oLIkYMRpxLP0A5y+lCXuRknaqW686MDOuyoeGz+2Cdf4adGs5D1FttRt4rqiBw2PSOwO
 XhyxfQol6BGrCYNfQMnMe4mPcA5OUqxDk6SFpAUm+wQYX0eIGIbgQVj8Wetp/h9s9Tig
 1k1JCRocjblGRkXW0UG8B7KlTpeuMWXePoLe8K0dOfrbhWmFub+gKAlie8CON9WMecRj
 Wc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6dTckcmqYpoAhWQv+LWva+K8cG2h93qjT54Po/IDQw=;
 b=MMahFKbH6UN/TSfHw98FwJ9pj/nyCOd+GukzHf7F9m+ljL/LriE3ZFo/ZGMF1RyxzY
 70KzlxeCrhrN0/Xcms6MDscWcBO3eATRNaBDvGtpZlIIttR+zp9vXH6fSViMJKxk1y9/
 /q4IVrRa87mxBVpGJin1Ud3/4iY6p5JbZwk+YkTo3Q0GENKb8NJdXwng/1cswp5wcAj6
 VyZtSz1jvV5YMdOPaFixxoUjgAvzOGq2d1eWRZgnHMzL3UhZEwqxJpyPy4gTIsjuWu3f
 s0Y0WeMlaDTX8g+4nFJQkh6EpCssDNT3YRoJKHqUJmA2TRouE9alMv6nk4ZtEXmEOCgu
 d+5Q==
X-Gm-Message-State: AO0yUKVSc1kN1O6pePXWk3c2U5FMHrwUhPXI0Jo0Iuht2/HVF1WXea9L
 2GTqpJA4UWrwtvrcYB1FZQ1XuQ==
X-Google-Smtp-Source: AK7set/2SfidczsvMw83ODF79PpJ15t+uuFJrK3Tp7736jGqJKCeEkzALrdM2uW0fqI5HYxSpanClg==
X-Received: by 2002:a17:902:e84c:b0:19a:e762:a1af with SMTP id
 t12-20020a170902e84c00b0019ae762a1afmr7408985plg.33.1676656642662; 
 Fri, 17 Feb 2023 09:57:22 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 z9-20020a1709028f8900b00186cf82717fsm3419391plo.165.2023.02.17.09.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:57:22 -0800 (PST)
Message-ID: <e24837ae-aa22-c62b-9ac9-99fe893d3f42@linaro.org>
Date: Fri, 17 Feb 2023 07:57:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] qemu/typedefs: Sort in case-insensitive alphabetical
 order (again)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217141832.24777-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/17/23 04:18, Philippe Mathieu-Daudé wrote:
> Following the recommendation added in commit a98c370c46
> ("typedefs: (Re-)sort entries alphabetically"), and similarly
> to commit 64baadc272 ("Sort include/qemu/typedefs.h"), sort
> again the type definitions (in case-insensitive alphabetical
> order, using 'sort --ignore-case').
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/typedefs.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

