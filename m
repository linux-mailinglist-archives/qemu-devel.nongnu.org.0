Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D752831B881
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:58:55 +0100 (CET)
Received: from localhost ([::1]:53432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcWk-0007mm-TK
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQx-0000Fp-Mt
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQu-0004DP-Qf
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id b3so8510669wrj.5
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4947nZDfKCY91YN+GzWW3j1l05CAmRJnmXZQOGt5go=;
 b=lWGzjOTMyq/LBWnPpM9Je6oed0XfNy3ZsyZwO+WB9FL5FHkz0zjJqv8oNNve8X238m
 gEe1nMDaAR+fVT2+TzJV2j9AVjU2JSLRMYSkttxcWjOpHhaRNsavA4dJh/Qt/ryDe33+
 Hyj2M8lgDmOVe1BnAFY2mjzQ25dJSp9PD2Jq+xq2s/4D0FIKdbQxq0maNTZtA6/La30y
 oBAf+J48zUqprPcXIZxETQ9ALzd2LQnEuIpXPqZNR/vT1lky1mMXoglWDFjpWKPd1nlH
 3/LiH6I6msK//bl8QvrP3ZL4fHdlmNTYNQWoUW5aGR4u0+3ccc1tSAhpIjUxJwpfuFZ5
 q0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4947nZDfKCY91YN+GzWW3j1l05CAmRJnmXZQOGt5go=;
 b=bkqPYfl6sZQ3EUSo3APLFgtyuQnn1GOGVjytaQ3dk4uqovsyUATGPMk0j/I0g3Au66
 aOP6l1KgZRUvAua8gmldmF5dyANSqicVcuwI/1/saOpU0L9KOyAxxV5UJAyEGo/T2kqr
 DqbdPy7LepjaG1KaxrAnQonO3GOzCg5G6inj9Wqj4y8ve6cTqigp6DC3F5EuauKNxjfI
 J7tjSCQv+Gb3xQ98V5u4KCzSu6G+bA+xXFQ6b0vQ7u3eD0QIxAkIyW9JAHPqQxwscNQ9
 60rSXY9kQ7GfFl3lXjAwsNRD1ItejWHEDtBa0kgqZwuiYOdtPArZyP5LnTujV29XhpfD
 /2yg==
X-Gm-Message-State: AOAM531CP9cO/RI8d83dqy9edQD0NKVV/aLC/4zFKTudiVLVlobqzWWp
 761ly4tbM83m37sdNuFyAWJzsQ==
X-Google-Smtp-Source: ABdhPJyKbkpm1DU19Sl+ablDj/RM53U1K3abSO1xJkSkZxgTOtUZTZquI+W6yMXXP9XvQ27jv9/cPA==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr18704484wrs.72.1613389971566; 
 Mon, 15 Feb 2021 03:52:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] hw/arm/mps2-tz: Support ROMs as well as RAMs
Date: Mon, 15 Feb 2021 11:51:32 +0000
Message-Id: <20210215115138.20465-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN505 and AN521 don't have any read-only memory, but the AN524
does; add a flag to ROMInfo to mark a region as ROM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 08dd2cbaa40..cc9d70ece54 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -92,8 +92,10 @@ typedef struct RAMInfo {
  * Flag values:
  *  IS_ALIAS: this RAM area is an alias to the upstream end of the
  *    MPC specified by its .mpc value
+ *  IS_ROM: this RAM area is read-only
  */
 #define IS_ALIAS 1
+#define IS_ROM 2
 
 struct MPS2TZMachineClass {
     MachineClass parent;
@@ -209,6 +211,7 @@ static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
     if (raminfo->mrindex < 0) {
         /* Means this RAMInfo is for QEMU's "system memory" */
         MachineState *machine = MACHINE(mms);
+        assert(!(raminfo->flags & IS_ROM));
         return machine->ram;
     }
 
@@ -217,6 +220,9 @@ static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
 
     memory_region_init_ram(ram, NULL, raminfo->name,
                            raminfo->size, &error_fatal);
+    if (raminfo->flags & IS_ROM) {
+        memory_region_set_readonly(ram, true);
+    }
     return ram;
 }
 
-- 
2.20.1


