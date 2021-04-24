Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6B36A20F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:23:44 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL4J-00089d-S9
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiW-0005dl-G3
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:13 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi8-0004Gr-CC
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:12 -0400
Received: by mail-io1-xd29.google.com with SMTP id l21so8548420iob.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGgDsEQCSEreTiFa0pBkZshQIPOID11pa8whoy7y464=;
 b=YvilGwOCWjekHZislDN4cbs1D4DyCfWNjzXytMBJ4ZyUIjgQeRiyAdJaLSv1VkAKUz
 V9pXWW+sddopnKaytOfNW2ItgRBOw3czVPMIHDdcXsLudSZ0P0HEj4uAFZwBVLhsYufQ
 d4VjewTDTYAmXLQVBbRO0KlDQoyZdOe/FqwSf91n6+WrgRhNC2+8iPWAhNKeV1oZ4v00
 +uDlUgONhfEEGycy9e8KtLDhz3nLOy6xMtl/KbIb38bGG44npNOtnW4df+6DtVBpa9oC
 hJcINfcUWFmuXNm6UMDFovwNtXm4PABTJYW9yBT6k6KXyprycqNQCgrI75EryQhmaSgc
 FPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGgDsEQCSEreTiFa0pBkZshQIPOID11pa8whoy7y464=;
 b=gH7sTz+zWLL/RYdTw4XY3VEod7KDW5QSFq1+7udszhVjK9BRd6e97caP0wMCGYM0Q8
 YW+SYoVrvQh1rfv8AjmHF++j6yKDkTpQ0I0pBcfM5EhyuSSQ5kSoIl53ReQbb3U8RFwS
 pHT24req+l0bSkzhIjwgRNolfSm+7uBXKCgQPLGhiI4SjsMfkwY73pX+pFwlhQNgpZl/
 rh1s673C3Ol9HPRzE98dexghv7tgdv/BVlNjrTRErBszKs7ImXX3MSsxn8VdQs52wKaI
 CQoT+saG4ombFculEkvtmXhK8Mtw98/4S+fi8Uq2R+TKUsV0QNmEHCmTRp41D0XT0bK0
 ybiw==
X-Gm-Message-State: AOAM533BI3kv/qGpakqZgq8ejJ4iqTHxSh6pkGufZ0NnIPP3IZOh9AkY
 fzyBSP57u+GbO8m7rqBKmdShcGdPiffj6MCs
X-Google-Smtp-Source: ABdhPJwIZz4VIkj0cYlEZATPWnN6TRnF0b2Xt9DJqSlJ4S+RZGoz4Pf4iihUDIHLtydeB4G8Uxxewg==
X-Received: by 2002:a5d:8441:: with SMTP id w1mr7566260ior.210.1619280046593; 
 Sat, 24 Apr 2021 09:00:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:46 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/48] bsd-user: create target_arch_cpu.h
Date: Sat, 24 Apr 2021 09:59:52 -0600
Message-Id: <20210424160016.15200-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Create target_arch_cpu.h to house the target_cpu_loop and target_cpu_init
functions. These are the empty files that will be populated by moving the
appropriate cpu-specific functions out of main.c. This work pre-dates the
linux-user work that moved these to cpu-loop.c, so was done differently. As
there's a number of things linux-user did differently than bsd-user in their
time of divergence, and as the recertification of the code to redo it the same
way will take a fair amount of effort, a separate effort to address the
divergence once everything is in the tree and we can create a common qemu-user
directory for the munane common elements between the two.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h     | 22 ++++++++++++++++++++++
 bsd-user/i386/target_arch_cpu.h    | 22 ++++++++++++++++++++++
 bsd-user/main.c                    |  1 +
 bsd-user/sparc/target_arch_cpu.h   | 22 ++++++++++++++++++++++
 bsd-user/sparc64/target_arch_cpu.h | 19 +++++++++++++++++++
 bsd-user/x86_64/target_arch_cpu.h  | 19 +++++++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/i386/target_arch_cpu.h
 create mode 100644 bsd-user/sparc/target_arch_cpu.h
 create mode 100644 bsd-user/sparc64/target_arch_cpu.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.h

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
new file mode 100644
index 0000000000..71c89174f2
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -0,0 +1,22 @@
+/*
+ *  arm cpu init and loop
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
new file mode 100644
index 0000000000..c05e048b9b
--- /dev/null
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -0,0 +1,22 @@
+/*
+ *  i386 cpu init and loop
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index a81a70f8ac..8a270ccfe6 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -42,6 +42,7 @@
 #include "trace/control.h"
 
 #include "host_os.h"
+#include "target_arch_cpu.h"
 
 int singlestep;
 unsigned long mmap_min_addr;
diff --git a/bsd-user/sparc/target_arch_cpu.h b/bsd-user/sparc/target_arch_cpu.h
new file mode 100644
index 0000000000..dcf7694cba
--- /dev/null
+++ b/bsd-user/sparc/target_arch_cpu.h
@@ -0,0 +1,22 @@
+/*
+ *  sparc cpu init and loop
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/sparc64/target_arch_cpu.h b/bsd-user/sparc64/target_arch_cpu.h
new file mode 100644
index 0000000000..c3962a8e9a
--- /dev/null
+++ b/bsd-user/sparc64/target_arch_cpu.h
@@ -0,0 +1,19 @@
+/*
+ *  sparc64 cpu init and loop
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "../sparc/target_arch_cpu.h"
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
new file mode 100644
index 0000000000..56cb59ae0b
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -0,0 +1,19 @@
+/*
+ *  x86_64 cpu init and loop
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "../i386/target_arch_cpu.h"
-- 
2.22.1


