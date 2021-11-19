Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A949945757F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:31:21 +0100 (CET)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7jL-0005Gl-So
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:31:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Qm-0006sW-PE
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:08 -0500
Received: from [2a00:1450:4864:20::430] (port=34742
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Ql-0006Ny-3l
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:08 -0500
Received: by mail-wr1-x430.google.com with SMTP id d5so19351113wrc.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w35g7LONGg6GxH2H/1G3N3tyyzYOmehU3xOy9Vo8HH8=;
 b=foTpgdl7UoFXYNEDNOMe6udm51Im3xYyxF/PlHwzySttvrh24BI8OAv+GW/xHygkr7
 1nZzlbq49HTm5i+qM7GyAmr/TOv8N/0owUgmWB/oQhlKFNe5LkvF7UdM1zp8SPhdefLI
 i6/c2wdQJIqiAn3L+Q4N/wzY6PIxJm38xaLueT3ZiTQhU9f9kMl2vjzu8j1dHtZNBzH7
 W2qMsPrB2RXPCX3+2AooLy+mOBna685Od3wH1DC73yS/PRi+vjvS3ex3qCb6yELdN+su
 fwVXBVkmhuTSM2j6WFnjyHzLjt1dWarEj18cprGJUmxsxnEFnHHgvhj3DyulKwuyE2PN
 e13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=w35g7LONGg6GxH2H/1G3N3tyyzYOmehU3xOy9Vo8HH8=;
 b=XI9nCfUFAdN+VWA1tUsU/j2Rbt/GF+2jM8LYgLiHEQc0UgKamAnjCjTbmvEaHqzULD
 3Z8xTnm/8vzXyPlnidiqi499me/JNke05s2ll68rolldIndJb+NVyrELwja+htB3HyoG
 WJFge1B8eu2e1s3T8rM0wNv/DsPn1A6vA34kwQONbG+Soe7WlKUg1z/opVvx6mENGv47
 CaITri99EIo/ywpBHGhK2C/8ylfSTKGS7AVDexv1vfKyz0QFCsHHWR/nL2+mALRjfDg4
 aH7d31cHJIUM06FptQ+eBm8TRvp4LqMtpSIocMmvJnhA2q3P46Y031yB7DWtjR17ymjO
 Z6hg==
X-Gm-Message-State: AOAM531GV9vHxmJefb1SmiZWJ+Bb6fDhMmGZ4nlOAvRDm45oLZMZ6jgU
 aSsio547PkYT/kVAN0+9BcyveCqoHPI=
X-Google-Smtp-Source: ABdhPJw2x/gw51OdbAxAZmDp1EP9vWWlJbvi1CtYMf3yAt2Xfoo3vVl14fU1ze4CJ5jl6B/YenPmbg==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr9165766wrg.433.1637341924605; 
 Fri, 19 Nov 2021 09:12:04 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l4sm280139wrv.94.2021.11.19.09.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:12:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 0/5] hw/display: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Date: Fri, 19 Nov 2021 18:11:57 +0100
Message-Id: <20211119171202.458919-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the open-coded vga_mmio_init() to a sysbus device.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/display: Rename VGA_ISA_MM -> VGA_MMIO=0D
  hw/display/vga-mmio: Inline vga_mm_init()=0D
  hw/display/vga-mmio: QOM'ify vga_mmio_init() as TYPE_VGA_MMIO=0D
  hw/mips/jazz: Inline vga_mmio_init() and remove it=0D
  tests/avocado: Test NetBSD 9.2 on the Jazz Magnum machine=0D
=0D
 configs/devices/mips-softmmu/common.mak       |   2 +-=0D
 include/hw/display/vga.h                      |   6 -=0D
 hw/display/vga-isa-mm.c                       | 114 --------------=0D
 hw/display/vga-mmio.c                         | 141 ++++++++++++++++++=0D
 hw/mips/jazz.c                                |   9 +-=0D
 hw/display/Kconfig                            |   2 +-=0D
 hw/display/meson.build                        |   2 +-=0D
 hw/mips/Kconfig                               |   2 +-=0D
 .../avocado/machine_mips_jazz.d/nvram.bin.xz  | Bin 0 -> 700 bytes=0D
 tests/avocado/machine_mips_jazz.py            |  99 ++++++++++++=0D
 10 files changed, 252 insertions(+), 125 deletions(-)=0D
 delete mode 100644 hw/display/vga-isa-mm.c=0D
 create mode 100644 hw/display/vga-mmio.c=0D
 create mode 100644 tests/avocado/machine_mips_jazz.d/nvram.bin.xz=0D
 create mode 100644 tests/avocado/machine_mips_jazz.py=0D
=0D
-- =0D
2.31.1=0D
=0D

