Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995732D914
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:56:01 +0100 (CET)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHsCe-0001D8-L8
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsB4-0000bO-Fu
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:54:22 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsAz-0001jw-1K
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:54:22 -0500
Received: by mail-pl1-x634.google.com with SMTP id j6so3011591plx.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uo/PFc/+t5LfIOm1CBanoBkXHmi9lYlCT8NTA/FCKWA=;
 b=UeEUSoluu/6KkqM1DLnlF6g5Flp42KhHtssVn68/f4bFS+SDK0XJQPoQU85zH73d8O
 7EWtq3mhJRhyxeIsjq5ILEI8oWneZ0F+pRSVmsnM5DPFIVrXYGcHsRpGKkpBXcZXZFZ8
 FM05GdawfGe+VcSWT5oLkOBXgVpY3XvOvMKNOO3a4egYLmCpnCopnqXrAbbbjfN60IAb
 Oumky7e5r7X3rPV/mqlaxV69FxYrZ2N7Ld8c+bq5IcVN5FbxN329gVSYsVdROYVwLXDO
 CcoBvzTk9nGNk/FNVeR1edEPgG+u8zJtPdcmMKpHbatNiVvSaXNYArWKMq3Tln2tba1b
 9MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uo/PFc/+t5LfIOm1CBanoBkXHmi9lYlCT8NTA/FCKWA=;
 b=P+9wyDJt2wSrFbik5h2wJzU+OOkaifsB9u6gyMzq060NHr2O8FB9YSckcgVOMODuJc
 qJedCGLU9wKtV44HOPYr67CQ33PuyeXUM39zkQNmOxfygLrL7MkRJ0pAf2mIBqXbwnzk
 TNqhF1zomSO+adBgr9l+YjWFJYSQajKeY+IUIP3fOr7/12NQEcFkFZV3r2VJNH/dVh44
 wC3+sGHQQoR3tdW9MG2li57wR4qcmYWE8bM2esIJu2oE22jF6s6lMdyxeRGiYTos39vr
 yS8a2hEplGIBNSSZlibj4qQYH0R+VrbdqcEMLf5XYsAiv8uyaGbbwriWjc3abK7GByaC
 NCwQ==
X-Gm-Message-State: AOAM530iD30coAIb34DD84e27rQiVzyBYaHLX06CcKDfD237S4GZ/hUA
 elYG5TPhA5ki3JziXUyiFEue6krC1ngAWg==
X-Google-Smtp-Source: ABdhPJypI2JE6unoHCrKKwauBlOOH3BYZu1UrEZSUcd3rQvY5TEqG0YWXA/iDkdBQELfjQP64vjwbg==
X-Received: by 2002:a17:902:7407:b029:e4:9645:fdf6 with SMTP id
 g7-20020a1709027407b02900e49645fdf6mr4845013pll.19.1614880455373; 
 Thu, 04 Mar 2021 09:54:15 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id mm12sm10389402pjb.49.2021.03.04.09.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:54:14 -0800 (PST)
Subject: Re: [PATCH 10/44] hw/misc/iotkit-sysinfo.c: Implement SYS_CONFIG1 and
 IIDR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b88bf72-7317-73c4-dedd-30e7e3c1f208@linaro.org>
Date: Thu, 4 Mar 2021 09:54:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> For SSE-300, the SYSINFO register block has two new registers:
> 
>   * SYS_CONFIG1 indicates the config for a potential CPU2 and CPU3;
>     since the SSE-300 can only be configured with a single CPU it
>     is always zero
> 
>   * IIDR is the subsystem implementation identity register;
>     its value is set by the SoC integrator, so we plumb this in from
>     the armsse.c code as we do with SYS_VERSION and SYS_CONFIG
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-sysinfo.h |  1 +
>   hw/arm/armsse.c                  |  5 +++++
>   hw/misc/iotkit-sysinfo.c         | 22 ++++++++++++++++++++++
>   3 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

