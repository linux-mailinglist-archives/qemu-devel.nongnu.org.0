Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAB83945
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 21:02:21 +0200 (CEST)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv4iy-0007b7-5r
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 15:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sean.j.christopherson@intel.com>) id 1hv4e9-0004yx-8X
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 14:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sean.j.christopherson@intel.com>) id 1hv4e8-0007Bd-Bg
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 14:57:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:31803)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sean.j.christopherson@intel.com>)
 id 1hv4e8-0006z4-3l
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 14:57:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 11:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="176715120"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
 by orsmga003.jf.intel.com with ESMTP; 06 Aug 2019 11:57:00 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Cornelia Huck <cohuck@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
Date: Tue,  6 Aug 2019 11:56:48 -0700
Message-Id: <20190806185649.2476-20-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806185649.2476-1-sean.j.christopherson@intel.com>
References: <20190806185649.2476-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [RFC PATCH 19/20] q35: Add support for SGX EPC
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGX EPC virtualization is currently only support by KVM.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 hw/i386/pc_q35.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 397e1fdd2f..ed385b8ca2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -178,6 +178,8 @@ static void pc_q35_init(MachineState *machine)
 
     if (xen_enabled()) {
         xen_hvm_init(pcms, &ram_memory);
+    } else {
+        pc_machine_init_sgx_epc(pcms);
     }
 
     pc_cpus_init(pcms);
-- 
2.22.0


