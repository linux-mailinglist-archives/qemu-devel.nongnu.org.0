Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD74A35DA
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 12:07:47 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE83e-0008Pp-9e
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 06:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zM-0006XT-Er; Sun, 30 Jan 2022 06:03:20 -0500
Received: from [2a00:1450:4864:20::235] (port=46619
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zJ-0008MW-Uw; Sun, 30 Jan 2022 06:03:19 -0500
Received: by mail-lj1-x235.google.com with SMTP id c7so14962959ljr.13;
 Sun, 30 Jan 2022 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEIGrybOclqUD83VbzxeddgFxVNGzQEKSjdZ4MLB4Nw=;
 b=nGJjmXtQDeVHF1UNqbl3b4txHjDui8f/o2ieRfmOi3TNxohSb8frenmcu5zGdA3ptL
 Nc5b9uQ9nu8JI73J05PpECownWxM2dMBLGByb2gswtwhYleNIqeFcYtKrgi5sjSeN+pB
 kr3rudGb76dwliKbWthhURvCyJdPc/bBjOzev2slrIw5BaDj2q93CDz1JKJrn9HsMJQV
 I+bav4ZaowalLTG8lcJNbVnR10VG/xoqzTvghon4zLYB7ffjsO/4lGUTK5vJJHV7WbU8
 Rm3Ggz9pWEB/flBg/DUeM7Hi91oqjoPToln0SqW9bMCrXOjTIdOHxrDYvliBUshkkr9O
 vn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEIGrybOclqUD83VbzxeddgFxVNGzQEKSjdZ4MLB4Nw=;
 b=Xx4R9eKOgiWSS1+e4J4du+lK4nYxKJtnsfoN3CCJa6Z9+//yDREJkBYUUSi5pd4CXO
 9MH5WY1siniDiRIA6tdVskEjOagnOx5pj789Dox45wV66j2GIedreUHNpSYKwdnZs/sC
 qtxenGb5UX73P2Qtg/ZCr9Tzy/fOM8DCUzUWQk6XBzLSaQcypaKeSQd88ja2uaq4pEJu
 4ln2s35lKd3ZSf/+dHXGjXraoiP+K4EvFFAsbVfHasvxqq4rUd6t9tznh3TrivrXMIGH
 uPC0cfFqpmB/C+dD1jpNWPfHV6W3zwENbEZXDC7oHZi8PgsfcH+6Qc/pfIMFuRyxiu8E
 6P0w==
X-Gm-Message-State: AOAM532xIl8KX5Gt4H0sEYMY/aTFnoHtySHMGxLGmVuKSRkCKBVafzDs
 qZ532bumXrH1homgtADPEuHppEEadaddzw==
X-Google-Smtp-Source: ABdhPJxh96LYrjoKB9veHJ4QV2FvmODNo6AkOrZRUscAfVVcByxXKGHliMO20CGFs94sC6fBG2ZkeA==
X-Received: by 2002:a2e:81d6:: with SMTP id s22mr11202679ljg.61.1643540594564; 
 Sun, 30 Jan 2022 03:03:14 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q6sm2788413lfr.171.2022.01.30.03.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 03:03:14 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal-virt: Always call arm_load_kernel()
Date: Sun, 30 Jan 2022 12:03:12 +0100
Message-Id: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 luc@lmichel.fr, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This should be applied on top of Peter Maydell's
"arm: Fix handling of unrecognized functions in PSCI emulation"
patch series.

This fixes an issue reported by Peter Maydell. We should
always call arm_load_kernel() regardless of kernel_filename being
set. This is needed because arm_load_kernel() sets up reset for
the CPUs.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal-virt: Always call arm_load_kernel()

 hw/arm/xlnx-versal-virt.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

-- 
2.25.1


