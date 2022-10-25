Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46F60C026
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:51:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on82v-0003E0-Gq; Mon, 24 Oct 2022 20:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82p-00025y-T7
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:43:51 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82m-0005Cm-Kz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:43:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BEBA7616D8;
 Tue, 25 Oct 2022 00:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0C8C433D6;
 Tue, 25 Oct 2022 00:43:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KUtT7ywq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyBNdz6QOGFZ2HRazRqwrQ+cVRUmAFmpKB4TPiAWBbk=;
 b=KUtT7ywq+THIMdU4adPqybN3PbnZbUaDc92M1ohSPz9dqQXXQc4P+hmqPo9HMt+9uubsME
 VlfRP0vGlN48NwpgZ9lbJ2p4lDbwTzMpgEXiUaGAW1y3Ugj9GvHsxlYvT7pyZN7NZHP0Oh
 I5mcFK9SpYXgbLtOeqvkP3VTAYZbHmE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d97ebf8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:43:45 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v4 03/11] x86: do not re-randomize RNG seed on snapshot load
Date: Tue, 25 Oct 2022 02:43:19 +0200
Message-Id: <20221025004327.568476-4-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Snapshot loading is supposed to be deterministic, so we shouldn't
re-randomize the various seeds used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 1148f70c03..bd50a064a3 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1111,7 +1111,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset(reset_rng_seed, setup_data);
+        qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
         fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
                                   setup_data, kernel, kernel_size, true);
     } else {
-- 
2.38.1


