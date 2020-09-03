Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A092D25C810
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 19:29:22 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDt33-0002Vu-Mi
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 13:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDt20-0000v2-Vh; Thu, 03 Sep 2020 13:28:16 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDt1z-0002Vw-Be; Thu, 03 Sep 2020 13:28:16 -0400
Received: by mail-wm1-x341.google.com with SMTP id q9so3682039wmj.2;
 Thu, 03 Sep 2020 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91f5lKKcpgYukroYyk+ZgX5AZVtjLWpe85jPZGy47cQ=;
 b=LyC+W766N/SwxeuWQWdZT0GanuQ0dc5ctaDpI91uj2h7ZqfZa7yANoCBSVdqndSr68
 S6zx4CtfamtXLOxPkLiMmCxtbcEEvSXqLBTE2fDIpXWXBR/6grDvpUHTLMZuOSo1jBET
 uYqLawQbCL4xH5ZFvWifVnQqE3d1ZHzqhe2v6WPJOZb0lzpmYb12xucEREg69PFPE9MH
 SnC4DVAH8pUlkl6Tr1QGKqTib/mj1fwYIuVnMHIlY5uSyQfc9+LfG/VPOM6nczxWGCxa
 bq1PlXmWZJ3hKzaql7SvzgVrHRgIfO1IbNKLPGXAfMxFW6tB7x4XG174loooTZrKfyo9
 zXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=91f5lKKcpgYukroYyk+ZgX5AZVtjLWpe85jPZGy47cQ=;
 b=JBA8TNHtpjFiC6AAu18xghJull1m+1E58bqG3DJqKLnrg275/Aj1UrQRqZLnvQd3CY
 JHmJVROlWqbjQSFBSx5I9A8cFBESHcjKQLQN1Hl2inwnPyMjSExkt2pjEpwLBwLHyjBa
 b6Hyyt9yMCWYUsfkFmsH73BJrC38TrAHTx4lilXDReHI6vczFiyz2LKTbAYi3yteK75B
 VX6/ndav5fm5Ztn7EXY0OanhdaFOTj2NcEXr3DVtibSU8wXWstUQAtoSBPsYJuu4Rvca
 hNBWlVO50zyo4v01h7qv/HSvBVlkhxZvwbmldT1m4goN5oTpDdL/WcTharmWHCjLageD
 CC+Q==
X-Gm-Message-State: AOAM533XKw2tD3ceqJ/Qp9lQShHUJkVSHNYI4QUi9UP3hNCnzt0WKTC/
 KAPP0V+X9lulA098BAdb8RavuAFaK0w=
X-Google-Smtp-Source: ABdhPJwfftNG6J6/XNPMEoDaI4gmXsDzgz1Hq9VnvdZ78H87d5DMluA8RToDucGlDNCoK9YKMmaU+A==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr1779631wmc.151.1599154092897; 
 Thu, 03 Sep 2020 10:28:12 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b2sm5325802wmh.47.2020.09.03.10.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 10:28:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/sd/sdhci: Let sdhci_update_irq() return if IRQ was
 delivered
Date: Thu,  3 Sep 2020 19:28:05 +0200
Message-Id: <20200903172806.489710-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903172806.489710-1-f4bug@amsat.org>
References: <20200903172806.489710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Ruhr-University <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 2b197631870..06cb098036c 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -215,9 +215,14 @@ static uint8_t sdhci_slotint(SDHCIState *s)
          ((s->norintsts & SDHC_NIS_REMOVE) && (s->wakcon & SDHC_WKUP_ON_RMV));
 }
 
-static inline void sdhci_update_irq(SDHCIState *s)
+/* Return true if IRQ was pending and delivered */
+static bool sdhci_update_irq(SDHCIState *s)
 {
-    qemu_set_irq(s->irq, sdhci_slotint(s));
+    bool pending = sdhci_slotint(s);
+
+    qemu_set_irq(s->irq, pending);
+
+    return pending;
 }
 
 static void sdhci_raise_insertion_irq(void *opaque)
-- 
2.26.2


