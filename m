Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B95387CC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:41:17 +0200 (CEST)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlGN-000809-5c
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlDf-0005yg-FC; Mon, 30 May 2022 15:38:27 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlDd-0008AO-GY; Mon, 30 May 2022 15:38:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id a63so4704429pge.12;
 Mon, 30 May 2022 12:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRWqlDxP9/kx8Mzwjk8k/mZThb7Cmqy3AeRT8l+rQ0M=;
 b=DftO1eVJJ9QcFl4RYKCoGxndfhvYgkD9TAlyLTgNymrw7rN5fL5ODH/OK8ZHmEsXxj
 Gmulx4s2rx4oiGfCZthH8cjMZG6L8ogPNLlg+EJH+A8OOSot+axdBz3lGV7f4BenGpkm
 xU7wJx8BDKjhtZ2lj6+IYFgBNAGZ0AvhGA6r204zCwD/ky+378ZcvwGWoHpMEfWzM4z+
 yuNu/X8WLcK0VUsHQVqDeCHODwaSStVABNdsGVlkxe90dGXCopEgF4kvuD60Iqx2Chrv
 ozRGRbtgoouwa2eunzV5dUUiGn4E06CyhFlcmaH/swYxPZfikjWjCIHhJoVu3S15SRIj
 FnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRWqlDxP9/kx8Mzwjk8k/mZThb7Cmqy3AeRT8l+rQ0M=;
 b=jtOMs1j/CBF/WiW4YpScUSBkxkwCIAy+N8UGrAQt6FxddxF44xiDaL05IbGoZV24ep
 CS/IzykX+SJSiTwnP8SCt9miDLnRSsp5Y0RopRA2u7NErDFt5tcUJEtuqPmibMgFk2mR
 A5acFnsLFdtHvTB+gmk35rXboitDPaKNEJuAsEQ8pamPjB7bhdPqDdpgxKssBzpwHbUM
 TXD/6rTBPY8D8Yk033ammw08LaautWL+UWsXChT7BcbZB+5etov9P5mPJHei51VB6rTL
 +aCJ9WG6GzSL4WkkKT5EQm9q0igpElnsCg8svAjkAnwl9VmIDEDLBxFt7h2DXkC2SCHq
 8Gng==
X-Gm-Message-State: AOAM531itnoHjmusRBlyTDyxPDovaNDFbYR1y/9Gp756gHpOjwGpyFTh
 H1m0DOgBGo1eIG5ph89X5228gYD6Gxg=
X-Google-Smtp-Source: ABdhPJy+OhODP1vbQXOw/W39Q/z2xFmKEbFdiCXQSPZ7VLYYWuOqYGt2I7m+yd0PWpEOuOSE4ygMZw==
X-Received: by 2002:a65:5c0c:0:b0:3fa:b2c0:7935 with SMTP id
 u12-20020a655c0c000000b003fab2c07935mr27921923pgr.600.1653939503379; 
 Mon, 30 May 2022 12:38:23 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090a2c0300b001cd4989ff42sm84137pjd.9.2022.05.30.12.38.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:38:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 00/25] hw/sd: Rework models for eMMC support
Date: Mon, 30 May 2022 21:37:51 +0200
Message-Id: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Rebase/respin of Cédric RFC:
https://lore.kernel.org/qemu-devel/20220318132824.1134400-1-clg@kaod.org/
(sorry it took me so long guys...)

Pushed at https://gitlab.com/philmd/qemu/-/commits/emmc-v2

I plan to queue patches 1-12 via sdmmc-next later this week.

Cédric, if you are happy with this series, it should be easy to rebase
your other patches on top and address the comments I left on the RFC :)

Regards,

Phil.

Cédric Le Goater (6):
  hw/sd: Add sd_emmc_cmd_SEND_OP_CMD() handler
  hw/sd: Add sd_emmc_cmd_ALL_SEND_CID() handler
  hw/sd: Add sd_emmc_cmd_SEND_RELATIVE_ADDR() handler
  hw/sd: Add sd_emmc_cmd_APP_CMD() handler
  hw/sd: add sd_emmc_cmd_SEND_TUNING_BLOCK() handler
  hw/sd: Add sd_emmc_cmd_SEND_EXT_CSD() handler

Joel Stanley (4):
  hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
  hw/sd: Support boot area in emmc image
  hw/sd: Subtract bootarea size from blk
  hw/sd: Add boot config support

Philippe Mathieu-Daudé (13):
  hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD spec v3.01
  hw/sd: When card is in wrong state, log which state it is
  hw/sd: When card is in wrong state, log which spec version is used
  hw/sd: Move proto_name to SDProto structure
  hw/sd: Introduce sd_cmd_handler type
  hw/sd: Add sd_cmd_illegal() handler
  hw/sd: Add sd_cmd_unimplemented() handler
  hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
  hw/sd: Add sd_cmd_SEND_OP_CMD() handler
  hw/sd: Add sd_cmd_ALL_SEND_CID() handler
  hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
  hw/sd: Add sd_cmd_SET_BLOCK_COUNT() handler
  hw/sd: Basis for eMMC support

Sai Pavan Boddu (2):
  hw/sd: Add CMD21 tuning sequence
  hw/sd: Add mmc switch function support

 hw/sd/sd.c             | 645 +++++++++++++++++++++++++++++++++--------
 hw/sd/sdmmc-internal.c |   2 +-
 hw/sd/sdmmc-internal.h |  97 +++++++
 include/hw/sd/sd.h     |   7 +
 4 files changed, 627 insertions(+), 124 deletions(-)

-- 
2.36.1


