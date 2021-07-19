Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B813CD06F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:17:46 +0200 (CEST)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PPF-0007hk-LC
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5PME-0004oa-Re
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:14:38 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5PMC-00084O-1Q
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:14:38 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ec55so23032051edb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4jOcIpf61ZDZCFpPReBm33SHTzRPUqFt4by0v9sMBRA=;
 b=CDyuwJw0GLt54JbC6WtGZByCrj3WcsbKi8xoaWBjtlYPSJJVyIhcOIkn28ns6xKCAz
 j83BJLWViiHLYUNz3eNnskh9SaTPqQtjktaG9c4TnrJit5hggyJEkRSgI7ba2Z3szAhJ
 Mw2ZRgRIXTrvRtm+uCh0/x+lMZ2/Tcy5tYLSJGsVKOHk8j9GDMmt3P6vKk0Zc58unsVU
 defeHcJ6MhqlwzJSRyrl3/vlUKMklEcfwWeGsTGr7AnxlGG28kzb8qD8JEXG3YP1zqXr
 rf0VrpA7KO+kZZVUZ/DNElcDNqEFEv50KCO5YZcQh/70MvQPJJaTjIZHqQbFVSr94JJj
 VPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4jOcIpf61ZDZCFpPReBm33SHTzRPUqFt4by0v9sMBRA=;
 b=XXyeeCnNZKobS13lKp8uKvcGlQFG8bMhdmeiqA860Os8KYxoBZoh6UmiipKjDGWPET
 zn2ncWas4ZfqGlzm+/24xMk283TK1QTDHhfTyfa+z7Lo9aOfUVuuMVEW3UaOctGcfSDa
 KGP7tUbXVKtwBzSFxNWhYSkXdmRnLO3lBYkwfYM/cmxjWxLe5Yioufynbl7VDU9vo7y2
 MGYJBL/zohjaqi8oIyLOG9Jm4Lxi2zn8cD1axoGgZb9OVlF6921f5zCBkGjZHpxXqz7+
 QCF7I/ZvYhVfWSM2vry13npw6mG76sDFfcBewPomW1CEjq7LavIfT/WoaV6pdXlL7XaV
 Iq/A==
X-Gm-Message-State: AOAM532VIYoK7fJH2c7SHcBTuUFtsxesmE9NBqTUItBHcco6V756ggor
 I4Vw8yIYvUrRDIuItDKFSAuW6jwzW1XB96/TDPEzRw==
X-Google-Smtp-Source: ABdhPJwRWQbODw3f1wZXF/jLRu1lCmv8kIUY4OzEoOh58hQZnwIQNmtIt14bnnhXo1vqZ+S49bp7JdqL7ylXuSJGOqc=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr32738319edp.251.1626686073123; 
 Mon, 19 Jul 2021 02:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-2-its@irrelevant.dk>
In-Reply-To: <20210714060125.994882-2-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 10:13:52 +0100
Message-ID: <CAFEAcA8cynksH16VXGGUp5wCi_J1wsATa0CDoc9E-uRfDuzNzQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/nvme: split pmrmsc register into upper and lower
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 07:01, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
> make up the 64 bit logical PMRMSC register.
>
> Make it so.
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  include/block/nvme.h | 31 ++++++++++++++++---------------
>  hw/nvme/ctrl.c       |  9 +++++----
>  2 files changed, 21 insertions(+), 19 deletions(-)

> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 2f0524e12a36..28299c6f3764 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5916,11 +5916,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              return;
>          }
>
> -        n->bar.pmrmsc = (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffffffff);
> +        n->bar.pmrmscl = data & 0xffffffff;
>          n->pmr.cmse = false;
>
> -        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
> -            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
> +        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
> +            hwaddr cba = n->bar.pmrmscu |
> +                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);

Don't we need to shift n->bar.pmrmscu left by 32 before we OR it in
with the pmrmscl part?

>              if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
>                  NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
>                  return;
> @@ -5936,7 +5937,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              return;
>          }
>
> -        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
> +        n->bar.pmrmscu = data & 0xffffffff;
>          return;

Not an issue with this patch, but why don't we need to do the
"update cba" stuff for a write to the U register that we do for
a write to the L register? Does the spec mandate that guests
do the writes in the order H then L and only the L change makes
it take effect?

thanks
-- PMM

