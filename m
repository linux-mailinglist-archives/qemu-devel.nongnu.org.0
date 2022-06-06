Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D291A53E5E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:06:18 +0200 (CEST)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGBF-0004Yw-Ec
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyG7u-00024s-Jt
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:02:51 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyG7s-0000BE-Rd
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:02:50 -0400
Received: by mail-yb1-xb31.google.com with SMTP id e184so26754200ybf.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pSan1ApKReif7NwnhO+c6usmPgQvaZsObStfMLnTGBU=;
 b=X9Rd2gVsT1wA4bEa6pYAPkGigkqBl+7Zc5DEDxq3yzVQ206gPAeios5RsAuGBMgpPU
 1Puf4rfNfxRbDQ5mhird3lucqu4VG5eKYumOfY29n3GtGjdtodABCDxjru2xHHvz3oBo
 zunJhxlDRFB+6ZYF30Lg7qdBdt4qKJKSj7E+OEvRBJVLT1l0GFXXZUprC0chXe4XVGPA
 oNLsRZ5flEXO5jV3cBcw5muGAWYNzlsrNmXPEH4qcNa+CCQrZIrD7TaP3acvoS1iO91I
 SENtbaBNqu1dxuSra3PpOk3238GXvTG/DLfmQgs8qA4/Sh3yVM5CBwStQT9KasSKPMfp
 YcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pSan1ApKReif7NwnhO+c6usmPgQvaZsObStfMLnTGBU=;
 b=ZJDzWSZ6dQUwgbjQWj6yuJqy+uXKEwJnfIXM+iAbJ4iRdMBIMO9wfs30oZc5hC4399
 3loOCjkF3x6qd+LGgSHBWJJjzbTQuw22p7vObRW9luW1QMWKZZgXIflFU3ojkXQ9mmLJ
 CG9Ui1ofepVkpQ7jFbWT349D9Dy15yY4mPQzQSKP8MNdrD3JZEmpXE52Ap1IUkpvfdwe
 BWfyuL9DLirQ8D5gSrc9gpVJRuKuUvdcIzc990ThEgm9fZbW8Sp0gM4uU1KxdNCM6Xxt
 Q1YIVxIxBbMqbQmipyl/krNGuNydRt8iWh0jWtvZJ9uyONrGYWcL8WJoBg/uc/P39YtH
 5LWA==
X-Gm-Message-State: AOAM530dU4TVAzOKi4u4Z0omTuhRWwGvDd+ecBzHrLguwUi7NXNpKgDR
 tiJWJPPnRvPl1Mj2c3r+WnTjSX172+LmwDJM+TZZFQ==
X-Google-Smtp-Source: ABdhPJzvFseScEuwCWeCkLS/9TfPtjFD9JExDu6NxPu/df+LQUjjQHESP6sApQRspbnr+sBWv1kqpKcvMhBQSVFn0fw=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr24816060ybb.140.1654534967322; Mon, 06
 Jun 2022 10:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
 <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
 <ec17bc9d-e1cb-3315-6b5e-88ec6d75c7bb@kaod.org>
In-Reply-To: <ec17bc9d-e1cb-3315-6b5e-88ec6d75c7bb@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 18:02:36 +0100
Message-ID: <CAFEAcA_vo-WmhpjpXcqE6qzS5xwoTfOm=d+jk9e2bG3Ob3Ye1g@mail.gmail.com>
Subject: Re: Help: How do I make a machine with 2 separate ARM SoC's?
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Jun 2022 at 16:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On the CPU topic, I think we will need to change the GIC device
> to stop using qemu_get_cpu() in the CPU interface init routine
> and in the GIC realize routine, since this is global to the machine.
> I am having the same problem when trying to model a multi SoC board
> with a GIC device on each chip.
>
> What would be a good approach to loop only on the CPUs related
> to a GIC device ? Could we tag the CPUs and the GIC in some way
> to filter the unrelated CPUs ? Or pass a CPU list to the GIC
> device ?

GICv2 or GICv3 ?

Guessing GICv3, I think probably the right approach is to
have the GICv3 device have an array of QOM link properties,
and then the SoC or board code links up the CPUs to the
GIC device object.

thanks
-- PMM

