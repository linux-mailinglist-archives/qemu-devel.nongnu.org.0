Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918D1F6E83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:09:13 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTVg-0008Qc-Fg
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8s-0007so-UQ
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31164
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8m-00010G-Si
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80jIdWIohmKCZwgDka14bDOSxMkNCzxoZxn+X7pnK+Q=;
 b=QyhpRoqZrHEyZD+6GA6zmQiGyj9g1BNptHtmRo3NrNR5PNUltcMsQyOpXBT+W7/cEOAGbX
 BoyahjwxfZSJw+GFDxyuOqlBJpRmQflKtHGnU1B+dOrvp8m+5pELKvZy5RkMEjQVlPTard
 YKS1pnRroo9z3Z8/n88HihW5Cwj16jA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-HJ22LuhANF-vrKrwPZUayQ-1; Thu, 11 Jun 2020 15:45:26 -0400
X-MC-Unique: HJ22LuhANF-vrKrwPZUayQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D979107ACCA;
 Thu, 11 Jun 2020 19:45:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 103647BA1A;
 Thu, 11 Jun 2020 19:45:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 037/115] hw/i386/vmport: Add support for CMD_GETHZ
Date: Thu, 11 Jun 2020 15:43:31 -0400
Message-Id: <20200611194449.31468-38-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

This command returns to guest information on LAPIC bus frequency and TSC
frequency.

One can see how this interface is used by Linux vmware_platform_setup()
introduced in Linux commit 88b094fb8d4f ("x86: Hypervisor detection and
get tsc_freq from hypervisor").

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Message-Id: <20200312165431.82118-16-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/vmport.c         | 19 +++++++++++++++++++
 include/hw/i386/vmport.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 21d4ff048a..309cfd105b 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -174,6 +174,24 @@ static uint32_t vmport_cmd_ram_size(void *opaque, uint32_t addr)
     return ram_size;
 }
 
+static uint32_t vmport_cmd_get_hz(void *opaque, uint32_t addr)
+{
+    X86CPU *cpu = X86_CPU(current_cpu);
+
+    if (cpu->env.tsc_khz && cpu->env.apic_bus_freq) {
+        uint64_t tsc_freq = (uint64_t)cpu->env.tsc_khz * 1000;
+
+        cpu->env.regs[R_ECX] = cpu->env.apic_bus_freq;
+        cpu->env.regs[R_EBX] = (uint32_t)(tsc_freq >> 32);
+        cpu->env.regs[R_EAX] = (uint32_t)tsc_freq;
+    } else {
+        /* Signal cmd as not supported */
+        cpu->env.regs[R_EBX] = UINT32_MAX;
+    }
+
+    return cpu->env.regs[R_EAX];
+}
+
 static uint32_t vmport_cmd_get_vcpu_info(void *opaque, uint32_t addr)
 {
     X86CPU *cpu = X86_CPU(current_cpu);
@@ -211,6 +229,7 @@ static void vmport_realizefn(DeviceState *dev, Error **errp)
     vmport_register(VMPORT_CMD_GETRAMSIZE, vmport_cmd_ram_size, NULL);
     if (s->compat_flags & VMPORT_COMPAT_CMDS_V2) {
         vmport_register(VMPORT_CMD_GETBIOSUUID, vmport_cmd_get_bios_uuid, NULL);
+        vmport_register(VMPORT_CMD_GETHZ, vmport_cmd_get_hz, NULL);
         vmport_register(VMPORT_CMD_GET_VCPU_INFO, vmport_cmd_get_vcpu_info,
                         NULL);
     }
diff --git a/include/hw/i386/vmport.h b/include/hw/i386/vmport.h
index 7656432358..c380b9c1f0 100644
--- a/include/hw/i386/vmport.h
+++ b/include/hw/i386/vmport.h
@@ -13,6 +13,7 @@ typedef enum {
     VMPORT_CMD_VMMOUSE_DATA     = 39,
     VMPORT_CMD_VMMOUSE_STATUS   = 40,
     VMPORT_CMD_VMMOUSE_COMMAND  = 41,
+    VMPORT_CMD_GETHZ            = 45,
     VMPORT_CMD_GET_VCPU_INFO    = 68,
     VMPORT_ENTRIES
 } VMPortCommand;
-- 
2.26.2



