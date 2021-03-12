Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EFA338F48
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:59:35 +0100 (CET)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiKE-0004WL-6A
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCx-0002ns-Rc
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:03 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCo-0001xZ-HU
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a18so4822778wrc.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ADa2Wj1PlQ9ggdEw9lEa7PJRf39fQP9+k6DKUg3dPXg=;
 b=R6P0UQ9I5kfExOgNO7QTQu0u/QahF1ChGcB601DThufUPDmIIi8r/L2WumONyMYT92
 eg4dcJKIC0IQbjVI01w357cVUXy7mjhMe0WK1L7Jg3rbD/s1n3EJUco2h0tXZ/vJLAP6
 NRplmjludKwJ+dlSd3AZYig6eRtCjXfvxlaLNtJ0b4of1sVVjkJWERWhY5RTy+j1mVqP
 wj/XRh7p29ndAlnPmIX5yN1M5r2ROShGLhxcEpC1kxoKuEnK89aLJocNZtll97GXRT3H
 OUSaRu3ckri/1/qWPBAexHxMpS7GQsFPphJiaobqdF8zgKIk0tuddxjZ8RCxgxtb8zwk
 HPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ADa2Wj1PlQ9ggdEw9lEa7PJRf39fQP9+k6DKUg3dPXg=;
 b=IKFNyIjYzq/99UN8Gorr4Ng47NPEFr1ggoTmimgtnGjGASJgqDXwIIugZF3Da3EbE/
 +CepabsX24tTwyZxbO5TQvsuHagrvVQ16V4HhekcXZYq5rBkMyxK/4M/GxKT25obqtZI
 6Oo5av7lS0jHEy6jV3RAWBjdJ6eqWIOpitjIu9b51cgu7JvCQoYl13IoWu9lxiGp/CtT
 Y5kvJ/5IQsJwJlVFYqwHwbHH/Yo6XtyRCNI6qFgDTGCECTZLNdiZBBWMkMwtI5PVqG8Q
 qNVkVfjknnNgoCaurF8Y0EQ2784yI2RIOEzhXiB0UF2cvUqnROC4gc3Nvpd84A5ZCnxu
 TWdw==
X-Gm-Message-State: AOAM53101fJ2UxdpcgA3ekBBM1R1nD0AKqQ81qLaWZ+gfICggpVGvHtT
 Wg9s6h/RpktCIMdujiNPaWrmbWsSmsZCsZXN
X-Google-Smtp-Source: ABdhPJxRT+KSkexTnfTfuZ9HRap2peisVp1R/eurp1nKZhfpX1Kyud9daw7zxfOOlvB4EVzfwZ5ncA==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr14439553wru.218.1615557108858; 
 Fri, 12 Mar 2021 05:51:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/39] hw/arm/smmuv3: Uniformize sid traces
Date: Fri, 12 Mar 2021 13:51:10 +0000
Message-Id: <20210312135140.1099-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Convert all sid printouts to sid=0x%x.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210309102742.30442-8-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/trace-events | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index a335ee891db..b79a91af5fb 100644
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
2.20.1


