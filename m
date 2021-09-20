Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1C410FC7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:03:14 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDKb-0007mc-4H
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSDIt-0005CM-Ls
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:01:27 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSDIo-0004e5-Hk
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:01:27 -0400
Received: by mail-pl1-x62a.google.com with SMTP id j14so3275263plx.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 00:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpnZG0QmTQuaU6YiLWA5coj7jxH6Vu7iW1GM6tT6QVA=;
 b=ed4crKdN1GIienmNOcWFAtU9J90l9hlRc/OKCwR1/S7bAYscJIAPKPUHRMeiW7dfKR
 XYeaRZQdTF5G9R/otTVOSCqkk3chkCY1sk4YJurbslN9QePxlomI8huL2HBUwNyCaSzt
 4kO2rzeHZ0ARlz8PN11r+W+OKSMC/3v+n50Zz/+D0LomVO0p34pRUndtHDvoHRpMdgh0
 R5jWu4NJcsweyZ1/tv9QhK6b9bwbw16/gZDTFzWB3O6Fcddj/p7U+wqs4Om1U57uLeyy
 cxWfH3Miy+lhk5l/AC29dly2gEQ98Acf4XHIez0Wkl02vb7Qo2Ga5S5W/NQiZBv8GHGj
 N/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpnZG0QmTQuaU6YiLWA5coj7jxH6Vu7iW1GM6tT6QVA=;
 b=gDGYZKihff1Spy2hMKGsmtAirge6cjuY1VKjQyxJgWpFdb54K9CeVDdfIqJ+chQaBD
 BzoJqw47eGuVuJnAQFlaGmUZ1eZ3iR7fuAtFi95v2rV83wA85cRukr80ZVeg7/7BsMPb
 z1lHB3fft0FVfxEXPWgJY0W3eSt/AEATVUU4jrtF9O3Ol7LDk+6PilV11avmDCru5HsU
 0kmor3By1E6pz+4Hif05IHxVvy64GyOkLYIvm5f7SV2L813gbeBNCkXYBsmCdINKLicD
 K5pkQ6dLx6kyxx2SodMwNPlUH2SraVjxcBTYhRAPlf/5TYvxVF4C7Nw04Rb6SUWJy26j
 QprQ==
X-Gm-Message-State: AOAM5339QwZx/2PSjn7rg7eVsPb2KI4KsDiP1kaC2MhWOL9D07K9iEz7
 SxIidX2XygYtzT8FZfpKsB558Pz0AM88bA==
X-Google-Smtp-Source: ABdhPJxqr5NQI7nRW3qMolPh45ZQvdXrnl+h8A1aOR3+Mb4U5+Bs7H7GOKIVJ/vHq0ZIfjNotHKhfg==
X-Received: by 2002:a17:90b:2243:: with SMTP id
 hk3mr36590950pjb.203.1632121280328; 
 Mon, 20 Sep 2021 00:01:20 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id
 o20sm12897901pfd.188.2021.09.20.00.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 00:01:19 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Mon, 20 Sep 2021 12:30:44 +0530
Message-Id: <20210920070047.3937292-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds a unit test to exercize acpi hotplug support for multifunction
bridges on q35 machines. This support was added with the commit:

d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")

changelist:
v1 : initial RFC patch.
v2: incorporated some of the feedbacks from Igor.
v3: forgot to add the ASL diff for patch 3 in commit log for v2. Added now.

Ani Sinha (3):
  tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
    table blob
  tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
    for q35
  tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
    test

 tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8435 bytes
 tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

-- 
2.25.1


