Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030264F9B19
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:54:25 +0200 (CEST)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrsO-0005IX-3p
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmH-00075S-TV
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrm0-00031O-Bb
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:47:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w4so13737047wrg.12
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbfUhEdoXUFU1ImJHXBrosmpAlm+ZA5/z2VauZwOXbI=;
 b=BTOedRCyP62uDlxVSIJt/5B95PhUmE7OWJ9zSAig/yo6I5SivI+hQzJ48FcBZGA750
 7rMgOV4r7zVOUSGF3xSQsxOWAnhg2LR2lArmIgrnoZC5hkpgZ9gsF3iK2mG+LcejNwnE
 qwJaZCDhIMjtqgfSy9YA7CcSybE+mils+Ah1MPjPZCLrG/WW5rCFCxmDQeDLhBBwOIOS
 n+ASqxt4zbDFXwAeXp+B4LsPzV+Lo+gsFvzOS4ri2wahhqQbBldV1n0NQLEzZ43z5Y+C
 e1WVq6UwyMhzI6MCqL20EU+OyFXj5k+CAFXuG/uyxtN2RNzwLls8IlXX+wtTUR9JFxTA
 EoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbfUhEdoXUFU1ImJHXBrosmpAlm+ZA5/z2VauZwOXbI=;
 b=B+mQfk5FVtcmEL2zvM5RFOEf7nXEgBJyAltpTKKhwBum8PeNPCt0v7sp2NCslrK5xs
 8jnYH6GFIxRiGmsvGeIdRxBM6Vl32EymREamLUN4cyMypIuyyl9FFHfj/1gpbW7j1x4U
 g37xkhW+i0INBtSwgCUO1JupamIQa+/TfX8SaRZwvul7ah4iBeLIGBczPinBgztBYg6p
 bM9fwkLfxszl5SlBstY2MdAb3yeSO4wnK5tVy4CeWRW1i7CvCtGy590hzsOIGeLQ9Cug
 3ThfUJsUl0BFSxMpDRe0YqQSnqcCCxafnLUiq8xHyYLwVfI01moVRR8zgFMMofDucxy6
 D4cQ==
X-Gm-Message-State: AOAM532vJWzJaLa9lFkJpBTWlnjuxDJA9B2YvD+gwQFmaqwaAgf4VvdH
 EKue1g9TGPDgNhpwRlegQepM4w==
X-Google-Smtp-Source: ABdhPJxJMAkMBFYZaAGeR/u8Zw2J95W8oC9lNbf12tIU6HFd66B9+5rSe2vfrPYg1FSFF6jhSuJe4Q==
X-Received: by 2002:a5d:4348:0:b0:206:1c79:fd57 with SMTP id
 u8-20020a5d4348000000b002061c79fd57mr15721266wrr.344.1649436467016; 
 Fri, 08 Apr 2022 09:47:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfdf07000000b0020609f6b386sm16365853wrl.37.2022.04.08.09.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 886F81FFBC;
 Fri,  8 Apr 2022 17:47:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/15] accel/tcg: move trace events to correct location
Date: Fri,  8 Apr 2022 17:47:31 +0100
Message-Id: <20220408164742.2844631-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c     | 2 +-
 accel/tcg/trace-events | 4 ++++
 trace-events           | 4 ----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2035b2ac0a..35797cea49 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -33,7 +33,7 @@
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
 #include "exec/translate-all.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 #include "tb-hash.h"
 #include "internal.h"
 #ifdef CONFIG_PLUGIN
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 59eab96f26..4e9b450520 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -6,5 +6,9 @@ exec_tb(void *tb, uintptr_t pc) "tb:%p pc=0x%"PRIxPTR
 exec_tb_nocache(void *tb, uintptr_t pc) "tb:%p pc=0x%"PRIxPTR
 exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=0x%x"
 
+# cputlb.c
+memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
+memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+
 # translate-all.c
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
diff --git a/trace-events b/trace-events
index bc71006675..841c2ca7c5 100644
--- a/trace-events
+++ b/trace-events
@@ -42,10 +42,6 @@ find_ram_offset(uint64_t size, uint64_t offset) "size: 0x%" PRIx64 " @ 0x%" PRIx
 find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_t next, uint64_t mingap) "trying size: 0x%" PRIx64 " @ 0x%" PRIx64 ", offset: 0x%" PRIx64" next: 0x%" PRIx64 " mingap: 0x%" PRIx64
 ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
 
-# accel/tcg/cputlb.c
-memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
-memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
-
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
 gdbstub_op_exiting(uint8_t code) "notifying exit with code=0x%02x"
-- 
2.30.2


