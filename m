Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118CE6B5130
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:54:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painW-0001GQ-Kf; Fri, 10 Mar 2023 14:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painU-0001G0-MY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:00 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painT-0004f4-2M
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:00 -0500
Received: by mail-pl1-x629.google.com with SMTP id x11so6765480pln.12
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1DnbR7KQTC+x6ysScZJbOrppJZcpcAPm9qgXNyJ5JE=;
 b=lrq24zTUOGU/rLGb1ndBs526zLC3QlVYI9QU1A7r5v/zgfwabH3TtBk/uekkBGFFIA
 Ic9Gl+D08gk4d3UDgOXekKv81wU3X8LFyNCHDwgGSv4lnQzSURAbWqwrsik6J4F0PA/R
 NTvQlwF8Xc++Ql5oZJlMqqYAuf7WdM77TJrjHLrXBRemSxTlg7dnpH66bPhFZhmZfWqS
 42u4ZcMN4MprN8mM/xahqh9drsMu4ON6tt1YbtIJo5R5ZFUz9M3Ujvsz0niKimSTZ5kB
 db00LqbESHHiunai3h+T+VhFgCwJX7cr5IIcA2ZMit4/wP6L0Adi/jItAL/HNaLDkeCD
 JmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1DnbR7KQTC+x6ysScZJbOrppJZcpcAPm9qgXNyJ5JE=;
 b=QMB4mZwFl8EfdH4Ut4zrgshPQQF1DPGi8ueNaYAwkOpaCKf6/Sk+B3CTBbRegZkB/e
 70UPim+LawGyqZm1mQdmvm98E67A0i0PjruKcPhxWjWnTrvq0O7IkfAN42vqZnxAh/85
 3esYZLZasjpouEFfWjF1WrU+6v6bWE0gf/w5hiQ8t38QQkB64QMgQsP7qaXhhvumSdbb
 ELi/d679L+g6BJjaqgvWAqPgVk7cVDykrhj7oIM9J9vLRJzjWdOLuPrZe4iHHZl6Bhhk
 Qern/ejwkiaDtfFZHdFBMRP4dhnjZmt3GGZlcA0O7mYgMQs3B9h59ErnAh72Fteus7ku
 kFsQ==
X-Gm-Message-State: AO0yUKXrLyTJWA6D8XMFCAWdMNZPislMnxQ8FdmqSi0kAEH+29j0bldu
 4E7XQthVP1f1HdRITSobhetWqZtoazhiuZDkN3s=
X-Google-Smtp-Source: AK7set8745t4jvIGFRq2ztXm3dnvw9MpW0PD7bi5nAsC3DdgkYbl/MIbl7+nmbDaUYsYx1NcScV+uA==
X-Received: by 2002:a17:902:cf0e:b0:19e:2495:20e0 with SMTP id
 i14-20020a170902cf0e00b0019e249520e0mr2645011plg.21.1678477977728; 
 Fri, 10 Mar 2023 11:52:57 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 5/7] *: Add missing includes of qemu/plugin.h
Date: Fri, 10 Mar 2023 11:52:50 -0800
Message-Id: <20230310195252.210956-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

This had been pulled in from hw/core/cpu.h,
but that will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 1 +
 cpu.c                       | 1 +
 linux-user/exit.c           | 1 +
 linux-user/syscall.c        | 1 +
 4 files changed, 4 insertions(+)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 176ea57281..e7962c9348 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "qemu/plugin.h"
 
 bool tcg_allowed;
 
diff --git a/cpu.c b/cpu.c
index 567b23af46..849bac062c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -42,6 +42,7 @@
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
+#include "qemu/plugin.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
diff --git a/linux-user/exit.c b/linux-user/exit.c
index fd49d76f45..3017d28a3c 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -21,6 +21,7 @@
 #include "gdbstub/syscalls.h"
 #include "qemu.h"
 #include "user-internals.h"
+#include "qemu/plugin.h"
 #ifdef CONFIG_GPROF
 #include <sys/gmon.h>
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a6c426d73c..38f3f5f784 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -22,6 +22,7 @@
 #include "qemu/path.h"
 #include "qemu/memfd.h"
 #include "qemu/queue.h"
+#include "qemu/plugin.h"
 #include <elf.h>
 #include <endian.h>
 #include <grp.h>
-- 
2.34.1


