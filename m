Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3FA3F2979
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:48:07 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH189-0006MP-O7
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH173-0005hf-G4
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:46:57 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH171-0001jD-P8
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:46:56 -0400
Received: by mail-ej1-x631.google.com with SMTP id lo4so18949467ejb.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UZXJZZTCLUPQ4+vbivQ1//7lHHf6qPon9XbJrJZb/8=;
 b=ouWXCuHxsE7FY/MZTmKJ9gVqOmIEni0j2YyLlcslgC322xROr6L/hg7D9TkM+cvRra
 3frLLKypYZmgaW4ineXwHiSSjHxSWbQaZw0XMIGPYkvHdttOqeUU/0NHGs64ulAO/48g
 xSsIwEsEvP/flVHggQcXOsAlHcK8dWW/tUi1RkIPVjVVDgnF1gYTZ2B1HSgr+gODVkk8
 t1VFWT1vNkuxfVQt8kVul+NQ03LMPt3KBsRLSvWh/1xR1W9HzEMdCbgmR38vK5uJrTor
 FVCtC9xmGHbYYa1RjQSu33ScixJR6KvOOH5TQdOautl2zMbCkb4EZYkHfenCW1lDFVT6
 gE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UZXJZZTCLUPQ4+vbivQ1//7lHHf6qPon9XbJrJZb/8=;
 b=eZut0G+Ww0FJSO5BxsbjZH0ZIbnz26ngJIsGBvmhTD4RVN10A4QcYZPRqc58KAU3dn
 lP0qV5MRZFf4Q4HUJyE7mCUNmAtaDKHoW2gsnErWP5tmZA78hJdbOIZgkgvInSZ13k7k
 QJ+E6yAD6h93wHU9m9TAYEx6PbpTvXj00bMuQp7BxAY7LJcSmnyn7ZlFoGB0+O8dqgz5
 Nisc2NIKWjMpqOtjtM+gUivHOwAXsQaU4rpnPrK6Leef47HGcikQZUPO59Bt9Ngi8/O5
 7UtuO6ilraaBL+1vyob3aASQrC9/soue675CoMmyqQJF0fjPW1y6vLEnYPC8dNZZaaE4
 ZRCQ==
X-Gm-Message-State: AOAM531jtj2uzpx1qsyaScBvyoQpXMQFvxBMrJdBaOu7zWoYBMi/221H
 BjRf3p/QHWYOubrn2jYzUXFsarmA+t4Z4RMl1NmaMAoFM2c=
X-Google-Smtp-Source: ABdhPJyXHmYf7AYEChLxycBy90qqzqS0bGrtxvx8YpBMSO6WxbdvV+ehSQXfIavgcRqJabGr7WzWhF5uPknwJ/2KsjI=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr21047110ejz.250.1629452813886; 
 Fri, 20 Aug 2021 02:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-61-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:46:07 +0100
Message-ID: <CAFEAcA9XQQEyGiwGgTSOz+2WshvT5DaUzgKxVCJvioN8jq92PA@mail.gmail.com>
Subject: Re: [PATCH v3 60/66] tcg/aarch64: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use load-acquire / store-release for the normal case of
> alignment matching the access size.  Otherwise, emit a
> test + branch sequence invoking helper_unaligned_mmu.

I don't think this trick will work for a CPU that
implements the FEAT_LSE2 feature -- section B2.5.2 in
the Arm ARM DDI0487G.b says that if LSE2 is implemented
then the CPU either must or can make them just work and do
the unaligned access.

thanks
-- PMM

