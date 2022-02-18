Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD24BB865
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:40:58 +0100 (CET)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1dB-0005Lv-MY
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:40:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1at-00039E-3n
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:38:38 -0500
Received: from [2607:f8b0:4864:20::b29] (port=44851
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1an-0006o1-Vi
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:38:32 -0500
Received: by mail-yb1-xb29.google.com with SMTP id 124so18898905ybn.11
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G/VSXKZO4kk4KttMdl+Oq45G8UpP7pW+r2icGfXdWIQ=;
 b=EopMrW1Q26PeWHIJcoJueTh8kp6r83o95mVK13LZVmPjAZ0KZIocwy7DKKRTPXPWBU
 zxfqxtjpWSCkM6erFvl+GyE8aDq4YcPhwoMG6oiof8ORl4dNRso5ikdTBQnQdGUTwviv
 ODdjcdBjh4P94d1fr6emWs2olli5ZCh6//SxQFRnSw2ipqctuBBJpICFahVrhEwV8SSM
 MACSc9Zofa2UwPWwawsl/SxgRsP6zzVxFd7dxBA6rNCElJmRXGfewqn3OYSXHCeON/KM
 3yIEpHvazgc1Is8HM0LFV0T3v3UAeK+CEmqU+xG0pLefVCCi1U6JAP9wiDtIShlHlrZY
 coew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G/VSXKZO4kk4KttMdl+Oq45G8UpP7pW+r2icGfXdWIQ=;
 b=VZl/WPWZFPlFPqykW/ejztKo5kuWXfIBc7CnhueKw6vaYrWE6GaCbX3HAMtnQRRCeW
 3eJ9nnXa3rW+rdzL/gPm8pp07ifklYKfbxXdniWYNDN8RGRtakwRoQSjUzys3wEoQoJA
 R6Sca1CZQp6jwNxA/xF+cf/9KN+xzasukZ32oJNYqJBH8pEmDnagHUhOQTj4Kkh6sIbp
 et8Zr5GNkLJKQXdInHFlcwOVPis/IR2XhJvrP3mK4nz8OiW+y98QBQGnDbOjF4Qyt9co
 XKuieCPRaeHwYZ655HTPOXJsQPVmbnL/21Qdd9MU7jlLWdbfZjFT6YobvT+8pef07dw4
 5AHg==
X-Gm-Message-State: AOAM533sqTtziu8M35I3k5kpu8coIDiwwo4GYhGv/XFO9/8eL4Y2E5wb
 /rvrAjArGY004W2q/2HgWu1j6D218rCCU8kPex2wHdPNm7s=
X-Google-Smtp-Source: ABdhPJzQPZkBzztA1Mndypag9uAUeb1B5coK5ZVqj/CkLgr3HJ7xGmUAvHKFX2gLwdqK8cOTM1OU++jnkTdDTWxVkfA=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr6918346ybk.193.1645184298206; Fri, 18
 Feb 2022 03:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20220117145805.173070-1-shentey@gmail.com>
In-Reply-To: <20220117145805.173070-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 11:38:07 +0000
Message-ID: <CAFEAcA_eFitfKzarU8XS+JT5m6uhGMecQzWjp9wruFBByk+oog@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Mark remaining global TypeInfo instances as const
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 15:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Applied review comments:
> * Mention the sed-expression used for the cleanup in the commit message
> * Have checkpatch.pl error on further non-const TypeInfo introduction
>
> Bernhard Beschow (2):
>   Mark remaining global TypeInfo instances as const
>   checkpatch: Ensure that TypeInfos are const



Applied to target-arm.next, thanks.

-- PMM

