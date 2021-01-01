Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509222E85DF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:13:48 +0100 (CET)
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTcB-0005bF-DD
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTao-0004Ao-1U; Fri, 01 Jan 2021 18:12:22 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTam-0001r1-5J; Fri, 01 Jan 2021 18:12:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d26so23326091wrb.12;
 Fri, 01 Jan 2021 15:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ay8cKUYMVyD1wzRztL11AqKt2gx732sE78EKtzR2AaA=;
 b=RwbtYCVxn6tZYtbhSZchXw9VMdZnNXH1SBE9Is01zAA+ekno8QP/eknuWaZp0f30fl
 lbEH0HngHfwIpGPd5nDOfjbU5euyVJgttYBn+lwGXQRFejMCz2rv+6e+Vov8kNgDkfll
 VrGsXeImAsJvFaCiu6XDPF+NgLQ/fsb2jMvhS9hcMn4fFS/3C9e2bPcC3vy1pt0tFcXI
 QHsosqwTUF9iogWEwvil8+qODdCHg+MVDWU1oXUyRcDSTcn5gQkUA2m4EtSmpf4dfdO5
 jcdyVZq0edp0RFTtnFZ0EQpVmMkKawkoRYFNYJFPP3vVnCB/PxcPunOS4BU08ZKKVXWD
 7NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Ay8cKUYMVyD1wzRztL11AqKt2gx732sE78EKtzR2AaA=;
 b=aJDGzBxa5ai/AJZA41oI97FBBp46ejMwsxC4WZsuQBxS5GTE3cWq7fgBVMml4pmN6Q
 a1qC2na829GdqIeBP9/c1grHW1t6FfVEaHydEZWeK0ZL2TCzcjPz0VLScPsP3le69b2K
 5h0RGDdUGcgkkT51nMf6LYqpXGGzd9dGnSSGdlo3bKxA9iz4WLL9GX7MlFwEztmswThZ
 54nkPnw6b2pCgEctF6tPvm6a12lsX1N5ayKR+Aso/nJ1lj1bb1LyUKaINcfBn2F1RJgs
 aq66zYWmICszDCIbDPK8rLEb0kYnyTzSHnKvXxpHqoIKZPdBDb5Vv6vh31sqqcfyZPlz
 AOeQ==
X-Gm-Message-State: AOAM5311MefRdz8jUBqvV4V3FCMFl9KJM1Ci7RzYts2xQgaRiWWkWd6D
 cCsAQSJZVHKZRqgecNR0M9AmJ5w3f2I=
X-Google-Smtp-Source: ABdhPJzZGsmV3nkG9s3eUh5g1vUU+5gm2c/1qWnUnrXf7s9AYNPlZfVf1ClgLSBHguTpm+t4O2iLdQ==
X-Received: by 2002:a5d:690d:: with SMTP id t13mr69668682wru.410.1609542737916; 
 Fri, 01 Jan 2021 15:12:17 -0800 (PST)
Received: from x1w.redhat.com (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id c20sm19077232wmb.38.2021.01.01.15.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 15:12:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] hw/mips: Fix Fuloong2E to boot Linux guest again
Date: Sat,  2 Jan 2021 00:12:10 +0100
Message-Id: <20210101231215.1870611-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We closed 2020 with few discussions about the Fuloong 2E board=0D
(see [1] and [2]).=0D
=0D
This series collect the minimum set of patch to have the machine=0D
booting Linux guest again, including integration tests.=0D
=0D
This is sent as RFC because Mark raised some issues in (see [3]=0D
and previous in this thread) and I don't understand PCI enough=0D
to intervene.=0D
=0D
Peter commented a similar PCI issue with the Sam460ex [4] so might=0D
be able to help us here.=0D
=0D
Anyhow, sharing this PoC on the list with the test, the avoid boring=0D
manual testing.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769105.html=0D
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769557.html=0D
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769593.html=0D
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769697.html=0D
=0D
BALATON Zoltan (1):=0D
  ide: Make room for flags in PCIIDEState and add one for legacy mode=0D
=0D
Guenter Roeck (1):=0D
  via-ide: Fix fuloong2e support=0D
=0D
Jiaxun Yang (1):=0D
  tests/acceptance: Test boot_linux_console for fuloong2e=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/pci-host/bonito: Remap PCI "lo" regions when PCIMAP reg is modified=0D
  tests/integration: Test Fuloong2E IDE drive, run userspace commands=0D
=0D
 include/hw/ide/pci.h                   |  7 +++-=0D
 hw/ide/cmd646.c                        |  6 ++--=0D
 hw/ide/via.c                           | 19 ++++++++--=0D
 hw/mips/fuloong2e.c                    |  4 ++-=0D
 hw/pci-host/bonito.c                   | 49 +++++++++++++++++++-------=0D
 hw/sparc64/sun4u.c                     |  2 +-=0D
 tests/acceptance/boot_linux_console.py | 47 ++++++++++++++++++++++++=0D
 7 files changed, 113 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

