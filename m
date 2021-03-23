Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172C346DC5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:16:16 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqFy-0001EJ-TB
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqDu-0007fV-NV; Tue, 23 Mar 2021 19:14:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqDt-0004n7-AP; Tue, 23 Mar 2021 19:14:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id x16so22520311wrn.4;
 Tue, 23 Mar 2021 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wcLxVW6lxbwa44z+dCAp47kty5V2tT/anv9mWjQkfQI=;
 b=A2Mgn8uQDW9ZLyEHCVFOSiaMY+KZR6FNvnl7j7L4OoPaYMHsLsFu6P6rg6ijYk0zgi
 eHWLnK8FAI7/gvcZgh4Deq8WmhWpWF4zU8URg9pW1Edi+OdnXNgoWHtiNnp9AH2rWJxt
 wGdPCYPj6KW5emcKGBTXX+LGd4YRwnZ4SbtZ08yCypH4zRK4BSHyDTWJTcvrk8/SPIE6
 wx+cZlgbfSrt4fiVWyzbdqibGbtmkwgITE5QSqBHsbEylvrmd5MvcudBn4AdbYJ6Y7T3
 lypJFCi4veHcVlAPKgRDugWICh6/+c7I39c0QUEDEir6zmU4xigia7flqiRvGy3f9gAD
 dzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wcLxVW6lxbwa44z+dCAp47kty5V2tT/anv9mWjQkfQI=;
 b=kXU3C0bK4ysEJGvNFJj5HELTh2u6aM4Q1T9jpQ0xDljBHVD3jBIF8XNurSOfCvH6qD
 4/ukx28wZFcPn93H7NS3CMM5/Ux9pw850z42/IRWif3UN0KWtI3VFDjRl4ol6IUIZT8i
 3E4lrS4IL1TsVlFWhPlw82ondZzy0lSd9h1gCOkGH2nfNE9UHMydLePRwSJQYry21SUp
 lnjJspKXaGQ3RgjirkGiTRrP3/PmlONeCEyhF7H8NNpsykLny/gjm/Wx9jrQ5biYMSKk
 pGpbKA6t2KplL61/y7p7VK6GGKOmHkycWSH7eB+7JG4dBZj4ltjBYJV2rIt7mWkq8VlO
 H4jQ==
X-Gm-Message-State: AOAM530pmHwnFZ9vRgsMeKD9Xk2Zjpu/4FpXgKzvIsf9vzNAnRDAe0Zf
 F+f3WocWVNYYA28hLeWKV5xHh5qua8d6LQ==
X-Google-Smtp-Source: ABdhPJy2tPdJTO7rXN2ym6vwStQfduk90zkLmM25BueYT07ThFrW+gqXIDozNIJAsgq9nrCx9I6VnQ==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr298723wrn.226.1616541241404; 
 Tue, 23 Mar 2021 16:14:01 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u8sm476803wrr.42.2021.03.23.16.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/isa: Remove unuseful qemu_allocate_irqs() call
Date: Wed, 24 Mar 2021 00:13:52 +0100
Message-Id: <20210323231358.396520-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I started to fix the LeakSanitizer error in piix4_realize(),=0D
then looked for similar pattern and found 2 other places.=0D
The older is i82378 (historically the first one) which then=0D
spread.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/isa/i82378: Name output IRQ as 'intr'=0D
  hw/isa/i82378: Simplify removing unuseful qemu_allocate_irqs() call=0D
  hw/isa/i82378: Rename output IRQ variable=0D
  hw/isa/vt82c686: Name output IRQ as 'intr'=0D
  hw/isa/vt82c686: Simplify removing unuseful qemu_allocate_irqs() call=0D
  hw/isa/piix4: Fix leak removing unuseful qemu_allocate_irqs() call=0D
=0D
 hw/isa/i82378.c     | 13 +++----------=0D
 hw/isa/piix4.c      | 10 +---------=0D
 hw/isa/vt82c686.c   | 12 ++----------=0D
 hw/mips/fuloong2e.c |  2 +-=0D
 hw/ppc/prep.c       |  4 ++--=0D
 5 files changed, 9 insertions(+), 32 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

