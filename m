Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34575BFB23
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:39:11 +0200 (CEST)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawCE-0002yO-RM
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaw5B-0005jY-Mc
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:31:53 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:56590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaw5A-00018l-5c
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:31:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A2526303D;
 Wed, 21 Sep 2022 09:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA97C433C1;
 Wed, 21 Sep 2022 09:31:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JJt/0WYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663752708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVCAkXlRlp3gruLyM+FFF5K4RDo3j6oaXFh9SSxTcSY=;
 b=JJt/0WYiYs3oqu1R/P+VoIJwx5DwUKApMMINGrQvqLflwlEbX0afmKAUeVCudjdxa/vV0X
 juwHgKpSvveIjCA7T4ivSAHP6n9+gCLlX0nBPfTjDbAOxa5InHwKieYl85sFiyzG77PDU+
 a4RQXROReWhF7J0Vb/O/wLrlb3xbL4w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d16651ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 21 Sep 2022 09:31:48 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v5 3/4] x86: reinitialize RNG seed on system reboot
Date: Wed, 21 Sep 2022 11:31:33 +0200
Message-Id: <20220921093134.2936487-3-Jason@zx2c4.com>
In-Reply-To: <20220921093134.2936487-1-Jason@zx2c4.com>
References: <20220921093134.2936487-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since this is read from fw_cfg on each boot, the kernel zeroing it out
alone is insufficient to prevent it from being used twice. And indeed on
reboot we always want a new seed, not the old one. So re-fill it in this
circumstance.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 1ee0b1b413..f9a4ddaa4a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -783,6 +783,12 @@ static void reset_setup_data(void *opaque)
     stq_p(fixup->pos, fixup->orig_val);
 }
 
+static void reset_rng_seed(void *opaque)
+{
+    SetupData *setup_data = opaque;
+    qemu_guest_getrandom_nofail(setup_data->data, le32_to_cpu(setup_data->len));
+}
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1105,6 +1111,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
+        qemu_register_reset(reset_rng_seed, setup_data);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-- 
2.37.3


