Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4F382B55
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:40:46 +0200 (CEST)
Received: from localhost ([::1]:42030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libc5-00060K-LF
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9p-0003v6-FC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9l-0000Sn-Vu
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so3347635wmn.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KsOd4cFGdpWMT1est35/VbB1+PKurYa2ah3FsZXq+ZU=;
 b=UosgpI6v/evula3iHdrKnoUMdOyBKCaZghtIgUeBSXIoI49UE93NT09csovTgeRQyt
 CL1Bhz8kOoYJouRrQKxVCAqhDa+iINdbY3c7aYpQV+bJniVE7Gcf+OtPTuDZfjdpoqts
 eFOcbPAg6XAIpLEy/mM1O953dJACMzpXRkIXYXvEfA7GUrIKzWm8hd+SDB+1e7mbcbnf
 C75X+iBUI5MC2v4o4lTq0xzCzABR2H6La8CWK3joEwQaL+cL9quSQXQhP0Ibal9wlXeJ
 yGQAkfdWq6+YdzprK8CYiqbDrFhPAqhnxDg4uU/xc+ni6lM6a8NmSJmUhZcTbIIEmW0A
 eIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KsOd4cFGdpWMT1est35/VbB1+PKurYa2ah3FsZXq+ZU=;
 b=lf5sXkNO/u+BAwWhkFPtqHvT1trbduQQpuIxWVVurRWPn9zQMLXv8eETltFlRPmMBx
 DYtukRurcfrG41GmWP3cE6zAqwRyTmtlITLOj4ienkhy43hxK34aYBZLT1J9KlD73izX
 sd9mRVj0U6x6iJ+hFNt+ad+0Nlv08dCc+Q+VhXH3Ochj4ooUb1DNyMxAMuf3hnYpaB+/
 Oax77FUdSvdqQdf65K0O9wcEcOsCoRD2adsBdXE3FU5o5dUqMHBGM8/QW+/WKsQlWiBl
 lYmqheD8K3fjwa1C6ygpb95L04QPcT5AiMlKfYEta6fhzTmFvF3rgntgjo45B4P2eb0q
 QayQ==
X-Gm-Message-State: AOAM532hbi6Zk1wPYYPQjxQ+ssoHYv9wGT9QLZqhx+ddgCGcFKcc02vR
 UprBP+5ZdD0QWxwEbWAdgazEac8m6F2PpQ==
X-Google-Smtp-Source: ABdhPJzEHqkIAhICNMdGYAVyEbl8cbr1w2U5cmscVYs3PFaUcNOGNhBllSO5ZhIrwLmibIyJAdQLvw==
X-Received: by 2002:a1c:5582:: with SMTP id j124mr28476733wmb.0.1621249888171; 
 Mon, 17 May 2021 04:11:28 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 6sm16234139wry.60.2021.05.17.04.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] exec: Restrict cputlb.h to sysemu/
Date: Mon, 17 May 2021 13:11:03 +0200
Message-Id: <20210517111111.1068153-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the cputlb.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/cputlb.h,exec/sysemu/cputlb.h, $(git grep -l exec/cputlb.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/{ => sysemu}/cputlb.h | 11 +++++++----
 accel/tcg/cputlb.c                 |  2 +-
 accel/tcg/translate-all.c          |  6 +++---
 MAINTAINERS                        |  1 +
 4 files changed, 12 insertions(+), 8 deletions(-)
 rename include/exec/{ => sysemu}/cputlb.h (86%)

diff --git a/include/exec/cputlb.h b/include/exec/sysemu/cputlb.h
similarity index 86%
rename from include/exec/cputlb.h
rename to include/exec/sysemu/cputlb.h
index 19b16e58f84..5a37a870343 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/sysemu/cputlb.h
@@ -17,15 +17,18 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef CPUTLB_H
-#define CPUTLB_H
+#ifndef EXEC_SYSEMU_CPUTLB_H
+#define EXEC_SYSEMU_CPUTLB_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
 
 #include "exec/cpu-common.h"
 
-#if !defined(CONFIG_USER_ONLY)
 /* cputlb.c */
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
 void tlb_flush_counts(size_t *full, size_t *part, size_t *elide);
-#endif
+
 #endif
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 84e7d91a5ca..452029e8193 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -23,7 +23,7 @@
 #include "exec/exec-all.h"
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
-#include "exec/cputlb.h"
+#include "exec/sysemu/cputlb.h"
 #include "exec/tb-hash.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ae7e873713a..98a07ce4e4e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -42,11 +42,11 @@
 #include <libutil.h>
 #endif
 #endif
-#else
+#else /* !CONFIG_USER_ONLY */
+#include "exec/sysemu/cputlb.h"
 #include "exec/ram_addr.h"
-#endif
+#endif /* CONFIG_USER_ONLY */
 
-#include "exec/cputlb.h"
 #include "exec/tb-hash.h"
 #include "exec/translate-all.h"
 #include "qemu/bitmap.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index f1ae9934349..4378ec47a2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -131,6 +131,7 @@ F: include/exec/helper*.h
 F: include/exec/tb-hash.h
 F: include/exec/sysemu/hwaddr.h
 F: include/sysemu/cpus.h
+F: include/exec/sysemu/cputlb.h
 F: include/sysemu/tcg.h
 F: include/hw/core/tcg-cpu-ops.h
 
-- 
2.26.3


