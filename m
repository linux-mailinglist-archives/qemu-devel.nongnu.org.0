Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F19316393
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:20:20 +0100 (CET)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mbb-00016S-BZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mXZ-0006ZJ-Fv; Wed, 10 Feb 2021 05:16:09 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mXX-0005Ia-VK; Wed, 10 Feb 2021 05:16:09 -0500
Received: by mail-yb1-xb29.google.com with SMTP id v5so1469877ybi.3;
 Wed, 10 Feb 2021 02:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FiMaCtVtz9ADarc4Vy0keuGHymmuBmbE6CBvnm5u8EE=;
 b=jwG8pE0MV887CX8t5ExeuaoM5r77MrhBMbN15RE+LwGyAXHGZ1phNDAzmm21nUDmIS
 obIel1OoCRRbjJk8PKx+6tECyJpQ4JD08w1QaFkvYeUV7+4gAiaIf4YED1s2gEdmBe7w
 86FkjrM1CjtzKNSH0Bl9FGmXRYGgqFTR9gKksSyiWr1bEBfVwhaR3epxHJS1cqgpH2Jq
 xj0JNezmz0TqLAxxjSL5Pjzmr6BBqHR2o6V2eJ6ly+6VY1oZWiQDh2uAEh3UVDTGpZBn
 zvXOOeiwlAm3TcYLr2cl9ZMQ4OhEQnNLchUq5sf2XP9WzSKlhS/yJ36hfLespenf8GVr
 CmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FiMaCtVtz9ADarc4Vy0keuGHymmuBmbE6CBvnm5u8EE=;
 b=f0LRZgmEMD8hFyHqMDdJEVmmTwZPFNyUaBMffF2IF/9wQJRdud1H47tVS32ZWn9y/7
 y2+QoqC+RwmMOFxgwEJYFXEWTQMzdbHxhRIDpzDuqxRyExq2xSBb0KWgt+3eye8NEDjy
 mB0nb130vC61toWrK3nIHBK/TrTKxA9MJrfhDtc8/nOVyMBKsZk/FLgRBv3lLOyHJyJ0
 FSE9pgb5myJwyaBrk6aDGpRAIfxnWQz3M7wCGSLEDyBWck/ULlRb9lCkQvyYXC4VlVMk
 zLSPpRe8LaEI3UrRsN8y/qU9oatuUPzV3ErXLIF7+qcjBeu+JMxlOqh6DjP0SLJQi8FR
 sOiw==
X-Gm-Message-State: AOAM530gpts1N9Mvwl+LjD/LoWuueymXS7LTlB283KTkKMKELoOLscut
 5u6+mTrx49jbQC2206oM/jEXkRsYVn1mSkakd2U=
X-Google-Smtp-Source: ABdhPJxy3Bq6+HxNNk5q2yc/LmxtjkOZXB8uiAlv9LSaRqdoYjSg7YusWPg1fy45AQUbWH0gf+qk9bYww8IG5kjZRvE=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr2900458ybm.517.1612952166677; 
 Wed, 10 Feb 2021 02:16:06 -0800 (PST)
MIME-Version: 1.0
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 18:15:55 +0800
Message-ID: <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
To: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, 
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 5:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Current QEMU HEAD nvme.c does not compile:
>
>   hw/block/nvme.c: In function =E2=80=98nvme_process_sq=E2=80=99:

Not sure why compiler reports this error happens in nvme_process_sq()?

But it should be in nvme_get_feature(). I will update the commit message in=
 v2.

>   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          ^
>   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared he=
re
>      uint32_t result;
>               ^
>
> Explicitly initialize the result to fix it.
>
> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)
>

Regards,
Bin

