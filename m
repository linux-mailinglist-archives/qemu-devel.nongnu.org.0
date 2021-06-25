Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA383B3D62
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:30:22 +0200 (CEST)
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgI9-0002yV-KF
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwgFX-0000tX-BW; Fri, 25 Jun 2021 03:27:39 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwgFU-0002GM-8s; Fri, 25 Jun 2021 03:27:39 -0400
Received: by mail-yb1-xb33.google.com with SMTP id p133so3230116yba.11;
 Fri, 25 Jun 2021 00:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cSsgV2fbA2GPae+HKI3ySLdxfbC+SgZOgCsQiTvBzMQ=;
 b=dFHVDHnCfYEM30Ft/+HuNANgC+AZrLHjxyIN4RkikChPb+mkH41sbvaoM74Ov1YIk/
 Kqhj5lLeSiIUhX2DdwgXbjfNjrzQjfkIj+g9A2FY7S6YSGvIKwfuz6sKtKent51JsyPx
 IVWMcjd/ecr61xjIf7hjqa+xfGhSCvZ3LUKmDWQF5X2onFwK9EqMup84K3Tj28E3ZAIu
 swgZo13Q6Cy0Oknhs6tYiFCxKSVnoGllUXQEpAsOe+1EvK0UDzwq66vVyd4RPYawOAx9
 uJfbgK04ZyUzSIIkaGufR0N6OT5y6j1Ce0/GVV8fCGKH7mgFI5qHrAE8Ua2qA47T1Aty
 I1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cSsgV2fbA2GPae+HKI3ySLdxfbC+SgZOgCsQiTvBzMQ=;
 b=cEE/CsI7V7MN4PcOFSkQkIu5j51r467oSa9JiYpjraLNe+lz84IrjPnLP6FDBD0Mmk
 8cfgJmNbZu2rWM18/V1N1mF0nnkTGMl3CSp47IuAkNA0SInu/2HEKB4cZAF+M56TJEvE
 OllM4HOS4rjjDrH3icEZ6i15ObgfIp0uWd9+kxlI20BkD6iTV/Bue+wAgjGUuZJ9GKGS
 l07nISJgYc+uCihNY5O34zwR2GO3tO+5TM55km4j+LVempzQOHgV14jRQG3NHqZWjXEK
 1l1BuuY9iLNUO/kHnJXwhoJ9bKjXIE/l2vagVLh4eGuk/EIW3mBL/yp4GuSNPbg+xr5O
 umhQ==
X-Gm-Message-State: AOAM532vSJnFsHaXe4jlPKjbt2U4KwOTey0X0xDQxU2BoCtCeENfQA1T
 SAmDOvobB16cmA8rfgnkEvm/Bg5GZXCW4/k2iIk=
X-Google-Smtp-Source: ABdhPJxaCBzy6gkqLaPXaXcir/exxHjdBLW1brH4HmkITv/5aVeD4dE5NF6Dp7SqyrjkxcAz2kDqU1vk75vSL44fvvo=
X-Received: by 2002:a25:7411:: with SMTP id p17mr10363107ybc.306.1624606055010; 
 Fri, 25 Jun 2021 00:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-3-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-3-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 15:27:23 +0800
Message-ID: <CAEUhbmWZGiDhZCKJtkW6uEgXXt-tJ5Ti+CfQ3J-A+2JsVGHtWA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/10] hw/sd: Extract address_in_range() helper, log
 invalid accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Multiple commands have to check the address requested is valid.
> Extract this code pattern as a new address_in_range() helper, and
> log invalid accesses as guest errors.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

