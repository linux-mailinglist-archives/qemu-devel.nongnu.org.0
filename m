Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78D496882
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:09:38 +0100 (CET)
Received: from localhost ([::1]:53670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB3yL-0007v6-4m
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3wG-0007EI-SI
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:07:28 -0500
Received: from [2607:f8b0:4864:20::534] (port=40762
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3wF-0003Pb-4N
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:07:28 -0500
Received: by mail-pg1-x534.google.com with SMTP id t32so9400942pgm.7
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 16:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7zsgauEZ32kimBeuHOU6pnq4QzuP3oIGVNzLUXDw4N0=;
 b=ljS6CaFByu9pN9adLGKY8bZmDgk3M0Lj2fqsoYoZqLbiZ9S5BZUiJG9d4F9dgBc4+k
 pILHJ7M7glKfMaJ4Jfxo0zlGfqppBB8VlhU0KaFR4hjHEK58FFs/6ebwsFoq2bIZeyFB
 xpw9NxMBcZEBZeytjXn+WxTUKDitHOtUyc47A/HRTTKBebxrPQy3zbRVKvJuHTQcukPb
 FG8LjS7bnaLbbBrvbCx+RD89aerBtMOp0dhuakS4ema0Lkwram/jJr3PTAM4519ag9s8
 1Kle8hcBOWHd863O4ZyA/NF/j2hZkS/Dmfmmtlp4E/Xnj4++WhSZHuJIpbztu3/qaePY
 7Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7zsgauEZ32kimBeuHOU6pnq4QzuP3oIGVNzLUXDw4N0=;
 b=algHhAj/pyZZWwXC8VuLCb9O5uDXPIRCtS/2W/8XM12eZZYXePmPZiSuwagDlm6Luf
 P6ZHP2D0UH3ubyufRuphAIC5Fm6pqXbLoDNAIZmW3HwOugRbv+QUEAWoH7t7vcouq6MI
 4dzQLTm8l9ao/QzvalzQA2cFD22WesX6r37YFn18O7KrzopOIxjR9Z87YGv3Kfir9rpk
 i0fpqhZOUsTAvxnH8pMq94l9qt8a9Cq40EPhfurZDtx4wRlFNHXwKUdKcY0lLCngNBJ5
 8iz9Ia7KCgIw3eX8EavHQzbVHs2OErOQd4c5vljVNGS5ZmHjE4rnwDicSXnNs3K/zwFC
 lR8g==
X-Gm-Message-State: AOAM532P4lu1ArCor++FiXYkWkSRype2fEfUwbUo5qGjwW3kWMZ4Cb1L
 +RhhGhGJPX6DcjJaryOD5H9hiUc6mPM=
X-Google-Smtp-Source: ABdhPJzXLyByT31rXC1C1ew35Fd3HZZS3VmLmE8+Qh0RmvDzte8UjV97FVDx7yVmPro4ElmnKCMxXg==
X-Received: by 2002:aa7:95b1:0:b0:4bf:ed5a:55d3 with SMTP id
 a17-20020aa795b1000000b004bfed5a55d3mr5894027pfk.64.1642810033149; 
 Fri, 21 Jan 2022 16:07:13 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z6sm5820667pgh.1.2022.01.21.16.07.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 16:07:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Andreas Gustafsson <gson@gson.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/display/tcx: Avoid clearing dirty bitmap in DeviceReset()
Date: Sat, 22 Jan 2022 01:07:07 +0100
Message-Id: <20220122000707.82918-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Commit 2dd285b5f3 ("tcx: make display updates thread safe")
converted this model to use the DirtyBitmapSnapshot API,
resetting the dirty bitmap in tcx_update_display(). There
is no need to do it again in the DeviceReset handler.

See more details in commit fec5e8c92b ("vga: make display
updates thread safe.").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/tcx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index d4d09d0df8..22b0ae4761 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -371,8 +371,6 @@ static void tcx_reset(DeviceState *d)
     s->r[258] = s->g[258] = s->b[258] = 255;
     update_palette_entries(s, 0, 260);
     memset(s->vram, 0, MAXX*MAXY);
-    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 + 4),
-                              DIRTY_MEMORY_VGA);
     s->dac_index = 0;
     s->dac_state = 0;
     s->cursx = 0xf000; /* Put cursor off screen */
-- 
2.34.1


