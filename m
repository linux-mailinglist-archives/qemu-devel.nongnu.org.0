Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165657F884
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 05:50:25 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFp6t-0006GO-MC
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 23:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oFp4G-0004d4-0Q
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 23:47:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oFp4E-0003yd-5a
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 23:47:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id y1so1052013pja.4
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DrwsoJAxCJokb6pvpy7vscLigX+OMGyUI7ACfS3fkc=;
 b=aiOBO7ZkZi4APa/LKQHZPRmmX57GDECplzSs7uw6b5J/RHoMEhfGa0sOL8HiWeEiRu
 Ndb8Eesjj/IZBayBkYK9CObFoPsiVknFxPcg3X7J/WgJvwASVIAE4nG/X7cKYdNxglMC
 QrYVIEXiwYsdpe54h1RdpklgRi6aVchlwuODNH74r0Ji31IsscUGDsGRxm9tQ3smfvAQ
 7H6cg0VyQGUfuiIETiyDscPTZIuOfDvzIYdyHkLGArM66ealnL0+ArILNyOI2RFYUIYX
 E29JN1Y3TgYZpZ0zUwhjclyyNm9GT9QDM+p7G9dso2VveHrbo1IUrj4Q+XgjbBqp6J9a
 7oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DrwsoJAxCJokb6pvpy7vscLigX+OMGyUI7ACfS3fkc=;
 b=d/aJiudj+Ylv7IJeCUkAjMXsxtEayE9T1VlVrvq+Nye+Z/1+nERtOLa9cAUdysrdpj
 5KvjYkOozIlaQxbfUcF33dqUID0J1mQwM9m5jlYdUS0gHJD4Wg/RzgJ1uWSB+NEo1TBj
 Y6wtNgkaLK+6243Z05ii2HZInFALP0ZLa6+luOMZxHE0sawz5j7TbohmN/hIF+J0iok1
 9VC5odVH78FQB1WX/5O+ArC3nP3FrP98pk+rXehSnYBp+p7muHYxNbwVJ0nZfGQ+pWNU
 TI8PPAqjEOUiTBUNhymEny/SiExjvnlBFQa1hWu8oLp1KzNe9AQfoIhYGUzbYo0tsit5
 MTrw==
X-Gm-Message-State: AJIora/Tqa1mfQqPht41JHH9onnxwMOSAmCtHJUhxoP3+yag6BQNFcfh
 JpytIbW3k982OChCAp5X8l3u6JqszK518A==
X-Google-Smtp-Source: AGRyM1vYb/melUmAesLr2XnmKafs6eECQhtFAHW9klvtuR6bIn9847EZeUn2ONcBxZU6YgGb5GLWJw==
X-Received: by 2002:a17:902:cf0c:b0:16c:8a4e:746b with SMTP id
 i12-20020a170902cf0c00b0016c8a4e746bmr10460348plg.37.1658720856287; 
 Sun, 24 Jul 2022 20:47:36 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a17090322c500b0016a214e4afasm7763420plg.125.2022.07.24.20.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 20:47:35 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v5 0/1] target/riscv: Add Zihintpause support
Date: Sun, 24 Jul 2022 20:47:27 -0700
Message-Id: <20220725034728.2620750-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause to exit the TB and return to main loop.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

--------
Changelog:

v1 -> v2
1. Pause now also exit the TB and return to main loop
2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function

v2 -> v3
No changes, v2 was lost from the list

v3 -> v4
No longer break the reservation in trans_pause

v4 -> v5
Rabase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply.next 

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.25.1


