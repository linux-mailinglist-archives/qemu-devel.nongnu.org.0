Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163685442BD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 06:44:10 +0200 (CEST)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzA1g-0007pV-SB
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 00:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz9yd-0004nG-B6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 00:41:01 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz9yZ-00081b-V4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 00:40:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id b135so20066906pfb.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=SL2n1Ii2dsA/H/DKoKzg6IIo1bdbBfipGZ9o1hQM+heiSaf3Vk4jXueayNO4QsySNb
 HGq9WUgyr8YUSqyOL9QUM/fItHrILDFDRtgNo6SedQlnSu9YihK3NWWuFVOEWSZ05COm
 LctCGfGAExA1ioa0eb9oFcUzIaGJXZc50F+jgd3ETnEGk6XgPcdc3YzmmcsZ+6u+bGAb
 j2r3g4gHDh6dtIZshhAI2EhFVdccWiMRe050GtSChutW/7noc9zZ8TXkVfUxYgEcbodk
 iVNyfwUIpn5Qa5rdGmdp9YY0ygU4+TxYKRtdk0qEO4Dp2IiEYQgNRTfFv+QSt2XoaX/b
 QZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=wioVRn8oK5m3szCWME/T7nrnyYsWDAa0v+XAIfUwGHrIrxKUI5zV41FFSPHIYamCGy
 T9s8Jp76echYqo9dk4djWYGlGkcgZ+s5bQ2VGTkgyo8TQGo2BWOrO8QBFic5+UdDsyiN
 KzzUuhmyCrtsqjqino/hXYnUrtTn4omzj6lSxVjE+tuBfCrEXufhTaQ5h28C8ZwcLyZO
 BE5jzEV5r5rdNlZo0j1El6YHTRmirgom/HK9SlndLrY8OVL4166VBwXxZxIKV9tmEEWw
 gspPudYDAe4HF/W9PbJWov6F6SVa4MCllb31qfCmOxuxu71y3RyQXoJUvBvBSkl45KlU
 Xtzw==
X-Gm-Message-State: AOAM531oLAJz0ZvEshweaYJnWggamhNvu4xv6co2AqK259OjnDsEuhAH
 ttayUSZYwRTR1QZnkK0m9hkqMW/2+KaQ6A==
X-Google-Smtp-Source: ABdhPJxev225ItuLMWWJMcDxApXTPSNDkoF9M+nuTzAQuzDxE7LRlZ0CFzhicNyUbCfxmOj5M1OsxQ==
X-Received: by 2002:a63:305:0:b0:3fc:7f18:8d7 with SMTP id
 5-20020a630305000000b003fc7f1808d7mr32771306pgd.186.1654749653050; 
 Wed, 08 Jun 2022 21:40:53 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001634d581adfsm15934870plg.157.2022.06.08.21.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 21:40:52 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 0/1] target/riscv: Add Zihintpause support
Date: Wed,  8 Jun 2022 21:40:44 -0700
Message-Id: <20220609044046.1903865-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=daolu@rivosinc.com; helo=mail-pf1-x431.google.com
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

Added trans_pause for TCG to mainly to break reservation and exit the TB.

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

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1


