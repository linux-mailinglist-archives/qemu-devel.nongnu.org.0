Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273240034A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:29:32 +0200 (CEST)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMC4I-0000Rw-G1
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMC29-0007Gz-Ok; Fri, 03 Sep 2021 12:27:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMC28-0001QW-7p; Fri, 03 Sep 2021 12:27:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z4so8991204wrr.6;
 Fri, 03 Sep 2021 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xbF6RpD9Jef5bcQtzhPmcAPpIO9sDkBA3EFd3DffmBU=;
 b=G7eWQEqku73Bzvw8R0KK1QnreGLb/vpi1xws+D9vGi7eUiGGeIYJlJiIdMOO3gcch/
 WoMYJ06eKAascVnrhU82JltFc3Ys9d6YKkde3j+Yi2rtgtxjIX7FppQnmBLcYuHMMG62
 vajShNiF5HIynf9IKRclfF4UJWsR9HwDLz9qP44denc4nTdnpviG6cPVoVWkxg8UKZDX
 zDM0E0hC2ge+DwpFqjeCv5Gka+qTLU3Y8dzUYRfKFY2UV5wWJr9oGbKxSeUtc1Wb7nBd
 qtII7gdxqLxVKJqsSTcwOyJDSyH1zFnSB3/7FC+ihzosit4gzTSLZRebz7DPSmmfCxjf
 isNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xbF6RpD9Jef5bcQtzhPmcAPpIO9sDkBA3EFd3DffmBU=;
 b=px38O3/19rbRtKQsx5kxmRNS76AE0lVoFYtnc3IzqPLt6UseFH8iNMR3w5SV4RC2zQ
 7q7VCCmoZ437BwJ/C5abDZQJ4XdfCs2cN1GwLc4i34TnttELsNXXUA7Vft2Vx7msFGZ+
 nkTmw2ywTt/zr5bLekjJeY2QroZgt6qfSjjV1zDIcyNVkuqIx7m8rtfSNBXzZVKS9ZJg
 Y4dGw+EEREBpmB7tXdrn/ZyeP2zjQy3t7siV1qZcu2azH5ZDQoB342DKct1pIW7RzRoo
 Mfd66rpjI3OKL0g9nM94zJErTIsWwJnDqSt8vVFovkT0TJciJ7BrHjdH8h74gpZo1koD
 j1aQ==
X-Gm-Message-State: AOAM53115DAzI2oubM0e8YAm5qHkCyiaGpAjksMieuczomS/EVT+51XY
 2U2U7iOnht4hbbTONUx1JDSepIHLE88=
X-Google-Smtp-Source: ABdhPJzUL9Ra3kmLvlWGRM+E1q99IEyf+BU24zcetlR+D/VE8q6g13z1jX43ECM4imybNGknjO+KdQ==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr5218336wrw.48.1630686433223; 
 Fri, 03 Sep 2021 09:27:13 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm4280144wmq.36.2021.09.03.09.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 09:27:12 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Optimize MVE logic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0501929b-43f0-d29f-ae7e-59bbe2b9f2cd@amsat.org>
Date: Thu, 2 Sep 2021 18:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
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

On 9/2/21 5:09 PM, Peter Maydell wrote:
> When not predicating, implement the MVE bitwise logical insns
> directly using TCG vector operations.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-mve.c | 41 ++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

