Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F8692A18
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 23:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQbrm-0002Dq-Sh; Fri, 10 Feb 2023 17:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbrk-0002DT-GC
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:36 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbri-0007h3-Pp
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BFAB61EB1;
 Fri, 10 Feb 2023 22:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EDBC433EF;
 Fri, 10 Feb 2023 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676068053;
 bh=kvIsppqJuGvkfwd1Y2Myje/RnRXHGaBztlU7IYWKzag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDkfsNDaRkqXT0f54vPAlFR9WAhGLWPVYiNLNeNkSvhHlRSQg0UqKnd2PZUdmJr/G
 w3nQheGAcBS9R8ZFtuboIxxAFI7cTpeHn5UcqJXLJtng8ZFUOfvggoN8t6uEhNrflP
 xzQerah7ss1urPTrjx6zezwz7USdVo37x5P76ZAOOm8UfPDvJGpryamDbT9YxB8Ah+
 aNB0mGTgHxnynEcnabkAlfz1cqw+pcUvL5AF9dvj6BFBYDjYMAWCkWdMrbDI4gcejd
 VcjxCjmvxzeY6JaIEcB3+y+nNCmURTYHSG6eGpCjaap2XLpRrmgJZprS+VeGN7I+kA
 e/+HXRJH29FDQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, peter.maydell@linaro.org,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Paul Durrant <paul@xen.org>
Subject: [PULL 01/10] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Date: Fri, 10 Feb 2023 14:27:20 -0800
Message-Id: <20230210222729.957168-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Vikram Garhwal <vikram.garhwal@amd.com>

xen-mapcache.c contains common functions which can be used for enabling Xen on
aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
accessible for both aarch64 and x86.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/meson.build              | 1 +
 hw/i386/xen/meson.build          | 1 -
 hw/i386/xen/trace-events         | 5 -----
 hw/xen/meson.build               | 4 ++++
 hw/xen/trace-events              | 5 +++++
 hw/{i386 => }/xen/xen-mapcache.c | 0
 6 files changed, 10 insertions(+), 6 deletions(-)
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 213e2e82b3..cfdbfdcbcb 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -33,5 +33,6 @@ subdir('kvm')
 subdir('xen')
 
 i386_ss.add_all(xenpv_ss)
+i386_ss.add_all(xen_ss)
 
 hw_arch += {'i386': i386_ss}
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300..2fcc46e6ca 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_platform.c',
   'xen_pvdevice.c',
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index 5d6be61090..a0c89d91c4 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 
-# xen-mapcache.c
-xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
-xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
-xen_map_cache_return(void* ptr) "%p"
-
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index ae0ace3046..19d0637c46 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -22,3 +22,7 @@ else
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+
+xen_ss = ss.source_set()
+
+xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 3da3fd8348..2c8f238f42 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
 xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
+
+# xen-mapcache.c
+xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
+xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
+xen_map_cache_return(void* ptr) "%p"
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
similarity index 100%
rename from hw/i386/xen/xen-mapcache.c
rename to hw/xen/xen-mapcache.c
-- 
2.25.1


