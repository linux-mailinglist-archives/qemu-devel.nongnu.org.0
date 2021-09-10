Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42759406D04
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:41:47 +0200 (CEST)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgmo-0001N7-Bs
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgld-0000gb-7z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:40:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOglb-00069E-J2
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:40:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id g74so1246464wmg.5
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tcLGmRfLdzGKJN0JwBJVVC+K9mihtMkcsmcfFxSyEHY=;
 b=a2wrM/u7KwRedxaBM3haBVvJl+doNOE+GHHgqmo9Jx8A6/S7WkAQ2AdfpDDwNZ91bz
 Pvn74bTJLKLxvb8ToFx2CYtH15lqULXatomuTNZRGealN4v6GmuwTLiOZhidz+aROW/Y
 QDHx3LQdscRRlg3W5/C+m7lMrDb5p7gVdecUCTfkgBwdrFNl6e8unI8dyf6cEQZ4FKim
 9OgEQjbfkjERswrLRGYneTRlkTKNj5Eb3m59jctTbapqc9JCmhMkKvUridYmQzNLJX5B
 V+g99sTX/OZc9+USHBEcz5hQfRxscodgQhcAvHFHWtUUIK7JAi6R5XgKaDSYkDUntdAF
 fzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tcLGmRfLdzGKJN0JwBJVVC+K9mihtMkcsmcfFxSyEHY=;
 b=dTYkfUaB/naO6kktBX4HYYWF9iSr3Bed+rU09ipgdKsAM1j9OmLSQ3yi1//CPZNLfj
 LKRjEKxWXtAlnV0mSL5QTHfrRGahmSn1GVwsDaOIk8hXmKhcwNSCkxSl6XnhktsqtVzv
 lcD6kr6ke5+pUKNjYVJpl17B/eBOYKVUEYQAZknalLgmmalLpUAY7HV7NhH70ZPN49CV
 XSvUj2h0q40k6OJOKRzcJpOZpQ0bgKa5iGDOtG5XC/i9D9qCWuSkcuQygXgr7VVR+u0e
 8xQh2KhZg4nAXlqGlM/aBA3xnjC6FydLD5Y9ZDL7nAaGeeJ4WEGCPZUDV0wtguH8lpDT
 Hpbw==
X-Gm-Message-State: AOAM533tR3U7t2+UG4ctZy0vFGVXaqkeK/JQO31nw1p60HnUmH0qfiwZ
 dx25FY9WPopFYXwhYja9Wahl3MUkFQGMR509
X-Google-Smtp-Source: ABdhPJxdHuCUjjm5oW21ktaFcQkBCaJblpobiS313UvFWUZx0mD7dCJ4Jfc3LeyMdIMUE4shx+Xqaw==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr8363230wmi.113.1631281230022; 
 Fri, 10 Sep 2021 06:40:30 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id q13sm4739533wrv.79.2021.09.10.06.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 06:40:29 -0700 (PDT)
Subject: Re: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
 <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
 <CAAeLtUAgr9r2aBV+M8jVE7J0DG2U4-EjxAEfY1adhQ_XCfT5ZQ@mail.gmail.com>
 <CAAeLtUAstVXF563xWGP3DjPCdPaN4GO8kr5S5LXVQnWu8eqDZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <641dcee6-0577-35e3-0b58-2acdc2b80c2d@linaro.org>
Date: Fri, 10 Sep 2021 15:40:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAeLtUAstVXF563xWGP3DjPCdPaN4GO8kr5S5LXVQnWu8eqDZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 3:36 PM, Philipp Tomsich wrote:
> Richard,
> 
> Did you have a chance to consider what to do with clzw?
> I would prefer to avoid the extra extension instructions and change the implementation 
> (and would update the commit message to provide more context), but if you insist on 
> setting 'ctx->w' I'll just have the extra extensions emitted than delay this series further…

I don't mind not setting ctx->w, but bear in mind that UXL is going to automatically set 
this flag when executing RV32 on RV64.  That's why I have written a tcg patch set to 
eliminate unnecessary sign-extensions.

Do swap out EXT_ZERO for EXT_NONE in the gen_unary call if you're not going to make use of 
any kind of source extension.


r~

