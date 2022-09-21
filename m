Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57B5BFB22
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:39:10 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawCE-0002v3-0K
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaw58-0005fp-SN
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:31:50 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:39764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaw57-00018W-62
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:31:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED30663052;
 Wed, 21 Sep 2022 09:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B32C433C1;
 Wed, 21 Sep 2022 09:31:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NHv7rwQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663752706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WL6TCD+Z2AXHZG7hutHMl0bxbs3fuwXVzrM5TbfCh1Y=;
 b=NHv7rwQ4zV3d8+LuwAd+k8hz6BlG4jUKih0kQI1vRztKrLqoc3+w69TOPmtSDsTBunGlJa
 lqvO5yiPBErvPADYfYOv3NBfTlTUh9uEkR8toAefV4q2QnamnT+xlZVPlmBr017M1VsgSc
 +l1/egQvXHuC+oU5pXkKQlhlkT9LTsY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a73d1816
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 21 Sep 2022 09:31:46 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 2/4] x86: use typedef for SetupData struct
Date: Wed, 21 Sep 2022 11:31:32 +0200
Message-Id: <20220921093134.2936487-2-Jason@zx2c4.com>
In-Reply-To: <20220921093134.2936487-1-Jason@zx2c4.com>
References: <20220921093134.2936487-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
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

The preferred style is SetupData as a typedef, not setup_data as a plain
struct.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 96d205927e..1ee0b1b413 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -653,12 +653,12 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state)
     return dev;
 }
 
-struct setup_data {
+typedef struct SetupData {
     uint64_t next;
     uint32_t type;
     uint32_t len;
     uint8_t data[];
-} __attribute__((packed));
+} __attribute__((packed)) SetupData;
 
 
 /*
@@ -799,7 +799,7 @@ void x86_load_linux(X86MachineState *x86ms,
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
-    struct setup_data *setup_data;
+    SetupData *setup_data;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
@@ -1082,11 +1082,11 @@ void x86_load_linux(X86MachineState *x86ms,
         }
 
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
+        kernel_size = setup_data_offset + sizeof(SetupData) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
 
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data = (SetupData *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
         first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
@@ -1097,9 +1097,9 @@ void x86_load_linux(X86MachineState *x86ms,
 
     if (!legacy_no_rng_seed) {
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
+        kernel_size = setup_data_offset + sizeof(SetupData) + RNG_SEED_LENGTH;
         kernel = g_realloc(kernel, kernel_size);
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data = (SetupData *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
         first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
-- 
2.37.3


