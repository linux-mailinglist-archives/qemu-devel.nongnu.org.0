Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193594CA7B6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:14:31 +0100 (CET)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPkM-0001zp-6g
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOY0-0008OB-8w
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:57:40 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=39684
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOXx-0003kY-Sk
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:57:38 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id x200so3157424ybe.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/fLnMeGQoBQXmlxvDP3kT3OuJXDsten3u81oa7OhT0=;
 b=OWnJ6ggjmKOOBlpenDmxlcaqQ8FE4ea0xEMA3uD4LuQKXdnA18EWA2ySyx7LJRAooF
 l+armW4sxcb3W10qKwLu9V5tx/ANTwX87MSPNiTmjvXKkHbIUco/HlWWb8uAZh1uLFPN
 GFvC17LT4lBHDyv5YAanqBOBZvSQwU4XXfam7c+3pXN0D5YThu5quN3Ldv39ns+7/BFg
 Cc+BbYx4eIvE5IKGEOU4OmsRV72Lawss4utHtXbQZfXYgwz4TPgf7isdq671UnwjfjC0
 P77nrz4ro57+nnZorGShJsOXw5IN4MGFWbt/cgdeyzkZeAfAa/rqxsUWq1b0Jz2NGBrB
 UGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/fLnMeGQoBQXmlxvDP3kT3OuJXDsten3u81oa7OhT0=;
 b=pKHudg8B/unaIFFlO2bXdRKAaTI9tJ8Ja0TrI7n7kygpLSD8t+m2CISrSYMyJNWZSQ
 TRP1JiXVZIRzXiF1obD8ODUqQCCklmkbWC1o5qVOcL8LbbeGWiLs5GO9oapKK7hm24CU
 efY51tuWwHUQ3DFsOXKQShdCY+tgQEwJb2Vm5mX+XiaJoZ0I1twhYXzhkO75OhkE8Ko0
 wu5KW1zz5kZrUWCQkM4brCZ1i2JnOaTSaR5zPNt2AAqH0yOvfigmdf78yOWnaXB1OAaE
 04zgJeFKjKajOcxyseiM4VpI65JZXxGPpknt6bdpFCEaMtCXL96rzgPTXzzet6daGVbM
 qm/g==
X-Gm-Message-State: AOAM5334QwxNG/xzMl0MUzHzDoZgVnoOfF4wZc18qH2R/01NjqcHemeK
 W02dv6Db/K0Lbizh06U5GPprWgiTO3CEFBvQLqBQB6S9d90=
X-Google-Smtp-Source: ABdhPJyf8rz+ekWwFi8ISGVj5uzUoOrmQV74e+qID66kr9rXZFS33se9cptEmxk40CSdtO8nplDXcNEFMjmyl6t8r1Y=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr29208633ybq.479.1646225856853; Wed, 02
 Mar 2022 04:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-6-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:57:25 +0000
Message-ID: <CAFEAcA_6g6NNxHZmWcxXhSe-TtPZrUemQhB+DdCCSR9YcyC=hg@mail.gmail.com>
Subject: Re: [PATCH 5/7] target/nios2: Split mmu_write
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create three separate functions for the three separate registers.
> Avoid extra dispatch through op_helper.c.
> Dispatch to the correct function in translation.
> Clean up the ifdefs in wrctl.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/helper.h    |   4 +-
>  target/nios2/mmu.c       | 180 +++++++++++++++++++--------------------
>  target/nios2/op_helper.c |   5 --
>  target/nios2/translate.c |  26 +++---
>  4 files changed, 104 insertions(+), 111 deletions(-)

You forgot to delete the prototype for mmu_write() in mmu.h.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

