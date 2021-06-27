Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210D3B522E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 07:22:42 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxNFg-0005s2-Md
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 01:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lxNEs-0005DH-Gl
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:21:51 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lxNEo-0004cK-QT
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:21:48 -0400
Received: by mail-oi1-x229.google.com with SMTP id 11so9196720oid.3
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 22:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=BxRExdU5AYHmCYKT6vKoKNySlhGqxpFdzYzkky51ASA=;
 b=eoPVok/XDidvqFNpoiQ1e9Kb7ga57xI8YJGqeWhTrj+6BGNzkdf7/laRmON4cNmI2w
 11AZc0H0IyBjndgrShYsyDdqy2ksUsSvrTDJxXbCpH+biq004rkGcSYX1JBTkS/IbM55
 bmM52BA6ppJ3rrG01PYkPq/Tah1vFSnPb2amVLWTMA8YQXKEeov6JAuz0dTfj+uELCZ7
 vkoFEA3W+kxhEDhZ2FGK+heUVnqobiOXqLdMsrVmBn705FQ0UsFVGq/5c1qJVCt02lGr
 zM46ipyqaEVhqbcKsTXiJ6NYtcdJUlkW1l2fmcgCXjJNdXfurWHsGo7jIrev8bKYPOdh
 MApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=BxRExdU5AYHmCYKT6vKoKNySlhGqxpFdzYzkky51ASA=;
 b=CG+XFcE3xzhKxDlZ2M7Xv5d07bpfbwlGOdQABDpPVYZk/fj2EzVFZRZR3RWEVJ88SV
 0b1f1s4hwHocnqKSj6CJcO7OEDFV7lQtkyX66ybbK+rkfJruvJvrmtyNwK5cKcVmqC8D
 j95ZkC6vjf/yAYoPNNdFSYfEQgVnsHu09J4wB5+W1npE9wOpEnhJU1KeH9VK8i2MxRzU
 fmSKjpbue+sxU9GSOtL42ClyVhT3JLKCSases16ryaXGBAYJn2V4d6YNeaWsI3Mgdzi+
 UrN5j+d0CuuA/uE93cwzgmVnKjyT8fik1Js0v6PynuperVEqKAFHqv96jzZ7PV9ws/Ds
 ZGYA==
X-Gm-Message-State: AOAM530RHo/UqeWKQtjHyJx1nkO+IAPRw5E61lj7jVLYnI+gqnTlCnKD
 E+tHObwFfnykVyFkPT/C6uhzQgZ5seCJI4CVxa4=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mt13253747oif.43.1624771305653; 
 Sat, 26 Jun 2021 22:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <1624764506-19841-1-git-send-email-cyruscyliu@gmail.com>
In-Reply-To: <1624764506-19841-1-git-send-email-cyruscyliu@gmail.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Sun, 27 Jun 2021 13:21:33 +0800
Message-ID: <CAAKa2jmWU=M8V9Lsjrjs-AV=RP6wVNb7mWBAM+MkT9HTdrwtzA@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-dwc2: Enforce epnum to 0 for the control
 endpoint to avoid the assertion failure in usb_ep_get()
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, MALFORMED_FREEMAIL=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

I found this bug by my dwc2 fuzzer.
It seems that
* https://bugs.launchpad.net/qemu/+bug/1907042
* https://bugs.launchpad.net/qemu/+bug/1525123
or
* https://gitlab.com/qemu-project/qemu/-/issues/119
* https://gitlab.com/qemu-project/qemu/-/issues/303
have reported similar issues.

Would it be better to consider and fix them together?

Best,
Qiang

On Sun, Jun 27, 2021 at 11:28 AM Qiang Liu <cyruscyliu@gmail.com> wrote:
>
> When eptype is USB_ENDPOINT_XFER_CONTROL and pid is
> TSIZ_SC_MC_PID_SETUP, usb_ep_get() should return the control endpoint.
> In hw/usb/core.c, the assumed epnum of the control endpoint is 0. When
> epnum is not 0, usb_ep_get() will crash due to the check assert(pid ==
> USB_TOKEN_IN || pid == USB_TOKEN_OUT).
>
> The description
> http://www.capital-micro.com/PDF/CME-M7_Family_User_Guide_EN.pdf
> (18.5.3.4 (14), 18.5.3.4 (10)) a) mentions that the pid is maintained by
> the host, b) but doesn't mention that whether the epnum should be 0 for
> the control endpoint. However, usb_ep_get() assumes it is 0. To avoid
> potential assertion failure in usb_ep_get(), we could enforce epnum to 0
> and warn users.
>
> Fixes: 153ef1662c3 ("dwc-hsotg (dwc2) USB host controller emulation")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/usb/hcd-dwc2.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index e1d96ac..65d9d46 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -636,6 +636,11 @@ static void dwc2_enable_chan(DWC2State *s,  uint32_t index)
>      }
>
>      if (eptype == USB_ENDPOINT_XFER_CONTROL && pid == TSIZ_SC_MC_PID_SETUP) {
> +        if (epnum != 0) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "epnum should be 0 for the control endpoint\n");
> +            epnum = 0;
> +        }
>          pid = USB_TOKEN_SETUP;
>      } else {
>          pid = epdir ? USB_TOKEN_IN : USB_TOKEN_OUT;
> --
> 2.7.4
>

