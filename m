Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAF320233
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:25:13 +0100 (CET)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG59-0000T7-Rj
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuS-0001Hu-G9; Fri, 19 Feb 2021 19:14:08 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuQ-0005eu-PR; Fri, 19 Feb 2021 19:14:08 -0500
Received: by mail-ej1-x62a.google.com with SMTP id k13so15044080ejs.10;
 Fri, 19 Feb 2021 16:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFijLuT8EaS8irfxFTsO9TYYMK5wRiR7VW/dtqh77EQ=;
 b=mCpS0icxeHlm/LkLxfjGrlGGeShvB7F9lceyAgT+veCFc/6Xv2+rsHCtX/kAKKTgSi
 C2C9HRVQXi4vAC/OTFL4cvy9bNbdXTHteVSzvCYvykXdi5HB8yGsX7pr374NeYKdXxsI
 0JCf0swMQ/62dWIEkLz5aAVC2ObK1PuenZUGvklP4/8kxBrJD5mZFvGvhAmMd8Ldsagh
 DOWAL/1cEEjaM+3w92yq6w65M7kadaqzTpba79NzQyugbVxU/iMrggomVNUMebN+VvBU
 0iSFlsCCf+rQUNj2LUGeUvIHiIvbHuX/JOLBTl6D2v0rc9q9yM9BvB7uQLOcVG0oRp7Q
 9uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NFijLuT8EaS8irfxFTsO9TYYMK5wRiR7VW/dtqh77EQ=;
 b=FHvYJxgWFk81nbHAmuXGwYLrApefKM36cJ9Ib9bQFIiFyuLyJwEYfK2wWdc2Wx7fPG
 hYEcvVIZ6RbU1pvUIEQWb+gT45OF6s2M2rhxXnxCNFYJYfvi640XNqNaJpQddFp6ZrOv
 L0xjM5IwqZUDdlKR2mNTGLnWFZeW9CHy7qggJt9e1yNH7hvaBoYxlnOy/vkh8M60f36u
 eJi92vm+hhKvNA5w2yQf4zFLrxsS1ArtdT+r/63t4KaFQEbvFXKZghzESIUBW9Z6B9JU
 srxUnEODOZYKP1dU4V6Q2tMQTCGPVWLxVjU97S53oBk9oZc0V+oR+r3ZdzTQ5l/Ma4MF
 nmag==
X-Gm-Message-State: AOAM530IEN06c7CL57Ag63+Xx8rkkkX8+8pez13QCRUUM6KHr0kLMRio
 es2/ClqLgd5JmhusdFnlvWHz/fnwZnA=
X-Google-Smtp-Source: ABdhPJziaDzmAq5vR/ZeIm3zSlevg3T/UhSsf1B1AYwdy+Q87ldN9c2t5giJ84fXEaFALXuAyNa30g==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr11043186ejb.132.1613780044967; 
 Fri, 19 Feb 2021 16:14:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m26sm236707eja.6.2021.02.19.16.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] hw/sd: sd: Fix address check in sd_erase()
Date: Sat, 20 Feb 2021 01:13:01 +0100
Message-Id: <20210220001309.2225022-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

For high capacity memory cards, the erase start address and end
address are multiplied by 512, but the address check is still
based on the original block number in sd->erase_{start, end}.

Fixes: 1bd6fd8ed593 ("hw/sd/sdcard: Do not attempt to erase out of range addresses")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-2-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 172e83f99d9..7adcb4edfaa 100644
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
2.26.2


