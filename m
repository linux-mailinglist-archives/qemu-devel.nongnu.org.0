Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BFC4AD860
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:34:19 +0100 (CET)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPhK-0003Nb-5B
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:34:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOr1-0000xS-PS
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:15 -0500
Received: from [2a00:1450:4864:20::42e] (port=45052
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00029D-9U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id k18so30169848wrg.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ihHWYxdE5z0CuYDIY4LqywVkWHM3vo8ypMEKSXKgPrs=;
 b=eQdoidTjv0eMbtL8olYadlxkO/2CEqarNGfWzrLtj7wicklk2cwhb/JcF4kfuj09fQ
 dKCi2E7QYz/jmmBeCx+1CItdBIHQ2UUEWYAVEl9X6YVdYRKAPhtBv9QoUOldh3zWfbe8
 shLEeNu+zP35aR3WUOccsMX5lBZ8/p6u+BOBsNmfswYYXohxkrKwB1Zs/gmck2jPwW7I
 QMMohmhpnntI6HspAn/eq/KiNWP3zIuW5iUB9IiHYTyjxluzhO7R1Yp3uDK6l8rtvQuc
 FXqMBOnLm6LVcyq5sTcmjHrYKY8DGVe1/YJ+j/OKEyBd4WK+nMLB/Mnrkv8+BJHu67Zw
 Id6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ihHWYxdE5z0CuYDIY4LqywVkWHM3vo8ypMEKSXKgPrs=;
 b=MU6rsK5LDUdzBrDThXO99FIE30wNfpszP9bACsyxETC3qj3/3us0BOVZ7cN0TTp8D5
 O58Nq4j+fPmhLgaabriVF1lCZOQezQaWLl/S1Wsx8Fr4svug7FqsRf+zR18pm2XmrWyY
 Fzx761wYPHo1e34wjDx//jEfndP6T+JgdiYlj6c3P+Tj4gbo6iVUVjS5QCyCX3cwKPAp
 8FZzPNYyGOU4Y9OrqtaMK9roQFFgeNvRib2e9u1TwvKcNobYF2MrzI4EqxLHPs8X+GT7
 UKhQqPyfvndGMBHwdvZKqWjfWCD6N3IeklKuCLnwSjAYMIrvNcz9/jp6ytVJs8HIUKSf
 SY8Q==
X-Gm-Message-State: AOAM533XvdzAzmSm+VyICDeXs8XfEF5k3DLdbhW8CYF5NTbiXcGceNL9
 RoK2kf9a1leLjjtna6V4y9cWPan1w+Diwg==
X-Google-Smtp-Source: ABdhPJweG/BsfYGPfMCnS5rPEaTliYPVx3iMrt0p5aE33S0fN4QncxmVH5wKR8fzpudLsExKICdzTQ==
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr3198917wrd.477.1644320403727; 
 Tue, 08 Feb 2022 03:40:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/39] hw/arm/boot: Drop existing dtb /psci node rather than
 retaining it
Date: Tue,  8 Feb 2022 11:39:30 +0000
Message-Id: <20220208113948.3217356-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

If we're using PSCI emulation, we add a /psci node to the device tree
we pass to the guest.  At the moment, if the dtb already has a /psci
node in it, we retain it, rather than replacing it. (This behaviour
was added in commit c39770cd637765 in 2018.)

This is a problem if the existing node doesn't match our PSCI
emulation.  In particular, it might specify the wrong method (HVC vs
SMC), or wrong function IDs for cpu_suspend/cpu_off/etc, in which
case the guest will not get the behaviour it wants when it makes PSCI
calls.

An example of this is trying to boot the highbank or midway board
models using the device tree supplied in the kernel sources: this
device tree includes a /psci node that specifies function IDs that
don't match the (PSCI 0.2 compliant) IDs that QEMU uses.  The dtb
cpu_suspend function ID happens to match the PSCI 0.2 cpu_off ID, so
the guest hangs after booting when the kernel tries to idle the CPU
and instead it gets turned off.

Instead of retaining an existing /psci node, delete it entirely
and replace it with a node whose properties match QEMU's PSCI
emulation behaviour. This matches the way we handle /memory nodes,
where we also delete any existing nodes and write in ones that
match the way QEMU is going to behave.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-17-peter.maydell@linaro.org
---
 hw/arm/boot.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b46f1fe889e..b1e95978f26 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -478,12 +478,13 @@ static void fdt_add_psci_node(void *fdt)
     }
 
     /*
-     * If /psci node is present in provided DTB, assume that no fixup
-     * is necessary and all PSCI configuration should be taken as-is
+     * A pre-existing /psci node might specify function ID values
+     * that don't match QEMU's PSCI implementation. Delete the whole
+     * node and put our own in instead.
      */
     rc = fdt_path_offset(fdt, "/psci");
     if (rc >= 0) {
-        return;
+        qemu_fdt_nop_node(fdt, "/psci");
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
-- 
2.25.1


