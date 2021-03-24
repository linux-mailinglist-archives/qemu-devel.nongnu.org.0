Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB595347236
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:16:38 +0100 (CET)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxkr-0003sB-Pu
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxei-0002Hr-NO; Wed, 24 Mar 2021 03:10:16 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxeg-0008MG-M3; Wed, 24 Mar 2021 03:10:16 -0400
Received: by mail-pl1-x630.google.com with SMTP id v23so7425853ple.9;
 Wed, 24 Mar 2021 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/o7dxIJvo+wY+R5e6q/EE3dKUI5sEW9NHgjAowAggU=;
 b=Sqzsam3iQNhxwjdlssfCWuNkuPf2hSnt1XEY4HslD7U0eTUvCjbVXueCN2DMAa//l/
 XyZGxCMTyVoMWZaN0Y1zK5UonRpJkPQcnumMK6FW/tjoQA0gxVgnGTy9SrcqsBbF6dbd
 vhYTs6VW6Mfelm7xMB3+2CR8Zs+IXqUnERcxx/+6AIobl0cHGUI7qZIoYcAr2iDh27JZ
 NIQMS34CLc3Dkh2w0QfFsrshb+13RzlctZqoyQldkjQPmEVeaaJDM2GqbumQNGCOXOZK
 W2PSSV7aGKRoeedi3Cb1cYO1PMPT9RmwJCrb9Ah+dW1r+EIW/8yy/t8DtFF36lsj2+qB
 RCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3/o7dxIJvo+wY+R5e6q/EE3dKUI5sEW9NHgjAowAggU=;
 b=QSMS2APhMDab82Lnu7V7Fc5e+xFpgBtbrkA1jmEBOXBrmfwHCSg/aCXbofb/HDuL+Y
 LZPWxfSJIVZ09c66Fv1EPJfD3A107ZTOEnyra8y1ABKYC8wKfAnT/DacQy117OB30T/B
 105aZ5vLVAnEgYDaABtrPm7/jR2azomNCcHfWvQKd3B/ZBRT2Xjt36Xf0yvBvgLfGGGP
 DUtvIDw8Cv5kzgBu2S7M6JojbIAO4gq4ln9qbuRHvvjuElJz3xU3183z/F4Ke19pHK7J
 G3PiqP3QWjbZ9ERHW3lGPd0ZrmHJFBa6BmA/6h+REPD8F+PAi6sORzAnKcSFylb3i/bi
 zEsA==
X-Gm-Message-State: AOAM533E7mkOTuts+6zAgHEslSb9nwRxGT2+a1v6b1yXrfuee6pEG+uv
 zSYjTSMZmQIHx7ABp9yfuH0=
X-Google-Smtp-Source: ABdhPJyS5VMB3V3xnh/SYfGgPUSqHcUNZYuC/39hD3sLCtsLggkoL4SA5w4DASaccaJ17MZX1L94Bw==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id
 fa20mr2011528pjb.220.1616569811746; 
 Wed, 24 Mar 2021 00:10:11 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id y22sm1297116pfn.32.2021.03.24.00.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 00:10:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 0/3] hw/misc: Model ASPEED hash and crypto engine
Date: Wed, 24 Mar 2021 17:39:52 +1030
Message-Id: <20210324070955.125941-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x630.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4: Rebase on Philippe's memory region cleanup series [1]
    Address feedback from Cédric
    Rework qtest to run on ast2400, ast2500 and ast2600
v3: Rework qtest to not use libqtest-single.h, rebase to avoid LPC
conflicts.
v2: Address review from Andrew and Philippe. Adds a qtest.

[1] https://lore.kernel.org/qemu-devel/20210312182851.1922972-1-f4bug@amsat.org/

This adds a model for the ASPEED hash and crypto engine (HACE) found on
all supported ASPEED SoCs.

The model uses Qemu's gcrypto API to perform the SHA and MD5 hashing
directly in the machine's emulated memory space, which I found a neat
use of Qemu's features.

It has been tested using u-boot and from Linux userspace, and adds a
qtest for the model running as part of the ast2600-evb, ast2500-evb and
palmetto-bmc (to test ast2400) machines.

Note that the tests will fail without Philippe's series.

Joel Stanley (3):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE
  tests/qtest: Add test for Aspeed HACE

 docs/system/arm/aspeed.rst     |   2 +-
 include/hw/arm/aspeed_soc.h    |   3 +
 include/hw/misc/aspeed_hace.h  |  43 ++++
 hw/arm/aspeed_ast2600.c        |  15 ++
 hw/arm/aspeed_soc.c            |  16 ++
 hw/misc/aspeed_hace.c          | 358 +++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_hace-test.c | 313 ++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 hw/misc/meson.build            |   1 +
 tests/qtest/meson.build        |   3 +
 10 files changed, 754 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c

-- 
2.30.2


