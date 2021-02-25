Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D1324CA7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:22:36 +0100 (CET)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCqx-0002Za-2e
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCk7-0003kV-HK
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCk4-0006Gw-A5
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iB/7Ge7AocTxeaZGZjq3gM/zWnXIQCTlec0VIFG3FNA=;
 b=gVOKRnSWL/KfTvAIIa10LLqi2x13jn/NUV11PFSC/b75dpLFp4VcPDKhMh1PKXAJw7QVln
 FuhrZzkJ8Vs1fkZp1+p+X3KQzgccmskDP8P0+dZUuza0oz8psLtQdIObX7wHyS/0gFZ8I4
 wgo/zg+cXVofwU1d6+cOrLSLX/qVOt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-io960E4LOUazH5iSEqLoTQ-1; Thu, 25 Feb 2021 04:15:24 -0500
X-MC-Unique: io960E4LOUazH5iSEqLoTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F81FAFA84;
 Thu, 25 Feb 2021 09:15:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59BB162467;
 Thu, 25 Feb 2021 09:15:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 peterx@redhat.com, jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 7/7] hw/arm/smmuv3: Uniformize sid traces
Date: Thu, 25 Feb 2021 10:14:35 +0100
Message-Id: <20210225091435.644762-8-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-1-eric.auger@redhat.com>
References: <20210225091435.644762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert all sid printouts to sid=0x%x.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/trace-events | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index a335ee891d..b79a91af5f 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -29,26 +29,26 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
 smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
 smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
 smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
-smmuv3_record_event(const char *type, uint32_t sid) "%s sid=%d"
-smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "SID:0x%x features:0x%x, sid_split:0x%x"
+smmuv3_record_event(const char *type, uint32_t sid) "%s sid=0x%x"
+smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "sid=0x%x features:0x%x, sid_split:0x%x"
 smmuv3_find_ste_2lvl(uint64_t strtab_base, uint64_t l1ptr, int l1_ste_offset, uint64_t l2ptr, int l2_ste_offset, int max_l2_ste) "strtab_base:0x%"PRIx64" l1ptr:0x%"PRIx64" l1_off:0x%x, l2ptr:0x%"PRIx64" l2_off:0x%x max_l2_ste:%d"
 smmuv3_get_ste(uint64_t addr) "STE addr: 0x%"PRIx64
-smmuv3_translate_disable(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d bypass (smmu disabled) iova:0x%"PRIx64" is_write=%d"
-smmuv3_translate_bypass(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d STE bypass iova:0x%"PRIx64" is_write=%d"
-smmuv3_translate_abort(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d abort on iova:0x%"PRIx64" is_write=%d"
-smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=%d iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
+smmuv3_translate_disable(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=0x%x bypass (smmu disabled) iova:0x%"PRIx64" is_write=%d"
+smmuv3_translate_bypass(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=0x%x STE bypass iova:0x%"PRIx64" is_write=%d"
+smmuv3_translate_abort(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=0x%x abort on iova:0x%"PRIx64" is_write=%d"
+smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=0x%x iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
 smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
 smmuv3_decode_cd(uint32_t oas) "oas=%d"
 smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz, bool had) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d had:%d"
-smmuv3_cmdq_cfgi_ste(int streamid) "streamid =%d"
+smmuv3_cmdq_cfgi_ste(int streamid) "streamid= 0x%x"
 smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
-smmuv3_cmdq_cfgi_cd(uint32_t sid) "streamid = %d"
-smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid =%d asid =%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
+smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
+smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
+smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
-smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
+smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
-- 
2.26.2


