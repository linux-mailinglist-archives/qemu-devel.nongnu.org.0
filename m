Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC669F877
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrUi-0007Ym-Ay; Wed, 22 Feb 2023 10:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUrUf-0007VZ-6t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:57:21 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUrUc-0000L6-Hf
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:57:20 -0500
Received: by mail-pf1-x42a.google.com with SMTP id n20so4731778pfu.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677081437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ydFG4awGI8M3yGlC0bMXgu5OvKSEuOnLjYNE1r3ejf0=;
 b=coUtv9sd0XMHa2GVFqmsuWrY3o60fntwlxsbD6qbG7/d6LHoTAdpbamdEpF2h++N+k
 AvDpkCYP2kaNfh5ySxw9xkmISvmWAfOSnE9BAwj/D0dJBjth0N6afJR6gc2TO4yBXasS
 twX6bVwQ/aWtuSiPePQ4KQdnZ6UIigL72wWfbfQsRo4hixxftvR/YHwSegAHLOnHx5Q0
 tma8a63OofgjI4gf/o4JMsMv5oTXSDxXaccgKy8FDUifB1ribjyDY56xiG8ZJZLBIwAB
 ELG2UWQDH66fLqubrPxdnRwAq/8iLtmDuglQjgUqb+lby3wyDxo9p7BUMml2faGOs0bw
 GSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677081437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ydFG4awGI8M3yGlC0bMXgu5OvKSEuOnLjYNE1r3ejf0=;
 b=E3gwfI6tWZLi/ILfGxievd1VeeHpuB/lVj9hvBSDx1sLek5eJL65Z6wuWEq+Pckz0s
 lGaZ2Hz2QFKU84hX9p0oF1y826hPVfa0csd3SqEdvnz+vT7ERDwMIWCpqlTTb0xMI2PB
 b8kZdJBbno3demBJh4TxzaZsuMXO1CY6XBWiATpof3lIBf2a6X3Pi263jvJeN33oGEfo
 XIavo+r4y4FIrJREbk2bEiroJlULyfnF4xQUdTCzdE/iTG0vwIbszJMsEvHfEfzJxl5q
 WqO4XQ9i80YdK3OSrFmnBx6dAb6crlEqXsMQO0tjqGWu7iZl5EH1heoF1MvGUblUL4U1
 KNQA==
X-Gm-Message-State: AO0yUKW4cj6ZnIIvapxV42LhthBQsFrIk2gbbVRGM202sb6ikwFdMKx/
 HUGcRsXcYZj8uoCEeolyyeHv3m2MPbG1ALdMFIfdXQ==
X-Google-Smtp-Source: AK7set9/tuevTPEbc6vORpoyIvfgdjRSu4buPXxItc21PFjzawB/eREIeL1xYlLuguM5+SG2M5XwxUKwHE6hTtPMAgY=
X-Received: by 2002:a62:64c6:0:b0:5a1:c313:3d2f with SMTP id
 y189-20020a6264c6000000b005a1c3133d2fmr1295415pfb.15.1677081436699; Wed, 22
 Feb 2023 07:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
 <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
 <CAJSP0QWDcw8cYo8opfQ_+_U4p1DfQ49oo_ogOsnqJji+d1DzgA@mail.gmail.com>
In-Reply-To: <CAJSP0QWDcw8cYo8opfQ_+_U4p1DfQ49oo_ogOsnqJji+d1DzgA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Feb 2023 15:57:05 +0000
Message-ID: <CAFEAcA9qwYFpYOg9tG2Kh-dnR4sr6jYzmapqNjZKqie8L=WO4A@mail.gmail.com>
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, philmd@linaro.org, 
 david@redhat.com, peterx@redhat.com, armbru@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 22 Feb 2023 at 14:19, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Wed, 15 Feb 2023 at 15:22, Vladimir Sementsov-Ogievskiy
> <vsementsov@yandex-team.ru> wrote:
> >
> > ping
> >
> > [add Stefan]
>
> I'm not familiar with the Coverity models. Peter Maydell is the maintainer.

We haven't run Coverity scans since September last year.
There's no point making changes to our model until we've
fixed that. Paolo?

thanks
-- PMM

