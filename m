Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1D310F6A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:05:24 +0100 (CET)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85Tv-00025A-6L
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84U0-0007Ae-2O
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TZ-00048Q-LA
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id q7so8393054wre.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M0p8lPGYTACYbzRLtR7fBRTYLnsV3hqqOQcj+ku4dlo=;
 b=pY+t6REUnChKux8CNuu2SL+CRK0Itagle1XrT50PNB3claeRbxT/M/N0hz29P7yYRo
 6tVFbzK1ACPm3Dn1bVIrHn5TumAuXXjS/hQwBDhhuE8xvW31PxriJ49Mph48IE6JYOLg
 ju6rb7l9QhV4LIF9xKnFvGT0gceyOgNZvz4Fu59ZmgUjIE7O5OmvDKY6siKHAKbvDmyS
 fPDLO2ycNPVyUmUl46EaJjeG5YK0iMKRl08afnOiZhQ/CdsxaX7xNZjRdGue0DgBEmrT
 pGRorGH3TUEyUzSJp07nL/qjepY4UD4A3HqcEP6zdRGvqOJ58zQAef87/6ych5e5tPIt
 Vhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0p8lPGYTACYbzRLtR7fBRTYLnsV3hqqOQcj+ku4dlo=;
 b=R4M2UU8WuBnky3IIBApwNXWx9NCGuutRXp7BCLyKBY1EVB/nRLlShbOfOXQFzM4Buj
 hR4jtzqm+1x0aVcm+ejZe2CzrpaxMPudoM/cvoWGY9mQqrf7PAV+DEv2FYwCEE5RtyGc
 xKeg7M//N3TTBdbSzrimOZDqeJRmcWxW6tCYqYJbUT3jKbBh385LCi93S9jIBbG/H1g5
 mwMeTdPsIjUQ8k8kI4cfpTekVJuVQ595B5zh2pVXiwrE+hJAJZiQpgXUzLsVyofA7Yd5
 enl8ismGD3GNOiN9iOvYxHNjjUeraUW3F6sRh9XHAbMUYac2+p+ApJUAxQ91zy912rEm
 qhAg==
X-Gm-Message-State: AOAM5326I7jiiMY7a0eK4EaNT8FqbY+8naTZgLxhcNUj0KCRGx6y3cD5
 aGQrbq5GEZOE9OVeLbSWhbww+A==
X-Google-Smtp-Source: ABdhPJyH4cp5e66yqoKU8hyQ78w00L4f68V6CL98B690UarIZm9R8DTyq9PYxoYhPwhmJdizjfCE1A==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr6335347wrt.338.1612544436251; 
 Fri, 05 Feb 2021 09:00:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/24] hw/arm/mps2-tz: Support ROMs as well as RAMs
Date: Fri,  5 Feb 2021 17:00:13 +0000
Message-Id: <20210205170019.25319-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN505 and AN521 don't have any read-only memory, but the AN524
does; add a flag to ROMInfo to mark a region as ROM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index b46b32746e0..ce5e804c734 100644
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


