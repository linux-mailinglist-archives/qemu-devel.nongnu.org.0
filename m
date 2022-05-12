Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D8524382
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:37:18 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozdd-0000EM-NA
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozMr-00041M-3E
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:19:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:5605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozMp-0002tI-A3
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325595; x=1683861595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9j0hfZ+A0CAuqZkKpvMTnZ32QvMIH0LlEbmUNATKMEY=;
 b=DnVxiu7Lb4oItcrMgjI97/qTqzW3R7fo0QzCuL+v4bri2Tj4h3j+FLTL
 /fT4JwmnGeYHrrZoPrwPNshB0CKaXUqdcU7lHN4v4WGumVvKOaUkJkTeP
 dncfaWxHVXUT43QqZ9x6zhDSNiQcnP6BvI56SwQFtRYTFUVITFTmMcRFE
 hTjRSHK0qC7ghGc3qh9/HE844jJM+vEkfjM5d7suGlKAh+az13WmrQWDd
 caCB5VvyIOfkqcRhZAwfKH9Y4Pfftj7YfOMOFI+6RXp+0I16lZnmtb4dI
 XVp7MRyIiMIFc1OmgU9aUHWVyUIZxJX82IB9+ysm8FX131zBrC0BmpRry A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="332915029"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="332915029"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594456006"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:19:43 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [RFC PATCH v4 20/36] i386/tdx: Register a machine_init_done callback
 for TD
Date: Thu, 12 May 2022 11:17:47 +0800
Message-Id: <20220512031803.3315890-21-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512031803.3315890-1-xiaoyao.li@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Before a TD can run, it needs to
 - setup/configure TD HOB list;
 - initialize TDVF into TD's private memory;
 - initialize TD vcpu state;

Register a machine_init_done callback to all those stuff.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/tdx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 2953d2728b32..a95d5b894c34 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -16,6 +16,7 @@
 #include "qom/object_interfaces.h"
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "sysemu/kvm.h"
+#include "sysemu/sysemu.h"
 
 #include "hw/i386/x86.h"
 #include "kvm_i386.h"
@@ -126,6 +127,15 @@ static void get_tdx_capabilities(void)
     tdx_caps = caps;
 }
 
+static void tdx_finalize_vm(Notifier *notifier, void *unused)
+{
+    /* TODO */
+}
+
+static Notifier tdx_machine_done_notify = {
+    .notify = tdx_finalize_vm,
+};
+
 int tdx_kvm_init(MachineState *ms, Error **errp)
 {
     TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
@@ -144,6 +154,8 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
      */
     kvm_readonly_mem_allowed = false;
 
+    qemu_add_machine_init_done_notifier(&tdx_machine_done_notify);
+
     tdx_guest = tdx;
 
     return 0;
-- 
2.27.0


