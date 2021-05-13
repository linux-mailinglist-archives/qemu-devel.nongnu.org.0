Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB11237F5BF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:38:14 +0200 (CEST)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8jN-0002gP-R8
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8fK-0007KU-VN
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:34:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8fJ-0003Pm-1Y
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:34:02 -0400
Received: by mail-ed1-x52c.google.com with SMTP id l7so30478154edb.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sCRe0joRx9GQPPIp+TsMdwedfIpJ8Y55JWwdgqY4E74=;
 b=VP1l7wKXWofqXummtxGDVsTA0KqGmUFqi1pDiWB6UzroGlQPK/o0y2uTmdq2NAQUfN
 BafLW0rY8aYlyBLTAIybecNJ3HbW56kMHQyGK+aZAH3RPoRhBmsNEfUkYlvi1KZvycUq
 t25b8drCtsjy8hoON/Lhvl7RlycMctVsbLnSZ162OeHlXwRcp8ylK2kq26q7yrfb/suK
 xyBgoP9ZPscakYQwVRknFKIpkYg87YeQVkEWPJCgA0L3HlZRK1B/rykYVGabyhWDmqjC
 LOaswCLHJZk4Tm6pt+zUvEkZnjuGn9kEr2tCCxrjurOXBsOorkgoMLY6n9OTjx6gZb6n
 i0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCRe0joRx9GQPPIp+TsMdwedfIpJ8Y55JWwdgqY4E74=;
 b=bCPBfnFMSFiRuoGRYXIMkZupoYvHVdMEX4/kkwyJW7249YnMdO4DmEQTkqV7NN8vr+
 fmx67kbiY8aYQmJNdtJ1cX4d2PSISGxTGxThvlWQxjxCd3u8av8jN1XBELJomT5tNDpx
 0ZGLjXNM7jyA51oC4ZOzGvOv6Co2QfcjrjM5TGhk1r2Lz3aA5ceGV00OKli/AseFujV3
 TQy5dqy/LO4EOj3DbXE1uLNqiyySJZPkgaNrSpzkQsYzBLN+xOxQim45/fq7R+T8I/XN
 LhhQmsmUNhowIj9UgnGFxJj8IbumZHPo1KSYh+85ME7KFXj1x/Vdrv7v/PVrFq2a6ppY
 Pw5A==
X-Gm-Message-State: AOAM530b77u4lNS8Dv6dLFx2Lpw89aWYUI4tZ2HbD0Ol7vFtJhbD9pFx
 V513W4uYqj3J6WlVkuj9/HXsCyeytCjbtrwxNpSszQ==
X-Google-Smtp-Source: ABdhPJw7XUBXyemCbW8ChekZNUU8OXm0GkehG/POq+8UcSKniSzFmqui0t2MnrPthDZDiDA+TsS2o6y2O9fwrxdh3nk=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr49497232edv.204.1620902039160; 
 Thu, 13 May 2021 03:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-46-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:33:47 +0100
Message-ID: <CAFEAcA8UPq07jVOXz_uwAWZwmnUSLOTwV6AzOyQjuMaQr-EKXQ@mail.gmail.com>
Subject: Re: [PATCH v6 45/82] target/arm: Implement SVE2 gather load insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
> load insns.
>
> 64-bit
> * LDNT1SB
> * LDNT1B (vector plus scalar)
> * LDNT1SH
> * LDNT1H (vector plus scalar)
> * LDNT1SW
> * LDNT1W (vector plus scalar)
> * LDNT1D (vector plus scalar)
>
> 32-bit
> * LDNT1SB
> * LDNT1B (vector plus scalar)
> * LDNT1SH
> * LDNT1H (vector plus scalar)
> * LDNT1W (vector plus scalar)
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

