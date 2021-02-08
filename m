Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5144313FA9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:56:03 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cde-0000aW-Nt
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96la-0003JQ-FY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:52 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96lH-0005FQ-Vk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:44 -0500
Received: by mail-ed1-x529.google.com with SMTP id q2so18111189edi.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhdeYlDMJ0sr6Dnu/8XckT4/MgIlzGrOwTUsBL9D8Wk=;
 b=Iqr/xdSDdswrgdU6yCSZ4IAQ+rv/G2fpkHOgsFeFYheLMUnFd2WfDVn18GJeoBd8md
 0vDXBxInN4jeFHm/DjPjdNY1WMBYVoupInUglomVqJjLNl4RWeOxRxjjwi8RWcE3EPVX
 pioywOaRbH66fGw9+chSgpp9zmAXDygU25SolvlJ6VWCemWmDTHVMN9nIpnVG72Bmis2
 ZJQRBWxafEMs+H9kdUbGalkNhfAjMFoSXCdGxr1zeulZHcFLzgD6DahckXOeQ+HuhG7f
 oZarpe4ajGBX2eGrmG0P+Xytz+JZJoRcst3ywfmx2iIwGZjS+NLX/YS2XAltCBV4CjK+
 Vn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhdeYlDMJ0sr6Dnu/8XckT4/MgIlzGrOwTUsBL9D8Wk=;
 b=qg5qs7fU6Pl2tT3AqFsfdU+CCoQWgyWTRf95J8l+hYAkDzAua6ybZbLZawjg5ZKbDv
 NVEMe4FrHLTeIDqrl4Awba/kFy5MNrxZCncTGnbDppynqxWSe0o1rSxaHpYqn36X2z6k
 STSbq0SeLPPwUnPswrrxW5iFVG9ZWmTVaC00HtmgF4jJeqYff3YGOfrVuyFCmEKiGfd/
 c9tlvGYUfCjc1znU1huOuynuFS4M3T0d8x5f80bcBLt4k7TSmmVXrPBbIH942JYYeoju
 zpGsVulHyYCHLUfnMAhucCZm4a2MXb3f54wkV3BuP+nE9UI9L/gThB1bKty8qSeeecnx
 VoGg==
X-Gm-Message-State: AOAM532aqT3aMxwg0FWU5CtDLF6Ka4WrwPrBc96qo/ceEjSs8CIiAFdf
 IVDvS5e89uj23rafGEDT7KN7IllOkmm5mq4ZpFljXg==
X-Google-Smtp-Source: ABdhPJyKHO/ISVRwH/i4CaYPQ7phqdMrCaX/2tZNiTZBP8PVGhZrmGvLafMc0Nic7bTfMTIi88vvG8DGx3V78UcMfsc=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr17651896edc.146.1612791570115; 
 Mon, 08 Feb 2021 05:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-13-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:39:19 +0000
Message-ID: <CAFEAcA-ou+uQRCwXYNLc2fBem=sLR-SBYBdK5UzA2+Cd-DDCoQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/31] exec: Use cpu_untagged_addr in g2h;
 split out g2h_untagged
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use g2h_untagged in contexts that have no cpu, e.g. the binary
> loaders that operate before the primary cpu is created.  As a
> collolary, target_mmap and friends must use untagged addresses,

"corollary"

> since they are used by the loaders.
>
> Use g2h_untagged on values returned from target_mmap, as the
> kernel never applies a tag itself.
>
> Use g2h_untagged on all pc values.  The only current user of
> tags, aarch64, removes tags from code addresses upon branch,
> so "pc" is always untagged.
>
> Use g2h with the cpu context on hand whereever possible.

"wherever"

>
> Use g2h_untagged in lock_user, which will be updated soon.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

