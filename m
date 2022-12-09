Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB1648151
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bDh-00052C-Uj; Fri, 09 Dec 2022 06:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bDN-0004x4-Qz
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:06:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bDL-0000bX-PW
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:06:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so5508018wma.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rol1YC6OG7gH13doSoyRHJDeV0JryMZ9eZ3VXv2OjO0=;
 b=dNBz8KhD6/xeI3gWNioBuys2fAnPok5uJOhYy8Fc/RqlmTRY1oORcBTAG+K+KFJsa4
 jxnS2YX6+TJJRwhYXgy31FC5NMD+CmwJKXBFRWuEIX/iGPMbI/sICPrXRLP9mMFHMcLP
 4Ji3LD5TN7MUJvAz4Lng4p1L0qxHzIRYpiD/cIOB5d3Fq37OncgQNwHqTNuL3wLNRjln
 oJpaOGzqYQcttTVC1LsvKPD0uQk9jw2RjggpFgDU9tufGoqowBOIormP5UrX89HG3fuY
 5wfPOXzVExnv5NMIByAnze+mTa6Mn8VEd4ZWL7MwKK2e0CKXO1oVSIv8TmszrFw6Iz2N
 PzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rol1YC6OG7gH13doSoyRHJDeV0JryMZ9eZ3VXv2OjO0=;
 b=S2X/bDjhkx/8CEFWqEc9AhafIYzZAxxd9sHwBThhgrLv80fZvm8uWWQjKg5YCGvW7G
 1jpf8dSxOYXOrYhmXWwiOI79nG8qZwrL/6PLVQYfqp6cuJTxhCsiXfL1pMN37rlAeT/+
 QLHUPRpN8zTW8Hvywax6J7jdKQsPD+QZRdXcuVnrchnlAGVWRN3MN7APPBO/GVLN7mwx
 jKSVl1NViiFZWv0uO/gPhXCIejXM3qu70WJDv7TqZj5NBSRwAfKyWyWUG7BhFImTljjp
 UV8UY6kf8YpAmd0bjxDtIWEoVCSAiurqt3uSYOdvTfOHZkXkZgpspws88SJ+qZo5eT/K
 9Fgw==
X-Gm-Message-State: ANoB5pkoYFrvTAyCJei5H2uR9nZWhQm9cVR3fEiwZM6HdWPAv5OsXYhg
 97aKHaIjHe/4E4ZvPB78/I8e3SSxa1AtyFxCx28=
X-Google-Smtp-Source: AA0mqf6yaqvsmMZg/AAlcjWWPhTpU+MjmPeTOpvxzc9ZMHemK8zsucM64bs7W6ax09dmUDD8ugEyoA==
X-Received: by 2002:a05:600c:ad0:b0:3cf:6f4d:c260 with SMTP id
 c16-20020a05600c0ad000b003cf6f4dc260mr4706462wmr.32.1670584005944; 
 Fri, 09 Dec 2022 03:06:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a1c6a0e000000b003cf75213bb9sm7670850wmc.8.2022.12.09.03.06.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:06:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v3 2/2] physmem: Remove trace events from trace-root.h
Date: Fri,  9 Dec 2022 12:06:31 +0100
Message-Id: <20221209110631.59031-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209110631.59031-1-philmd@linaro.org>
References: <20221209110631.59031-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Missed in d9f24bf572 ("exec: split out non-softmmu-specific parts").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/physmem.c    | 2 +-
 softmmu/trace-events | 5 +++++
 trace-events         | 5 -----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index d562c0bb93..94ee981917 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -50,7 +50,7 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/xen-mapcache.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
 #include <linux/falloc.h>
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 22606dc27b..c7d709151d 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -21,6 +21,11 @@ flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
 global_dirty_changed(unsigned int bitmask) "bitmask 0x%"PRIx32
 
+# physmem.c
+find_ram_offset(uint64_t size, uint64_t offset) "size: 0x%" PRIx64 " @ 0x%" PRIx64
+find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_t next, uint64_t mingap) "trying size: 0x%" PRIx64 " @ 0x%" PRIx64 ", offset: 0x%" PRIx64" next: 0x%" PRIx64 " mingap: 0x%" PRIx64
+ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
+
 # softmmu.c
 vm_stop_flush_all(int ret) "ret %d"
 
diff --git a/trace-events b/trace-events
index b6b84b175e..6e67dfe91b 100644
--- a/trace-events
+++ b/trace-events
@@ -37,11 +37,6 @@ dma_complete(void *dbs, int ret, void *cb) "dbs=%p ret=%d cb=%p"
 dma_blk_cb(void *dbs, int ret) "dbs=%p ret=%d"
 dma_map_wait(void *dbs) "dbs=%p"
 
-# exec.c
-find_ram_offset(uint64_t size, uint64_t offset) "size: 0x%" PRIx64 " @ 0x%" PRIx64
-find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_t next, uint64_t mingap) "trying size: 0x%" PRIx64 " @ 0x%" PRIx64 ", offset: 0x%" PRIx64" next: 0x%" PRIx64 " mingap: 0x%" PRIx64
-ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
-
 # job.c
 job_state_transition(void *job,  int ret, const char *legal, const char *s0, const char *s1) "job %p (ret: %d) attempting %s transition (%s-->%s)"
 job_apply_verb(void *job, const char *state, const char *verb, const char *legal) "job %p in state %s; applying verb %s (%s)"
-- 
2.38.1


