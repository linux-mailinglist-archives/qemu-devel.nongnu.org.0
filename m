Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C66A8F83
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:00:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvch-0007Qv-Li; Thu, 02 Mar 2023 21:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcZ-0007P9-Iq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcY-0001lc-2t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:11 -0500
Received: by mail-pj1-x102c.google.com with SMTP id l1so1173378pjt.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEtYCrcrznZmhowtmX9YimePEBwlx4D0eZxGxnMge0Q=;
 b=laxhOAuFtXBcu0sBUJuq2dfEL2+Obz/NrMQk961r+Lee8PZj0qEv0vI/gqs45oQckg
 d3z2b4e/TbNXtGh4/N9ZNnpAr5KviD5crFxNX4l04WYVYM0Ko0NbGtBi864/TRgMbnCW
 FpX/3yO7qEr6Qn56szPTPaGV3yhefCe7pI53eCJ+LVm4ewTgnNc3Mfawp4XekAXMVABR
 kZ3MBQVcoWzNEsS5i1QuU97oeDarjSlivtyUuVe4i2W3895wuWBZEQC3urt3a/RHmlGh
 bDUrTt6NDIpNLItQs0tRiKbvSkGZ14byQ4oFuEQLOoisqfVadGaQwlCsVdNFRxu/19aZ
 4Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEtYCrcrznZmhowtmX9YimePEBwlx4D0eZxGxnMge0Q=;
 b=vtum7JNweegHi70FYMCoUwh67xO5XOMK6PYmKO8B7Cphb+S9moOq/BBejQrpnJapLg
 7gmD5IvLcWeKbK5L+Un4ar4q7uP7R/nY6UyZ8UfY91yaDAc3d2HhZeZwYsZwNJk41XRg
 r7vQHWFyCKcWsjYF3+iqPSuMhqBUYtLA1hdtb5pBAt4olDA94o0TsMBZL+aOiQbEmWp2
 Oef6MA4pqDDhMTfCYaZVeiBn9ozdY1eGAgB3z3rcyWPZGWSY8nUeHtxBEYr2HRUFXj/7
 Vgl95ukvwjZ0MYE1Shn5XaKQeZD+ssZSsvcHIHbxvd3d5eWY9EhEHUg9iSZ9GJEy1QhX
 Ys5Q==
X-Gm-Message-State: AO0yUKWVmXbcfnVNtwu/di2/cxVy3D+CxKidc2zHj8wDgmJkf/jgK564
 Dkj1Qiv8V7L7hwF8IcrhYKAcaDEyBsMsQL4tDsM=
X-Google-Smtp-Source: AK7set9QQ+ofmEVOCEPBvLwMPz0YLU3amDxVytiaTUZP4Ib3pz5dSpKOJKvr5YUQ5Xu/JqnG7X++Fg==
X-Received: by 2002:a17:903:228b:b0:19c:bae2:681a with SMTP id
 b11-20020a170903228b00b0019cbae2681amr448690plh.66.1677812288352; 
 Thu, 02 Mar 2023 18:58:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 01/29] gdbstub/internals.h: clean up include guard
Date: Thu,  2 Mar 2023 18:57:37 -0800
Message-Id: <20230303025805.625589-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

Use something more specific to avoid name clashes.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-2-alex.bennee@linaro.org>
---
 gdbstub/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index b23999f951..7df0e11c47 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 #include "exec/cpu-common.h"
 
@@ -16,4 +16,4 @@ int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.34.1


