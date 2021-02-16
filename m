Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACC31CC9E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:09:06 +0100 (CET)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1yL-00020m-Ae
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sS-00040A-Du; Tue, 16 Feb 2021 10:03:00 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sO-0006HL-M5; Tue, 16 Feb 2021 10:03:00 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d15so5618189plh.4;
 Tue, 16 Feb 2021 07:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JSSbbEQMVPfDlmsQro50Dl0kGOHve+9ueKscDDbMorY=;
 b=Yf8HmdkQnEfEZ83r1tDR/VR7Wb1iUMkx4g1QnK2i+HdoC1/Wpy31KsbD5MA6QbIngM
 7IRneV7x6yOligK/UwfMd7EDqMKlFb5tF5o4YMV5A7SMzYF24zc3+KmNuMVKj8VRsKGo
 rdtwoX/LP6OD+1egfsWbcTLjqq9E1Ihbd++qtyT+K8rumOIcdPEW9+A8rsDqZoZM7DGn
 gqISHDn08AHouKHXPpjLhRLrYdU4Jm6Gw9l6R+nbTjbOG1Y4hsB7od2ALybcADPI6cuc
 HcVTVy2aPUC6YUcQMQnOPnVegvoWmmJXq8c4SToA71gbKqhKSbiXSYK0b5horMz6p7zA
 XDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JSSbbEQMVPfDlmsQro50Dl0kGOHve+9ueKscDDbMorY=;
 b=OFSccyimvJtvkoOrF0hi5OoFpC54zcCGAuTtAIw+CnxZJZ4bHVIUD4H9nygqAm3t7D
 dm6RqXJONpyPmBAo1NxM6nyoIZW7zmOOu4Vj6hwwPVgD+3YqLHiNA9z0PR3HFAI972sK
 wVfl0pd6ofeZnFUJa5uKlysiwGTcESGml/Ql4JZGiGF1rSQMO0thxTL1j4CRGJ++5vX3
 C8cgvYnkKMXuHRDpAZpDSjDP9wiCOIMVNprmLAWig9+NtyKUcGarL8LdY3nJZt4O3kCL
 cSx8t3tKUfdpQdYYVl2L+hjdeIgUjQUAfLb/3hcZ2JzJQMtp7E4o9bIGDTVHjRvASj4c
 RHfw==
X-Gm-Message-State: AOAM530vQwAqQtL8awCAFEVDkPaVO2t+mn9rXrgwchMtNdVngxp64M/l
 D9988k6UO+dVZem2UGMuXzA=
X-Google-Smtp-Source: ABdhPJyNWXJfrUYlj01JAE8YT4/vid5r5FpvI7so4d47aZmxG9ewvAugAZO3VPcwBLNhPyrdSu43jw==
X-Received: by 2002:a17:90a:46cc:: with SMTP id
 x12mr4625498pjg.114.1613487767406; 
 Tue, 16 Feb 2021 07:02:47 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/sd: sd: Fix CMD30 response type
Date: Tue, 16 Feb 2021 23:02:20 +0800
Message-Id: <20210216150225.27996-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
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

Per the "Physical Layer Specification Version 8.00", table 4-26
(SD mode) and table 7-3 (SPI mode) command descriptions, CMD30
response type is R1, not R1b.

Fixes: a1bb27b1e98a ("SD card emulation initial implementation")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: sd: Fix CMD30 response type

 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 273bae0a9a..6af821b75b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1340,7 +1340,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             *(uint32_t *) sd->data = sd_wpbits(sd, req.arg);
             sd->data_start = addr;
             sd->data_offset = 0;
-            return sd_r1b;
+            return sd_r1;
 
         default:
             break;
-- 
2.25.1


