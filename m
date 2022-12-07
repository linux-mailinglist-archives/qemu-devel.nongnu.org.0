Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126764607E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 18:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yQX-0004gj-A6; Wed, 07 Dec 2022 12:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQV-0004dt-F0
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQT-0001ol-Qn
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1616381wmo.1
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 09:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5B6vDbFr2pk0CR4IzEviq/2sUbcV4f8oxGB7SYBHu8=;
 b=dvBcbiDFNmEiNHSYU0n7hzKF+tbxKOmppgPgU7/uN5amTMB+ea3Yug/IeP6T6IqcW0
 1tC6uw++qALtsXpAxfoFERdQ/Pt7XBkpXg9woogM0YDjdjVTKaFqsSLfr0W9gKPld4ed
 vtDIlPCSK3Ftvp87Jq0RZr1Zyttc62GUm6Nobu6SRGxm1hIIZ57Xmd/z12QNISMUsyF4
 RiwfkPUBeW/5Y00u8GUJKcZVJ1U4XOAmLmlO870D1lOGNiHNY0MC4qh45j4jT55/ggy8
 pWM98HPBwJMq7abRlgKFN9EvRh6PVtDdtuRE0XOFxv4ziGRfa0svKv8lVthnI3yQAbwS
 i7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5B6vDbFr2pk0CR4IzEviq/2sUbcV4f8oxGB7SYBHu8=;
 b=tIxZN1yAilcWVE7NiaB/7MfPkMy7S2RbxkSS5YNvbvCX7xLNPCrZhM+qqc+TFq+TAO
 LOPLJ7J+/15LhmpwFfwtrfT2Exyb8ajWCrzV+VRqd1ziF6/ozUEtGXmZI6H8zrdvZm2i
 KQK+NmHFBoJx78PblgtxQtnN6Fe7+8wAv7DR6kGINKhtxhyrb2YNTTNRkOhjVN8168st
 HUIB//ptfnLXLnPbNOiEr0PowNM492jMGrTETnS69Oqsw7VCu7KH9PNvTXxxYJd4LyNd
 7bGVtDufXOKLmG3ZRo5jfSeknKhfZe9orpihDLtYCs2uJbzvvcRAQxaHtDKoW7c1A5eH
 AaoQ==
X-Gm-Message-State: ANoB5pl69yd+P8+SZGKd4dTBtPJibPBtY1+ijc6DsV1x0tmj4Oy77L4S
 0nkzrh67rJeMMUeqhGmtsX8WFSOLJqJZ890q4gU=
X-Google-Smtp-Source: AA0mqf4i/t38pK4+O+hAvlPNuUNdfqhbD/+a4JcLmYEN4Rj28AOjOkxueP0TxC3YcuUxno4mWmb+JQ==
X-Received: by 2002:a7b:ce0e:0:b0:3d1:cae5:efe9 with SMTP id
 m14-20020a7bce0e000000b003d1cae5efe9mr10723461wmc.158.1670434904326; 
 Wed, 07 Dec 2022 09:41:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c3b9400b003cfd10a33afsm2846992wms.11.2022.12.07.09.41.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Dec 2022 09:41:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
Date: Wed,  7 Dec 2022 18:41:27 +0100
Message-Id: <20221207174129.77593-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207174129.77593-1-philmd@linaro.org>
References: <20221207174129.77593-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Both insert/remove_breakpoint() handlers are used in system and
user emulation. We can not use the 'hwaddr' type on user emulation,
we have to use 'vaddr' which is defined as "wide enough to contain
any #target_ulong virtual address".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 gdbstub/internals.h        | 6 ++++--
 include/sysemu/accel-ops.h | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b23999f951 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -9,9 +9,11 @@
 #ifndef _INTERNALS_H_
 #define _INTERNALS_H_
 
+#include "exec/cpu-common.h"
+
 bool gdb_supports_guest_debug(void);
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
 #endif /* _INTERNALS_H_ */
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 8cc7996def..30690c71bd 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -10,7 +10,7 @@
 #ifndef ACCEL_OPS_H
 #define ACCEL_OPS_H
 
-#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
 #include "qom/object.h"
 
 #define ACCEL_OPS_SUFFIX "-ops"
@@ -48,8 +48,8 @@ struct AccelOpsClass {
 
     /* gdbstub hooks */
     bool (*supports_guest_debug)(void);
-    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
-    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
+    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
+    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     void (*remove_all_breakpoints)(CPUState *cpu);
 };
 
-- 
2.38.1


