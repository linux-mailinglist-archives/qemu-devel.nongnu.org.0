Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA230D32B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 06:50:33 +0100 (CET)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7B3g-0000X6-Eh
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 00:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7B2N-000804-OO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 00:49:11 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7B2L-0006qk-GO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 00:49:11 -0500
Received: by mail-pg1-x535.google.com with SMTP id v19so16537382pgj.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 21:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bgeMERJZbFZAc6USC3fjOyLoKU/bLq3+UFxkbpKL4/c=;
 b=Xpjp5dZ+P0LfHwzKIU8RZnRcTQUVHQ7bMCYevrq0rtYbsA8UwJI7cg7VB6MsERr9I1
 u6KuC7nEbcyEPaqSMfhABJ+oL7RWElKXQGkgxlJTUGMdWerGze2aB1EsP1xORXf9Dpbf
 J9BBBcSWXtLjxRnDtOxt1i/ZRRsv0fa11u5jApARLGQ0gf+2uAciJv7aSFdfq3n1Rszp
 4jxNYMg8vVeKNpwKQi7P/GEHywldEMDu+JRGPO0Ry5WwSIDVyO0h4bE09+dPLECk31oo
 1u3b9BuhjhekjgTHhVHKt6WnTw/X5jGbHKaX+4r3SZmavPgdoLDy+QwebFcsP7AxP6Wi
 N0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bgeMERJZbFZAc6USC3fjOyLoKU/bLq3+UFxkbpKL4/c=;
 b=YICPmC6jfFgYk+kEUmokEEx9HCFXa7lke0xndyCGEI7M/2h0aptQzadWZGvIXkxF5w
 jrCsRnXaf63ob6HV4rMEmsfxvhGjLtnmRYRQyOx94yj5XLl2V+bqvRfnjxfII1upnQGc
 LCfEpSGqY091unI6fYkrwHO1+uFHFtRq6NZ9iFYgG3q1ipyDo/YHpQtCfBpQ9nj/LaHw
 ErnNgmLRxUrduGI5Q8mjO8/EE4dll26EUMuZ6IgsMElpi/T70JcJXtzFollBgyPnW4sj
 ew5kuECDn1PzUdNc5hgMeHBv4dnnMm6nAsvqYoef/rt6H0QsXC8y5bvfmLmqCNzCpoHq
 +U4Q==
X-Gm-Message-State: AOAM530EGld6gAntf3MkKi1XiytwmzS/mBb+zCdszAG0c8yzlcp4rXLJ
 MaAmPr7d/LSW6kGkUQKUFLOf+g==
X-Google-Smtp-Source: ABdhPJyAuBo/HEYPIHZXHgVqx5Nppt0hjv/zo1Z6waAMtTGrtvDiZq1q9XiwGKs0wGtRfE84TIq6pQ==
X-Received: by 2002:a62:e30e:0:b029:1b9:3823:4b3a with SMTP id
 g14-20020a62e30e0000b02901b938234b3amr1574694pfh.15.1612331347982; 
 Tue, 02 Feb 2021 21:49:07 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id b206sm792760pfb.73.2021.02.02.21.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 21:49:07 -0800 (PST)
Subject: Re: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-2-richard.henderson@linaro.org>
 <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
 <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
Message-ID: <2aaedf0e-3594-13a7-7576-8e0566464224@linaro.org>
Date: Tue, 2 Feb 2021 19:49:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.155,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:40 PM, Richard Henderson wrote:
> Well, here's the thing: this appears to be v3, reposted.
> 
> All of the work I did for v4 has gone missing.  I went to go fix the single use
> of current_cpu, and it wasn't where I expected it to be, and that's when I
> noticed.  I'm grepping blobs now, but I must have made some horrible git error.
>  :-(

It's not quite that bad.  About half of the changes are here.
But e.g. patch 11 had been split into at least 4, and those are all missing.  I
presume all of the r-b that I collected before that point got lost at the same
time.


r~

