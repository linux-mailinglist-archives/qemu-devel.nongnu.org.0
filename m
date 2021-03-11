Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF53381ED
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:53:00 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV6x-00034l-LO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKV1r-0007CT-EZ; Thu, 11 Mar 2021 18:47:43 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKV1p-0004pf-BT; Thu, 11 Mar 2021 18:47:43 -0500
Received: by mail-pl1-x633.google.com with SMTP id 30so6477205ple.4;
 Thu, 11 Mar 2021 15:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wh9EwU4i06ioYEqsPWPov44GpqVJVHuB8gjUzCfLwQs=;
 b=diRKxDBTlmvuzpcijsYMSTDfcXcl4CPzNNgZaShLSbNBbNh5/dDIi86Zsd/iTvpkiJ
 nvVjT8VUhKCK/5OFPSa4z6X10Wr4M/ClCclzZwD9fGiuuTemy26HmIvhzFIFaC+37cQC
 AtEDJfHY2JW53d+BPJsAjKAsU/OisLhl1TgH1oQmfCj/JTbsN4Ba4cW21tqU03fPnY05
 VFhYP1OCmSy73WJgLDTyg5wD5NJxDUKaZ5zWr7ahdLMi5JaBWcBmg2T/xbBJyRpr2Pbl
 nCvfK5KB+05qpzEf3buR+TxnFFzDDyRzBESYMEk4xzGPCPdz5KcvF/TYqmvnMVw0ZHsS
 mJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wh9EwU4i06ioYEqsPWPov44GpqVJVHuB8gjUzCfLwQs=;
 b=UYEDA7L9aNLV13d1WiULdaU27YgY9wKw92SyjaTWVT2z7VfrqhUJIjNq9x04RVD/4E
 iGCuAofQTLLZyB7CWQICEMgZTMF831R5wd47xqujc22OjQztgTj4l1NqSZ5JITu/wv5H
 A8UK9y/VpQpTJekDufiL4L7bzFaPfFYpAtVm2ikotzAr3lC+AwEfyR9YAKg3zIJO7+NG
 TXB7xEBBXyHfVfA67/RHEhq2uWXsAEmNZk4IAQ0SsnzRACMR4JrY3/ngVcjtAcqO7DgU
 9AgqotyN27g05LEZk9qZsJuKu4Fz/HEqhjoNlgwHkLcj4sK1YqswEzPFph5m4pOdAinG
 ewlw==
X-Gm-Message-State: AOAM531NJUyMKI2t8lstTgJqff5QQNpP3a6seS2Hxj84ASVLicvNwFDZ
 n2VUWEfK0wUaoXcy5q88tPI=
X-Google-Smtp-Source: ABdhPJxQhXp2P2kQYccGLwO5sQiORzLx9UZg6imloHULWOlEVtpRC/VKacacdIOQX8lWWQSuMwfFqQ==
X-Received: by 2002:a17:90b:fd2:: with SMTP id
 gd18mr11249517pjb.115.1615506459291; 
 Thu, 11 Mar 2021 15:47:39 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id a204sm3357005pfd.106.2021.03.11.15.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:47:38 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 0/3] hw/misc: Model ASPEED hash and crpyto engine
Date: Fri, 12 Mar 2021 10:17:23 +1030
Message-Id: <20210311234726.437676-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: Address review from Andrew and Phillepe. Adds a qtest.

This adds a model for the ASPEED hash and crypto engine (HACE) found on
all supported ASPEED SoCs.

The model uses Qemu's gcrypto API to perform the SHA and MD5 hashing
directly in the machine's emulated memory space, which I found a neat
use of Qemu's features.

It has been tested using u-boot and from Linux userspace, and v2 adds a
qtest for the model running as part of the ast2600-evb machine.

Joel Stanley (3):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE
  tests/qtest: Add test for Aspeed HACE

 docs/system/arm/aspeed.rst     |   2 +-
 include/hw/arm/aspeed_soc.h    |   3 +
 include/hw/misc/aspeed_hace.h  |  33 ++++
 hw/arm/aspeed_ast2600.c        |  14 ++
 hw/arm/aspeed_soc.c            |  15 ++
 hw/misc/aspeed_hace.c          | 312 +++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_hace-test.c | 215 +++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 hw/misc/meson.build            |   2 +-
 tests/qtest/meson.build        |   3 +
 10 files changed, 598 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c

-- 
2.30.1


