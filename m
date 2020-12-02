Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6712CB75D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:39:46 +0100 (CET)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNft-0005lE-67
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCR-0002ym-Ar
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCF-0003gM-0j
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sRkjmVhOwL6CdZ5aAVqczXmeSGgoS0sSd1QAioNC4c=;
 b=SfQCPKkYQgFJ4mdqcw/GHLif5RU65Fu46UKF8bfk1UaMIB7owpdiu0EeziZ6CixCNj+OhQ
 /2PtD0rar1g7+twd2K9/3dSKi4kJ5XJO1NMPat7PAry84UCFFcq6cqQD5eGf0uMnUxGbYI
 sCFnBKIn/RtCsEvgpowau1oojhTCuaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-nS5TuGFTOrqfjDUCepsNLw-1; Wed, 02 Dec 2020 03:09:04 -0500
X-MC-Unique: nS5TuGFTOrqfjDUCepsNLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C962C1074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95DDE60854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 037/113] cris: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:33 -0500
Message-Id: <20201202080849.4125477-38-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/cris/axis_dev88.c | 1 +
 hw/cris/boot.c       | 2 +-
 hw/cris/boot.h       | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index dab7423c73..b0cb6d84af 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -333,6 +333,7 @@ void axisdev88_init(MachineState *machine)
     if (kernel_filename) {
         li.image_filename = kernel_filename;
         li.cmdline = kernel_cmdline;
+        li.ram_size = machine->ram_size;
         cris_load_image(cpu, &li);
     } else if (!qtest_enabled()) {
         fprintf(stderr, "Kernel image must be specified\n");
diff --git a/hw/cris/boot.c b/hw/cris/boot.c
index aa8d2756d6..9fa09cfd83 100644
--- a/hw/cris/boot.c
+++ b/hw/cris/boot.c
@@ -81,7 +81,7 @@ void cris_load_image(CRISCPU *cpu, struct cris_load_info *li)
     if (image_size < 0) {
         /* Takes a kimage from the axis devboard SDK.  */
         image_size = load_image_targphys(li->image_filename, 0x40004000,
-                                         ram_size);
+                                         li->ram_size);
         li->entry = 0x40004000;
     }
 
diff --git a/hw/cris/boot.h b/hw/cris/boot.h
index 218854e5d1..9f1e0e340c 100644
--- a/hw/cris/boot.h
+++ b/hw/cris/boot.h
@@ -6,6 +6,7 @@ struct cris_load_info
     const char *image_filename;
     const char *cmdline;
     int image_size;
+    ram_addr_t ram_size;
 
     hwaddr entry;
 };
-- 
2.26.2



