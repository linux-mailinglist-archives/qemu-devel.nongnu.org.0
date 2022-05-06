Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29F51DAEC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:44:08 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmzBg-00009n-2D
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5r-0001Bg-BN
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5p-0005ZB-LA
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651847885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmGWyb7GP9HxU18rJwmkzLq55bRoz+0gMvBXD0f/Zu0=;
 b=VL0gkkK2wHx4fXeFk6zOt7aOPUE4kkWx1FW2nwTsB+YCb/5eWKCwbZwFSoGFj5dNTxtVkx
 nKMxW2x/Xa66BrXa5W7kd0JOn5yfb4pxdN88+bmDlJLmUYu79gLDYT2qNQ9okLDiZcN5wa
 9AH1nBhUSLwkZ8XkzJEb1uTfwVK/zh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-73O9Ps8xN9G-bbc91WQD7A-1; Fri, 06 May 2022 10:38:01 -0400
X-MC-Unique: 73O9Ps8xN9G-bbc91WQD7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C3F811E76;
 Fri,  6 May 2022 14:38:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83E012166B2D;
 Fri,  6 May 2022 14:38:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 4/9] qemu-options: Limit the -xen options to x86 and arm
Date: Fri,  6 May 2022 16:37:45 +0200
Message-Id: <20220506143750.559526-5-thuth@redhat.com>
In-Reply-To: <20220506143750.559526-1-thuth@redhat.com>
References: <20220506143750.559526-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The Xen hypervisor is only available on x86 and arm - thus let's
limit the related options to these targets.

Message-Id: <20220427133156.344418-1-thuth@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 5f69b94b8e..796229c433 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4186,16 +4186,17 @@ SRST
 ERST
 
 DEF("xen-domid", HAS_ARG, QEMU_OPTION_xen_domid,
-    "-xen-domid id   specify xen guest domain id\n", QEMU_ARCH_ALL)
+    "-xen-domid id   specify xen guest domain id\n",
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 DEF("xen-attach", 0, QEMU_OPTION_xen_attach,
     "-xen-attach     attach to existing xen domain\n"
     "                libxl will use this when starting QEMU\n",
-    QEMU_ARCH_ALL)
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 DEF("xen-domid-restrict", 0, QEMU_OPTION_xen_domid_restrict,
     "-xen-domid-restrict     restrict set of available xen operations\n"
     "                        to specified domain id. (Does not affect\n"
     "                        xenpv machine type).\n",
-    QEMU_ARCH_ALL)
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 SRST
 ``-xen-domid id``
     Specify xen guest domain id (XEN only).
-- 
2.27.0


