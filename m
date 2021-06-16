Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95BE3AA1CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:50:52 +0200 (CEST)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYkd-0004mU-RN
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYj8-00030c-6q
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:49:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYj3-0002b9-7F
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:49:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id m3so1658465wms.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lbf+c7oI69fps61x6+r9jfj3fNRLFVLi6AGZdI0ZKOw=;
 b=RqWVuDeESOf7sn9s91SaT9GXfVX4kUlEnzTlz+QDQ+6dhjws8NyTfMF5Mw4VryINz0
 joEQh2ZQbAAMX3KpbYaBKlz/lmYt5W5c6AD7LGNLDHAJsB8nVrsZ99ylLFI39qfo2M2k
 8ztEWqe02MCBHv6hm+NXDl/8uiPxH71PAz2ZOwg+vcDKexxHNGbTEIedJNzTu8OATu/z
 O7yWAtJHK0VyxaeU3PiBUZb1LS0jz++EIWvgkP/ET7esFoK1uvf2FRt/c8mnqdmyIn2H
 fVQyJceSR0cxF690TA0tDIvjeddoYxsNAnuswjPzBAxZhdWjgmhYCRc7emX8oBN1SC9o
 86aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lbf+c7oI69fps61x6+r9jfj3fNRLFVLi6AGZdI0ZKOw=;
 b=AIz5EY2y+VjnwiPmbLVaRgyc9rBIPZIpkC2rkWriCbkbYlCT5uIjhM0PxtVyxqTGRD
 UqU+n0srwW3FySPlfmn664+LkdnyY/cmAtPaIT3icxg5Ppo+nEC6oV9lirv7VZi3byEQ
 Xdv9nR0qPNkXMMXQkCUlXpxkIT5DWTr+xhUA0PYJYActsVOtsgUq9OP69GXOu2tx7Z/6
 /4udvxCjNVtCcJbs2XXY5PRaaTm1pRs0lrO6+Q7H7CwZ9RgMvy2IkNhbR+Aa2/7IXnmU
 7ul/sXKEmk0PE8dM+xx9BrEIVEEG8ykkxMsjE5HTry3wSKXH4XICu7J1xMtzCoaIXyRb
 ItAg==
X-Gm-Message-State: AOAM533ozV4ecFqYQrRv2OsvgQjo3PI5r3siCwtV7FmaKZehbGyg8FBc
 5hihG3D2NyUl9HTucfzs43c=
X-Google-Smtp-Source: ABdhPJyPESseyb9e4ufNrVo3KPOLR4eV4dvwfCpCdIHU0jqmUsZDxjY/d0HOAbo7m79FC1+C7wvB7A==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr12200179wmb.158.1623862151545; 
 Wed, 16 Jun 2021 09:49:11 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x14sm1987882wrq.78.2021.06.16.09.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:49:11 -0700 (PDT)
Subject: Re: [PATCH 14/21] linux-user/openrisc: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aafdb4d6-5128-7156-24f8-567bdd137bc4@amsat.org>
Date: Wed, 16 Jun 2021 18:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:12 AM, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/openrisc/target_signal.h |  2 ++
>  linux-user/openrisc/signal.c        | 24 ++++++++++++++++--------
>  2 files changed, 18 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

