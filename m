Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7EA471BE7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 18:35:32 +0100 (CET)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwSl1-0001la-Q4
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 12:35:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSi9-0008Sc-U3
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:32:33 -0500
Received: from [2607:f8b0:4864:20::42c] (port=37645
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSi8-0002ez-4C
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:32:33 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 8so13008762pfo.4
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 09:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XzvCyZHVDJNW0fY+aJXs29D+CLYKsLM8Ol29emlGVRE=;
 b=iU0Hqs8lxgzUn9R6LLeE5OdGgnahZ66kl8TLr25ElOnVnFX0JRdJfuxdaKfFH+QY9J
 1WRXYs9OJWMmbBXvCnUmaoMKTSQA5Rv03Ospy0yOI62gkyKHk440z4uBQxQqn0pcc7cH
 ERg2biTjHfsvPVcMPcirIq8xqRYMQZlwb8alvaXuJA8hKcVCN3ZpNsE/5jk2CSsShDTD
 cxJrjDe7b4LrsN4YfEL9/Cf+21ZYq8xkfE5ritaN1yYV5eO8xa4OAGyHEelPx0ZyATWZ
 zqB0bgWFhnk0MBx3BxLxqrI5ERsBPAbCYwljMMh+mrVOhdatmkPgDMQTiUvEzOYY8xxT
 mO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XzvCyZHVDJNW0fY+aJXs29D+CLYKsLM8Ol29emlGVRE=;
 b=cJ5a4V3IucBpu6sK0T11JH6TZAtoDXyACqPwtRFTloouaa5ZdwonV0wr3zWcaiQ+Gp
 67m/sP7kpAr+QWORjCjqWwLgXXtUkDuG4/x59WOtFFyMOo9JHY8X5KekqsU/yuGIcR7G
 sYy4b38LDlGOTDuiZmmeJSQsk1aOJwDx58OEK5ItGKgMKIwT5tFjayz8W3zBlM9kTyh8
 XzPNPnbzwZzDXe11vJT55xED4Rlq7v69qAw+fWVt/DVPearbTm90d0CrLhyVtqC/nGrh
 ATPyT16Ik7TnTnDPJCV1q7ule2EoQiGo/Cr2GYkaUEqSFphGpjYd7jA+xuaUdPFRYXSK
 LWEg==
X-Gm-Message-State: AOAM530Uz/xOLf1Kv/fzT4zw2c3MVwDi/E5K2FDTr1J2cM/87z8BBJHW
 aaujtEdy9SfbujZvFnpqkQ2CCA==
X-Google-Smtp-Source: ABdhPJxqme5Ap7z5bHt13QWJ0B4wSkWw8p8NEnAlMBsvua6tSkmY71vB5WZYImz+sb2483meYPD1qA==
X-Received: by 2002:aa7:9a04:0:b0:4a2:ebcd:89a with SMTP id
 w4-20020aa79a04000000b004a2ebcd089amr29213294pfj.60.1639330348494; 
 Sun, 12 Dec 2021 09:32:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g1sm7643655pgm.23.2021.12.12.09.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 09:32:28 -0800 (PST)
Subject: Re: [PATCH 02/26] hw/intc/arm_gicv3_its: Correct off-by-one bounds
 check on rdbase
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1099d721-61af-8342-9e1a-e23ddf0aa8f8@linaro.org>
Date: Sun, 12 Dec 2021 09:32:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The checks in the ITS on the rdbase values in guest commands are
> off-by-one: they permit the guest to pass us a value equal to
> s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
> meant the guest could cause us to index off the end of the
> s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
> would probably crash.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Not a security bug, because only usable with emulation.
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

