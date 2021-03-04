Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681732DB38
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:32:28 +0100 (CET)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHue3-0005qq-D7
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuWo-0000Gl-Mv
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:24:58 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuWm-0000PO-PY
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:24:58 -0500
Received: by mail-pl1-x635.google.com with SMTP id d11so16807356plo.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/CGlW3pc52JpVh9HgbXYO3RXSjgVXwb7vrL5K0RPuwM=;
 b=co5fpDihOgLbTy7CFh6/QDjkUEyLmU6K3m+mYxwlBEqVQVnriuviCTv7BiMKlMZJmP
 YSgYz/Abt2vLW73om8AQlTnyZMsetlZkP+Zj8S3bhwPw5lsKyashNErlVstCkuhObj3s
 pR55X8yv9bOcDUpRtqsWIlQQHbQH3WqpOIgbY4qY54aHAqaOrmqv4ht3iN88FefRIzL/
 JOH9bEMBmFBFQXvR9bXahCZgV+k7rPJQoxA5M0cI8iBzz/191fsDE0iFgGj9YF5m8MJx
 yCxs8BJsYHbXH2b/5LU49WcWV+cNrzK9Az4/kZPrnqhkWABn88XZGbk19ASYR+MiIyzZ
 d0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/CGlW3pc52JpVh9HgbXYO3RXSjgVXwb7vrL5K0RPuwM=;
 b=LdDw3F8sZ9peKeZnpUZqdIvmstoiFg9TQDhKoaj8RPiHcyt+bfMM+HB4+oWdbTqHnh
 xEBv87MCMz0cFkBTYLuQ0CWqR0GK0gxJZoZ1UVGWN1WF6cjKQXsv16RsZtUn+iAhX5im
 Un4XW2yWVpKcg+NQAgh3Hz+OpFo81oRKRLVWuzEHCFuNZifTPMmuXXx9LYJq6JyV3XHa
 dEt4vfvc/cgIgO8nr+USkmC1Sg1RWpI/FdrlvOQ8kT8Pxg+I92CqB5h6o9LYESIkpiWq
 o7WTteITgn+bLK9itBPaKHf4lOsXH+lQ09glwiIuV2hwxcqBndaazrsjsZJ0+e5ytdVp
 vT4w==
X-Gm-Message-State: AOAM530F/Wrdx4c5MPlhMseo2qyo/hTurO0ORj9E0iHmgFGr95v8r86m
 unD/OqMjMWvOpVD0wguLbc92j17unHs3gQ==
X-Google-Smtp-Source: ABdhPJwtle0h2Hi9gwqsTqk6XgIT+XdgozlVePerQAe5b5YbyLHDTB5fQDt3jn6tiylM2zGW+pDjmA==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id
 z9-20020a1709030189b02900e5d7c3a264mr5521832plg.6.1614889495180; 
 Thu, 04 Mar 2021 12:24:55 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y19sm265720pfo.0.2021.03.04.12.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:24:54 -0800 (PST)
Subject: Re: [PATCH 29/44] hw/arm/armsse: Move PPUs into data-driven framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4b07146-eeb8-dfd7-ed09-9bb1b18bf60e@linaro.org>
Date: Thu, 4 Mar 2021 12:24:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Move the PPUs into the data-driven device placement framework.
> We don't implement them, so they are just TYPE_UNIMPLEMENTED stubs.
> 
> Because the SSE-200 and the IotKit diverge here (the IoTKit does
> not have the PPUs) we need to separate out the ARMSSEDeviceInfo
> for the two variants, and only add the PPUs to the SSE-200.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

