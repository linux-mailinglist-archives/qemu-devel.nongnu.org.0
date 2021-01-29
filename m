Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE1308726
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:53:14 +0100 (CET)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PWj-000097-Oj
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5PVB-0007jq-2w; Fri, 29 Jan 2021 03:51:38 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5PV8-0001qi-Pb; Fri, 29 Jan 2021 03:51:36 -0500
Received: by mail-pl1-x633.google.com with SMTP id d4so4877421plh.5;
 Fri, 29 Jan 2021 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CGJwe2KfCbup34X43OpSVdI4W313C+9sqSt3oL2OyqM=;
 b=PGXXMtWkZP3WRu7XygZfVCfuKiV3OvDyTc0oVegH+S7gcSf/uHJq1wOVs2ziv7KqSR
 mB51jN1DBtJmgRujTvW+7axPOFvFsU3FugRWaZU8Sqs26VHEWw+2WhOwZlz4u8IeHSlf
 P8HnxlJr2poiBvA+aBKY0ZASds/KXqEuro2eAs3nAMxfsYHlVN0I5+LLgG/2KBMR/jW3
 UL4K5iOSdz6HcT001Gv7CmOcusyl55Ma/ptNUlR/iVT/FMvJSSmo7xiQtq6rtNGZSg2P
 4U0rk8h/kvhoibojGu7bRRMEkddlOWJGIkkUtgLY89zIdbN+1XdVedsQs+C+H2vkO+et
 iziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CGJwe2KfCbup34X43OpSVdI4W313C+9sqSt3oL2OyqM=;
 b=n8WiBIH9mFbyZMQ8Y64JuuYbZyWkGtdyJr0iYLZTe23HrB/WxTNZWNtBQyZOHailPR
 DNpXbE941uMMa8/7ZjQPGqE0IKwHVNvTy6jBnDtkxHCIezwI0zkMQXEEAB+27UvFhXLF
 swRwRJhNfb2Rcs9tC+C5r2C8ybwyw8zeZuoHi4pekgxziQuJTRxhqNg+u0v4F+zb6dm2
 FpmeyNjtIqwq/0oBhAoCpJ5y4wb25XJ1ATALHis4IAsBfGnIO0fUjHxzg1dybQXYcyBZ
 Q/7jU68ZHF1vcKwiR6/F/X24WvC2m/cwBH0ANQK5FglhqNaOca9hxmL2HFH05G43XBdG
 NKhQ==
X-Gm-Message-State: AOAM532Thpn5xqv4N8tDxpYBBQClU1rrgwv8tL6/IQs2Ms1NrJnAGNL2
 hSSyzihv8OECXkW/Go03fxo=
X-Google-Smtp-Source: ABdhPJxjdZXMhlbssqFqIeCIEWplhvVsPcGOgbPDTutn0d6iI2/nYSdSnXkagCXHDp8W7w8kh6qQtw==
X-Received: by 2002:a17:90b:d8d:: with SMTP id
 bg13mr3717293pjb.189.1611910292398; 
 Fri, 29 Jan 2021 00:51:32 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t8sm6813925pjm.45.2021.01.29.00.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 00:51:31 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
Date: Fri, 29 Jan 2021 16:51:24 +0800
Message-Id: <20210129085124.21525-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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

Unlike SD mode, when SD card is working in SPI mode, the argument
of CMD13 is stuff bits. Hence we should bypass the RCA check.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---
Based-on: http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226787

 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8c397d4ad7..4f902d0b72 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1166,8 +1166,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 13:	/* CMD13:  SEND_STATUS */
         switch (sd->mode) {
         case sd_data_transfer_mode:
-            if (sd->rca != rca)
+            if (!sd->spi && sd->rca != rca) {
                 return sd_r0;
+            }
 
             return sd_r1;
 
-- 
2.25.1


