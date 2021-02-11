Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA531869A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:05:14 +0100 (CET)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7uS-0006Wv-S0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA7tS-00063m-PQ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:04:10 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA7tR-0001YJ-2e
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:04:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m1so4818977wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 01:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DcY85TGSJ0VxJ3LSFxDYIrn38O02+A5fQi1RtAU8Oe0=;
 b=Rc+lyBHQT9J69HPIwNRaEAS2jVyxFqtXUNPCBhyWfLeZJXLy3lA0CW1ulVmRZ0trDk
 Jt2QbfzZe+rDBFMziBepzy1NbXWzZAwLXJdIiJB+YRj/2XzAXPIyidUBOHl7PBBc+cPc
 zkV25zM6CoaeB6n2mB5jfY2Yv8dSCMk9QFNJBhhNRz0gYTxZQQH+3dnTHOwdDfudSnfA
 lGZnXBdOHitQlD48LhEfjURKHP1aRJgZK1DhuzWlf/ImHqhVndlYhcm/mZqtqhChYv14
 PX9pmHl9JBd1c+SX321l/iykLbJgYj38wKyk7TIrlygwmsTpKuvH7EqCWb9xvAZvT9DH
 My4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DcY85TGSJ0VxJ3LSFxDYIrn38O02+A5fQi1RtAU8Oe0=;
 b=UZ7ZIRMKadE14YP3tBEXmDvCT3FiZzulV2h4cEAu5iKy2W2/vW4jEgowyB6LNEz0Kj
 1LKbGBUv8VnZCGdS2rVLtofLekLuiKp4mOq24BlVdm1og4xUCKj8bD+ePf0yXT8djrIc
 SZtGKRiKPAFYlCTrAtSUFnDkAcdCcSX1www4fTq5rQkwooh46gkHfDbhga9T569yrmSg
 LmZsnC7X5a/b6lC5geTpdw/+FZ+B+VvCrIOgnpczHfOBlmEcV1h4W3kgi1nT+W8XVJUU
 ydosNzMxfPXPBDrXQLeuLdArOtaUtT3OshCHgiqg5aU03pDoFuK1nN4omluk0oZvsuxy
 iwJQ==
X-Gm-Message-State: AOAM530mPPHNZ6QLmwjUFHmbt9OirlAfL44CI2e4RuBfXJdVkFwC2ZTM
 rvF7fQo9L3CMEuTSYi6i5hSLBA==
X-Google-Smtp-Source: ABdhPJx2aXkc7wjbEmf3+bqAIx+L8Sp/7ZdvikdUVmOCmtv/aK/ZxNRfOSmXvRUDW/RY+XcGwdhljg==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr4118292wmd.92.1613034247072; 
 Thu, 11 Feb 2021 01:04:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q24sm8071336wmq.24.2021.02.11.01.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 01:04:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CBA31FF7E;
 Thu, 11 Feb 2021 09:04:05 +0000 (GMT)
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
Date: Thu, 11 Feb 2021 08:58:12 +0000
In-reply-to: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
Message-ID: <875z2zugai.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> virtio devices support separate iothreads waiting for
> events from file descriptors. These are asynchronous
> events that can't be recorded and replayed, therefore
> this patch disables ioeventfd for all devices when
> record or replay is enabled.

Does it always have to be the case? Can a virtio device forgo iothreads
and poll events from the main loop?

>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  hw/virtio/virtio-pci.c |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 094c36aa3e..76fbc111ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -37,6 +37,7 @@
>  #include "qemu/range.h"
>  #include "hw/virtio/virtio-bus.h"
>  #include "qapi/visitor.h"
> +#include "sysemu/replay.h"
>=20=20
>  #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_prese=
nt(dev))
>=20=20
> @@ -1746,6 +1747,11 @@ static void virtio_pci_realize(PCIDevice *pci_dev,=
 Error **errp)
>          proxy->flags &=3D ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
>      }
>=20=20
> +    /* fd-based ioevents can't be synchronized in record/replay */
> +    if (replay_mode !=3D REPLAY_MODE_NONE) {
> +        proxy->flags &=3D ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
> +    }
> +
>      /*
>       * virtio pci bar layout used by default.
>       * subclasses can re-arrange things if needed.

I think we need a better solution for this. Are we going to end up
sprinkling replay annotations throughout the device backends for each an
every device supported by QEMU?

This seems to be it should be the other way around. We should identify
the devices (or classes of devices) that support the logging and
consistency requirements needed for replay and mark them with a QOM
parameter. Then we can walk the tree of devices and either claim
compatibility with the request to record/replay or report to the user
"can't use record/replay because device %s is not supported".

--=20
Alex Benn=C3=A9e

