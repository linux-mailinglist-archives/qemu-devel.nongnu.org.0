Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50133DBF17
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:36:06 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YIf-0001QM-Ng
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YH9-0000So-0x
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:34:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YH7-0004WB-Kf
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:34:30 -0400
Received: by mail-pl1-x630.google.com with SMTP id c16so12271055plh.7
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rI8yTTJNSogWqt1+W06+S2su0oNWbXFJd2YIZCUKYJE=;
 b=hd0447OYELu4GNtAhmNtwkef7hLcRIsuee9/or4Y2npasfdIc+iKumIIYwyKdDd64p
 YC8F/Ynekv3KyAKN2dGeIo5lwEQ5puw/7gvokI/oxPUFKWn3+ibrLete3mhavP9exKMU
 BI1LBqIKoSWB1b+9Z/Zsai+e49IoB5G6ov7gd5nYDj1DZ7iTPvPdslFv4ZrSddN6+rn6
 bKTHrHfnViMQlZSVtmxbS6J9930Q3Ao9CX9A+Q5D9u1zHDuOHKR2ZpXj9CWeO6b6SnDD
 RsNk0YdguOu3QF0VwJiFJ4+mwHmMiAz6YzuAPN8PTXl1Jd32rGlDCHMAj3axMr4fNVnj
 qpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rI8yTTJNSogWqt1+W06+S2su0oNWbXFJd2YIZCUKYJE=;
 b=T8WoHGcHB3Qu6TH7O7wLqGF06I7XamngCXVxx4QzANhBcqWXDS78czXo0H2OaoX076
 r4kLLsd1KIRMQl4C+gcc40F9ZmpJMS9/wYI4K70XgrGbDifRsX2Cgaz3SV18716DyAlz
 au7qMX4dMWfLmLioWvkyJkX7NVnyOh9JqTWrnUXOb2utkSlYwpFGBeYoZ2cMxkEZGxxO
 bJkU67jKK2iSiPRRQK9UkTx0qwqscdQiocy+TN+7VdBKwfs+JKWfJzEWUUnXOwNtI8Rj
 7z3AuvxgtBxK7zFpKQ9ojdG8wof/R7BZGU1k/SPUxoNeEUpIRalOMerQxZvuI4G14Ngs
 h9HQ==
X-Gm-Message-State: AOAM533A2zcuOulAcuS3KLHxmUGmkp/Y/NPZ+leV/5gzLVvrGYvt3Qz5
 S2a9uXwAIvM17aB6hP7aofFIe9ughp5OWQ==
X-Google-Smtp-Source: ABdhPJwm4smt67cmcK6Q0ogEkA93hQ/LGZ34gl/HEp/T6y3NiHlnKRRuf7UMea1yT7mZXyVKh/Mhnw==
X-Received: by 2002:aa7:938c:0:b029:32a:1725:a3d7 with SMTP id
 t12-20020aa7938c0000b029032a1725a3d7mr4115751pfe.64.1627673668289; 
 Fri, 30 Jul 2021 12:34:28 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id k16sm3104783pfu.83.2021.07.30.12.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:34:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 39/53] target/arm: Implement MVE VFMA and VFMS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3665bc7a-ce5d-9419-136d-3bbc78c72637@linaro.org>
Date: Fri, 30 Jul 2021 09:34:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE VFMA and VFMS insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 47 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

