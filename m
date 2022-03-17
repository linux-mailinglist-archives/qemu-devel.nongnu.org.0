Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5784F4DC94E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:53:41 +0100 (CET)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrVU-0000Xs-BC
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:53:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqht-0002Bu-VE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:02:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:25193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqhr-0004Y7-6d
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525743; x=1679061743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YlLzJPEj8XgiWGFr996h1/bOg3vljlgCwT9DgTO2RWk=;
 b=SkZw2+ydkWh+a1dp9yORfVl5mETFWkjfIOfx7fgzwJ+ayRylfVCkXVoA
 L4Kyl1uJj/z/N2X/kKT2KdeTJuC2ltW1RJwtlMB3MjdBl8A72p10czL6s
 J7PcDZkX8yY1TPkGy5zyzqViUgGv5MJO9Xn2Mno+rs7sSv4eXJwC7MR+Q
 D29qkVZJxb9QS6o5DVl+zIDTBLpKVLbwUyLUEusF9p+e1NkeQ4FER4tc+
 GM/kzaSr+g3DuBzl5RlMTKKv9TR9V35rGokwIkGNVD/9ttOeYZpu2Fgg1
 UEOJWUc764p8TRrIg+lnbKZNcxWfmjDOjAcEgfBb+9wXmWlOGudw/rxFu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236817551"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236817551"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378791"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:01:24 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 29/36] i386/tdx: Don't allow system reset for TDX VMs
Date: Thu, 17 Mar 2022 21:59:06 +0800
Message-Id: <20220317135913.2166202-30-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TDX CPU state is protected and thus vcpu state cann't be reset by VMM.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4a8b6e2c8797..ccbafb4ca183 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5266,7 +5266,7 @@ bool kvm_has_waitpkg(void)
 
 bool kvm_arch_cpu_check_are_resettable(void)
 {
-    return !sev_es_enabled();
+    return !sev_es_enabled() && !is_tdx_vm();
 }
 
 #define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
-- 
2.27.0


