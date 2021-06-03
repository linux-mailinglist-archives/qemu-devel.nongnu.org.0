Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571E399EFA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:31:52 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokdj-0002bd-Bd
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lokck-0001fy-Be
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:30:50 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lokcZ-0000If-CL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:30:50 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ce15so8481790ejb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0BP2ff03ZPP7dKcCglzKrplPuwWosa6ih9W8QfTk7g=;
 b=UYN5LcbHBG/a0wFPIbzZwxHQ1ztjlAem3p94M6FHw5/EGeEu/hksYUXv/7o87+CdHX
 MeFmUhC+DRNiiYS3V/yAFyqQBhaRJFYT942mp7hdekLDBneI2mXQ4pub3SHPnEXksuc7
 2qy3KbZxu8+6n5wurMkegQ3n1WHA5rdeU2qSjU4Hoc4LLdiIIFZJhbtCxL9KZ/YFy7Dt
 sM0TIGCsarVxggzQUMmcuPlYnHWljdKkos8AePiiqdWFWj+fXDZNWcgyVrV0FQNGcZnm
 WYukoDRfjSfi6Hye7BXoUXqTAoIVmYfmnm3V/pp/gXykE0Q48GO/uOX1xLrCcc2xvMVB
 HsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0BP2ff03ZPP7dKcCglzKrplPuwWosa6ih9W8QfTk7g=;
 b=nEbmDfLJG9IW71Tm2PIO/vg2jEWIMDaFBKeAvNOW9h7KIf7lvkjm1qkL6yAchB36AA
 R3P27aImILuhDObRgsj3lviEjQ8h0CdqytIszk912ROqG7aPy+LS04Vi6ro1YprmTaKe
 DSCLRWqXXHQH87Y4KZ6OfjPAtV7OnHj6eIfWSlP2guk4joLOH3y6JQE1j6u5m5+yceDg
 V2Ta2j3VKui/IseD/CJCVzAjms5m02v/6OMIW9D8LQxn4VKNcSrmXx8cnbr4unt0y1ME
 Amhi0ce3cmpEU23JiOo3BUpWMnkgQ2fh0E20gU4pEYWsBnCmm1wwz9D66fZrdMcUTcz3
 QsUA==
X-Gm-Message-State: AOAM533ctMc0gRkRzswbattcmjHBLxw7UQoEJWqZNAah52U5e6v6sL4R
 Dz0SXgG7RTo2w862EED9lpP9FJ9RgjamW47tM5VF4g==
X-Google-Smtp-Source: ABdhPJywt1Jp5LUF10n+zh6GvmFxBK9d6vFAWVx/sh4IdcA1a4em2jJjYSEMdTbF2phHzd2lkNvdgtGZFV1rLEaV9ak=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr38047017ejb.407.1622716235273; 
 Thu, 03 Jun 2021 03:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210526121847.1935454-1-jamie@nuviainc.com>
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 11:30:02 +0100
Message-ID: <CAFEAcA_ug=+-TjUUy3oRcf692ehC9eg95U=kX5wfcsKdOCNG2Q@mail.gmail.com>
Subject: Re: [PATCHv2 0/4] target/arm: fix missing exception class
To: Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Wed, 26 May 2021 at 13:24, Jamie Iles <jamie@nuviainc.com> wrote:
>
> Thanks Peter for the suggestions, I also added a patch to switch a
> couple of cpu_restore_state+raise_exception pairs in stack limit
> exception handling for both v7m and v8m.
>
> v2:
>  - fix raise_exception_ra to restore state before raising exception
>  - remove redundant do_raise_exception
>  - remove now redundant open coded raise_exception_ra from MTE and stack
>    limit exception handling

Applied to target-arm.next, thanks. (I tweaked a couple of comments
and commit messages.)

-- PMM

