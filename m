Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7C4E51E9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:10:43 +0100 (CET)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzp4-0001Z8-R4
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:10:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWzSs-0002Sh-3w; Wed, 23 Mar 2022 07:47:46 -0400
Received: from [2607:f8b0:4864:20::82d] (port=35353
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWzSp-0002A0-Ds; Wed, 23 Mar 2022 07:47:45 -0400
Received: by mail-qt1-x82d.google.com with SMTP id v14so885697qta.2;
 Wed, 23 Mar 2022 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x03eQiYpYvTKSGrhFrf6io2N96nw/bYXntct1TDlZN8=;
 b=VG1yiIZZRHPEpI8Y2theRB+sNngJJCmr54LwEv0xYkPx8EG/OekcIcn9xstm+4j/T8
 5RlUDqwSJHh1dEAGJFr5e/56X6xi/tbYi4VTuKqGZCEprABi8MO9kxjHRAJZ/UrxAkTR
 asW9ATOz2kqiw0oDPWvyl128OmL/2d+eSTFhNw8vAqVxGIk5PBdk5SjBur7F0i6uKfQI
 QSXC0FM6ub1MzRjOGJuIItRlponcT3nRknK/1SrhR9gLCCNO/7xAnTtb7J3zEtuzoToo
 809ZOrBYcoiFL0QTiKZ/8Ju8ZcZtCcLO1lXDg15gutJGfBqbftGLR2wijCJ1tzOZ48kK
 0Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x03eQiYpYvTKSGrhFrf6io2N96nw/bYXntct1TDlZN8=;
 b=QQiFA03SVYWnh287MVjUuHGEIi2XccPNLbe9kMPS4oMzH5t4ZLO3wigQdVMk5K2ZnN
 HN55zLd7QA9S2hJln8ppe9NxqMIdEV7gGoJ7foqUiUNnySi02zoV9vB0E+xVwfruau6K
 h23DsDi3uQ8Op+jcgNVMhlcoWC8x0Ovf7ZvfVMHtuOGNyousMEpbn/j4oJkL6BTKM9ZG
 BbVJjlFZbKQ1bC0WGQNAozgaMPCW+OEbJY37ef0rXlv2hKa427mBswaj6wGeNrJATOyL
 B7fbl+1bRYw8rN0RC7aHxlBHT6U0rnL5LdFraPHmDoAgR75bS55nfCAgWfmA1d6z0IFb
 vexA==
X-Gm-Message-State: AOAM5324P26CWD05XDOoPsaNcTGLfh0kKhWn+KDXLZBSIpewaFZjprbG
 0G4kuI7AGCIO6vJx9+cs/f+/o+UTFFY=
X-Google-Smtp-Source: ABdhPJw0b+ggVSwYDeq89xM2VrAybl2t57CejaRJZLFg+d1usMEABtxesoS6xsvBCv6JSAOMS5wpiw==
X-Received: by 2002:a05:622a:1807:b0:2e1:c220:887b with SMTP id
 t7-20020a05622a180700b002e1c220887bmr23598727qtc.620.1648036061186; 
 Wed, 23 Mar 2022 04:47:41 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05620a134b00b006809a92a94fsm70646qkl.79.2022.03.23.04.47.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 04:47:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 2/2] hw: Fix misleading hexadecimal format
Date: Wed, 23 Mar 2022 12:47:18 +0100
Message-Id: <20220323114718.58714-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
References: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"0x%u" format is very misleading, replace by "0x%x".

Found running:

  $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' hw/

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


