Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF049FD18
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:49:17 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTUy-0001Rn-5O
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:49:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD5-0002AY-OW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:52 -0500
Received: from [2a00:1450:4864:20::329] (port=55084
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCz-0006Pe-KA
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:44 -0500
Received: by mail-wm1-x329.google.com with SMTP id c192so4665734wma.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=raqwdgmKVyt/ge2ZlIIpG0uRf/6DS9G6pKFMHK0PNV8=;
 b=bJZKrsbxphJmIHuJpBWfW3THH2GORfp62wSOsZXSUPMtT5nf15aBWnc26hNDbjAjxw
 YN4yim0GqOCntBKz5H69h1ucFER2+/hjaiktnWx+h4znZm6HaCP8vByYSPzsknbDp7nZ
 90AHh2GFjuFmol7TVqKiptF6YbatEn5ih7DPOuHWAft67e6L9Tn3Rldh1A2vgNOhD+Y8
 OHHFJ9GFdXpQNc0UNaIeNeFzkCfXRMbBn9W2kaHG4bBcQcXxQ69uxo3dVgA12V8wvqzB
 IOEg7f28PClatwTdEnPCsKk8mMEl4I8ujp/S5zAsgQ2CP0uX9ezN86gntYNsMwxsVJWf
 6vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raqwdgmKVyt/ge2ZlIIpG0uRf/6DS9G6pKFMHK0PNV8=;
 b=F+9bSo9jSeQdF3k9KMgkTsaetsn72KSeCtEMqkQXLUpE7jk+NwFF7CHFxWdZWcVpKl
 3yB5guTica4t7jWVtejdAbFjstERBOgoGxUwWr49Ta4P/9htUkBt5Ndmk/A11o2ZfQYt
 huxJiaMimMBBpQkJ2HBlJFaMdO1VkSjMLSM3uxhEueC/qk+39fqaFG/OMm8hl+LudWJu
 6vdUCVFN2Fug0NOz0CNf4hflWDpCZohepU528GFRC/hzHxkAopDb5D/hSNtHJ5DpMkMc
 adkJ0/NSK5X3vr7NZoS6sJkZSVApVbtR9+9lHEL9H+hSx7zWNL1ue5dqyzlVROUmA1yF
 QSgQ==
X-Gm-Message-State: AOAM530qD4DrDU1DEqkShjQzKPGmbgBLwav9LidfUov4JB36ZiTCgiNK
 8UwfoHqebq8uWUStSaHRrTt8VEDL5ED9lw==
X-Google-Smtp-Source: ABdhPJwGMd5Ia37a34pl3SAWOFHJEIV66u5lR7fVyWBKyeWfqmxFn4T11Z0w5FTxRao0ZUM7a0ELVQ==
X-Received: by 2002:a05:600c:4e0d:: with SMTP id
 b13mr7930843wmq.188.1643383828450; 
 Fri, 28 Jan 2022 07:30:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/32] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Fri, 28 Jan 2022 15:29:49 +0000
Message-Id: <20220128153009.2467560-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Francisco Iglesias <francisco.iglesias@xilinx.com>

Add support for Micron Xccela flash mt35xu01g.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220121161141.14389-9-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b77503dc845..c6bf3c6bfa8 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -255,6 +255,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
+    { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
+                   ER_4K | ER_32K, 2) },
     { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-- 
2.25.1


