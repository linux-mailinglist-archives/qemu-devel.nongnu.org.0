Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F662C497D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:04:02 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1xJ-00056n-VN
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qY-0000QY-Ol
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qX-0003Nj-3i
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcyTO1EndQuMSTqqIVsGvEARRbZE17kEQ/mI/5TZMqc=;
 b=SaZF1E/wR35Ophvmmxa/PTHdzhDgOLygOV4IXIqchpHSG7mwMMhv/25TTmbaI1688Xbf27
 iBOVofbCD3cjgv4S7uiuyvNg/N9qz8X0aSZwGA2kYV+bvzfTiF8LUfgXCytuGfBiAAbcYF
 0t8iMiWf5uVVJg/y84KVCmvlVUILHdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-AaIHiFkGOLqrKW3-qBNNqg-1; Wed, 25 Nov 2020 15:56:58 -0500
X-MC-Unique: AaIHiFkGOLqrKW3-qBNNqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 938AF1005D62;
 Wed, 25 Nov 2020 20:56:56 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4230F60854;
 Wed, 25 Nov 2020 20:56:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] xen: Delete xen_available() function
Date: Wed, 25 Nov 2020 15:56:34 -0500
Message-Id: <20201125205636.3305257-5-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function can be replaced with accel_available("xen").

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
---
 include/sysemu/arch_init.h | 2 --
 softmmu/arch_init.c        | 9 ---------
 softmmu/vl.c               | 6 +++---
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index b32ce1afa9..40ac8052b7 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -32,6 +32,4 @@ enum {
 
 extern const uint32_t arch_type;
 
-int xen_available(void);
-
 #endif
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 79383c8db8..f4770931f5 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -49,12 +49,3 @@ int graphic_depth = 32;
 
 
 const uint32_t arch_type = QEMU_ARCH;
-
-int xen_available(void)
-{
-#ifdef CONFIG_XEN
-    return 1;
-#else
-    return 0;
-#endif
-}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..74b6ebf1e4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3667,21 +3667,21 @@ void qemu_init(int argc, char **argv, char **envp)
                 has_defaults = 0;
                 break;
             case QEMU_OPTION_xen_domid:
-                if (!(xen_available())) {
+                if (!(accel_available("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
                 xen_domid = atoi(optarg);
                 break;
             case QEMU_OPTION_xen_attach:
-                if (!(xen_available())) {
+                if (!(accel_available("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
                 xen_mode = XEN_ATTACH;
                 break;
             case QEMU_OPTION_xen_domid_restrict:
-                if (!(xen_available())) {
+                if (!(accel_available("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
-- 
2.28.0


