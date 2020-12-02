Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660C2CB7CF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:55:44 +0100 (CET)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNvL-0007VQ-6V
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCa-00033Q-U3
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCI-0003hY-7K
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z41wdtVrX1P7TMOdXTQDHU5/w3QF676y8J6+L1l1EKA=;
 b=CguvsmgpcmCEuWA5Qv0n+/oCIHOcIgaNUC2lFONMfEkFhhREKWET9RHzDIxa3z8nwrfaiH
 ZN1AXPkq63k5ig6zgkWHnO+yB5VXurIUdOR2UsvXzSunAndv887JkhVOTgcgeEFOFpnoDH
 9aE8UC9yBjQcW8lax9LVZJi0ISkQTkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-FT1K1tMbOOyviO8RK3ERlA-1; Wed, 02 Dec 2020 03:09:07 -0500
X-MC-Unique: FT1K1tMbOOyviO8RK3ERlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9AD185E486
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE8331346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 046/113] riscv: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:42 -0500
Message-Id: <20201202080849.4125477-47-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the machine properties instead.

Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/riscv/boot.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 9b3fe3fb1e..70a9bf8f5d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -120,7 +120,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     }
 
     firmware_size = load_image_targphys_as(firmware_filename,
-                                           firmware_load_addr, ram_size, NULL);
+                                           firmware_load_addr,
+                                           current_machine->ram_size, NULL);
 
     if (firmware_size > 0) {
         return firmware_load_addr + firmware_size;
@@ -148,7 +149,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     }
 
     if (load_image_targphys_as(kernel_filename, kernel_start_addr,
-                               ram_size, NULL) > 0) {
+                               current_machine->ram_size, NULL) > 0) {
         return kernel_start_addr;
     }
 
-- 
2.26.2



