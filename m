Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D07700843
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:42:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS4j-0007X2-UK; Fri, 12 May 2023 08:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4i-0007Wm-NL
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4h-0006Jh-37
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3neinR8MEJhTuDj8ra6ZWrpLW+xh3Te3jouJUdxwKIM=;
 b=aWLBcx5oGb5PeE5MCXWuwLLIDyS8MkNjHAAVl0EVBU3Kd07JFsZH9O4ws0OZAamO0m7cc9
 lHofBNpIOakUWetZh2tsovEwD2XyM9cNCZCTKAYkpVWFBOwunYxAyVMQALqWDAYVk4y6ZY
 uszpFcmNi4w5c0Zz3sTphN0bu3tbJGU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-GZ1exGe4Mx6Koz7eP0SUAQ-1; Fri, 12 May 2023 08:40:39 -0400
X-MC-Unique: GZ1exGe4Mx6Koz7eP0SUAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4658688D013;
 Fri, 12 May 2023 12:40:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8101121314;
 Fri, 12 May 2023 12:40:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/18] softmmu/vl.c: Check for the availability of the VGA
 device before using it
Date: Fri, 12 May 2023 14:40:17 +0200
Message-Id: <20230512124033.502654-3-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In case the user disabled the default VGA device in the binary (e.g.
with the "--without-default-devices" configure switch), we should
not try to use it by default if QEMU is running with the default
devices, otherwise it aborts when trying to use it. Simply emit a
warning instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6c2427262b..43d3b972da 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -957,7 +957,18 @@ static const char *
 get_default_vga_model(const MachineClass *machine_class)
 {
     if (machine_class->default_display) {
-        return machine_class->default_display;
+        for (int t = 0; t < VGA_TYPE_MAX; t++) {
+            const VGAInterfaceInfo *ti = &vga_interfaces[t];
+
+            if (ti->opt_name && vga_interface_available(t) &&
+                g_str_equal(ti->opt_name, machine_class->default_display)) {
+                return machine_class->default_display;
+            }
+        }
+
+        warn_report_once("Default display '%s' is not available in this binary",
+                         machine_class->default_display);
+        return NULL;
     } else if (vga_interface_available(VGA_CIRRUS)) {
         return "cirrus";
     } else if (vga_interface_available(VGA_STD)) {
-- 
2.31.1


