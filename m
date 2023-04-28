Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F396F199E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:33:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAX-0007hv-R1; Fri, 28 Apr 2023 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4d-0005vV-35; Fri, 28 Apr 2023 09:23:44 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4b-0001e6-G7; Fri, 28 Apr 2023 09:23:42 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4edcdfa8638so10870596e87.2; 
 Fri, 28 Apr 2023 06:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688219; x=1685280219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRUJPqamteZaBxY2HOvE1kgnvhOgzMYuu3VVcMwkcmk=;
 b=E3xKSoU87h3wC/r0iN/4FBLh0Ip5EE7aUhoR/i06jkjNjBT/11uo7b4+N0JDxKQAAP
 7pN7UQHLaBQ1Nn1fE8AT9aKMkDH7nkC0PKfxjp/lB91CO7i1UizC7Ek4wo9uCHsiul9K
 Vr2ceCPCwaY7lHke/l/P6viBtULmkbNUT75isg5iAGvaV3rdVs943oewVpFqBA/I4/Nz
 obmFwBYtJhT1mlk9mFAmkhmnB0Tipu+C/MctHjXle1cU2tBDrYnUaLLaRV+DlSGyWVb1
 pNVqSTXUaqX8lZ3hnHdYUKH76DecRTndm6WXVtbqf2327pAR7FrZ24mYkkl2r4WmMLAK
 kQmQ==
X-Gm-Message-State: AC+VfDwKXCSf3onEQreSdYfmb8KPHqD6hJ8k7w6crE7pe7eVMes9h5UW
 qgYKgotL9s4c8yAY718zHY7FMBn/SbNap8bA
X-Google-Smtp-Source: ACHHUZ4N0gjf9rS2w0agdMeI644B0DcYKUO5QF3UMuw08XuwOA1qZP8OHQt4PILF9ZeiXD+mKFzd9Q==
X-Received: by 2002:ac2:488e:0:b0:4ed:d542:6f63 with SMTP id
 x14-20020ac2488e000000b004edd5426f63mr1471998lfc.11.1682688219174; 
 Fri, 28 Apr 2023 06:23:39 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 f20-20020a19ae14000000b004d85316f2d6sm3332691lfc.118.2023.04.28.06.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:23:38 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 2C7E9294; Fri, 28 Apr 2023 15:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688218; bh=r3RO+N2OE0QxKNjQnzee2qyNncPo80LGqpneO602KkA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+A9nIjrgSCM23sXoF3BBncbcD65r/wEeVZ1qhcNuu4wS3HzPfxMsWnRDEqlCfJON
 d3xZIPyviqdBbfseBl036a8sfOsuZwAQbzqPQDwWEgF3RGPOz/zAPrRGrLpoPqg+eq
 lxU8jo7z6hcVwumDrA+6Yws7wDF5qKlr8KmhyyD8=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id 7EF7D75B;
 Fri, 28 Apr 2023 15:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688102; bh=r3RO+N2OE0QxKNjQnzee2qyNncPo80LGqpneO602KkA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iTbVDWQrG2EpJRbKWKWjfMUf0zI4CuMDi97Yb5BImE3/9pLPj26mLGY/z4yyJyS/I
 VKrecpOEDfUngasdGiRqhobNCzlOyRBHjFRxbMygEEbVulMFe9bCt7NwPTk29yXH2V
 lexLVvuxU4eKTzSrRqpuo8oncfgHb1X1JfVdhirY=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 9/9] hw/ide/ahci: fix broken SError handling
Date: Fri, 28 Apr 2023 15:21:24 +0200
Message-Id: <20230428132124.670840-10-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x12d.google.com
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

When encountering an NCQ error, you should not write the NCQ tag to the
SError register. This is completely wrong.

The SError register has a clear definition, where each bit represents a
different error, see PxSERR definition in AHCI 1.3.1.

If we write a random value (like the NCQ tag) in SError, e.g. Linux will
read SError, and will trigger arbitrary error handling depending on the
NCQ tag that happened to be executing.

In case of success, ncq_cb() will call ncq_finish().
In case of error, ncq_cb() will call ncq_err() (which will clear
ncq_tfs->used), and then call ncq_finish(), thus using ncq_tfs->used is
sufficient to tell if finished should get set or not.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 4950d3575e..09a14408e3 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1011,7 +1011,6 @@ static void ncq_err(NCQTransferState *ncq_tfs)
 
     ide_state->error = ABRT_ERR;
     ide_state->status = READY_STAT | ERR_STAT;
-    ncq_tfs->drive->port_regs.scr_err |= (1 << ncq_tfs->tag);
     qemu_sglist_destroy(&ncq_tfs->sglist);
     ncq_tfs->used = 0;
 }
@@ -1021,7 +1020,7 @@ static void ncq_finish(NCQTransferState *ncq_tfs)
     /* If we didn't error out, set our finished bit. Errored commands
      * do not get a bit set for the SDB FIS ACT register, nor do they
      * clear the outstanding bit in scr_act (PxSACT). */
-    if (!(ncq_tfs->drive->port_regs.scr_err & (1 << ncq_tfs->tag))) {
+    if (ncq_tfs->used) {
         ncq_tfs->drive->finished |= (1 << ncq_tfs->tag);
     }
 
-- 
2.40.0


