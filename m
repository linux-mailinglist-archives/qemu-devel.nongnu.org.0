Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82D3102EF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 03:41:36 +0100 (CET)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7r3u-0006Ui-OI
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 21:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7r2G-0005sS-N7
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 21:39:52 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7r2F-000121-5d
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 21:39:52 -0500
Received: by mail-pl1-x631.google.com with SMTP id s15so2792985plr.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 18:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lmJ8CW4kUyv9H6aq0RcNzDaxAFLh7nSlMAC9Sp29o+4=;
 b=LrvH2aieqSdyiE0DVVUKRbPsXyjDuTO+HUw1arcAmaAfRD5DuGelToxJ3DKXhrdiMs
 wrs37cHOXybaeal7sxzMe0jcuc6O0Vl83MyHhJqWXaf7azDjD88MTsicPzHkU+214vyG
 SUpDo4tWWF1ClouGp3+VwaLj1pfmWSsWvpSSAeDY1KTnsjZicpwTR8M8uj+qKAs0VXbb
 fcRrwODaJ5gb8hmxZhB4OaMmTIKcC6CpZme64u2OSu3rrlCGO/JkXdU2z4Ow2boCc5+J
 et6MrWJcOPwkbUflUqcqQ/2Dzo08PXNaXEXXuvFh7nwBslyRBaUErP91ubUw1GdhSSFl
 Yf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lmJ8CW4kUyv9H6aq0RcNzDaxAFLh7nSlMAC9Sp29o+4=;
 b=il9V1XNu1ZuXw5zRfosJ8E9TEJGQSQQc07FWeTA66XQv9G+rr5CHsw+d996Yg+8NA0
 YngmWykIyBfXnn6yyRi3PHO6LVDuoROLSheFW8bVeeTA3HHNO/vbucwERQnSr9zEGAvG
 XMJs9YUvoSgV4Zlvwcwsk1tvqEJxee8l1oKjeTqig8tm/rcuWbRxvkdg8xfNe1x/YwrY
 flE6DNvNLNwyWZlRZkn8J5zTfJQT48Bt1x0xFfb0RHAUb0+ROnul2sxs8DSCUFH1vzOZ
 Pz1J/SdLpoO4M1zxZs0R1Lucfs0sxWS6nRHPaSc7uuEZ2qweEDX3gS9i4acxmT9Tnl8o
 h2PA==
X-Gm-Message-State: AOAM532aXlH6KUYwZRPJkAEzS59tqNSQSZebrIp473+zxqSwxyhIFH3t
 ad2lcmfMmHsqrWSBVbEKjA2Fqrtakpl5fEGq
X-Google-Smtp-Source: ABdhPJwu9SjqM1h57PAtuUGN44ikP+UvmHh9Ekf0vpUeRhRBGIDJq7aQHhaqwDA7hMiSozIaNWpm5Q==
X-Received: by 2002:a17:90a:7888:: with SMTP id
 x8mr2082195pjk.69.1612492789380; 
 Thu, 04 Feb 2021 18:39:49 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id i1sm8133000pfb.54.2021.02.04.18.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 18:39:48 -0800 (PST)
Subject: Re: [PATCH v2 00/93] TCI fixes and cleanups
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <CAFEAcA8yiVXSLwP4kzsE4MSfhVKTn9H3VtnXgXRmnHZmxUrfhw@mail.gmail.com>
 <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19c8cb6c-880a-d78e-fa59-628763b27711@linaro.org>
Date: Thu, 4 Feb 2021 16:39:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:02 AM, Stefan Weil wrote:
> It would also help if the patches which were already reviewed were already
> merged in qemu master.

I'll queue the ones that have been reviewed to tcg-next.
That'll get this lot down into the 60's.  :-)


r~

