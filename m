Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09F22C708
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 15:50:23 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyy5e-0008FW-PB
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 09:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyy2d-000471-7x
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 09:47:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58501
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyy2b-0004DJ-Km
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 09:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595598432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/0IocmKsmS1D12je30pvQt+ZUklNprxk52cN3LSkCs=;
 b=fSOTamo8uuK7IyZ+2Q/Z4peY2j3dqc3LdBI5iy4n6W07wrIiPwM8UFU2a4sTRLPlRIQyvP
 ihmkZk2vE6GjDl/qxa3p0w/oXSYxYjy8ZjMAikYwKiKKwq/XJqY7RIavU09oJD8HKFLj2B
 UwnJ025AgVd2NlpCaw83xsn9QbxclEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-OJzyfBZDPMCuLlbnbQzu4A-1; Fri, 24 Jul 2020 09:47:10 -0400
X-MC-Unique: OJzyfBZDPMCuLlbnbQzu4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5633E8017FB;
 Fri, 24 Jul 2020 13:47:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C6810013D9;
 Fri, 24 Jul 2020 13:47:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A895411385F1; Fri, 24 Jul 2020 15:47:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] error: Strip trailing '\n' from error string arguments
 (again)
Date: Fri, 24 Jul 2020 15:47:02 +0200
Message-Id: <20200724134704.2248335-3-armbru@redhat.com>
In-Reply-To: <20200724134704.2248335-1-armbru@redhat.com>
References: <20200724134704.2248335-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 08:23:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tracked down with scripts/coccinelle/err-bad-newline.cocci.

Cc: Peter Xu <peterx@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200722084048.1726105-3-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c   | 6 +++---
 target/ppc/mmu-hash64.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 0c286635cf..5284bb68b6 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2356,7 +2356,7 @@ static bool vtd_process_iotlb_desc(IntelIOMMUState *s, VTDInvDesc *inv_desc)
     if ((inv_desc->lo & VTD_INV_DESC_IOTLB_RSVD_LO) ||
         (inv_desc->hi & VTD_INV_DESC_IOTLB_RSVD_HI)) {
         error_report_once("%s: invalid iotlb inv desc: hi=0x%"PRIx64
-                          ", lo=0x%"PRIx64" (reserved bits unzero)\n",
+                          ", lo=0x%"PRIx64" (reserved bits unzero)",
                           __func__, inv_desc->hi, inv_desc->lo);
         return false;
     }
@@ -2377,7 +2377,7 @@ static bool vtd_process_iotlb_desc(IntelIOMMUState *s, VTDInvDesc *inv_desc)
         am = VTD_INV_DESC_IOTLB_AM(inv_desc->hi);
         if (am > VTD_MAMV) {
             error_report_once("%s: invalid iotlb inv desc: hi=0x%"PRIx64
-                              ", lo=0x%"PRIx64" (am=%u > VTD_MAMV=%u)\n",
+                              ", lo=0x%"PRIx64" (am=%u > VTD_MAMV=%u)",
                               __func__, inv_desc->hi, inv_desc->lo,
                               am, (unsigned)VTD_MAMV);
             return false;
@@ -2387,7 +2387,7 @@ static bool vtd_process_iotlb_desc(IntelIOMMUState *s, VTDInvDesc *inv_desc)
 
     default:
         error_report_once("%s: invalid iotlb inv desc: hi=0x%"PRIx64
-                          ", lo=0x%"PRIx64" (type mismatch: 0x%llx)\n",
+                          ", lo=0x%"PRIx64" (type mismatch: 0x%llx)",
                           __func__, inv_desc->hi, inv_desc->lo,
                           inv_desc->lo & VTD_INV_DESC_IOTLB_G);
         return false;
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index e5baabf0e1..c31d21e6a9 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -859,7 +859,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
     }
 
     error_report("Bad page size encoding in LPCR[VRMASD]; LPCR=0x"
-                 TARGET_FMT_lx"\n", lpcr);
+                 TARGET_FMT_lx, lpcr);
 
     return -1;
 }
-- 
2.26.2


