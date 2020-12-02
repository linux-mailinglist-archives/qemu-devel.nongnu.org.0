Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF592CB79F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:49:41 +0100 (CET)
Received: from localhost ([::1]:38746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNpU-0000QK-Js
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCa-000330-4e
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCG-0003h3-SK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8E+/Fiz3NqLS9yQanr0Zg453gPRiB9OY5V3QQ3GVy70=;
 b=MkdK34KMHzn5DpY/+qKoOYAZKqO2d9dbG7bgRFtsg5GSW77K5K8kuUACKBbLKG2EbzGjvA
 64QFlb31ZfAfXYKJ8gyt3U90SG2ecBvEofPvdKhipKoGfq5wezHNwdtf769UwyEK0+I70s
 aU2nMiMnxwXodXO7TdUOp/DvLkv1BFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-n-MRha-ENx2lQLQkh4zgfg-1; Wed, 02 Dec 2020 03:09:06 -0500
X-MC-Unique: n-MRha-ENx2lQLQkh4zgfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A368F185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 708D91346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 042/113] mips: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:38 -0500
Message-Id: <20201202080849.4125477-43-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Use the machine properties or loader parameters instead.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mips/fuloong2e.c | 4 ++--
 hw/mips/malta.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 25b679011f..84a2132f85 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -134,14 +134,14 @@ static int64_t load_kernel(CPUMIPSState *env)
         initrd_size = get_image_size(loaderparams.initrd_filename);
         if (initrd_size > 0) {
             initrd_offset = ROUND_UP(kernel_high, INITRD_PAGE_SIZE);
-            if (initrd_offset + initrd_size > ram_size) {
+            if (initrd_offset + initrd_size > loaderparams.ram_size) {
                 error_report("memory too small for initial ram disk '%s'",
                              loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                               initrd_offset,
-                                              ram_size - initrd_offset);
+                                              loaderparams.ram_size - initrd_offset);
         }
         if (initrd_size == (target_ulong) -1) {
             error_report("could not load initial ram disk '%s'",
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ef369945d1..467b21849e 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1087,7 +1087,7 @@ static int64_t load_kernel(void)
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                               initrd_offset,
-                                              ram_size - initrd_offset);
+                                              loaderparams.ram_size - initrd_offset);
         }
         if (initrd_size == (target_ulong) -1) {
             error_report("could not load initial ram disk '%s'",
-- 
2.26.2



