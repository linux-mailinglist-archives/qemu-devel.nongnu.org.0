Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A731405C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:25:11 +0100 (CET)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D5q-0002lR-Oc
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l996e-0000zA-Fs
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:09:44 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l996W-0003oa-Rf
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:09:43 -0500
Received: by mail-ej1-x636.google.com with SMTP id bl23so25680763ejb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBL+iBqHXGYjonafPDBFl9xB9D/yN9WRBAgbiTal3gI=;
 b=yMXfVh5ipbStj6RqjbWvuJyN+Iat4SN3yQDmgCBjTdgg7qCZWo6OYh+SEyQMLbxX03
 qAsf2OLGg+PNDImbbDjzCfpWE5IlJe8043r0feNhTSU9kWEJdXIDCWFUKBgqkiOcx6gK
 Z8nsN0wWf4UuOJsbFGhzI4S5C1/KlkzRFRnOKeFAjG+ybdDhlB6sSPTIp59uMsIoLYHe
 q4fSEL1ep2PhsUvNbJW2VyjRgDh60rwUPefrCI8VTy4DqgFBH8kYdQEWmzFsPmFg2o38
 durWJqxEIPU/H2i8SzW+/rqRYv7vGgRmJQNBc2xQPuq1YuS0sdn5l5icaWndFl2CB/xN
 bHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBL+iBqHXGYjonafPDBFl9xB9D/yN9WRBAgbiTal3gI=;
 b=Bf7IRqJIAlXX8PqRwmwQn89hBkSsVhiCC0p/5J9/TzpoOOsx2wNjTBQTWIRZWlKtuG
 FbY2XtJ8gxbOipMLyKHGtrFUIYn+pbhRZqa0pCVLYS2aA/hUIKw/+TOaNvK4Zplx7afV
 rvjZXdrXdGWtU7IP5cPl2seHOIN33err3Pr0QkoKie2T7PkyculcvQSIR8jWlSvWOB2v
 +8cG8EZbBexXJ3njtZzpYUeOrjCe0h3ve57COUor2eJHQQtMTOvq69YXFRZ40LsV6Rdw
 Gq6oUMt6cpMWfOd4jfl/rZI4b27M6y9DQ3bAeMJehROWwKKxVeL4XHVZcBkBjyFsZ+QW
 0Xsg==
X-Gm-Message-State: AOAM533dlzjrhjZZms4nANhxMiO3k5UH8JeUG5jOMqxz4ltzExjM0yjG
 PWCRyi+U4xtjcutZYCEAJMrnPTQVgkB+tcGn9sEszA==
X-Google-Smtp-Source: ABdhPJxFJPsAUKzh2Yf5NwqvjgXbN4mAKdAois6yTs58Euyv+ghdUooaqeVn+CmPu46Sfb+EsP06cOeOcj7G7wXGa6s=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr17603040ejh.85.1612800571487; 
 Mon, 08 Feb 2021 08:09:31 -0800 (PST)
MIME-Version: 1.0
References: <1612766576-7792-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612766576-7792-1-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:09:20 +0000
Message-ID: <CAFEAcA9QzNnXb61vA0Quy3Lii+vpO5wyqh_kthHTf0Jsbn8RkA@mail.gmail.com>
Subject: Re: [PATCH RESEND] hw/net: fsl_etsec: Do not reject short frames
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 14:53, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> As of today both slirp and tap networking do not pad short frames
> (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
>
> If eTSEC is programmed to reject short frames, ARP requests will be
> dropped, preventing the guest from becoming visible on the network.
>
> The same issue was reported on e1000 and vmxenet3 before, see:
>
> commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

How a short frame should be handled is ethernet device specific:
what is correct for one device model doesn't necessarily apply
to another.

> Ideally this should be fixed on the slirp/tap networking side to
> pad short frames to the minimum frame length, but I am not sure
> whether that's doable.

It would be useful to investigate further exactly where these
short frames are coming from. If one guest is sending out short
frames, or we are doing tap networking and get a genuine short
frame from some external host then we should pass them to the
guest as short frames; if QEMU itself is generating frames (eg
from the 'fake' hosts in usermode networking) then it should be
generating valid frames, not bogus ones, and we should fix whatever
bit of code that is.

> This commit changes to codes to ignore the RCTRL_RSF setting and
> still allow receiving the short frame. The log message is updated
> to mention the reject short frames functionality is unimplemented.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> RESEND using correct email address
>
>  hw/net/fsl_etsec/rings.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 121415a..503b4d3 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
>          return -1;
>      }
>
> +    /*
> +     * Both slirp and tap networking do not pad short frames
> +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> +     *
> +     * If eTSEC is programmed to reject short frames, ARP requests
> +     * will be dropped, preventing the guest from becoming visible
> +     * on the network.
> +     */
>      if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
>          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> -        RING_DEBUG("%s: Drop short frame\n", __func__);
> -        return -1;
> +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
>      }

This doesn't look right. If the guest programs the device to
reject frames less than 60 bytes and then expects to recieve a
frame that's less than 60 bytes, that's a guest bug. If QEMU
itself is generating packets to send and they're short that sounds
like a bug elsewhere in QEMU.

But I think the actual problem here is much simpler:
the datasheet says
# RSF: Receive short frame mode. When set, enables the reception of
# frames shorter than 64 bytes. [...]
#    0 Ethernet frames less than 64B in length are silently dropped
#    1 Frames less than 64B are accepted upon a DA match
(https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf chapter 14)

whereas the QEMU code is doing the reverse: dropping short
packets if the bit is 1.

If you fix this bug by reversing the sense of the test on the
RSF bit, does it make your guest happier ?

thanks
-- PMM

