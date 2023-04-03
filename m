Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510A6D4D04
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMcl-00059d-Fw; Mon, 03 Apr 2023 12:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcX-00055Q-U1
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcU-0002BJ-4o
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h17so29877487wrt.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680537680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AmlbhI+3LA71Xt6UcR44d//uzKHu0T+b6W9+kDRfosk=;
 b=vD/Y5ccqHkoYX340/2aN+XPYnpdlG0jl1orRl8T5cYFUdkx+yIRBbMk0q0kfAAB8sP
 SfG9oGn4UHK1JYFSRQerJUyZ9Cb/sWtejG0/KMcfA7d9zkxAgzPh8s+jemgIr5w+G4p9
 37UTa/VY9PLBFTcT39mP3TtfUULmS4aY6S3Q2pSawm/aXUtsjvGxy92QQ+LtrCDNiou5
 iQiq8DDMlw49RTbHr0KCW6OlM7woymNWfm9rzLwcVAKeeYGjmMY59OH4wpp/si1YOz5W
 yHzLQb8HdfkCfz7XmDWilpSbRht3rgDI2rMSbWgRGkx7JKZTda3gN3MXtP5jmUfgO6B7
 jZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmlbhI+3LA71Xt6UcR44d//uzKHu0T+b6W9+kDRfosk=;
 b=S2ZXSmw4EAkL6cOX5qkfB5NfKmMLw9jIVQHoCY6IeyABpgRUHzkamLOQMlY6YfO4YF
 akmN+dVuU8nOupCPGQJkx/WcIkQSNs//iL45Yzl3F/IX2X/dgSBSlG3TUw3gPwcatc78
 7/9Ce/W09Ax/cWNSceeJSjfVi0ui+PwbV/uDGkCUyxc9Ar4sUkXRUdy8QaoL1m85XVIa
 80kRHXj4YpeUhDdOiDLrYzmTNwftWYSwa9zbLSn2pUo93R7kjonvuB+tJzNrvc2lc+zk
 WMlG3C7PWQ0GhTeg9N5+OPWsQR32lUCp/EpXHlBNHKWSmCIh2Cz//rNzlLTTiPYtWSTR
 DCJw==
X-Gm-Message-State: AAQBX9eB2FaIqxyb0Hqe5uPLUmL/vO4VSgdMqsI9a3v4CUcSQVhRilvw
 v3hf8f9dkU/oEHV1acpZtF/gmI9mcRLfswXNrbo=
X-Google-Smtp-Source: AKy350ZmVCCN97OfrDCYpexZwO1+AXVaSCoDTBtJ42LVDpY2Fe4fKCUVyB+1fIywqFZ/rtVc6CdTLg==
X-Received: by 2002:adf:e94c:0:b0:2cf:e688:51bd with SMTP id
 m12-20020adfe94c000000b002cfe68851bdmr25789024wrn.31.1680537680064; 
 Mon, 03 Apr 2023 09:01:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b002c59f18674asm10088668wrw.22.2023.04.03.09.01.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:01:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Mon,  3 Apr 2023 17:01:15 +0100
Message-Id: <20230403160117.3034102-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403160117.3034102-1-peter.maydell@linaro.org>
References: <20230403160117.3034102-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

Since monitor command 'dumpdtb' was introduced a couple of releases
ago, running it with any ARM machine that uses arm_load_dtb() will
crash QEMU.

Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
of freeing 'fdt', assign it back to ms->fdt.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-id: 20230328165935.1512846-1-armbru@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 50e5141116b..54f6a3e0b3c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
-    g_free(fdt);
+    if (fdt != ms->fdt) {
+        g_free(ms->fdt);
+        ms->fdt = fdt;
+    }
 
     return size;
 
-- 
2.34.1


