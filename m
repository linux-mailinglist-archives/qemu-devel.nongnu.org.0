Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4312A653398
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 16:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p81GI-0003KW-Op; Wed, 21 Dec 2022 10:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p81GH-0003KL-7g
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:44:05 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p81GF-0002br-5o
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:44:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id f3so10660895pgc.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 07:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5dX/EIWEZOr8Em8VAHuexUlP2J2OT1elZYg9YtTj1Y=;
 b=Meg5EymIHhoR7DtN07Oqd60oQ5avqFQcdnUyHBkIYztn0Bm6L/VwdX+oUqF6zuqSVQ
 6+K2Oe6BuGv+wglfZP9FqolFb4YL6e9H6IAwVii4OEknB5rmRTDamJ48YMsUuYRZYqFp
 tybf5YZCx6asYESwTSDzOU3hSwVOmAOD06qO1dJh3P09xd0zAjpO1A8h54hopwf8LIom
 1J0r4NgNv8QuFPepVFw8DdB2E67Qtg8nBJFOIPGv/S6Ny3cDfcZSl8Rst6ZIwvXT0U8V
 FSSeTrU8EqQ6QY+tSKLvtEuxok2ICOeDM4MtWfID4wfs/q7uPnke7qhIm8G5PRY352qE
 Apqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5dX/EIWEZOr8Em8VAHuexUlP2J2OT1elZYg9YtTj1Y=;
 b=sS0caM0s5Y4odZNZW32SEcFA8RN3yCXWYhtlWXvbTl/9oQA25y4PmOa54Rjlx+0Y5e
 5BJGG/82/CTzLaiZDiGjzY3rcu+gZJgtNT9D1IHyK2Iy65l0zi41jbUk94q942L8JMCX
 Tl4WX7Qr4u0dS2501K6ihBA2PJXMtEGZnvQUe+27KRJfLxb/Vm20Vp+ElffEe38Cl2oB
 vqli5JMvrH8nzBx6QbrQskadq2S2cuy9y0r6zn6GA5dEYtYDp5/zgVs6tWj2VPfAMamm
 2akBuGvhM96UkWem3FXgVVzrtwk/OMYaAW12eBOu9FOCLWq7iLpGtl5xuyj/6ezqbMuM
 zybw==
X-Gm-Message-State: AFqh2kpGEBpZbHfiYzNGil0mp1oxO12ExPpih0Kwm8J6g5cKumUZghBw
 qSPXF5VDtyc3lclXYePPdn1q4qJNB4M3VKRxSIekng==
X-Google-Smtp-Source: AMrXdXtxuSAB7nWOHtjydHJRy6uXZ/GBwu1K47T2MfaC5VGBmEKfqSd4ZAQHfjUXIn6+e7I6qSMyYqTFzbkA1k6wUc0=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr128242pgh.105.1671637441662; Wed, 21
 Dec 2022 07:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 15:43:50 +0000
Message-ID: <CAFEAcA-WqcNAyPuP63JO6HiOvFJPGRSu6Unysfkktuj_hxYiVg@mail.gmail.com>
Subject: Re: [PULL v2 00/14] accel/tcg: Rewrite user-only vma tracking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 21 Dec 2022 at 05:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 8540a1f69578afb3b37866b1ce5bec46a9f6efbc:
>
>   Merge tag 'hppa-fixes-pull-request' of https://github.com/hdeller/qemu-hppa into staging (2022-12-20 15:32:27 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221220
>
> for you to fetch changes up to 811242654934bd4613634235ef6a8219792ab088:
>
>   accel/tcg: Restrict page_collection structure to system TB maintainance (2022-12-20 17:11:12 -0800)
>
> ----------------------------------------------------------------
> Use interval trees for user-only vma mappings.
> Assorted cleanups to page locking.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

