Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA66F1CEF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:53:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRKr-0004K3-2J; Fri, 28 Apr 2023 12:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKo-0004JP-Qf
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:52:39 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKl-0005pi-R2
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:52:38 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-38e7ce73ca0so130215b6e.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700752; x=1685292752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oXstUCrChMK1U3IIw5RAhakVys7/ay86/Z2D+gejX0Y=;
 b=IGymusdXqabSPRIzFMGP08MXL0GHOXifPZdqICzPU/i2HwfhY5icjj9GoeK7XATJgB
 6MbCQQTolJ7kD5bGqC6SoenmNTpMYF8utb25B00Wd8Oy4Kj7ZYOgzvGhzfR5g1VF2nDZ
 i/uKi8RvD63+iiv3e7BebQ8KoQqb0jyKwTEnyVFbkAGfneTtXBAwateTiFA/AW+jpCAc
 KGk8nhkTaXtk6WgUsfc5sKHsO9oZYlNpvV+gy2cFM7N+MxpFCh0UBL+4qynHJO14FPjA
 r9rfvaCDQfM49SA+4JKHg/Syw08cuJ03z9Mi5Eyj66o3FJyk4PQs/rksDc3XEpY5N/m7
 0JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700752; x=1685292752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXstUCrChMK1U3IIw5RAhakVys7/ay86/Z2D+gejX0Y=;
 b=Buno0kzOLKzcWMIdl/Wfh7C1l5n9uXZKyoL3VQAWM1e4M59BOWB8VfboiutOeKCCBv
 C59BBbP+78wnPnsPGnO+3ekC0FsjfEU9fJaaO+SDQ2eDGN64YqKSMhPBs89MTKBS7ZcD
 z8S1FGp/TNSNnrtSAsIicxNkPwkszVGo0XcOksjWkzvZ3wl64gEcF3Zyx9ZAT58XDQkl
 Fc3387EG1C/3qL0s8JFkERg+CDWFByFFrGVvJT9WZ/tRNYtGPmy3FoEMwq3KajJ2VDYl
 hmIjUDs0TQNytiHtjNwRhHqwLsVD3bQIOddTI2BUt++CMcn9+adXSs7cUp97q6vO48bW
 oqVQ==
X-Gm-Message-State: AC+VfDxYBrjDecKzN/5BmjOqUtudzND9uGG2HemA0Zbs+tz2wWzCVBJx
 1YLRXYIjgvrMn+XAFaV6AiANzRdvPrzEMu1jWxYBQg==
X-Google-Smtp-Source: ACHHUZ71mvL0ZvtKER/bscbZ+SwFDTv8Dstrx7mdohHBOc9VK7Oxk+fpJDdeHC3tbJZHIJptMFrfVg==
X-Received: by 2002:a05:6808:2017:b0:390:98eb:7602 with SMTP id
 q23-20020a056808201700b0039098eb7602mr2882508oiw.43.1682700752173; 
 Fri, 28 Apr 2023 09:52:32 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:31 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 0/4] Smstateen FCSR
Date: Fri, 28 Apr 2023 22:22:07 +0530
Message-Id: <20230428165212.2800669-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below.
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence splitting the patch 4 of the original series into three and
re-submitting along with the original patch 5.

Changes in v3:
- Reuse TB_FLAGS.FS (instead of TB_FLAGS.HS_FS) for smstateen as HS_FS bits been removed.
- Remove fcsr check for zfh and zfhmin

Changes in v2:
 - Improve patch 1 description
 - Reuse TB_FLAGS.HS_FS for smstateen
 - Convert smstateen_fcsr_check to function
 - Add fcsr check for zdinx

Mayuresh Chitale (4):
  target/riscv: smstateen check for fcsr
  target/riscv: Reuse tb->flags.FS
  target/riscv: check smstateen fcsr flag
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |  3 ++-
 target/riscv/cpu_helper.c                 |  9 +++++++
 target/riscv/csr.c                        | 15 +++++++++++
 target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++---
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++---
 target/riscv/insn_trans/trans_rvzfh.c.inc | 32 +++++++++++++++--------
 target/riscv/translate.c                  | 12 ++++++++-
 7 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.34.1


