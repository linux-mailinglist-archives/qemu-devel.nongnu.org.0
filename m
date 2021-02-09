Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F493151CA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:37:42 +0100 (CET)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9U97-0008VQ-AW
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9U4b-0006ZO-Io; Tue, 09 Feb 2021 09:33:01 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9U4Z-0005kZ-Lh; Tue, 09 Feb 2021 09:33:01 -0500
Received: by mail-yb1-xb30.google.com with SMTP id i71so18361414ybg.7;
 Tue, 09 Feb 2021 06:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6rCiAK3q7f9D9jfXidnhgVKLoErnW0pIAN2PJufOas=;
 b=n6AhL8GDWSZqqwZvj96FpAGufO6U93f1VHJmdV7Gr1JgY40zqjGX7W5piwMpSPP7+L
 EjiKMalqJ9qhKOdfXkw839L2zK2an21FTihFE3Zdf3O87yA6FEDXb/Eu7593+YglTxMZ
 Ss08xblR/mnMvzGnQ98+Www+TjLSt+Iw661cnFnpYboRll1fWZzIay+e4rSMh7+187LH
 UtEGC4m+N9HSyj7Ts2jFGRZTfDpSjfPXdUtX0sxJY1BjjBi9Pff7CgzpL49EEvGTmg0d
 ZzO4RziJUyiZQOAufubs8IBWZ2UC/ydPjgDEaIFkSLF4azfJVCfX0jiUWm0d0iZR1akc
 l+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6rCiAK3q7f9D9jfXidnhgVKLoErnW0pIAN2PJufOas=;
 b=NRRq3L7UtmTE4ZG0tLQru/TjipSNk6fJcVuvk/1F7HDM00txHvLC3pVWg8mqQOiVZ0
 CR5bXL71XfQH5AdP8M+bXU4PaT9sAbR2d0cUlsF6jwZlD9ACWaoFDOeCoUuo/FPZzjqj
 EnreRR1yKoMMYOdKWJxEIdwvQLL0UPF3+yhy2786Vl1/DjNl06ZjMmug2CLPBNa5/yOC
 B2T2Fe+peJGLOp2foj4oApQmftVFlkemYC+XdtTyaCsRPsORVpwK/NBjbjHGuaCTsKyO
 lCP/ciBE4TDSf0tEdGej+RsacZYqUVvgvx9t2jQQ9l27kk7JWUjntJbAWuRX8FiK3hSA
 9uGQ==
X-Gm-Message-State: AOAM530x8RFxq6WBhzSN3e2fCCUN/wqTCthhOGdQYJvyit4Hzh2c+XWM
 VZiienMZX/8sjYexhKSNe8y51tjX9XZYJphhJ6E=
X-Google-Smtp-Source: ABdhPJwg85pZ8N3r8aTue7XJZMP1JDP5IS9vgG/OxJM+yQKPtwhVVsLiWWARdmSEL+WwHcJ2Gl/42hFPUHjEbofnWKc=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr34173545ybc.152.1612881178277; 
 Tue, 09 Feb 2021 06:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <CAEUhbmXofQq9AerwBQfjDZkwp0kA9w+y+x_F0LUWZ6ArP+9H=g@mail.gmail.com>
In-Reply-To: <CAEUhbmXofQq9AerwBQfjDZkwp0kA9w+y+x_F0LUWZ6ArP+9H=g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 22:32:47 +0800
Message-ID: <CAEUhbmXb58yxg1TAgq0vdH=QE-o0qCTjYghX2XZag-S1cWB=Eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] hw/sd: Support block read/write in SPI mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Thu, Feb 4, 2021 at 2:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jan 28, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This includes the previously v3 series [1], and one single patch [2].
> >
> > Compared to v3, this fixed the following issue in patch [v3,6/6]:
> > - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
> >   receiving the STOP_TRAN token per the spec
> >
> > All software tested so far (U-Boot/Linux/VxWorks) do work without
> > the fix, but it is better to comform with the spec.
> >
> > In addition to [2], one more issue was exposed when testing with
> > VxWorks driver related to STOP_TRANSMISSION (CMD12) response.
> >
> > [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
> > [2] http://patchwork.ozlabs.org/project/qemu-devel/patch/1611636214-52427-1-git-send-email-bmeng.cn@gmail.com/
> >
> > Changes in v4:
> > - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
> >   receiving the STOP_TRAN token per the spec
> > - new patch: fix STOP_TRANSMISSION (CMD12) response
> > - new patch: handle the rest commands with R1b response type
> >
>
> Ping?

Will a PR be sent soon to include this series so that the SiFive SPI
series can follow?

Regards,
Bin

