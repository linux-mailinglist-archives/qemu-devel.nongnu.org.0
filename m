Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394E4E67A2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:18:41 +0100 (CET)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXR6e-0004rs-7z
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:18:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXR3n-0002dO-0Q
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXR3k-0007Nx-64
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648142136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Wb+FAfjKY3fSSrJECDDUq2wTWAyWnchPU02dBdfOs0=;
 b=PdvrGVe1kGdudpq4SZTOwRvF1Ki6jGubxE0zhTrwCMhoK3F+tWUYTlfy7FekCMffuvPS5p
 pAWCZ53zkjF/U1Sl3pRneWT9JE6mv8j6Wr0tPEpLdwVywDK1bDMGKHuCNAteykHy/1qZLT
 xKSDsPPf392Rvoe5PVvr2lhXxrk5ZfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-2v0lqibbMbe7y8svzrQydQ-1; Thu, 24 Mar 2022 13:15:33 -0400
X-MC-Unique: 2v0lqibbMbe7y8svzrQydQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4151885A5A8;
 Thu, 24 Mar 2022 17:15:32 +0000 (UTC)
Received: from localhost (unknown [10.39.195.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE7434010E5F;
 Thu, 24 Mar 2022 17:15:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-7.0 2/2] hw: Fix misleading hexadecimal format
Date: Thu, 24 Mar 2022 17:15:27 +0000
Message-Id: <20220324171527.1256604-3-stefanha@redhat.com>
In-Reply-To: <20220324171527.1256604-1-stefanha@redhat.com>
References: <20220324171527.1256604-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"0x%u" format is very misleading, replace by "0x%x".

Found running:

  $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' hw/

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20220323114718.58714-3-philippe.mathieu.daude@gmail.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/i386/sgx.c        | 2 +-
 hw/i386/trace-events | 6 +++---
 hw/misc/trace-events | 4 ++--
 hw/scsi/trace-events | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a2b318dd93..a44d66ba2a 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -315,7 +315,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-        error_report("Size of all 'sgx-epc' =0x%"PRIu64" causes EPC to wrap",
+        error_report("Size of all 'sgx-epc' =0x%"PRIx64" causes EPC to wrap",
                      sgx_epc->size);
         exit(EXIT_FAILURE);
     }
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index 5bf7e52bf5..e49814dd64 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -33,15 +33,15 @@ vtd_fault_disabled(void) "Fault processing disabled for context entry"
 vtd_replay_ce_valid(const char *mode, uint8_t bus, uint8_t dev, uint8_t fn, uint16_t domain, uint64_t hi, uint64_t lo) "%s: replay valid context device %02"PRIx8":%02"PRIx8".%02"PRIx8" domain 0x%"PRIx16" hi 0x%"PRIx64" lo 0x%"PRIx64
 vtd_replay_ce_invalid(uint8_t bus, uint8_t dev, uint8_t fn) "replay invalid context device %02"PRIx8":%02"PRIx8".%02"PRIx8
 vtd_page_walk_level(uint64_t addr, uint32_t level, uint64_t start, uint64_t end) "walk (base=0x%"PRIx64", level=%"PRIu32") iova range 0x%"PRIx64" - 0x%"PRIx64
-vtd_page_walk_one(uint16_t domain, uint64_t iova, uint64_t gpa, uint64_t mask, int perm) "domain 0x%"PRIu16" iova 0x%"PRIx64" -> gpa 0x%"PRIx64" mask 0x%"PRIx64" perm %d"
+vtd_page_walk_one(uint16_t domain, uint64_t iova, uint64_t gpa, uint64_t mask, int perm) "domain 0x%"PRIx16" iova 0x%"PRIx64" -> gpa 0x%"PRIx64" mask 0x%"PRIx64" perm %d"
 vtd_page_walk_one_skip_map(uint64_t iova, uint64_t mask, uint64_t translated) "iova 0x%"PRIx64" mask 0x%"PRIx64" translated 0x%"PRIx64
 vtd_page_walk_one_skip_unmap(uint64_t iova, uint64_t mask) "iova 0x%"PRIx64" mask 0x%"PRIx64
 vtd_page_walk_skip_read(uint64_t iova, uint64_t next) "Page walk skip iova 0x%"PRIx64" - 0x%"PRIx64" due to unable to read"
 vtd_page_walk_skip_reserve(uint64_t iova, uint64_t next) "Page walk skip iova 0x%"PRIx64" - 0x%"PRIx64" due to rsrv set"
 vtd_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn, bool on) "Device %02x:%02x.%x switching address space (iommu enabled=%d)"
 vtd_as_unmap_whole(uint8_t bus, uint8_t slot, uint8_t fn, uint64_t iova, uint64_t size) "Device %02x:%02x.%x start 0x%"PRIx64" size 0x%"PRIx64
-vtd_translate_pt(uint16_t sid, uint64_t addr) "source id 0x%"PRIu16", iova 0x%"PRIx64
-vtd_pt_enable_fast_path(uint16_t sid, bool success) "sid 0x%"PRIu16" %d"
+vtd_translate_pt(uint16_t sid, uint64_t addr) "source id 0x%"PRIx16", iova 0x%"PRIx64
+vtd_pt_enable_fast_path(uint16_t sid, bool success) "sid 0x%"PRIx16" %d"
 vtd_irq_generate(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64
 vtd_reg_read(uint64_t addr, uint64_t size) "addr 0x%"PRIx64" size 0x%"PRIx64
 vtd_reg_write(uint64_t addr, uint64_t size, uint64_t val) "addr 0x%"PRIx64" size 0x%"PRIx64" value 0x%"PRIx64
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index bd52cfc110..4e0c7973a4 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -1,7 +1,7 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # allwinner-cpucfg.c
-allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, reset_addr 0x%" PRIu32
+allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, reset_addr 0x%" PRIx32
 allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
 allwinner_cpucfg_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
 
@@ -93,7 +93,7 @@ imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08
 
 # mos6522.c
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
-mos6522_get_next_irq_time(uint16_t latch, int64_t d, int64_t delta) "latch=%d counter=0x%"PRId64 " delta_next=0x%"PRId64
+mos6522_get_next_irq_time(uint16_t latch, int64_t d, int64_t delta) "latch=%d counter=0x%"PRIx64 " delta_next=0x%"PRIx64
 mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, const char *name, uint64_t val) "reg=0x%"PRIx64 " [%s] val=0x%"PRIx64
 mos6522_read(uint64_t addr, const char *name, unsigned val) "reg=0x%"PRIx64 " [%s] val=0x%x"
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index ae8551f279..20fb0dc162 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -249,7 +249,7 @@ lsi_bad_phase_interrupt(void) "Phase mismatch interrupt"
 lsi_bad_selection(uint32_t id) "Selected absent target %"PRIu32
 lsi_do_dma_unavailable(void) "DMA no data available"
 lsi_do_dma(uint64_t addr, int len) "DMA addr=0x%"PRIx64" len=%d"
-lsi_queue_command(uint32_t tag) "Queueing tag=0x%"PRId32
+lsi_queue_command(uint32_t tag) "Queueing tag=0x%"PRIx32
 lsi_add_msg_byte_error(void) "MSG IN data too long"
 lsi_add_msg_byte(uint8_t data) "MSG IN 0x%02x"
 lsi_reselect(int id) "Reselected target %d"
@@ -267,7 +267,7 @@ lsi_do_msgout_noop(void) "MSG: No Operation"
 lsi_do_msgout_extended(uint8_t msg, uint8_t len) "Extended message 0x%x (len %d)"
 lsi_do_msgout_ignored(const char *msg) "%s (ignored)"
 lsi_do_msgout_simplequeue(uint8_t select_tag) "SIMPLE queue tag=0x%x"
-lsi_do_msgout_abort(uint32_t tag) "MSG: ABORT TAG tag=0x%"PRId32
+lsi_do_msgout_abort(uint32_t tag) "MSG: ABORT TAG tag=0x%"PRIx32
 lsi_do_msgout_clearqueue(uint32_t tag) "MSG: CLEAR QUEUE tag=0x%"PRIx32
 lsi_do_msgout_busdevicereset(uint32_t tag) "MSG: BUS DEVICE RESET tag=0x%"PRIx32
 lsi_do_msgout_select(int id) "Select LUN %d"
-- 
2.35.1


