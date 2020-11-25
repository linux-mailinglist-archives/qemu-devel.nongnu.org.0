Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4A2C4976
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:03:52 +0100 (CET)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1x9-0004x9-Sr
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qW-0000M2-9B
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qU-0003MM-JR
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZZQRbSxpJbfML8IkKeWrdc8btDAgjJ9BXbeofnw+dE=;
 b=XYsMEKCKqmBBKkiniTq7vAgg6ay2whGDiF0bO5RUde04OQ0JgBOfeFsTRw/b2nMM6CCyu2
 G6yDrxfqH4eantlQYX0JBvtDn43Q9P9YyxGaE23KFEihBVAR9Ej9V304kiNyhpBqAXPPiJ
 VOG2CbojhtD+IuFhXUdb2Ni20bO/Txg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-uPzmHt8iMk6LKtSdDdHVQg-1; Wed, 25 Nov 2020 15:56:56 -0500
X-MC-Unique: uPzmHt8iMk6LKtSdDdHVQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3F1A180E49C;
 Wed, 25 Nov 2020 20:56:54 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85F3560854;
 Wed, 25 Nov 2020 20:56:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] kvm: Remove kvm_available() function
Date: Wed, 25 Nov 2020 15:56:33 -0500
Message-Id: <20201125205636.3305257-4-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only caller can use accel_available("kvm") instead.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
---
 include/sysemu/arch_init.h | 1 -
 monitor/qmp-cmds.c         | 2 +-
 softmmu/arch_init.c        | 9 ---------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d491..b32ce1afa9 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -32,7 +32,6 @@ enum {
 
 extern const uint32_t arch_type;
 
-int kvm_available(void);
 int xen_available(void);
 
 #endif
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a08143b323..ac5b8a97d7 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -57,7 +57,7 @@ KvmInfo *qmp_query_kvm(Error **errp)
     KvmInfo *info = g_malloc0(sizeof(*info));
 
     info->enabled = kvm_enabled();
-    info->present = kvm_available();
+    info->present = accel_available("kvm");
 
     return info;
 }
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 7ef32a98b9..79383c8db8 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -50,15 +50,6 @@ int graphic_depth = 32;
 
 const uint32_t arch_type = QEMU_ARCH;
 
-int kvm_available(void)
-{
-#ifdef CONFIG_KVM
-    return 1;
-#else
-    return 0;
-#endif
-}
-
 int xen_available(void)
 {
 #ifdef CONFIG_XEN
-- 
2.28.0


