Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E84D204E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:33:24 +0100 (CET)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReeA-0000OC-TM
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:33:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRedA-00087T-SI
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:32:20 -0500
Received: from [2607:f8b0:4864:20::1036] (port=51890
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRed9-0005cV-7H
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:32:20 -0500
Received: by mail-pj1-x1036.google.com with SMTP id cx5so137693pjb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mMzFE1hBTwVuh4iVBF2AGl+EqUH/SHGGGgDUrUfu8yI=;
 b=zhVPnCj3jZuUkMIalZ3VXmx6wIz6/shXNfzccBXE/Ae5KIdDYsx9SIideu2KQelPRn
 cGw4BSY6jueYCkULEoXcDEHQvTkXXojJKv7sp9T/LrbCRWEk/fu77UovxsbOy40N56Q7
 j1BZqXJNrZJ+k7EGT6WS9luizm3v8sd7CZ64kGcbH0LSdHSxB4VvQjNSijxVkiGanB1d
 +QOnOjy8sYMTH+5xwwrDQLsqvIEggA3ywJgITcVWI7hcmy3upVkUGJcgtB3bYkA8NInq
 hdhWZLMknKmq5/Vys4bqQLKGeTi5jG8TS+2Hr+Rvqy8RPwfphi1Hvsnq76tTuLWuVWC3
 xGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMzFE1hBTwVuh4iVBF2AGl+EqUH/SHGGGgDUrUfu8yI=;
 b=brZSjcrhgIU2um2zJUI/3yKgz0Snl21N7FHkf6M0w+7CUxs6yKk2bRPtT7rBtXA6NF
 6R8VFhNCde/1Y+hBvcZZSKTxU8mEz7emMXt08hTmTErMj35GcNLH7jqRFKDwWtr5xDHg
 Xu8i98Xwik3Z5cLaWMqUTkPg/htuJT5N1abCJbooq4IV0sERzNYrKSG3uSCtOZsY1gmj
 frIvk8Ykob5fZyMmtPyhmJh0qKmyULjZ3z65jcDm7db/BYhapibsvy2KtQNWjnviNUum
 z4mD9VRl4pEbt1wIECg3p0rvqGCMLY2X9yEtFPITsQe9DSWULFcPrFL+ITECGnahHVnV
 xPkQ==
X-Gm-Message-State: AOAM531QTLQfkqfnxwgo1yKTFcBYamfraybO/rAjjvQcuVBUy2x4BvdH
 PHWjJTDonfggbYAez/zOnbaJ/g==
X-Google-Smtp-Source: ABdhPJw2t8wwaX4ft0d/jsotCcIIQe567fjMRFS34O+qxLpLwm2vqTpWfD0ruhdqGpMdD8xemEIA6A==
X-Received: by 2002:a17:90b:350c:b0:1bf:1dc5:1c3d with SMTP id
 ls12-20020a17090b350c00b001bf1dc51c3dmr6099180pjb.53.1646764337718; 
 Tue, 08 Mar 2022 10:32:17 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 d23-20020a17090a02d700b001bf6ef9daafsm3656702pjd.38.2022.03.08.10.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:32:17 -0800 (PST)
Message-ID: <68f4a24b-440c-bab2-b4f6-4b609cd856c6@linaro.org>
Date: Tue, 8 Mar 2022 08:32:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/13] hw/mips/gt64xxx_pci: Resolve gt64120_register()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-8-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307134353.1950-8-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 03:43, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> Now that gt64120_register() lost its pic parameter, there is an
> opportunity to remove it. gt64120_register() is old style by wrapping
> qdev API, and the new style is to use qdev directly. So take the
> opportunity and modernize the code.
> 
> Suggested-by: BALATON Zoltan<balaton@eik.bme.hu>
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Reviewed-by: BALATON Zoltan<balaton@eik.bme.hu>
> Message-Id:<20220217101924.15347-8-shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
>   hw/mips/malta.c        |  3 ++-
>   include/hw/mips/mips.h |  3 ---
>   3 files changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

