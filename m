Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D401F9666
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 14:18:17 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jko48-00073e-A8
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 08:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jko21-0006Sx-OV
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 08:16:05 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jko1z-0008IV-7q
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 08:16:05 -0400
Received: by mail-ot1-x343.google.com with SMTP id g5so12910134otg.6
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 05:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jH+FVUcLyGZ8+p75rBAz48h/mZlYR0NcFtss6SMrdsg=;
 b=J9Kmpis0bRU9anee1/c80QlEwsCdXRIvA4fsM1sAbuJmfBj+OqRsVDTI68fHpPR/Lx
 Wo0pv7KmySacs1yNsEJdBcSLZ7TWFx6B9HjwBOERIlXxBZHuXlQjzxB68xezFqOgRoU+
 prfYM68i5WLbOrNsSOJj8EczWu4oTJWEiSE6J8ItLSKT/bmiRTsUhfL0xMXWNX20Wq6e
 a01l7ocgKz4WIk/73NFwmBfSDKrL5iUzIEgsi70kFASSR2khl8nHH3cDjeC22Qm2du3v
 cr8cI6CDv7U9onCTiI79kJY74+Wj8kaKg9NSkOV28LjS3OeKjXMlXBCW9NZmR35Nr5rY
 HfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jH+FVUcLyGZ8+p75rBAz48h/mZlYR0NcFtss6SMrdsg=;
 b=V6hKRHZx+BUTsS9lh+uq9Bsz978LiByy0zz2NsAQA8EFxjckoCClWWPyNZTHTYBWtY
 ClZdaa4uJRuz0Eg2gswOCIRX/+N7bltA/+AO9t8e7lQsc6zaZaKGpm4Lme7ytkcnGJMn
 KwKj7t24DYUWAM5FEp1L3NuBkasJ7JWxt2Km/7P2ovs25i6J8M4LS6Ob9biaN2sYjWsX
 VN7l+PeFVfhBENZV41ck18Yt0ABDDJLGQHwz7ZWi5xPl3ZclrshmS69IiaN1/2XrHy+T
 cXvZt7wnjpSQjUxf9iPt/B6+q8BJbQrEJY+AWD+Q4lHO6uUYN+oPp8tRbNAADZgwv+AB
 G89A==
X-Gm-Message-State: AOAM530Z2wkXOfCoe3JYFCmC6CGPL5/08E83pPsuEebGy1y9xJG8vIOr
 5OObbPOATPMI+kZmmLDkONTSDvEU4D/Aqr3klmuvnw==
X-Google-Smtp-Source: ABdhPJwP1vMgYIexUy5+aDAD/Z8j7wrHxgKKADEUrtUqaayZGQu+/vBymL3boHhM4SG+ZEx+glOBa4ayYvMno80Jtu4=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr20958370oto.91.1592223360506; 
 Mon, 15 Jun 2020 05:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200608121243.2076-1-fangying1@huawei.com>
In-Reply-To: <20200608121243.2076-1-fangying1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 13:15:49 +0100
Message-ID: <CAFEAcA-ez0aNE6ASFM1PXs_PaqAuBzOqRhbYVAmrEhooPzmP0A@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm/cpu: adjust virtual time for arm cpu
To: Ying Fang <fangying1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wu.wubin@huawei.com,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Jun 2020 at 13:12, Ying Fang <fangying1@huawei.com> wrote:
>
> From: fangying <fangying1@huawei.com>
>
> Virtual time adjustment was implemented for virt-5.0 machine type,
> but the cpu property was enabled only for host-passthrough and
> max cpu model. Let's add it for arm cpu which has the generic timer
> feature enabled.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>



Applied to target-arm.next, thanks (with a minor commit message
wording tweak, and the suggested-by tag removed).

-- PMM

