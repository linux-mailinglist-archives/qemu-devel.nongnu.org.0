Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FC6F199B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:32:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAV-0007f1-T3; Fri, 28 Apr 2023 09:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4C-0005rK-3w; Fri, 28 Apr 2023 09:23:16 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4A-0001aJ-HU; Fri, 28 Apr 2023 09:23:15 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ecb137af7eso10419617e87.2; 
 Fri, 28 Apr 2023 06:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688192; x=1685280192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IfopbcdCm3JqnUyb69N+rZYN1ysla98dVjEHPkEgZhM=;
 b=fK0lQCJmpeUUmA/lDm/urwpJgq0HeeyFpGB2+Qdsm7Lc7qOosJTxFFh81G1uChkmu6
 6y3h+NzKyqrbriWz4+Qs4V+oX2RXqsag+7D4pSWic8Jgw+0JhHMs9LvuHFTLutZJLl0a
 3zKcSqBJn8nMpq2TUttPRts3APcsJW4bfsRBrJRbZiv0Ls98sc9D0TNVOin6NDXNMaiP
 +T+9E7y2yQ8dncJc2iyYe4hIfS5SCEK+wt54VOCVfdiIHH+gD0XgEkiWD1+hk9ow2kk3
 bDtwKXSLuikn6tPbYTpHdRmXq3JOUbj3dx6N9ilouP7Zi2JlUlCE6iC8XNWNXmr6/XQx
 2r9w==
X-Gm-Message-State: AC+VfDxAqwiLUD/q9dy1knQ1BMfKkUMFJO2bglU2+J9Q+IaAuxCEEgC8
 dsrmJrYFEwTDElOWoPTzXWSJEoL9nDZkmuCn
X-Google-Smtp-Source: ACHHUZ749YekqxOKwjJ8Yd4GZIzP6O7iT1DpEgEDUikG52IwiUocuw/wMhbyZIPV9qeRJmJHUoffcQ==
X-Received: by 2002:ac2:42d4:0:b0:4db:2ab7:43e6 with SMTP id
 n20-20020ac242d4000000b004db2ab743e6mr1539584lfl.44.1682688192519; 
 Fri, 28 Apr 2023 06:23:12 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 e5-20020ac25465000000b004f00f29abe0sm628875lfn.151.2023.04.28.06.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:23:12 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 689BB406; Fri, 28 Apr 2023 15:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688191; bh=L9DJxjfWRGH20opVfUzaIU7S3SfYFoTyL12Xkr35s5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F49fBn1KEZC2PETXaHeG+Th0DFCFDbMaaFFnZ/pF5o6QEavb3v6cLuVYhTziX+HLX
 HLeMTp4T4M91Ih3glyVt5wpf5z9oXlzpximE7TTwHbvWDDflMRZfkXcCnMWP4V6Xtv
 JZi/WF+1AyBITOHuxK3oAoyC7HxQAJfNiGTR4oXI=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id 83763689;
 Fri, 28 Apr 2023 15:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688101; bh=L9DJxjfWRGH20opVfUzaIU7S3SfYFoTyL12Xkr35s5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XgNkgS1/BSEfw49cLtxV4LbhfdwpOd2qk/xQv/M+1F+EBi8g3vWSGKqDN9v3m2WTp
 cVjaKjomPsMtdzLx8SSX+tZvCa6B7xhTW1GzDJmR8y2nh8yHdRqXKIUH8uTjuTIYd9
 w1Gf8Qw0dN3MyoJua5fQOVw6OkVMSq/jCZojSsDE=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 5/9] hw/ide/ahci: PxCI should not get cleared when ERR_STAT is
 set
Date: Fri, 28 Apr 2023 15:21:20 +0200
Message-Id: <20230428132124.670840-6-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 09:29:45 -0400
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

From: Niklas Cassel <niklas.cassel@wdc.com>

For NCQ, PxCI is cleared on command queued successfully.
For non-NCQ, PxCI is cleared on command completed successfully.
Successfully means ERR_STAT, BUSY and DRQ are all cleared.

A command that has ERR_STAT set, does not get to clear PxCI.
See AHCI 1.3.1, section 5.3.8, states RegFIS:Entry and RegFIS:ClearCI,
and 5.3.16.5 ERR:FatalTaskfile.

In the case of non-NCQ commands, not clearing PxCI is needed in order
for host software to be able to see which command slot that failed.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 9d79b071b8..366929132b 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1518,7 +1518,8 @@ static void ahci_clear_cmd_issue(AHCIDevice *ad, uint8_t slot)
 {
     IDEState *ide_state = &ad->port.ifs[0];
 
-    if (!(ide_state->status & (BUSY_STAT | DRQ_STAT))) {
+    if (!(ide_state->status & ERR_STAT) &&
+        !(ide_state->status & (BUSY_STAT | DRQ_STAT))) {
         ad->port_regs.cmd_issue &= ~(1 << slot);
     }
 }
@@ -1527,6 +1528,7 @@ static void ahci_clear_cmd_issue(AHCIDevice *ad, uint8_t slot)
 static void ahci_cmd_done(const IDEDMA *dma)
 {
     AHCIDevice *ad = DO_UPCAST(AHCIDevice, dma, dma);
+    IDEState *ide_state = &ad->port.ifs[0];
 
     trace_ahci_cmd_done(ad->hba, ad->port_no);
 
@@ -1543,7 +1545,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
      */
     ahci_write_fis_d2h(ad, true);
 
-    if (ad->port_regs.cmd_issue && !ad->check_bh) {
+    if (!(ide_state->status & ERR_STAT) &&
+        ad->port_regs.cmd_issue && !ad->check_bh) {
         ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
         qemu_bh_schedule(ad->check_bh);
     }
-- 
2.40.0


