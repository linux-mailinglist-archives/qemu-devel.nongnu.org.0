Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B35116DA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:38:17 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgvw-0006gZ-C8
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njgrH-0003ci-3W
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njgrE-0004MT-GR
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651062803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qet0lokKOWtqzVKSO0FqVbZx/S8u2uKt2DstxZ7gIoo=;
 b=dVy9Ee7e1+Ps+I2R2xyQ1J5qbosHOsrdh270b8tEFaOyOzBDG7cl2za4lh/x0JsUgCfRda
 AxdnEt0R3cL5obcymf0PCnp9JAgEeHDg43tRfdSdM7Y0ef13xICJOjx98ksUYRihva0IqX
 4FKGJK8vgKBnzw1xkcIUyvdyzGT0XEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-pUyrpyLNMPWNyG7PDLHo0Q-1; Wed, 27 Apr 2022 08:33:20 -0400
X-MC-Unique: pUyrpyLNMPWNyG7PDLHo0Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B808803D4E;
 Wed, 27 Apr 2022 12:33:19 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE5A5742F4;
 Wed, 27 Apr 2022 12:33:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] softmmu/vl: Fence 'xenfb' if Xen support is not compiled in
Date: Wed, 27 Apr 2022 14:33:16 +0200
Message-Id: <20220427123316.329312-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, kraxel@redhat.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'xenfb' parameter for the '-vga' command line option is currently
always enabled unconditionally (since the xenfb is not a proper QOM
device that could be tested via its class name). That means it also
shows up if Xen is not enabled at all, e.g. like this:

 $ ./qemu-system-sparc -vga help
 none                 no graphic card
 xenfb                Xen paravirtualized framebuffer
 tcx                  TCX framebuffer (default)
 cg3                  CG3 framebuffer

Let's avoid this situation by fencing the parameter with the
CONFIG_XEN_BACKEND switch.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 06a0e342fe..e26421b815 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -934,10 +934,12 @@ static const VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] = {
         .name = "CG3 framebuffer",
         .class_names = { "cgthree" },
     },
+#ifdef CONFIG_XEN_BACKEND
     [VGA_XENFB] = {
         .opt_name = "xenfb",
         .name = "Xen paravirtualized framebuffer",
     },
+#endif
 };
 
 static bool vga_interface_available(VGAInterfaceType t)
-- 
2.27.0


