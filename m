Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8923E2C7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:02:58 +0200 (CEST)
Received: from localhost ([::1]:57294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3m6L-0004s0-OP
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQe-0001nx-Bv
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:19:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20299
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQc-0006nZ-9y
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ljzT9uBW3oam26OBDL4h2fJTNj7LbFlqlVlhCS6FiY=;
 b=DrKMLv3ZRCM1tttUvmojHbtht8Tl9w8yYugFgPTSzXaShxqem7ku7DMaMHI3c/1MG1h5On
 SVAazKDxQqiBTZhEPmI1B79xcEn4igyWSkOf8zD5lP+RQR8VKzU0GpCC6uC8XOCaBCfW+M
 NC21xTIqqmdCKhznBr04vMHGWO0xhLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-B2IgNitVOoKmvsrJ1EuWbQ-1; Thu, 06 Aug 2020 15:19:47 -0400
X-MC-Unique: B2IgNitVOoKmvsrJ1EuWbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2098014C1
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:19:46 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D028769315;
 Thu,  6 Aug 2020 19:19:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 112/143] meson: convert hw/hyperv
Date: Thu,  6 Aug 2020 21:15:48 +0200
Message-Id: <1596741379-12902-113-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs        | 1 -
 hw/hyperv/Makefile.objs | 3 ---
 hw/hyperv/meson.build   | 3 +++
 hw/meson.build          | 1 +
 4 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 hw/hyperv/Makefile.objs
 create mode 100644 hw/hyperv/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 22eb804..a2c2f6d 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -9,7 +9,6 @@ devices-dirs-y += cpu/
 devices-dirs-y += display/
 devices-dirs-y += dma/
 devices-dirs-y += gpio/
-devices-dirs-$(CONFIG_HYPERV) += hyperv/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/hyperv/Makefile.objs b/hw/hyperv/Makefile.objs
deleted file mode 100644
index 5b614e0..0000000
--- a/hw/hyperv/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-y += hyperv.o
-obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
-obj-$(CONFIG_VMBUS) += vmbus.o
diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
new file mode 100644
index 0000000..1367e29
--- /dev/null
+++ b/hw/hyperv/meson.build
@@ -0,0 +1,3 @@
+specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
+specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true: files('hyperv_testdev.c'))
+specific_ss.add(when: 'CONFIG_VMBUS', if_true: files('vmbus.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 983edc1..f9e5adf 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('hyperv')
 subdir('i2c')
 subdir('ide')
 subdir('input')
-- 
1.8.3.1



