Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214521F6E84
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:09:30 +0200 (CEST)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTVw-0000Vk-W1
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT9R-0008M6-J3
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:46:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT9O-0001E9-H6
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9wtEOmw2FHl5lxP0ezQdM7JMQVoBoKAz0J5xFT9n+M=;
 b=fpB75O4PogkezHlzcuMVCyoVTgeOnntYxem9Xj1a6wNE04PtyzGpUKKYKaObk82KlF3ztj
 xPNjm0lH04YIbZcNw4Grdg79+GZ8vK4cw4FKd13h8ythdH2BDAVe0bPb8Wq+AqvWUsSjUi
 sQiY5oq5RoS5FUt8ANq8elGRyQ/B4M4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-Dk3K1UVCOySfW6RZzIHlqQ-1; Thu, 11 Jun 2020 15:45:24 -0400
X-MC-Unique: Dk3K1UVCOySfW6RZzIHlqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49C45461;
 Thu, 11 Jun 2020 19:45:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFEA25EE0E;
 Thu, 11 Jun 2020 19:45:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 035/115] hw/i386/vmport: Allow x2apic without IR
Date: Thu, 11 Jun 2020 15:43:29 -0400
Message-Id: <20200611194449.31468-36-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Liran Alon <liran.alon@oracle.com>,
 Nikita Leshenko <nikita.leshchenko@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

Signal to guest that hypervisor supports x2apic without VT-d/IOMMU
Interrupt-Remapping support. This allows guest to use x2apic in
case all APIC IDs fits in 8-bit (i.e. Max APIC ID < 255).

See Linux kernel commit 4cca6ea04d31 ("x86/apic: Allow x2apic
without IR on VMware platform") and Linux try_to_enable_x2apic()
function.

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Message-Id: <20200312165431.82118-14-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/vmport.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 942a0e94e3..21d4ff048a 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -176,7 +176,14 @@ static uint32_t vmport_cmd_ram_size(void *opaque, uint32_t addr)
 
 static uint32_t vmport_cmd_get_vcpu_info(void *opaque, uint32_t addr)
 {
-    return 1 << VCPU_INFO_RESERVED_BIT;
+    X86CPU *cpu = X86_CPU(current_cpu);
+    uint32_t ret = 0;
+
+    if (cpu->env.features[FEAT_1_ECX] & CPUID_EXT_X2APIC) {
+        ret |= 1 << VCPU_INFO_LEGACY_X2APIC_BIT;
+    }
+
+    return ret;
 }
 
 static const MemoryRegionOps vmport_ops = {
-- 
2.26.2



