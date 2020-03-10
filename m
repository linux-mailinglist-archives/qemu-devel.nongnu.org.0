Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EB180515
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 18:43:28 +0100 (CET)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBiuc-00038x-UB
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 13:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.kiszka@siemens.com>) id 1jBitr-0002gl-6r
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:42:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@siemens.com>) id 1jBitp-0004JX-AB
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:42:38 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:48580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
 id 1jBito-00041L-Rt
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:42:37 -0400
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AHgWhY031171
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 18:42:32 +0100
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AHgCap022833
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 18:42:12 +0100
Received: from [139.25.68.37] ([139.25.68.37])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 02AHgBrQ012785;
 Tue, 10 Mar 2020 18:42:11 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] hw/i386/intel_iommu: Fix out-of-bounds access on guest IRT
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Message-ID: <4b15b728-bdfe-3bbe-3a5c-ca3baeef3c5c@siemens.com>
Date: Tue, 10 Mar 2020 18:42:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-size: 1279
X-purgate-ID: 149902::1583862152-000010EA-C737BA99/0/0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.138.37.39
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Kiszka <jan.kiszka@siemens.com>

vtd_irte_get failed to check the index against the configured table
size, causing an out-of-bounds access on guest memory and potentially
misinterpreting the result.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

BTW, we still miss error reporting emulation, right? Therefore, I added 
that simple error_report_once thing, like the other paths do.

 hw/i386/intel_iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 204b6841ec..df7ad254ac 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3094,6 +3094,12 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
     uint16_t mask, source_id;
     uint8_t bus, bus_max, bus_min;
 
+    if (index >= iommu->intr_size) {
+        error_report_once("%s: index too large: ind=0x%x",
+                          __func__, index);
+        return -VTD_FR_IR_INDEX_OVER;
+    }
+
     addr = iommu->intr_root + index * sizeof(*entry);
     if (dma_memory_read(&address_space_memory, addr, entry,
                         sizeof(*entry))) {
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

