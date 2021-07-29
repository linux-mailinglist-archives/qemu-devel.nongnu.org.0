Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DAF3DABB5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:14:34 +0200 (CEST)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BUH-0003iI-Fp
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9BTN-00033W-A5
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:13:37 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9BTL-0001qf-Oc
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:13:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id d1so8157011pll.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VxRyvqxYZOjAq5kIjoSXJpmwqhYA9JfP0SaAGBb6/gM=;
 b=j3IwmntfkD6UMycTdtR19HyB05JsQJLB0zTUOhMAXNR2oy6Yp/PhGIIzCP2vd779bS
 A3xqa+j96ZcUyjAsMcaCRKZO86h/4c80llpUNXzdCqdrOh7GbVhl4hBFSjUfIyCzw5zW
 hb93+ILWKJOrKv0jWCTBZNLQN99JnnDSwWN58VUhjuOybui5HUWUfVt1LMPeAfbtavuh
 m4hhR+ix4x+QEQy5mGJ0TlxS9wLvYCN+y1cMqc2Jt2a+MJF3oH81gi9VOqglt+F2HmLb
 soz9Ix5Ty3YZy27riKnN6ewo9v1J0Innf4xne4W443XdfDnlngu9VY7f1Q/dtaYFWywg
 5HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxRyvqxYZOjAq5kIjoSXJpmwqhYA9JfP0SaAGBb6/gM=;
 b=SGoKSv/72lzdDGMp+o+wTyE6IF17NUWydN/rlC6dB3W8AP5aWxRReTtQKWsDVcGxCL
 3sR7xPgTU7az30RDQMI33/oP3EdXyDgs97I1Nhpf/oUDcD+7lQBR1uy+R4Mw5zxns/n6
 vNflQM6o1veXOBJQ/9dh1DVAtwPIiTDWF7oLEW7eGGEli36uVrX/EWBkQhMcc5Ifrkx7
 Y37CnIYbgdhcgeRRUFmJ2hmnODhg9sisoOYGZZaaQZhPvQvFQssn5kkPD3dtM1ivOA6A
 7nnuG3Mxr53iXYo7c8dQYhuZ7MLV/u26XU9g2LsRRYNBKjn+xq9dfrwfer/K9kSC5KYZ
 rL2g==
X-Gm-Message-State: AOAM532LPXnooJ86dpeL4tzhbMsoJm6lph+y+EBNAcLLhRXVTe3CX6y7
 UkjweDOWhIbTvV+Y9mChjJCO2Q==
X-Google-Smtp-Source: ABdhPJwMhL9d2qLPOJTZbZH6/7CmxuarwuFbOEdKBdDjScTSAn6ELKcaw2XOZSBf+cQFFaIJ7wiugQ==
X-Received: by 2002:a17:903:31d5:b029:129:18a9:6267 with SMTP id
 v21-20020a17090331d5b029012918a96267mr5828975ple.43.1627586014096; 
 Thu, 29 Jul 2021 12:13:34 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id a21sm10127683pjq.2.2021.07.29.12.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 12:13:33 -0700 (PDT)
Subject: Re: [PATCH-for-6.1? v2] target/nios2: Mark raise_exception() as
 noreturn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210729101315.2318714-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <caba47e2-c139-aae3-d5f1-8a4118c282d8@linaro.org>
Date: Thu, 29 Jul 2021 09:13:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729101315.2318714-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Marek Vasut <marex@denx.de>, Jeff Da Silva <jdasilva@altera.com>,
 Chris Wulff <crwulff@gmail.com>, Sandra Loosemore <sandra@codesourcery.com>,
 Yves Vandervennet <yvanderv@altera.com>, Ley Foon Tan <lftan@altera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 12:13 AM, Philippe Mathieu-Daudé wrote:
> Raised exceptions don't return, so mark the helper with
> noreturn.
> 
> Fixes: 032c76bc6f9 ("nios2: Add architecture emulation support")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

