Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F7C69C7B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:31:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Jt-00046m-AB; Mon, 20 Feb 2023 04:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2HF-0007hB-2H
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:16:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2HC-0004NF-Ia
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:16:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k14-20020a05600c1c8e00b003e22107b7ccso511826wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jeXuk3DN5Mx4yuY9/PXaV3cLllgNC2UqEL9auJG1ah4=;
 b=X9HI8cuKVoc6cu7Gy/gd0haTMRShy2N0X6gMidIQHR+XvCNefLGAOjD2DoeYj6tURQ
 SuH5B2BqI9h3Yncex8mygXrjRLxzVGKJK1uaxwS3C+/EOAQZntxDApkjaBy2+kFm3zuY
 6tgr8/NeeTG8RfYV4LD+hUK/EvRctLyFUj6w2dICzyrce0LbbrF/IJ57iHPdjR+4b+gk
 SGFuFwSj6x5YmUW3yKsojCUJt3F4bwIxuvY2Sg1O7AYGqSgFEBN3oqCrM+8FCrar7Z1Z
 vJGM2kOTRw1Xmkun6xa+K3Hxdo7VqSAZJicduCAxIq9p6H8+B+jkuiuBijw50TEAIZBq
 lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jeXuk3DN5Mx4yuY9/PXaV3cLllgNC2UqEL9auJG1ah4=;
 b=bQvUQPikuSoy+vh+r3tbYEP6sBKYhu6PDNcKm5hId6RdWi5op0aUiCbsSisIMYuSn9
 kjDDymrOO7SX3NzXeWIdEuex8oPPtAXJ/b65V/8vg2deHES6UPmZjZCjQs6zmlSh31bV
 gAju1AdbYsOZzVv9ASG/Kyf7xNa+3F1cSyXaBjSP/tJXKZwM8SS3a/Ec7zgnwfUoc+F5
 bMb1EI7c2xXlekL+dSLv38RKXVfRT7v12SSMX5PYq+UQfw50xWTyKbHhgC7IW/UOL4Vp
 WJX0C63UVfd9A1g1fHE6L5NRKJM6ebmAzOiW0kUhOkmglCOzJhW+5RRYR58bpfKa5JH4
 Q/iQ==
X-Gm-Message-State: AO0yUKX4E/fjCWeqqgYVsHx6tyZXEflUinwdAbWv28OzeVB2L/XTe0Za
 xiuAwn2BNUIqN2uV7uWDbH4Wy4Gp2x80eU3T
X-Google-Smtp-Source: AK7set+EGk4RIxEK3u8rvk4rYNXk/VvC9GfsIIBZ07UHPXuFDZWcrs2zIi6feXHhDMfzIvBHlcM67Q==
X-Received: by 2002:a05:600c:984:b0:3e1:fff7:e970 with SMTP id
 w4-20020a05600c098400b003e1fff7e970mr82721wmp.30.1676884560915; 
 Mon, 20 Feb 2023 01:16:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c500900b003daffc2ecdesm9573572wmr.13.2023.02.20.01.15.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:16:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 24/24] hw/ide/ahci: trace ncq write command as write
 instead of read
Date: Mon, 20 Feb 2023 10:13:58 +0100
Message-Id: <20230220091358.17038-25-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Fiona Ebner <f.ebner@proxmox.com>

Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230217103130.42077-1-f.ebner@proxmox.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci.c       | 4 ++--
 hw/ide/trace-events | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index d79b70d8c5..55902e1df7 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1086,8 +1086,8 @@ static void execute_ncq_command(NCQTransferState *ncq_tfs)
                                       ncq_cb, ncq_tfs);
         break;
     case WRITE_FPDMA_QUEUED:
-        trace_execute_ncq_command_read(ad->hba, port, ncq_tfs->tag,
-                                       ncq_tfs->sector_count, ncq_tfs->lba);
+        trace_execute_ncq_command_write(ad->hba, port, ncq_tfs->tag,
+                                        ncq_tfs->sector_count, ncq_tfs->lba);
         dma_acct_start(ide_state->blk, &ncq_tfs->acct,
                        &ncq_tfs->sglist, BLOCK_ACCT_WRITE);
         ncq_tfs->aiocb = dma_blk_write(ide_state->blk, &ncq_tfs->sglist,
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index a394c05710..57042cafdd 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -91,6 +91,7 @@ ahci_populate_sglist_short_map(void *s, int port) "ahci(%p)[%d]: mapped less tha
 ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64_t off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
 ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ transfer finished"
 execute_ncq_command_read(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
+execute_ncq_command_write(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64
 execute_ncq_command_unsup(void *s, int port, uint8_t tag, uint8_t cmd) "ahci(%p)[%d][tag:%d]: error: unsupported NCQ command (0x%02x) received"
 process_ncq_command_mismatch(void *s, int port, uint8_t tag, uint8_t slot) "ahci(%p)[%d][tag:%d]: Warning: NCQ slot (%d) did not match the given tag"
 process_ncq_command_aux(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: Warn: Attempt to use NCQ auxiliary fields"
-- 
2.38.1


