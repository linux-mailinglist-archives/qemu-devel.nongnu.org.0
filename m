Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ECF314611
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 03:09:51 +0100 (CET)
Received: from localhost ([::1]:43564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ITO-0003cL-Kp
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 21:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l9IPQ-00034S-HO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 21:05:45 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l9IPO-0002Ma-HD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 21:05:44 -0500
Received: by mail-qk1-x72f.google.com with SMTP id s77so16651737qke.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 18:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tE4AaJ79bXZsnypkrW56VkvHHK9wYgmzCZNGXh1RZr0=;
 b=nZO36TbNtQ+/AGwuAcGyDuLnwR/M67N+jY73oc/YN4VBSfg/s9USRE+JqgI9nO9EJv
 xfp2gC2rZukzzvK7d/MnqtzwEW79bzrZkY74aVE4fumbhmhFTwlQ7oARwgfCnsbdC1PX
 tX27fw3OuJr/WXQH3fuySa92LfRtX2uMlQ5h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tE4AaJ79bXZsnypkrW56VkvHHK9wYgmzCZNGXh1RZr0=;
 b=Vui21zND9YIPhnLSNNV6PJa7LAcARXCVVi1CVOUPg2K6WuxMeIyou0dJSiLn8cqfne
 rIKvuda+0bKaOUaaRpcnb5eSbHPjUeLg93GH1DHGtM1tuGktxj1hrOJqr1duVf9EHgM+
 DlAsZV0J6f72ov/DaTNk4j9zCNNrPNjP/678+nQY3ANjEsXcKObQ0w7gWop8W2BzgjY6
 mgkLQD3AbqXMK3qpzAlH/R1Hx4f6wgqiK34pNcHgATU5Uc2SWcMRzFYLID2c+JyHDBDT
 BNVpXwWD7KXg8b4d8g6tRRqpjn3UGgjKjm+iZ0pab/oJ598zZAcIsFjbQSCpvE8Ss8gn
 M22w==
X-Gm-Message-State: AOAM531F0+iJD+WbAqeFza6czMJcFpTzdDB2FeLZGN1bWQh6p63dXQ1Y
 oie3tjqdR8SzUNq4vcg/3abE2B0qENzuH31+nhM=
X-Google-Smtp-Source: ABdhPJzfgte87VCIFYZGRmeHaYrIjGTJbEOyPusQ/pSqYf3+HgjeqCFpuoS03O2nMy0AaR5o4pRYMqIOD/TgrzaKyac=
X-Received: by 2002:ae9:e314:: with SMTP id v20mr10192083qkf.66.1612836341318; 
 Mon, 08 Feb 2021 18:05:41 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Feb 2021 02:05:30 +0000
Message-ID: <CACPK8Xc4y+i9MmrB9rmrXjprAmvM+fgr9s83=bZE7X0hkwFGOA@mail.gmail.com>
Subject: Booting nuvoton qemu machine with -kernel
To: wuhaotsh@google.com, dje@google.com, 
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello nuvoton qemu people,

I was attempting to use the npcm750-evb machine to boot test some
Linux kernel changes, by running the kernel directly without a
filesystem (and therefore not running the bootrom or u-boot). I do
this with the Aspeed machines quite often, and it's really useful.

The machine appeared to hang; attaching gdb showed it jumping around
various addresses but nothing that matched up with the symbols in my
vmlinux.

To reproduce grab these two files:

wget https://builds.tuxbuild.com/1oDtoGMge0cGKE1uoNPpnSSnqwi/zImage
wget https://builds.tuxbuild.com/1oDuLU3E0keoRISk6R06PYBeW2G/dtbs/nuvoton-npcm750-evb.dtb

My command line looked like this:

 qemu-system-arm -M npcm750-evb  -nographic -kernel zImage -dtb
nuvoton-npcm750-evb.dtb

Is this something you've tested? Is there something I'm missing?

Cheers,

Joel

