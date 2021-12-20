Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A847B438
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:12:00 +0100 (CET)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzP0p-0003YI-KH
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:11:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOMU-0005LX-30
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:30:18 -0500
Received: from [2607:f8b0:4864:20::1034] (port=36561
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOMR-00034S-3x
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:30:17 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so143566pja.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GDs2UfKmNqlAvk1qgspt9IBNVTtdD5H8zEy7/S12j2A=;
 b=cLdyGMgyCJTASvy6EdohA+bJ8BX0NU3aUqPRfAYn++Y6aQ92rIsT22CRY7QM+DOzgL
 1O+7TWTO7NQGQ+geVIYImIb5rQa61GNBSyKbJQ7JxL1ggJ/DIRnmVjT0gBSCYmhh+PoU
 Ts3gcEgdmwY84XntchTjJh7tXfkhQeif2pjo6S/FEM0CeZdW8SI5qASGrC9O3A8N2ADW
 CDmZfpXKqsgbZCabs0io6TX+dYp7J2Im6500yrtUyRir4EJHHQW4tkuiJABHwYAyD5Qg
 Nu0vMUddfs8oLaWrqPihF0x0JvzE60B6eNAzMa+bn2TB7XmwK6INAhxmfCzVZTbn4sCS
 lwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GDs2UfKmNqlAvk1qgspt9IBNVTtdD5H8zEy7/S12j2A=;
 b=h0PwdbvgaWOSW3q/IBmVMtvx3+zT+KbRzoTXodiRpXDcm2mAPsXQSAIMGB3U0tapii
 WPT8T2UPu014DcptWluxp7q24g8bGan/gi2ZUOhQq3Z8hRo/gqH1LNgGqsDNPRlSGQsG
 n4i2X1hSMv7wu5rXkAHXJAVcBly+Drnl0lGjAK3W/otk+d+ZxEm6uyfrUx2JMYDVJySX
 ihOomQT/uFizYdo4s1U9KWLVDTDQ0gVvB4Wyhwv9YTRQTywZA/mpGu1ty4V0Ijnq40WN
 WYuY2GS5a5pE4kAdkcmxHALS352ajZv5lg4lvx8637/FMzRDOk7jL26KzgZNS8kloYPD
 BQvg==
X-Gm-Message-State: AOAM533gDQCQ7NCbBNIOFOgb6PQq43+ZEppDQMUAb0IrYDw4rBpzVQQe
 nEo0Ys2uju1kP7+P46rLYeayUQ==
X-Google-Smtp-Source: ABdhPJyh5p0fHQqKqKUB5RFTLpe1KnfJmxcdhBYG0Fk4V4R2KFq5Cu3c2NqhiWY24ztWnSN/me3LQw==
X-Received: by 2002:a17:902:7b82:b0:143:a6d6:34ab with SMTP id
 w2-20020a1709027b8200b00143a6d634abmr18333736pll.30.1640028611301; 
 Mon, 20 Dec 2021 11:30:11 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s29sm4469852pgo.34.2021.12.20.11.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:30:11 -0800 (PST)
Subject: Re: [PATCH] tests/qtest/boot-serial-test: Silence the warning about
 deprecated sga device
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org
References: <20211220164042.397028-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5a9aeed-a336-05b4-10b5-87d726f81c24@linaro.org>
Date: Mon, 20 Dec 2021 11:30:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220164042.397028-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 8:40 AM, Thomas Huth wrote:
> When running the qtests, there are currently a bunch of warnings about
> the deprecated sga device during the boot-serial-test. Switch to
> "-M graphics=off" to silence these warnings.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/boot-serial-test.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

