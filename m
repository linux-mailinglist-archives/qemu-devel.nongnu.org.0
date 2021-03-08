Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C079F331A64
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:49:05 +0100 (CET)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOgS-0007vB-8a
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lJOeB-000686-FA; Mon, 08 Mar 2021 17:46:43 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:37395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lJOe9-00037j-Qw; Mon, 08 Mar 2021 17:46:43 -0500
Received: by mail-lf1-x133.google.com with SMTP id n16so23763154lfb.4;
 Mon, 08 Mar 2021 14:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNLOvs0ucCNTAGN2Nadjp7QvYj9G74gasBhXldVWF8o=;
 b=KOPQVyoKwgQxv8UUn2j5pJoaiAuVJKo5fn29ROCpB4l5ocj3G4ofUNJACT/4AByP/E
 UTdN4L8S/3I1/DprPHN9VExB3WCzWBxGm96ygtK4hQpGY9Mg1Hmjm8LmZrI7L5ucZasP
 5Q9n0gZ0qq7kvnQgRaaZBcg7N4QQ/vR/HMHAUoqTxOPxRUuif7Dj6FdcmeUpPbl4u0tL
 VYCtK9601f6Li0VeoTCCEvduq7xe32jTvYaKNX2sFGlEwNfwCpxJVUZzoAgQ0nfkb1Wn
 bXSc/hvTMjkWoPOqgY5dbIrk6fDqclLpSM/2BctOqTESuSgQTeqwnwlWCqKuLU2x2rtk
 8f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNLOvs0ucCNTAGN2Nadjp7QvYj9G74gasBhXldVWF8o=;
 b=S6FTiCyaI8rB5pEiw5GUIgQUHSb1NPdi0AGEYwXDCF4HESOfUf14wvmfP1Mm6dgngo
 Lclgvo3fHBFqM1hPLk+xosYTC9Q4gXBQgZ8CpMm8JiH7PR8ewnzpSbys0SDzA1Sbbe2y
 AobcVnJswh6CF8Z9SnJc69XOTIxLxAUntZlxBXYxBnXIxBmRKDA2heT8zr7sGVgpSsnq
 xrffQakROplnT8/ci6RZUYA6pJuztZPrwoZSrf0dqKMyo3PxwaXHjBWUry/JO71BR+Xe
 fv3uB8IaeihZ/0PoMchKCJVo/clsQFD7CxZ282WBiabUELtotoBEbvGL7OwSmKbzq/G/
 c/dQ==
X-Gm-Message-State: AOAM531i1V/r7K0OPrN/NynflDcwoYWOZSo8dwIiGeHClBjdrAPp0VQw
 2W32nYpQ1IzuDKdW7qpkaB1kqG0Q6C5PHJjB
X-Google-Smtp-Source: ABdhPJzAY/Cf5aTYySfSrhSCtTsRCFHwLh+8mz6OnMbr4QXWx+p8ZqijrOIjapT89pBl2iJSup/g8A==
X-Received: by 2002:a19:4d6:: with SMTP id 205mr16347364lfe.50.1615243598420; 
 Mon, 08 Mar 2021 14:46:38 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id i184sm1508187lfd.205.2021.03.08.14.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:46:38 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/arm: versal: Add support for the XRAMs
Date: Mon,  8 Mar 2021 23:46:35 +0100
Message-Id: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x133.google.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 joe.komlodi@xilinx.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This series adds support for the 4x1MB Versal Accelerator RAMs (XRAMs).
Most of the controller is dummy, but it's got enough to make firmware
and some of our test SW happy.

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* Reduce list of included files in both .h and .c.
* Remove unnecessary MR container around regarray.
* Don't leak regarray.


Edgar E. Iglesias (2):
  hw/misc: versal: Add a model of the XRAM controller
  hw/arm: versal: Add support for the XRAMs

 docs/system/arm/xlnx-versal-virt.rst |   1 +
 include/hw/arm/xlnx-versal.h         |  13 ++
 include/hw/misc/xlnx-versal-xramc.h  |  97 ++++++++++
 hw/arm/xlnx-versal.c                 |  36 ++++
 hw/misc/xlnx-versal-xramc.c          | 253 +++++++++++++++++++++++++++
 hw/misc/meson.build                  |   1 +
 6 files changed, 401 insertions(+)
 create mode 100644 include/hw/misc/xlnx-versal-xramc.h
 create mode 100644 hw/misc/xlnx-versal-xramc.c

-- 
2.25.1


