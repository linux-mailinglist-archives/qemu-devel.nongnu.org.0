Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D073DBF3E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:51:39 +0200 (CEST)
Received: from localhost ([::1]:57958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YXi-0003dK-Fh
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YWd-0002eW-3r
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:50:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YWb-0006j7-Og
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:50:30 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso22378880pjb.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bmlIp+0ON9Qts3yqUGeH75l1oWQ/NEKpeZrMW4pqUZQ=;
 b=vPJUWtBj5WoR8EYQdYENAECx3R1qFrWuL+1On/ddB47XR41Cb9kb3szY5hysGQtKlX
 v15zickptdYgiHGla1JubVyzwelzvT9/lWEJTUGDAB+AFAkd+s8iZGqyUDx2IJfCGjgC
 Vy6dPiALpWh9NXwJVVbPOwCLoccJuFWFMpyOQm19qCuEzIo2y45/Zy2mah5nTpOB0WDB
 id+FoGkZV6ITJSfDqY0IKRC1tnqmcrDWHPnlkxWd8Xm+4/7njzVq9096QRe2ZuA7ViAa
 CPrectVq6aNkqX/HJBPpnC9NSQ5gMsNmtiTm5VAj3nNsvuGZJ0K5v3KWB1qrXAuUYwTJ
 UbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmlIp+0ON9Qts3yqUGeH75l1oWQ/NEKpeZrMW4pqUZQ=;
 b=WThQcCAY21DAzbLnAgxhlJm37hto/Sf2lXIfFFLw+vXaQYX4mZtQsh0lgtnlmqQb9M
 Wz9uvazVXggiNIk51yDFIkIaltPOs9saxslI7x6fLjnirNdwXbqtQ8eKFudycs7a2wcj
 wSkL2npmHWyGuXZWPW42gnQuLhwRYs15F35Nsj+Qxk6Gdyh9kzGf0lbmw0qC5+ZiMmfC
 oswVO6JgUV0Iy8sW/DetW3L5CmkHUlsRd89phBvTCDNtgMRFB8tP4FM/5/tkLY7aRTJh
 H/wMzVqXpiwUgkLYVSHWvA8nFgThupPFc4lJqRcOOhvvNG0rtIAkcP61cc+3ZjxvJw7q
 WvFw==
X-Gm-Message-State: AOAM531UE/ZhGnL1tX3KrOtSFskh1Xix35EiRjS0wkwKZLB8/fWoxM/u
 KW93NainKhmUAYfWml0IQEIFqafhMe2piw==
X-Google-Smtp-Source: ABdhPJxTljTTsROQ1blQYdNdjGGl2vuT3D1ZyU82E1pbtaRv8sIDhVkPHlWGSXZy8YtZ0BlKJvZnBQ==
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id
 26-20020aa7921a0000b02902cfb55b9d52mr4264439pfo.35.1627674628348; 
 Fri, 30 Jul 2021 12:50:28 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id s20sm129804pji.51.2021.07.30.12.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:50:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 41/53] target/arm: Implement MVE VMAXNMA and
 VMINNMA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b525a3cb-1809-28dd-3f72-0ab51b5d739d@linaro.org>
Date: Fri, 30 Jul 2021 09:50:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VMAXNMA and VMINNMA insns; these are 2-operand, but
> the destination register must be the same as one of the source
> registers.
> 
> We defer the decode of the size in bit 28 to the individual insn
> patterns rather than doing it in the format, because otherwise we
> would have a single insn pattern that overlapped with two groups (eg
> VMAXNMA with the VMULH_S and VMULH_U groups). Having two insn
> patterns per insn seems clearer than a complex multilevel nesting
> of overlapping and non-overlapping groups.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      | 11 +++++++++++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 44 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

