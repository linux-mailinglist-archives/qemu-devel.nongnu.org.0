Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB049FDE8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:22:55 +0100 (CET)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDU1V-0006HL-T1
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:22:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDJ-0002Dd-ND
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: from [2a00:1450:4864:20::42d] (port=41938
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDE-0006QT-RQ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h21so11550015wrb.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=heH8RpXJ9awSXu4Em9erq2sCHDZu92VPxiANQHMjwHw=;
 b=tgjurxdBIJTRQfDF0xbQIotbG51ksdgPd5gbRaOmM2MxNPpPPj4fS7YPYn2HSz8DMJ
 UH5Kd2Y81HUB1x/55+ES+PVJUSaUBnn1vSLemlFB70W98sIQIiwlCng5mkelcgIeSmla
 DHX/HEmNusl5b4aTmXoNW6HmJsITpoiD1yhgSNXyBfTKm0dQDOcQtwCYmp5W/0uCfm6a
 rqQqB62xX0+5ruyfw5uWF/fk33AcIpooi4sMVvSKER4amoJ/PaFLbUt8pR8zUu7+8lyJ
 k4lrqYnTGi4LITDPrQcVa0BoJQeixNpMcyz+pA3z1vzPeClSxVdJHSK6WoA/hY6vELxz
 SrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=heH8RpXJ9awSXu4Em9erq2sCHDZu92VPxiANQHMjwHw=;
 b=KckKmkUsxgRK59zFP95Aqbbs4Obp7+UPSKHHk9+byldSp9dE0rIuEnyLvTeRlgITy6
 7lCXrHmB0oZnpe4hzk4BCe497EIP9eDt+/fYPJZ1pQYXB6lLHUd1GIswcEDsPU7cOeSl
 5n2XOIwCLnR0yx4Q6f2vOTdQif00q7c7KwHyasd/BBTSzHiqxNbNFz9/sMGejSmXu/XA
 t42cq62i0fW029ZvMTqyB0IVn0vdpQJ8z8Jht7RM8o4wjZUafVznXIeGIrNB5qVDqw81
 3TFqVN0zLNrtTQcw9fsy1I7nepbYSUAH+Uq3RnzOEeljYt0d7B0fL/WqtsI2EhPICbX3
 BSEw==
X-Gm-Message-State: AOAM5321IGUq8hU9gNCeq3wfV1FSQ/QdKYpbbaZAkDVrKR/meF5IReUR
 S11cGyerEQH8K888oTJF2BmMikB7zZt71w==
X-Google-Smtp-Source: ABdhPJyqugCXI3VY9umlIMri+VFgI0qDGJux7Ne5pcztPVxHDNq0xu9zkkhS81zEjqE5H3VSgnt8kw==
X-Received: by 2002:a5d:6090:: with SMTP id w16mr7476423wrt.476.1643383836621; 
 Fri, 28 Jan 2022 07:30:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/32] hw/intc/arm_gicv3_its: Sort ITS command list into
 numeric order
Date: Fri, 28 Jan 2022 15:30:00 +0000
Message-Id: <20220128153009.2467560-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The list of #defines for the ITS command packet numbers is neither
in alphabetical nor numeric order. Sort it into numeric order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-8-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 1eeb99035da..5394266aaf4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -314,16 +314,16 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define CMD_MASK                  0xff
 
 /* ITS Commands */
-#define GITS_CMD_CLEAR            0x04
-#define GITS_CMD_DISCARD          0x0F
 #define GITS_CMD_INT              0x03
-#define GITS_CMD_MAPC             0x09
+#define GITS_CMD_CLEAR            0x04
+#define GITS_CMD_SYNC             0x05
 #define GITS_CMD_MAPD             0x08
-#define GITS_CMD_MAPI             0x0B
+#define GITS_CMD_MAPC             0x09
 #define GITS_CMD_MAPTI            0x0A
+#define GITS_CMD_MAPI             0x0B
 #define GITS_CMD_INV              0x0C
 #define GITS_CMD_INVALL           0x0D
-#define GITS_CMD_SYNC             0x05
+#define GITS_CMD_DISCARD          0x0F
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
-- 
2.25.1


