Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FC27F0E5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 19:53:38 +0200 (CEST)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNgIL-0001qf-46
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 13:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgE7-00057p-7B
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgE5-0004i6-My
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:49:14 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnEvm2YGufL/LGTxpb1iYvXccIx4fAshtwx4WeM3AM0=;
 b=aPAiFb/zp0Fxf+Bc1vbR64Cm8Z1x5g7k/TYLuUhkQImfIvhb2iWiPS6Io4nwI39nwcXVYc
 SgWwmm5dCalpzz8zLrVoEI7kqkMCTRcKi8ToeWBzotUVEGj8umWDZ0Wi61woVl9HOFdC0f
 2QGJsSmbwGcj8uxUSy49JWKvWv16AIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-ppq9LB9RNWqsiZMROomY2Q-1; Wed, 30 Sep 2020 13:49:10 -0400
X-MC-Unique: ppq9LB9RNWqsiZMROomY2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7666D80F058;
 Wed, 30 Sep 2020 17:49:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E5F55D9DC;
 Wed, 30 Sep 2020 17:48:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1178443BFB4; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] move MemMapEntry
Date: Wed, 30 Sep 2020 19:48:44 +0200
Message-Id: <20200930174856.11296-2-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is defined twice already.  Move to a common header file to
remove duplication and make it available to everybody.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-2-kraxel@redhat.com
---
 include/exec/hwaddr.h | 5 +++++
 include/hw/arm/virt.h | 5 -----
 hw/arm/sbsa-ref.c     | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/exec/hwaddr.h b/include/exec/hwaddr.h
index a71c93cc810a..8f16d179a885 100644
--- a/include/exec/hwaddr.h
+++ b/include/exec/hwaddr.h
@@ -18,4 +18,9 @@ typedef uint64_t hwaddr;
 #define HWADDR_PRIx PRIx64
 #define HWADDR_PRIX PRIX64
 
+typedef struct MemMapEntry {
+    hwaddr base;
+    hwaddr size;
+} MemMapEntry;
+
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index d018a4f29788..655b895d5eba 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -111,11 +111,6 @@ typedef enum VirtGICType {
     VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
 
-typedef struct MemMapEntry {
-    hwaddr base;
-    hwaddr size;
-} MemMapEntry;
-
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 257ada942550..9c3a893bedfd 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -80,11 +80,6 @@ enum {
     SBSA_EHCI,
 };
 
-typedef struct MemMapEntry {
-    hwaddr base;
-    hwaddr size;
-} MemMapEntry;
-
 struct SBSAMachineState {
     MachineState parent;
     struct arm_boot_info bootinfo;
-- 
2.27.0


