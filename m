Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748332FF88
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 08:49:50 +0100 (CET)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIoAf-00008C-Hb
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 02:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIo9X-00088p-Ps
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:48:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIo9W-00077b-7k
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:48:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so1844838wmi.3
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or3s5L1DEA3J17CPf5B/vfRTzz01RYN/ydodt8L3izA=;
 b=WfQr53HnjqAeHolJSQF2SVkFTulpZHoDaIubHglpAqGxCRzIPp05XX1RLBCcI/qNXF
 wFeT78T8rHzSNIULs4ht0dZVK88I1zgxjFDjT73dXFRpe29fYdvDC7psESze+sNKCtHg
 wJCSXAX/TOVYJtrhWnnLY/zF3Y/xZmjqgkUyBe4CDG+EeRtgvAbw9zIOHhdb93MBHHmN
 XEscjebjml53R0MLq3+d4VUuqSNiEPYT40N3KbZhe29sXN/BIqf+6uo65cw+C8UX4zlC
 bep0Y9cKHVu4qI1M6Es0tmhL/MBtFpYaEjJgpZuL3y2ELrUBBZA0P6povOBmfDSR+n0/
 683w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=or3s5L1DEA3J17CPf5B/vfRTzz01RYN/ydodt8L3izA=;
 b=Dr+K+wj/8ZqfnaG/2uan66ck9nJv3U/BEoEFmkoRAbmk1NcfCfurwAvbUR2SRYjfh/
 TeLoNUd7DiNksTEw2TlNOJf2LKQojOLzL2+H7su5IpHnKolpDoRSHlYCKn6kO1GyxBmu
 CThZWzWVY5lD6SkF7DqShZgRcNU5QLEdxkSE7zkdrSNNuHrlX4kWwSXAt2BqGyIv2X6S
 8mhVH9GG/zpKOFKWfg/j458CIHJm2SiasbxD0OgCBEZlIMu2a8VgVUxOMqOM6Rw8Hw7C
 cdc1Pfeu/jVq7x945LNQbkg8+QDZOje76PaPcsF+w6/vyM049cD/+pUnu8IWgf3AN3uP
 Rf0g==
X-Gm-Message-State: AOAM530K1/EGN2xEHWawnK5k2LjwSYt/nTlmb1kb6RYHtgkxobKogybT
 4sjZDtmT5znGV05KXIIMuVU03StlBwg=
X-Google-Smtp-Source: ABdhPJwkka1sJ/nrA6olt3/5ib2JcQGi8WF2Reu1ttQ4tNmQatlVd4ctqiqGugJ4uJQhOkM53t5gvw==
X-Received: by 2002:a1c:66c4:: with SMTP id
 a187mr16719194wmc.164.1615103315979; 
 Sat, 06 Mar 2021 23:48:35 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y18sm4897684wrw.39.2021.03.06.23.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 23:48:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
Date: Sun,  7 Mar 2021 08:48:33 +0100
Message-Id: <20210307074833.143106-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MemoryRegion names is cached on first call to memory_region_name(),
so displaying the name is trace events is cheap. Add it for read /
write ops.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c     | 12 ++++++++----
 softmmu/trace-events |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..d4d9ab8828e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -444,7 +444,8 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
+                                     memory_region_name(mr));
     }
     memory_region_shift_read_access(value, shift, mask, tmp);
     return MEMTX_OK;
@@ -466,7 +467,8 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
+                                     memory_region_name(mr));
     }
     memory_region_shift_read_access(value, shift, mask, tmp);
     return r;
@@ -486,7 +488,8 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
+                                      memory_region_name(mr));
     }
     mr->ops->write(mr->opaque, addr, tmp, size);
     return MEMTX_OK;
@@ -506,7 +509,8 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
+                                      memory_region_name(mr));
     }
     return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
 }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index b80ca042e1f..359fb37cc8d 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -9,8 +9,8 @@ cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
 cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
 
 # memory.c
-memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
-memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
+memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
-- 
2.26.2


