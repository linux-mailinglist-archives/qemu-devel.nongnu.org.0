Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2454D8821
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:33:44 +0100 (CET)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmha-0001O1-OP
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:33:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d5a5bae4d677cd76b57a+6777+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1nTle0-0006Tz-Qr
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:25:56 -0400
Received: from desiato.infradead.org ([90.155.92.199]:44798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d5a5bae4d677cd76b57a+6777+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1nTldy-0002KL-I1
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sZZuFpI4exz793Oyalsxftvzu/Zwg8HQxGOOUixySZQ=; b=Ln4NI7HEM5jHy45UM4eaiWZTWr
 EANhaG4L3313pRC6xFJH/mkCzQeA3jfExVZQmFV+LwGqmra4ADF4igtOliSozFRVxyFGw6lYqPAJG
 GkmSBzEuli2zt8A7iF3tVj4e6GtdIB1nNCkjXOKbSvAlidLdeyX7+FwsUIysyBr9VfCK7TCmOvm6K
 p5m/lxbV1ZkCmorLLF1EpmtqAfZLdKlXlhnl1ZTCyUdW/ijvVTifKy4DrQw4szrOjEzCm1gSmbm6m
 WE6q997eCkntrb4ow0wxJVQlBVqbCzsR7BrD2DUD+wmQr2jhDCgAkwK256L+hJyayc4ADZ9aoc4Br
 XbFRhguA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTldp-000rjR-Bi; Mon, 14 Mar 2022 14:25:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nTldo-000dAa-La; Mon, 14 Mar 2022 14:25:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] intel_iommu: Only allow interrupt remapping to be enabled
 if it's supported
Date: Mon, 14 Mar 2022 14:25:43 +0000
Message-Id: <20220314142544.150555-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220314142544.150555-1-dwmw2@infradead.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=90.155.92.199;
 envelope-from=BATV+d5a5bae4d677cd76b57a+6777+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: David Woodhouse <dwmw@amazon.co.uk>

We should probably check if we were meant to be exposing IR, before
letting the guest turn the IRE bit on.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 948c653e74..e32cb933bd 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2209,6 +2209,7 @@ static void vtd_handle_gcmd_ire(IntelIOMMUState *s, bool en)
 /* Handle write to Global Command Register */
 static void vtd_handle_gcmd_write(IntelIOMMUState *s)
 {
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
     uint32_t status = vtd_get_long_raw(s, DMAR_GSTS_REG);
     uint32_t val = vtd_get_long_raw(s, DMAR_GCMD_REG);
     uint32_t changed = status ^ val;
@@ -2230,7 +2231,8 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
         /* Set/update the interrupt remapping root-table pointer */
         vtd_handle_gcmd_sirtp(s);
     }
-    if (changed & VTD_GCMD_IRE) {
+    if ((changed & VTD_GCMD_IRE) &&
+        x86_iommu_ir_supported(x86_iommu)) {
         /* Interrupt remap enable/disable */
         vtd_handle_gcmd_ire(s, val & VTD_GCMD_IRE);
     }
-- 
2.33.1


