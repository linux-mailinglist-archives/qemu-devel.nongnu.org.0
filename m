Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D4D6B2E19
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWp-0004V1-AP; Thu, 09 Mar 2023 15:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWo-0004Un-2D
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWm-0000mk-Fj
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:17 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so3016036pjz.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrO4dlYUJFEzJH9DlikJXAcAZ+eRmst5Rd47HXpMFxk=;
 b=lQvmzJNUbioq3Fo5pb4raLTPVU9NX7Q6WNsRDNxEhwplPl6n0rhaquuclrtlLq+l+l
 Z90uBLZdiH3LJyPhDOj5L81MHhD/Vh3tUC/ofKYUpaUNlc7CpS/tJ0izp4gdKcjK08Yv
 pxJpgTPQIBsKVywaFqWvTNaylA9BEX8Qn6TQeMaPErBb9//yGp9N7769AYs+Bh8Z4Vyn
 YQi6TY6fDbEkBAw5DTIGwORejtEvbGUvf8OEkNKIodueqxsKiOSj10E2HXgnZtLSeUkP
 cEFOaK5Q2B21zD0/r7gw9XHyi0NMnL5hpIpP67OcYBiWsl+VsnaCI3DVifE9rwAujA5l
 v6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrO4dlYUJFEzJH9DlikJXAcAZ+eRmst5Rd47HXpMFxk=;
 b=hvutC4rSdPiXcYrenbcVuHzCBcFSyYKNRebw9YUWmR0/YKw105fmGmFbRNL3wepO1Q
 NWZ42JE8+Yv8rey3t8ODXqzu5ij+vICS0fAiP9L2KV2u85jPmRAIUx/qlIZWGmkTzWL/
 7vvL30cnuiD2xA+hjAw4OZX7ZsMYwUlW/WaCbfuG1TukCGSsc+j1jiV8hKTm0QW+r2cp
 W9RpkYlgyBWlNdDB57JlVkNfGcgiH9qu6WhXGpZL1fC9JPV9p7O8EdKy+/78lJ8iov9D
 kJ5BCJvQPa8P/bsxqxZ6LQRSv7LsJdwpO5BoCaHKGMsnzBEnWJ6nixnx+N3CprPjQAwy
 YElg==
X-Gm-Message-State: AO0yUKVkVxr+uO7imreFhyRUYArteViFQNJbsLcWNWa4zaTBJldznl6q
 oBW5ZmykVzcfekLLuisvLRy2dyXVCWThx1QdfH0=
X-Google-Smtp-Source: AK7set+zsRu0m3+V6EFFJWMwux71Jl4vdUTW6ygc+Kv7flZw7kpu/i/sU5e6YkKOQMel9PlzgD8j9Q==
X-Received: by 2002:a17:90b:1c07:b0:233:d91e:e651 with SMTP id
 oc7-20020a17090b1c0700b00233d91ee651mr24040141pjb.23.1678392375162; 
 Thu, 09 Mar 2023 12:06:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 26/91] target/microblaze: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:45 -0800
Message-Id: <20230309200550.3878088-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-12-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu-param.h | 1 -
 target/microblaze/cpu.h       | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/microblaze/cpu-param.h b/target/microblaze/cpu-param.h
index 5e54ea0108..9770b0eb52 100644
--- a/target/microblaze/cpu-param.h
+++ b/target/microblaze/cpu-param.h
@@ -28,6 +28,5 @@
 
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 3
 
 #endif
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index f66df02226..88324d0bc1 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -394,7 +394,7 @@ void mb_tcg_init(void);
 #define MMU_NOMMU_IDX   0
 #define MMU_KERNEL_IDX  1
 #define MMU_USER_IDX    2
-/* See NB_MMU_MODES further up the file.  */
+/* See NB_MMU_MODES in cpu-defs.h. */
 
 #include "exec/cpu-all.h"
 
-- 
2.34.1


