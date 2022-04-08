Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1B4F981B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:32:47 +0200 (CEST)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpfK-0004OL-Mc
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPI-0006va-QM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPG-0002JT-UL
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso7685329wma.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7U8lMphTZ6OFXdG0z5y131mbCO64BRGqr3xnuXCy7z4=;
 b=HvWG8N1Y7hSsKO3Aiy6n2r3JXRn7452U1CYs+JweGMVHhalWTqG8L6iMBxeoef0NpR
 5qxF3iXOXAs1KKIrzuYO912sfaHaYPe8QJh7GSJ1sTmwdFC6bKPsQlIFi+elJXU8fplf
 KcwNy4l/iaqup1N/DwfCM9+dHd1slx4ADHA3PsaYI8GvY+bxDhzvaPiN/GJFv6pqetZM
 4guwxLuXMMtabh23gOxpb7+/u+PYFPySjusCqr9Av7vU0uUanUzexo3S4yoUWMC3v1l7
 bDB3lz57HYIBplFVLPnSWyoR9akKL/qTfSInT5Y8cQSJHVO4WQ9SJcRgVueZKn+Z8kh6
 Ax+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7U8lMphTZ6OFXdG0z5y131mbCO64BRGqr3xnuXCy7z4=;
 b=3VhOg1K0bgy4LuWNIfazaVLYnKrwqFMW8wzHpKFBlrxDh2vcURCSWRjaITzna9X7/E
 PdiqfDxQoHHMjkIPqzpdPZvys7uERSVEDenUoVERGtntWFfggqEdPCT+vrYZA49wHZZO
 PEB19akhp7aECbzddB+nSKAmFoMYe4b6aeZ7Jgmz4JQ/yYjU4Ra64Q/2teRIJgqivMT1
 Szl25yDRp81F5X4XDXTH6/uhFAtwOQUCdmivsOU0EbXPeTP73SnL4VdOGQYdkFk8K2mr
 gVU2Js/O24wc07FW6YQWPAjXRZA/UVvVd+gzDBQ1Eufmi780N6uUegobEQvJesvFgn2W
 J+UQ==
X-Gm-Message-State: AOAM531Jcvr6kD/FFP5gOx8vGCQ9jsv11AuiGAvsl2uQ87DJeOz6FHEF
 6TcSerwVfY9awCYuajyAYPiAYg==
X-Google-Smtp-Source: ABdhPJzg4T5/eeVjO4INnnvrGnF4UqmmMN6I8MPosyPUKqMgvydu26mv2aLNPAVFBkpHOFftjk5HWw==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr17168967wmc.2.1649427369543; 
 Fri, 08 Apr 2022 07:16:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/41] hw/intc/arm_gicv3_its: Implement VSYNC
Date: Fri,  8 Apr 2022 15:15:26 +0100
Message-Id: <20220408141550.1271295-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VSYNC command forces the ITS to synchronize all outstanding ITS
operations for the specified vPEID, so that subsequent writse to
GITS_TRANSLATER honour them.  The QEMU implementation is always in
sync, so for us this is a nop, like the existing SYNC command.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  1 +
 hw/intc/arm_gicv3_its.c  | 11 +++++++++++
 hw/intc/trace-events     |  1 +
 3 files changed, 13 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index c1467ce7263..ef1d75b3cf4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -330,6 +330,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
 #define GITS_CMD_VMOVP            0x22
+#define GITS_CMD_VSYNC            0x25
 #define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index bd82c84b46d..05d64630450 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1165,6 +1165,17 @@ static void process_cmdq(GICv3ITSState *s)
              */
             trace_gicv3_its_cmd_sync();
             break;
+        case GITS_CMD_VSYNC:
+            /*
+             * VSYNC also is a nop, because our implementation is always
+             * in sync.
+             */
+            if (!its_feature_virtual(s)) {
+                result = CMD_CONTINUE;
+                break;
+            }
+            trace_gicv3_its_cmd_vsync();
+            break;
         case GITS_CMD_MAPD:
             result = process_mapd(s, cmdpkt);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index a2dd1bdb6c3..b9efe14c690 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -191,6 +191,7 @@ gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t d
 gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
+gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


