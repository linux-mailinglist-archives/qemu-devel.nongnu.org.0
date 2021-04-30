Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD4436FA6E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:37:48 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSOx-0004Rd-8f
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSR-0001Eh-0a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSK-0001o0-Th
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1HS3FPzeemdBuzJ0MMLNIXg7ZaeNhkU7tj//MSnykU=;
 b=f61AOPlCQQPwuWoqLtV9Ft+s8GpfgmnHODzaaA9FvMAT1rBtfxyiYJWkKZvHipKFQraBOk
 zgOhgs8O22Id/LkYjeDD9lQPQgkcCWbeo00MTisaSqLibYCjMQ88L08I1UWSS+UYYu2gz7
 Ax2h7MKulkPr56xD4XRqSN1SCZEph+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-1NLom1taMGSV-tIvzPrDvQ-1; Fri, 30 Apr 2021 07:37:08 -0400
X-MC-Unique: 1NLom1taMGSV-tIvzPrDvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A965B9196A1;
 Fri, 30 Apr 2021 11:37:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 071925D719;
 Fri, 30 Apr 2021 11:37:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E726F18007A5; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/16] modules: add have_vga
Date: Fri, 30 Apr 2021 13:35:46 +0200
Message-Id: <20210430113547.1816178-16-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a symbol which can be used to prevent display modules which
need vga support being loaded into system emulators with CONFIG_VGA=n.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/vga.h | 6 ++++++
 hw/display/vga.c         | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index ca0003dbfd92..5f7825e0e368 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -11,6 +11,12 @@
 
 #include "exec/hwaddr.h"
 
+/*
+ * modules can reference this symbol to avoid being loaded
+ * into system emulators without vga support
+ */
+extern bool have_vga;
+
 enum vga_retrace_method {
     VGA_RETRACE_DUMB,
     VGA_RETRACE_PRECISE
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 836ad50c7b6d..28a90e30d0cf 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -39,6 +39,8 @@
 //#define DEBUG_VGA_MEM
 //#define DEBUG_VGA_REG
 
+bool have_vga = true;
+
 /* 16 state changes per vertical frame @60 Hz */
 #define VGA_TEXT_CURSOR_PERIOD_MS       (1000 * 2 * 16 / 60)
 
-- 
2.30.2


