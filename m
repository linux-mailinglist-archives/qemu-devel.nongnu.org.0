Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A754D8708
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:37:18 +0100 (CET)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTloy-0000RC-FC
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:37:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1nTldu-0006Fc-Ko
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:25:50 -0400
Received: from [2001:8b0:10b:1236::1] (port=41660 helo=casper.infradead.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1nTlds-0002Hy-Rc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bHAchC0+iNjy4eEX6Icd7ira7yPt3JmQnXnO4S53bdQ=; b=XDz59F+qwUk/bBNEAoIBT35/O3
 NAr/u+ffFuMiPj7DvI7CM7/LXgoBzRS2EcfdvGA8U9OndnyRHdX+pZSHq4yATDCyMZA7oDwLaNUis
 c/ig+O/LKRnyoWNfBEBfiMD5ARgczxI7iEwdJF3/L/gAJJ/oTefD8AoWLB+7pDOFYG8ObBvJ0Aiwi
 D1kehFJPRZslUNZ6d9FHg0K+5Roe4bs3Uk0uytqQvKm5V94WxBsHTzT8dEHj+Q6HFcaOdMbIlOt7J
 Yu74kbMM6wuazRsE71SfUqQGq68/5VIO/7mFK7vLeLApw5DsxbIMtHOxFsXhP/hAPnMz7G7t2zybr
 i7xBmP5A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTldp-0047Z9-A5; Mon, 14 Mar 2022 14:25:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nTldo-000dAd-MB; Mon, 14 Mar 2022 14:25:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] intel_iommu: Fix irqchip / X2APIC configuration checks
Date: Mon, 14 Mar 2022 14:25:44 +0000
Message-Id: <20220314142544.150555-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220314142544.150555-1-dwmw2@infradead.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:8b0:10b:1236::1
 (failed)
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to check kvm_enable_x2apic(). It's perfectly OK to support
interrupt remapping even if we can't address CPUs above 254. Kind of
pointless, but still functional.

The check on kvm_enable_x2apic() needs to happen *anyway* in order to
allow CPUs above 254 even without an IOMMU, so allow that to happen
elsewhere.

However, we do require the *split* irqchip in order to rewrite I/OAPIC
destinations. So fix that check while we're here.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Acked-by: Claudio Fontana <cfontana@suse.de>
---
 hw/i386/intel_iommu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index e32cb933bd..1cc64b0efc 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3786,15 +3786,10 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
                                               ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
     if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
-        if (!kvm_irqchip_in_kernel()) {
+        if (!kvm_irqchip_is_split()) {
             error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
             return false;
         }
-        if (!kvm_enable_x2apic()) {
-            error_setg(errp, "eim=on requires support on the KVM side"
-                             "(X2APIC_API, first shipped in v4.7)");
-            return false;
-        }
     }
 
     /* Currently only address widths supported are 39 and 48 bits */
-- 
2.33.1


