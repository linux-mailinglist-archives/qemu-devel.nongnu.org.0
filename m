Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556BB47064B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:49:21 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvj5E-0001j4-0f
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvj48-0000Zs-Bj
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:48:12 -0500
Received: from [2a00:1450:4864:20::42e] (port=40911
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvj3u-00038F-HQ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:48:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t9so15917439wrx.7
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46aSvpLgwbmRFQ7eYd1yyC5rdxtc/aKq+7Ah8gtQNZE=;
 b=KgW2fA4dq2vRYn7MkVR9N1WtAf64Fyn/xN3ZQTkcTISkiIxuazDcmk5o+YVmqgHh1l
 xrHt7O9cKbMc69W1s2KbzqPV1os0vwILoLXlLVN4LepObUAbP6ky0sfJ0r4QtLRu7itN
 83Fhs5k+xKJdbaFv46r29Wy0UjJLJhsW+CJaP5np3QPK/62OgtJju1qjX2jNKscaLk3Y
 Xp5p9B1qLpKCxoj/TjfQx8OomzEq7Bf6/Jwr6gMRhMekFF0FpFak/tmZ/9LGS/PEtRkt
 qiZRmicIGA5VMYErZ6vJs19hXc4T/txIhBWn7kZG51LHjt3EvsAZWRc4v1vTdqUXXIKS
 TN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46aSvpLgwbmRFQ7eYd1yyC5rdxtc/aKq+7Ah8gtQNZE=;
 b=0GWEGTACQqyhobrbTkIZ3JZX2z1EeDoAXAwemJPvOAc1TGhEllrzLfytM0vhQpsIM/
 bkzn4l8wHQU8eEMnMXKbWO76x8h1LjT1J2DLXV8vrwP6C/CDc6X1rSr0M+RYQVRhCGQH
 WgwhygplpiU6fPLPNqmJIO+ieUn8WwBKJxJZDgMkPv0uaKRUWLtQS7CowZmlGW2B6SN+
 f7Wn5f+GZPLP/O/zWhU662u9t1Q7I8r37BL7kqqV+AGmxWsvfWuhL1UCGOfxllu8n+KU
 tm7IaXiusKJlDdNK5NeqoZ4kit9939tzystZeslfQgfwhsqsI/1NVnCBfsrr2OO58Zxy
 CtVA==
X-Gm-Message-State: AOAM530BOTwjkIvgzFagg5BUnZ/0juJlCMwbHnoUvwmWwCMQ1uINAjzb
 Mgfft3IKQabxzrd0yNj/pNYH1OgnFVZop/iADkewDg==
X-Google-Smtp-Source: ABdhPJwhbkpvXVoLYyEnqn7oR3aNpKzlzd8BCO7agOcU1lpT7I9wq+0eGOmfbDcbU5KFY74ZlWh4rAv+GTKOaImiadY=
X-Received: by 2002:a5d:6707:: with SMTP id o7mr15618519wru.172.1639154874665; 
 Fri, 10 Dec 2021 08:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20211203221002.1719306-1-venture@google.com>
In-Reply-To: <20211203221002.1719306-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 16:47:43 +0000
Message-ID: <CAFEAcA-n+XSNM1h-VTAGxNiQwMtUr-S4N9x-yWifJr-pPTRYZw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc fix missing queue_flush
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: hskinnemoen@google.com, qemu-arm@nongnu.org, f4bug@amsat.org,
 kfting@nuvoton.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Dec 2021 at 22:10, Patrick Venture <venture@google.com> wrote:
>
> The rx_active boolean change to true should always trigger a try_read
> call that flushes the queue.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: introduced helper method to encapsulate rx activation and queue flush.
> ---
>  hw/net/npcm7xx_emc.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>

Applied to target-arm.next for 7.0, thanks.

-- PMM

