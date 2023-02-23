Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A06A0ABE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBlr-0007s6-9r; Thu, 23 Feb 2023 08:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVBll-0007pl-Qf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:36:21 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVBli-000765-77
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:36:20 -0500
Received: by mail-pf1-x431.google.com with SMTP id a26so6040471pfo.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziMLKydJTay/BmNLV1+TS3AzWc2BBP9B0nqwN7+xrP4=;
 b=BtTRyxb7+dy2VMgw01VMpL1Hj91WrdUv/6B6g9evbk6SILXPsC8eFz0fB8OrhCdI5t
 RLDZOu5CZa+Esyp20IdmUDx+vj5xIpzcLbusF2E2rv3xJZMRAVsWdAv1DHZrJueI0SsZ
 8tJuaMsr/YIDQ2FzKTu+e7bBKsdxfRVezbwrOy9zLndZuY6V7XCAb+DXLSh5MGuBXrlo
 fXg51bQ7L6zc4JYMV51nvwD7hINgqPyMLW54ekjJoPHPCtkYlHzLC+p7MnITo05wkxGy
 tdroeb1sFaGqf5Lfz/l3siJtM2mccO2XxUrG5BxXKHg63Jvnc0r2HMoVH5dghDORy+dw
 xDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ziMLKydJTay/BmNLV1+TS3AzWc2BBP9B0nqwN7+xrP4=;
 b=5g58u6po1ZmIM/TmAMT1xWzQq8gUwxtLj1rYu1bomF1sYHvgpUVRz0UyLKxaxOUfH+
 EO5KG05veywwT5ldWy20QSrEf9SHQzP3zT2QSzahz3Wjd7YaRMV4PhmAnNSp13NewmI5
 Bwpz+A5cSOlvkpJn/b/h3jZmIAhMjGhTaNPMKdiLYS8YbDn/zg4MB1898SI1pzb++we9
 d8dlEqZePXijfNP1wctz9dnF9up3vboTXLHPmneqkutq3OYDHtAkCrxJakBV//mjHJJV
 mxZ/axVqi8G9xEsULr29Pl6GE2HlCh5ig1LCdgWtcJnLM890HRqlbr3bGPcsV6mNjob2
 xAVQ==
X-Gm-Message-State: AO0yUKV8/CThL0Gw39I0z700aFsGY/FCQkcXtfABE6kG0kjyEmIDLMfs
 BXL+WHcj/7xIB0UDVYLUN94ZdQ7MxNgz+/ucU9dQxg==
X-Google-Smtp-Source: AK7set968R8ACxGV76QfmgC3Q1J6wAcT//jUUbrQA6Sbw+lr4pqpfoJcvdlxk5JiI2S3GaZOTJWK2B1aiEbDsTtqI2A=
X-Received: by 2002:a63:7555:0:b0:4fd:4602:1b9a with SMTP id
 f21-20020a637555000000b004fd46021b9amr1833686pgn.9.1677159376680; Thu, 23 Feb
 2023 05:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20230113200138.52869-1-philmd@linaro.org>
 <f8a83363-ce88-e424-4db5-2fead70e4ec4@linaro.org>
In-Reply-To: <f8a83363-ce88-e424-4db5-2fead70e4ec4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 13:36:05 +0000
Message-ID: <CAFEAcA_xqTmYHqv+4QZqouAYtFYRz=PrZNAk6y4arRPHjNrsug@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023 at 09:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 13/1/23 21:01, Philippe Mathieu-Daud=C3=A9 wrote:
> > - remove unused code
> > - use recent QOM macros
> > - use CamelCase typedef
> >
> > Philippe Mathieu-Daud=C3=A9 (4):
> >    iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
> >    hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
> >    hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
> >    hw: Replace qemu_or_irq typedef by OrIRQState
> >
> >   hw/arm/exynos4210.c                  |  4 ++--
> >   hw/arm/mps2-tz.c                     |  2 +-
> >   hw/core/irq.c                        |  9 ++++-----
> >   hw/core/or-irq.c                     | 18 +++++++++---------
> >   hw/pci-host/raven.c                  |  2 +-
> >   include/hw/arm/armsse.h              |  6 +++---
> >   include/hw/arm/bcm2835_peripherals.h |  2 +-
> >   include/hw/arm/exynos4210.h          |  4 ++--
> >   include/hw/arm/stm32f205_soc.h       |  2 +-
> >   include/hw/arm/stm32f405_soc.h       |  2 +-
> >   include/hw/arm/xlnx-versal.h         |  6 +++---
> >   include/hw/arm/xlnx-zynqmp.h         |  2 +-
> >   include/hw/or-irq.h                  |  5 +----
> >   iothread.c                           |  4 ----
> >   14 files changed, 30 insertions(+), 38 deletions(-)
>
> Since most changes concern ARM machines, can this (reviewed)
> series go via your tree?

Sure; applied to target-arm.next, thanks.

-- PMM

