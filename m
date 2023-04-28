Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B336F19A2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:33:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAX-0007gK-2Z; Fri, 28 Apr 2023 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4X-0005ux-FZ; Fri, 28 Apr 2023 09:23:38 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4V-0001dh-Oz; Fri, 28 Apr 2023 09:23:37 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4efe8991b8aso8539374e87.0; 
 Fri, 28 Apr 2023 06:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688214; x=1685280214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xU/+JTk7oCVqZXWB6aWdEuifmOuFNJGeTyRi3vXSztg=;
 b=aDTCFQg0713gjeUMFPCTUn550LrhHD6qB7EyBpouJIeRvrFlpFSUlpQr60Qh3bftyC
 wiyiMeCiH3DCeH7P2k/wu67oGZkD2lrb66XcVAeFp5b+tzaZ6C2Xxj4V5ds3m0CMyCjg
 etVTFw/GSmKMwpZvnejwpU5/+Ejep3Eag4YCsHOf9x7JctAgKaCyq11qLBsSgEOrOAjk
 g3T6au+rjdE1iee3LP6+ShDh1J0UIQds+x6ZvV6D9TIn1LYuBMI749i0iVZT0ymD1w7m
 pgmUHBY04I8yG6jDSXmZGO+OdtiKf0cL2k4OoaqScMAzST4tOBoFuPpuwPcxK4zc1WqD
 9+qw==
X-Gm-Message-State: AC+VfDyU1eaO3ydII2/sQ6xp/RGiHJboYHhxC3hKF8Hmdley2RTWceVY
 HV6rWQvDyC4IBu25VrGB+bpwR7qR4AUChBxy
X-Google-Smtp-Source: ACHHUZ5XxKPZgv2IES1gtlHYKF+e443w+yFM9Dbq9k84CAi1C5HWs504eK3ULbTJozR79Q3Vi0NFoA==
X-Received: by 2002:a19:7016:0:b0:4ee:d752:23c2 with SMTP id
 h22-20020a197016000000b004eed75223c2mr1559350lfc.15.1682688213765; 
 Fri, 28 Apr 2023 06:23:33 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 p11-20020a2e9a8b000000b002a8c7c5d64dsm3354762lji.1.2023.04.28.06.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:23:33 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 2E3F23C7; Fri, 28 Apr 2023 15:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688212; bh=tbSOs7oKUuhJVh7XJgV1FX58SIGIet6cYZMAoAjteeU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vRrXwnDwOMhDuoRXoG8qY5WppyqMKDG7Zls3B6c57lZO44PJ3VI62J+KqR3II+tBd
 UkH2IGomC5l3uFT+eXDntEn3nUX4O5cc2DBUVpwvWikeRQUO/DyZ00DyA5YyImH8XK
 WDa2h/YS/jzvKo0HquVXS3JO14g5OuoHjVMb7gQg=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id 3FDF2744;
 Fri, 28 Apr 2023 15:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688102; bh=tbSOs7oKUuhJVh7XJgV1FX58SIGIet6cYZMAoAjteeU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BWTrz6xa1hQK6GJFf3OYImn4rcmuqMxgGHSlo3uk06DVUkPF5x+TewMmY+bXzXQ8m
 ExpkYjpZQn4oTKhRlaCMwmTp3Dnt6OQY9VQDQ3DQd9kVgiq0GV7IveVMDJV0k27OGu
 TQiEHQhich5RjkpmOG+b8wU8H3sZ3ndPBeMpMbwY=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 8/9] hw/ide/ahci: fix ahci_write_fis_sdb()
Date: Fri, 28 Apr 2023 15:21:23 +0200
Message-Id: <20230428132124.670840-9-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x134.google.com
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

When there is an error, we need to raise a TFES error irq, see AHCI 1.3.1,
5.3.13.1 SDB:Entry.

If ERR_STAT is set, we jump to state ERR:FatalTaskfile, which will raise
a TFES IRQ unconditionally, regardless if the I bit is set in the FIS or
not.

Thus, we should never raise a normal IRQ after having sent an error IRQ.

It is valid to signal successfully completed commands as finished in the
same SDB FIS that generates the error IRQ. The important thing is that
commands that did not complete successfully (e.g. commands that were
aborted, do not get the finished bit set).

Before this commit, there was never a TFES IRQ raised on NCQ error.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index d88961b4c0..4950d3575e 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -806,8 +806,14 @@ static void ahci_write_fis_sdb(AHCIState *s, NCQTransferState *ncq_tfs)
     pr->scr_act &= ~ad->finished;
     ad->finished = 0;
 
-    /* Trigger IRQ if interrupt bit is set (which currently, it always is) */
-    if (sdb_fis->flags & 0x40) {
+    /*
+     * TFES IRQ is always raised if ERR_STAT is set, regardless of I bit.
+     * If ERR_STAT is not set, trigger SDBS IRQ if interrupt bit is set
+     * (which currently, it always is).
+     */
+    if (sdb_fis->status & ERR_STAT) {
+        ahci_trigger_irq(s, ad, AHCI_PORT_IRQ_BIT_TFES);
+    } else if (sdb_fis->flags & 0x40) {
         ahci_trigger_irq(s, ad, AHCI_PORT_IRQ_BIT_SDBS);
     }
 }
-- 
2.40.0


