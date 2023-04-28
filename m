Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E96F1994
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:32:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAW-0007fm-HA; Fri, 28 Apr 2023 09:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4B-0005r9-MG; Fri, 28 Apr 2023 09:23:15 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4A-0001a6-6I; Fri, 28 Apr 2023 09:23:15 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8eb8db083so99772731fa.3; 
 Fri, 28 Apr 2023 06:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688192; x=1685280192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IVHF7HaE/FJpqfMAG4WIgl0t+tG7pgV6IiTH6DFVl30=;
 b=ByUCd3QfiKTAaCDGjenEZTPz9gb+f7d1oPJQkt4rj9PYSLMKGN31oFV5sftOzdkCM/
 VpgM7oJ332nmokOijq1mIJ+jYKYEkx+ce23bbu0tX9sx8INpJ5DA5cDecf/HBa550pMm
 Afqvo56qYzw+qTk51lqPr0mKR+bNSd1QeXLPajPOIN41UMu0P+5eD097oQMOPui2acuP
 /vSl5vvflJVKkwjqtbsXzfbBAJrXEYSgKy9xurpNMFG6URLT1362WCVU7UNi6HwhfrvH
 i7/vf/0fLa68uQZAcPU2INF6365CNCp/FG8iW6uJZPTRiyBJqjDLA/SYlhaJfJuXCH3C
 EKMg==
X-Gm-Message-State: AC+VfDxj84bWOLsg8s/N7+px5qNwh31fJEwt0pin0teB9wVHbMYhPkCq
 W6xiqOWJ0raQ2vtM9E0DLuewAZ80G0eETPxK
X-Google-Smtp-Source: ACHHUZ5xmX3rSDZfQmsnsuT0yOebpV50aVew/x4mbxXSVYwjqg3woGRR4P/gXwYwFvWphhxIzeboWw==
X-Received: by 2002:a2e:9783:0:b0:2ab:1247:9b53 with SMTP id
 y3-20020a2e9783000000b002ab12479b53mr1731000lji.43.1682688191788; 
 Fri, 28 Apr 2023 06:23:11 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 n17-20020a2e7211000000b002a8e758f669sm3337392ljc.27.2023.04.28.06.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:23:11 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 2F3114EB; Fri, 28 Apr 2023 15:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688190; bh=4nIZf6ERltl1pb2E5WggKtCiqfw9QyHbGlE8VwOevqM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d8rqt5jxS3pjfmgRzZtOVnxsYt4M1AmI6AhzDB62AADandfENvC4GfbOzjBfAgy1h
 rQcc0+pdiVKsu+bT+JLq3bwH8fsSQir6vlsSaVMp05O81AoDaVKaj9XP3y4bFLLcl8
 r6mQZmtiCtR8Sh2f+JD701+P1C2VTOOm9AIsaNkU=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id C5EED6EC;
 Fri, 28 Apr 2023 15:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688101; bh=4nIZf6ERltl1pb2E5WggKtCiqfw9QyHbGlE8VwOevqM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mTgAHO36Hyg5dIHGPB75X4l9sYy/SKOzCZVmaX6M19f4b0zur+yIDt3gbE11KltOR
 nr1vcqjC0hdk4CYUChjo49H7ZCVQe6fB5s1/gkJUzxKGB57IxO7izoSCn+3NOx/qXg
 cGKMntRVvQqjDBTxt+wd+l3a8LdLU1CDNXNaOTyM=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 6/9] hw/ide/ahci: PxSACT and PxCI is cleared when PxCMD.ST is
 cleared
Date: Fri, 28 Apr 2023 15:21:21 +0200
Message-Id: <20230428132124.670840-7-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=nks.gnu@gmail.com; helo=mail-lj1-x22c.google.com
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

According to AHCI 1.3.1 definition of PxSACT:
This field is cleared when PxCMD.ST is written from a '1' to a '0' by
software. This field is not cleared by a COMRESET or a software reset.

According to AHCI 1.3.1 definition of PxCI:
This field is also cleared when PxCMD.ST is written from a '1' to a '0'
by software.

Clearing PxCMD.ST is part of the error recovery procedure, see
AHCI 1.3.1, section "6.2 Error Recovery".

If we don't clear PxCI on error recovery, the previous command will
incorrectly still be marked as pending after error recovery.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 366929132b..2a59d0e0f5 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -329,6 +329,11 @@ static void ahci_port_write(AHCIState *s, int port, int offset, uint32_t val)
         ahci_check_irq(s);
         break;
     case AHCI_PORT_REG_CMD:
+        if ((pr->cmd & PORT_CMD_START) && !(val & PORT_CMD_START)) {
+            pr->scr_act = 0;
+            pr->cmd_issue = 0;
+        }
+
         /* Block any Read-only fields from being set;
          * including LIST_ON and FIS_ON.
          * The spec requires to set ICC bits to zero after the ICC change
-- 
2.40.0


