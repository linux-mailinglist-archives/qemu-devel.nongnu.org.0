Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6931CC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:06:59 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1wI-0007Wa-VJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sO-0003tU-Fc; Tue, 16 Feb 2021 10:02:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1s9-0006GU-6C; Tue, 16 Feb 2021 10:02:48 -0500
Received: by mail-pj1-x1033.google.com with SMTP id cl8so5837097pjb.0;
 Tue, 16 Feb 2021 07:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odp3y9W0QWC+Eqi22Ei1DyhqtJRF26815/yKpl97ZQU=;
 b=jvsNVgF2KXGZ38vInmMjuSZXok0hHf+65Y0FKgfpe2ovvIcu9X28aybRKvGOQclYpu
 ciFcWvLYRRNNeOuhWtjQkBBNR2+gdF1dNQk+TsBHBwlXE8COOqG0AE2o331nTiVkjUdO
 jMe1TJr6UMTX2QbLwg7IDwdyS8V9psZw7RgmlqjRmPh+nQ141U/bpL6FPVO/VjcSOaDS
 hI4HXvwtkM+TgYLfqIry9aHOeMfcl7uW1JeAGW/LIU2AK3AvmIq/9yypAtNETMEA/F3g
 KYiTSVA6YNjnNeuDv8RS8UdXOuwBzsn1+zuJyy3FxosVrmoBYos73C8eZgcgmnIBUEqB
 c9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odp3y9W0QWC+Eqi22Ei1DyhqtJRF26815/yKpl97ZQU=;
 b=LZQlIvoq9DZlO2/qAPq+OP2cD2oDc0h0pixM8NMnxppS+oNkIJT28boGmJE3lsfdLf
 6uZzRU2I9B14sUs1ZKZ/qfuN4ZuF2oUz+Hh+r8U//kDABQughgHIV8+2WylJwYKqE1+K
 ln17vYGgtSZu+Ud43AmZnE2cbsOM/xK1RYIj4TKUX3KitaY/up3bzHK/R0BbfmfId4ex
 9CcrXlMCcI0cuPGErEuR83yjq8Y/wYJshqepvRys8zbb+7hi+sd9WWjUoHs5vFJ661Ic
 rFSkfapQK+3ssdzt9azYma8N0iiA71h7xnBwMlJnNxjmP2R8NEC5lJKZngwLUn9fabPO
 jmqw==
X-Gm-Message-State: AOAM533wFR/O1QGSDeAts/veG4lmt7VmDDlsLyBNYMeI3wHEhQmXu54Y
 6w4mHUp9sOzRjpck38McADetN0MDs4E=
X-Google-Smtp-Source: ABdhPJxswMxTu+fHBOg2jLjCF8V35vuc852X/N7eEPFTzhCdKBPoxlIrqpmZCMaA7H19cNWZqUWAzQ==
X-Received: by 2002:a17:902:aa42:b029:e3:492a:7b37 with SMTP id
 c2-20020a170902aa42b02900e3492a7b37mr13083424plr.6.1613487759549; 
 Tue, 16 Feb 2021 07:02:39 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw/sd: sd: Fix address check in sd_erase()
Date: Tue, 16 Feb 2021 23:02:18 +0800
Message-Id: <20210216150225.27996-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

For high capacity memory cards, the erase start address and end
address are multiplied by 512, but the address check is still
based on the original block number in sd->erase_{start, end}.

Fixes: 1bd6fd8ed593 ("hw/sd/sdcard: Do not attempt to erase out of range addresses")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index c99c0e93bb..a6a0b3dcc6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -760,7 +760,7 @@ static void sd_erase(SDState *sd)
         erase_end *= 512;
     }
 
-    if (sd->erase_start > sd->size || sd->erase_end > sd->size) {
+    if (erase_start > sd->size || erase_end > sd->size) {
         sd->card_status |= OUT_OF_RANGE;
         sd->erase_start = INVALID_ADDRESS;
         sd->erase_end = INVALID_ADDRESS;
-- 
2.25.1


