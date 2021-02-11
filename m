Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E03189A5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:42:39 +0100 (CET)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAMo-0008Ks-Ur
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAKI-0007gd-VQ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:40:02 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAKG-0008Up-FV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:40:02 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lg21so9578276ejb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=57ghFSysUM66+eyX4VVr39NE87Z0OFzTbYVug/sHOE4=;
 b=eo/vtvZOMELpo5l3T+YQPMu5MI/VInYOUiyliueN2igFlDSV6XiwYlmC8fLK7wkmfv
 SYK4/4RGD9gJcr1q+NlH35RjAjW+PywT9yyR18R4agvALzUp9jIiZxuu75wZVWMGvnn2
 Px9NQpn7LHbXURB9X65oV7iG+lbxZ6Fal/TS2mv3jZ3ETjmpH6999W4GCBa6aU1WFryJ
 uCaYI7thbM7S/0KNwCG5eigWnqnSmcQvICjclwYSqc68tsB4SBG7CcY3x+ujixLSbt5p
 vO6SQ8ncod+TRNCJrdClWwC+SCjmk1Z/Uw+Xef9VlE+DI1MQ1Y1TYF5TuMlUdY17jgE4
 GKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=57ghFSysUM66+eyX4VVr39NE87Z0OFzTbYVug/sHOE4=;
 b=tKGo0ws4nHJOxhQMd/JDn475p7wbDwf8X1am/+bLJluDNH0zceU9upmfqkOsxcCVhl
 ieDLe1WabUT0b1w6xsnkYvVgT3h2kvKBc33E47KcpYsStlcGd4wKfKoF/9HfQSIx0/Mi
 ZSo1UfoXKb0BKMZc087o3je6ObgqC1rbnCmkLgcdmczVLOwlhD8YR99x6hTV3ZgzYExm
 cevonSQFgz6aygCxIGzR4rJD/m0BuOzaPE6WZ6ndLsRwsuloPnJIEiC1WwMGjbcs3eCE
 +JXf3iAZKwhvNCal8wl+4XCGs8MVxpgNdhywWjVg79pkDYZj0imeL/yEe4jrNzT2AvLo
 1QCw==
X-Gm-Message-State: AOAM533pMQN3Q95a6tdcWLpa6/pVS/+XoKcj4xm3KFJLy55+p8aMo3Vw
 FYatAQoUzRV0RkTR+RNkslrHrGXYjeHJcvKAW1ugqA==
X-Google-Smtp-Source: ABdhPJxlUPWvuOtioOyvo78m8P3X9Ytf4OMikh2orxbF5TTiZ78TcooRA0FdijMAeQxnZy1KAtDt/x27nGIbHiMg/dY=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr8346430ejd.250.1613043598941; 
 Thu, 11 Feb 2021 03:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20210210174122.410690-1-muellerd@fb.com>
In-Reply-To: <20210210174122.410690-1-muellerd@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 11:39:47 +0000
Message-ID: <CAFEAcA9Qa_+oxEK59FF0z1QdXsBchUpx6jYZRUTAnZEBVb49Zg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Correctly initialize MDCR_EL2.HPMN
To: =?UTF-8?Q?Daniel_M=C3=BCller?= <muellerd@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 18:05, Daniel M=C3=BCller via <qemu-devel@nongnu.org=
> wrote:
>
> When working with performance monitoring counters, we look at
> MDCR_EL2.HPMN as part of the check whether a counter is enabled. This
> check fails, because MDCR_EL2.HPMN is reset to 0, meaning that no
> counters are "enabled" for < EL2.
> That's in violation of the Arm specification, which states that
>
> > On a Warm reset, this field [MDCR_EL2.HPMN] resets to the value in
> > PMCR_EL0.N
>
> That's also what a comment in the code acknowledges, but the necessary
> adjustment seems to have been forgotten when support for more counters
> was added.
> This change fixes the issue by setting the reset value to PMCR.N, which
> is four.
> ---
>  target/arm/helper.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

