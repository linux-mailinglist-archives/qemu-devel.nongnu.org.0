Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9A538C67
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:01:25 +0200 (CEST)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwoe-0000Dc-CR
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwm6-0007dY-Jz; Tue, 31 May 2022 03:58:46 -0400
Received: from mail-yw1-f171.google.com ([209.85.128.171]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwm4-0002LP-4h; Tue, 31 May 2022 03:58:46 -0400
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-300312ba5e2so131250577b3.0; 
 Tue, 31 May 2022 00:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7B+HAgcxUXE5BG45VZtt5CjpPo6aaPUAcFVeSsiyAh0=;
 b=PSupN4xVER4/iS7Svn61+C6/XmG9TFNGMoxxulDCgzwDKafTrOf8+N0gmk/u1QkU2v
 b7vx4TxYpuN4peMLDW/aWllB+cjqrkPVxdEGNGa3fwuIyLE339KROZ5HnGbJXrYlumnj
 xlgsaIjg3NEypXvHcvI17zakoqaqLI2GSIvG1EKVGMsF5uLtmDGphLlHzsdm4sfUXco0
 ggc5H/Jp75LPa2zr2bhjxS2BmJvyGcjAmSJ8732lUNob4zwbsTel401Fw1yClIZ82b3o
 1ycy73O+IqBZOZm+/55CGImQo2D5ZcpA12FhFJbgqpd2AE8EYy5UCUV8tKwwiw/7/B4f
 NEog==
X-Gm-Message-State: AOAM532LKaXE5fi/o4r1ZPJjJnKUCvVpxPkCqUoAbVrN2YncxDOOarZ9
 cIEZ1W3hpYvdQZ85/WRQ4zXrsT94/U1jzFWYkAo=
X-Google-Smtp-Source: ABdhPJwWRRFdFuDnVzahJzqpTJlS3dc7AW6LtLt7T35gRZmZqa5ErfrVA4ow1Mtg7VcTGtIhcvslcjgGLj5jGl6J5YQ=
X-Received: by 2002:a81:4ed6:0:b0:307:224f:eed3 with SMTP id
 c205-20020a814ed6000000b00307224feed3mr21453648ywb.301.1653983922586; Tue, 31
 May 2022 00:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <a4496a43-3332-76b7-e4c5-7ab27a7b988c@kaod.org>
 <9dcf841f-2608-b815-f651-31ccff0ba055@amsat.org>
In-Reply-To: <9dcf841f-2608-b815-f651-31ccff0ba055@amsat.org>
Date: Tue, 31 May 2022 09:58:31 +0200
Message-ID: <CAAdtpL5fGs=5ejQL7jBWUp+ajph59HCwCmqBKGyKB8i-PFEsaQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] hw/sd: Rework models for eMMC support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, 
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.171;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yw1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, May 31, 2022 at 9:56 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 31/5/22 08:31, C=C3=A9dric Le Goater wrote:
> > On 5/30/22 21:37, Philippe Mathieu-Daud=C3=A9 wrote:

> >> I plan to queue patches 1-12 via sdmmc-next later this week.
> >>
> >> C=C3=A9dric, if you are happy with this series, it should be easy to r=
ebase
> >> your other patches on top and address the comments I left on the RFC :=
)
> >
> > Sure. I will for the first patches to be merged and I might introduce
> > a base class.
>
> Then consider patches 1-13 queued.

Oops too fast, new patches 3 & 13 are not reviewed.

