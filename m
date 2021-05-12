Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658AD37C2C0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:15:05 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqZk-0008SI-Dy
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqYM-0006iP-Rm
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:13:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqYL-00065O-8w
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:13:38 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a4so35562443ejk.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrwVdvn48w9E3gd3L5oybplNbYWFyHzVuRtoDmaOcgQ=;
 b=s9H1yOPU1Y2vIWdG1zUM+aoKbvBbhEjYueJaV02cszVRRuXsFB5sPEQHf1pwURRAaQ
 J6sQCXSdsQos0zb1ziCCyuqXVj9Ex6B90wQ3hzonH3GIuFnGrbQCOC7yiFBiarjnrni1
 iEj30axugv4iMDUPkYOCPoqg5y9h5Ix/0FyTymv86QOEqiAqiDxhPXAfmcvCMCUAO85d
 JAFj5YDVxjaq3VtaMUq5ghuWMZTE5Dno2EB+U8XFdzFjVbP3Vg9CO9kEvoI8Wa7QuEpb
 TU64VOXM3f5n0GNxMMReN3iwp2kAfecMh6uB/ME7MPZsMgmxxCBiRjh2HYCoGXnGQbnN
 iyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrwVdvn48w9E3gd3L5oybplNbYWFyHzVuRtoDmaOcgQ=;
 b=m7GsJV0/IvTzkhwPly7RRm1cqvEE7p2GQleUAhjUcZfHtV9CMELQtMfZcA/p1ELxob
 gHmR+MKo1o4EfZV5DiL6/mFdNQE0ZC0zaj8LXjy6ZQsLjiCHz7exLEFBnWC2LQbPLMWT
 VwxYGwNfHa71UWZ2ackPQlWzkg7i8l3zxCDToHbOm1UD2Cr44OdKMzqg/igej2K0rXU8
 YnhuWGrNT26xA8FZpGilfjRuDH5JX8pNRbsT6ztcczVWOsIUDmiquz7zNuaLtsmSVAmm
 wHF4exw61L2XfRqAOAd0pmhCY7z1dv34U4o2k3zdS5rcqrbsds2GXYgYsRz4ZzBvxnqv
 rJ+A==
X-Gm-Message-State: AOAM531MZWWvz2O+uh/J9Ch7gn4yjKNZZjfZE0nWstJcD8Pt9ei/itp3
 4c8o0J1Z9+pLrR4bMbe+VcvGApkr+tJPOiB/YcFFzA==
X-Google-Smtp-Source: ABdhPJxCW6sg7YbvRDwDO6AeCE5A1/4X1hh0GTxocKN4HHAc1HZZtTzPesfDidMDLAbHR3NmjvG6vite1gAI4S7JHgc=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr37798526ejb.407.1620832415544; 
 Wed, 12 May 2021 08:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-36-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:12:22 +0100
Message-ID: <CAFEAcA-kXzyFjACPN+5RFBWZ_cyj+8=4iP59NDjhDm7Dny2==g@mail.gmail.com>
Subject: Re: [PATCH v6 35/82] target/arm: Implement SVE2 saturating
 multiply-add high
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> SVE2 has two additional sizes of the operation and unlike NEON,
> there is no saturation flag.  Create new entry points for SVE2
> that do not set QC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  17 ++++
>  target/arm/sve.decode      |   5 ++
>  target/arm/translate-sve.c |  18 +++++
>  target/arm/vec_helper.c    | 161 +++++++++++++++++++++++++++++++++++--
>  4 files changed, 195 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

