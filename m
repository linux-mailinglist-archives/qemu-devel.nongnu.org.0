Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3C379782
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:16:19 +0200 (CEST)
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBO6-0000zu-O7
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBH5-0000dM-68
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGw-0004zC-HH
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:09:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so3764701wmq.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPwV84wK51NRUaX+1XqI0uenRCE3AdgkV7fRnhwYUkk=;
 b=ifHqjlt5x9ShrajOCE8DvFBhzcqVMCO/NNt4FfmgV9OfDC8n4RFb6icSxdNu/Ficgh
 iyhMpzd6pwyJ/n6saMUmHKybLZIkR+0WfDdJ7vu4Tox/YhpM9Ot0A8aLWK5+vhH3dHuG
 Zf53LMy0/VL/l9+uSPOftNxQARM7lpyz7oq/WF+3Vs1+r+jT5TxkN6p6ysBQGJiANNQc
 c/x9KaWpSN+aoS0CriaVmFEdr1aGIT/grqZlCcD/zPljVw4rb5gKO0OBAHUJdqZIji70
 CvE1pfOItlp03r/M8PoPU7CZKui2VdAAat4ihMYh01UDgPKwb8lYT+V1rocrKwAhTJLM
 c8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPwV84wK51NRUaX+1XqI0uenRCE3AdgkV7fRnhwYUkk=;
 b=btEXxfh6l6hkxnHaNV0oJ/KH7FSqtXHe7H66tN3Wq7Y6O8YgJnKRO+4b4IqJuzLEMx
 NbPKm1RfBJsVVvs3J8tcJDH3utoCt2rEpyoofyJ5rQmYyOfUfnKxUGQR+I/i2P/AARrg
 dsJ+OY2esqbtDs/UhFqkV5L7oGY6j0wx/P6jBMyvFEZcxYlXgUVONYiZf4ujHeLacuph
 n/BfrATVwq3h3oWpzSDR9Sakw+bsXomR32GVSMuxaPYWLE6QMTXw7H3gLejJdDgh+Fxv
 IhXTt62WJhXTm/TnKbXuWOpstezKv91IA7WwZLqCqTwasLxdMUOZRSzKIEIdNcAoYNym
 zmUw==
X-Gm-Message-State: AOAM531XbDVfeooD2uSC5yJoFDUx1cmgJ/ThjoY/oZAYwoS8dlnO+GZV
 CssFWPMmSb7dwjJY4Ap/+Vcodg==
X-Google-Smtp-Source: ABdhPJz7Hm+xzLgEII/xBeUd34YHznKPqoy9vxcqUeF4/ykGiFG6+4tMkXpaHO/tbHlRnL9fdhd3IQ==
X-Received: by 2002:a1c:415:: with SMTP id 21mr28594697wme.132.1620673733102; 
 Mon, 10 May 2021 12:08:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/arm/mps2-tz: Allow board to specify a boot RAM size
Date: Mon, 10 May 2021 20:08:43 +0100
Message-Id: <20210510190844.17799-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we model the ITCM in the AN547's RAMInfo list. This is incorrect
because this RAM is really a part of the SSE-300. We can't just delete
it from the RAMInfo list, though, because this would make boot_ram_size()
assert because it wouldn't be able to find an entry in the list covering
guest address 0.

Allow a board to specify a boot RAM size manually if it doesn't have
any RAM itself at address 0 and is relying on the SSE for that, and
set the correct value for the AN547. The other boards can continue
to use the "look it up from the RAMInfo list" logic.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f2595b1c7f7..8d921afec14 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -126,6 +126,7 @@ struct MPS2TZMachineClass {
     uint32_t sram_addr_width; /* SRAM_ADDR_WIDTH setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
+    uint32_t boot_ram_size; /* size of ram at address 0; 0 == find in raminfo */
 };
 
 struct MPS2TZMachineState {
@@ -761,6 +762,14 @@ static uint32_t boot_ram_size(MPS2TZMachineState *mms)
     const RAMInfo *p;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
+    /*
+     * Use a per-board specification (for when the boot RAM is in
+     * the SSE and so doesn't have a RAMInfo list entry)
+     */
+    if (mmc->boot_ram_size) {
+        return mmc->boot_ram_size;
+    }
+
     for (p = mmc->raminfo; p->name; p++) {
         if (p->base == boot_mem_base(mms)) {
             return p->size;
@@ -1268,6 +1277,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
+    mmc->boot_ram_size = 0;
     mps2tz_set_default_ram_info(mmc);
 }
 
@@ -1296,6 +1306,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
+    mmc->boot_ram_size = 0;
     mps2tz_set_default_ram_info(mmc);
 }
 
@@ -1324,6 +1335,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 15;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
+    mmc->boot_ram_size = 0;
     mps2tz_set_default_ram_info(mmc);
 
     object_class_property_add_str(oc, "remap", mps2_get_remap, mps2_set_remap);
@@ -1357,6 +1369,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 21;
     mmc->raminfo = an547_raminfo;
     mmc->armsse_type = TYPE_SSE300;
+    mmc->boot_ram_size = 512 * KiB;
     mps2tz_set_default_ram_info(mmc);
 }
 
-- 
2.20.1


