Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6C48FDEE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 17:48:55 +0100 (CET)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n98i6-0006EA-BP
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 11:48:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n98fQ-0004Xo-DH
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 11:46:08 -0500
Received: from [2a00:1450:4864:20::329] (port=36660
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n98fM-0003nl-LX
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 11:46:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so18753107wmk.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 08:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tb8uaPbx4DAdtnNUsWa4b4XyGc9qKNuEDwK67C/+30w=;
 b=nhfookOn3vh37nMdhmzuxdoMh3gVYGkDQCdnUuGbkn2s2GP7PH6rldrfS5AiCFwa4h
 esEaSCq4PVSF2hqOlO2aikSoxDrDq5fRdDuX63bg7vCDQJLLO9O5QWYeLdShQx9tTnhL
 r/PefvAlB7rHyfOYBM8V/ngBoq6VRO5RqIdKJafsfAJ5vA+xhIWMo0Uh9ia+U47zvyCb
 VWc7gz/ry/xLxe5Irpkk2V7OVA5wFZ1apDvHq1GFfZpFodCWEBL1S5pVwMihM/BJP4iw
 wU3z8IedkJKzSPCLzYHR17mUw12T8qUoiEowNh2fF1EMJIHnHDaYWhQroVHoXG9UpilS
 q56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tb8uaPbx4DAdtnNUsWa4b4XyGc9qKNuEDwK67C/+30w=;
 b=BDWmB5Zo6UifJ5stLFAxhK2AO3nAFDUXtdiyhbXLjxh54U6dZcIP02MQWox0ZFKZTq
 wakUyD3k5TswMNyPgLrvGxoOVwWCf4yBamh27a4fiO4aG9uuj7QvzhdP3/0N01vtPOkN
 nNnLadLVesFwCkfHrvKU6ZPCmdY0/xPWBSLqwsN2G/Q5DJa50nHSVeUaXyeNWgXkejJX
 rKW3zd9N5gqrJzjXWsDYobgAUPZfHyyDO2A+cZMpDRCKuskUazNhHgpNeov8ME959zQF
 TdpmJT1+xP38+O6BK4CXQvQCz/tmmBWpw91EDviswzp9fCLNtVpd7Wp/rE0naZr+KXGd
 Dbmg==
X-Gm-Message-State: AOAM530Opp8pK+VHgd/ZrrqrsrHHCwcnIAq4ZN/4oW5LTybhXA5Qd7rA
 G+Z9q4bgEhWoeNly1yD5zgkx/jF/D02VKBfFeEykWQ==
X-Google-Smtp-Source: ABdhPJx5YSFSTFFGdq7cwAVNGyK2VnusvK419rPngMgXDDgqK1FrVuYO8dQD/VdJ1j48W73/Z2SU1sYP+lbBryfUlN4=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr16524792wrn.172.1642351562053; 
 Sun, 16 Jan 2022 08:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20220107072423.2278113-1-aik@ozlabs.ru>
In-Reply-To: <20220107072423.2278113-1-aik@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Jan 2022 16:45:50 +0000
Message-ID: <CAFEAcA9JS9SfN3LmGfd8T_icCUx8tJXC=tKDE6j1i1GQE2c-mg@mail.gmail.com>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 07:29, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> "PowerPC Processor binding to IEEE 1275" says in
> "8.2.1. Initial Register Values" that the initial state is defined as
> 32bit so do it for both SLOF and VOF.
>
> This should not cause behavioral change as SLOF switches to 64bit very
> early anyway. As nothing enforces LE anywhere, this drops it for VOF.
>
> The goal is to make VOF work with TCG as otherwise it barfs with
> qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)

If you get this assert it means that something is changing
the CPU state and not calling the function to recalculate
the hflags (which are basically caching part of the CPU state).
So I don't know whether this patch is correct or not in updating
MSR bits, but in any case I think it is only masking the
missing-hflags-update that is causing the assertion...

-- PMM

