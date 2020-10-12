Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D328C3C6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 23:06:43 +0200 (CEST)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS51m-0000Sr-1H
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 17:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kS4Wq-0003JB-Fm
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:44 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:35605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kS4Wo-0002nB-Q8
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:44 -0400
Received: by mail-il1-x144.google.com with SMTP id o18so17211713ill.2
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OI/+eHzIyJYt8c4T3AdeNt7wPrS2BpKGHdtztzIHLw=;
 b=o0RhylCewc+7tpNZ0ijyjo/jWQGRgCKnMYv0KyNWInpVsTnpag/CRTR5s+CyoJ7XRC
 3s7nYHksjGulFtYnsmPiesSMsMrPCJeSN/iV2mS06OVbVmVk43dNwio1khG2G8hbrLry
 m8if+3srdby6fz+3UBvIenaHIe2rCtgpLKQIJ/439Ao8flqRVfcWGC497Eh5jGuji+fm
 Y0pH62YEyXepw9grPm1hzxJTL/T3TGt85mlpaMBTi0YkBzezx/iUtgQV3+04AaDti4yo
 Mqck/AmOyM0p/qCBjh2KCo6xWi7SoCSOZzm0A8RWBbdkyZq7fL29mQsRv8A97vShxGqm
 0ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OI/+eHzIyJYt8c4T3AdeNt7wPrS2BpKGHdtztzIHLw=;
 b=Tn6k1GBe/RX84yv1gyonePJb/6xKuzmQkHTmK+htdzcOa1wBJGHpQGdC/lboe63m3N
 CuH0kYXjWyUAEemfNponaO4KebrnX7+3WT4NvBV6cu8wjyBPNScPWCr3e2meyMzG7WDc
 UvrTt5NG5SP874g7pcS9MAw7ZYHUlRTACn5rb/q6GsSJzymxuYsX1LykmwUJ3IehQjnc
 /OszuzbUwTtQFgXGiOV8it0XuVRfmg7g1/gSlY+4FGnb5GWO0eHi83T1Bwtr8kE+WWcP
 k7CQeRzTJ54NmkVL5pWbsWo0SdB/4XoFPoOiKxbVp8wmIBxuBADcGuY5m2Wm+nJ1wUH/
 bOZQ==
X-Gm-Message-State: AOAM533HtxAR1xwJ7x17hn2gvluS1QMlORnLtSeBCghjAfpPyPc7RaZ8
 PWKWi2o2NPTJYNNHQqbyMD01SJOoFAmHodSmcFY=
X-Google-Smtp-Source: ABdhPJy4542/Q67ht2+UEwtSJfpnnJ5TUaSNA9B8i9sz+JzFnf2NOs/ub+RszBhCZ3cY2jMt4d0Uvnt9K0uFBg8YjGc=
X-Received: by 2002:a92:907:: with SMTP id y7mr471808ilg.276.1602534881269;
 Mon, 12 Oct 2020 13:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201012150356.79670-1-mcascell@redhat.com>
In-Reply-To: <20201012150356.79670-1-mcascell@redhat.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Mon, 12 Oct 2020 13:34:14 -0700
Message-ID: <CADBGO7-w7txnd6MHAY0ge3k3LRcn0FfGDU9znQU7qxQddJQT0A@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-dwc2: fix divide-by-zero in
 dwc2_handle_packet()
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=pauldzim@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: gaoning.pgn@antgroup.com, linyi.lxw@antfin.com,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 12, 2020 at 8:05 AM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> Check the value of mps before it is used as divisor. Since HCCHAR_MPS is guest
> controllable, this prevents a malicious/buggy guest from crashing the QEMU
> process on the host.
>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Gaoning Pan <gaoning.pgn@antgroup.com>
> Reported-by: Xingwei Lin <linyi.lxw@antfin.com>
> ---
>  hw/usb/hcd-dwc2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index 97688d21bf..91476fd781 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -324,6 +324,12 @@ babble:
>              }
>          }
>
> +        if (mps == 0) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: Bad HCCHAR_MPS set to zero\n", __func__);
> +            return;
> +        }
> +
>          tpcnt = actual / mps;
>          if (actual % mps) {
>              tpcnt++;
> --
> 2.26.2
>

Hi Mauro,

I think it would be better to move this check earlier in the function,
just after 'mps' is read from the register. Otherwise it can get
assigned to 'tlen' and 'p->mps', and who knows what mischief an
invalid value there might cause.

After that, you can add my
Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>

Thanks,
Paul

