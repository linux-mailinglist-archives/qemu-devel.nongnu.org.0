Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189343CFAEA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:42:50 +0200 (CEST)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q1J-0000A1-3G
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5pzk-0006Az-1H
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:41:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5pzh-0004Lr-7R
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:41:11 -0400
Received: by mail-ej1-x635.google.com with SMTP id hc15so34413072ejc.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaxSE/Tn0sFAU3JeXWmiXJ7nyEukPq1x1GBDF474wRM=;
 b=u8JtSLTpwCxgbBVs4BOHg9BPfIrGLwI0rGG5WDpmfEGwMKf1HXolQzAC3Vl5o3WunD
 LywmDsOvysOVuRg7oU3uCLs1qzXeQMlSz0QH1dnL7t2dOtNu/tkFuMF4NkGWI0USlK3R
 XQ0XVTIKxN58wHi3GrLF3NZcOk2YPjxIxYvxueueDXe1XUInCs08vi0emxpV+nwVeu7y
 X7NPPd7I4XoaFCUFcGpgVom0+/ye+TqtfxPGOFJPzTK7wI12ozkwIe4bZYxzRuHyowUI
 2xCTJ95GH29AwDoG2iZOE4+xLUgYsLz437qbjSzIIqUKK0YjqLhk+1iXZP3raCWaym5k
 bwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaxSE/Tn0sFAU3JeXWmiXJ7nyEukPq1x1GBDF474wRM=;
 b=DCu3ILgyxRzNTsyOdW/pqPTZNZjDwMAa2unbfPNFvRE45zFZD3TUGTxCwwvJmcl/vb
 GIv/ELINsLeo0q4Mfp+F6nlPgwhdpiIjrPq0kvxq6es4T2E5qOFkqJ1ueWjuA4sV42Sj
 LFeb060XqNSBEI5sMOBMFe0MWu97Bvs57UcLI6761qKMUxr3QetyrKmMDvUQv3CTvn4T
 jQGhRSTQ+Wl5N+LiAs7N9ecll3FsR8w1KkiEUYrAUhNNqt0OA5TQ6cJ+xgZdd6WXIJkx
 ucaZ1SUxDRGU0bP+8bIT1zq+ov/xtzhWemU1Fwiej+YSeNx2WdHPRQLQAOdthdbz0Zi5
 CzVw==
X-Gm-Message-State: AOAM533Ake/Y5I9LYqU/JoIHJde+GP8S8sq/D/uz6Y+eKnqsbZSKjkYk
 zWvmMhdi0mOfa+5ytTfDoEbe18bWS+KYSUHpCjbfaQ==
X-Google-Smtp-Source: ABdhPJy++MRgkq217WXps3Da5fVA/L0Hp7E4neu3mIs1T1n771rnOWh9gucJZTgWO2miBpwhzED1KqKAR3H+IDcGogo=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr33401305ejd.250.1626788467425; 
 Tue, 20 Jul 2021 06:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-2-its@irrelevant.dk>
In-Reply-To: <20210719224647.68559-2-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 14:40:26 +0100
Message-ID: <CAFEAcA_i5NZ9=EcuT++7BzFGi-y-V9N_q-4pydmzrrSRfgoW3A@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] hw/nvme: split pmrmsc register into upper and lower
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 19 Jul 2021 at 23:46, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
> make up the 64 bit logical PMRMSC register.
>
> Make it so.
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

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

This mask is unnecessary because pmrmscl is uint32_t.

>          n->pmr.cmse = false;
>
> -        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
> -            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
> +        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
> +            hwaddr cba = n->bar.pmrmscu |

pmrmscu still needs to be shifted left by 32 here.

> +                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
>              if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
>                  NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
>                  return;
> @@ -5936,7 +5937,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              return;
>          }
>
> -        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
> +        n->bar.pmrmscu = data & 0xffffffff;

Mask not required.

>          return;
>      default:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
> --

thanks
-- PMM

