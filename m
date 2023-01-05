Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983A65F18C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMh-0001N8-0C; Thu, 05 Jan 2023 11:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM8-0000gy-60
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM6-0007Nm-Dx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1776850wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XPcxKKzTJ6CHZqkcMut7l6klmMKuAhMpUuRA99yE0PE=;
 b=QsVOLQ3jAvt9Pl3+gohNKc7T/bgDaJ5gOreLDIqwXsCiI7k2OSoBmmS3Q4SVr8ECvr
 1inzxLdmFaAIghzio3ebO1TbFa9T1ORtksTQyXj4ru6D9dCNAgUZyd1xCyLnN5eQP6zJ
 TjFFfi78jkYguTRn+CQ/i0VQBN0k3KyKilNW3tabqrH/mtjZcUQgcYJbebBz9gKieG+6
 beIg6P7Fp3OyBLP8ImsayGr+v7AEXvnJEhHe6p5Acd0DnhlZ2aX9sUJFWe26z149ov2M
 B2VEXuZ2I6iPrBlD05re99FvX6iyjzRH4RQM+QOjZ55NcGZfEUt1YkD7EBW5XvNcrgou
 II5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPcxKKzTJ6CHZqkcMut7l6klmMKuAhMpUuRA99yE0PE=;
 b=H95xgUFVEgoiIHioVmyhUTZXSEPc9Tz3bQoa2Qf2eHgdP7XZY8CHgipbISUJaCwBHI
 SKvSNjloYzaplJkp7XHFlkeCIfsFxOg/SJFHyey+ysv8z4MB7xfffr8heuLr9PG3iJ0K
 ea9oDOgxEdsVY/WxQMDhZ/kJkEKtPCcE9dArWQHEjCs0oOp+tv5FPfeWUsuQx+NLxC1f
 3bdgcXh5NWr2udEcfIYAvCg5oWi5ZhiWk4Fr3eqlbaPCk2WT+G1tbIca5q9czwVIUtdI
 RY0VWiRGK/T6FUhaVIYtHx7c9OzM2BQPcMDzq4a6d051G6unzZqKsCkKnIXlpvVM0KCa
 jdEA==
X-Gm-Message-State: AFqh2ko3BpfWtlfqTB4j7G/wq84L+w0FwQEFWpgrUXMi5ukX3SZraqoV
 J5goAjg+iGdGVTNqz/NRTOv9mPHwEjYan2DC
X-Google-Smtp-Source: AMrXdXt5S412HOxr7cLj4OuEuXr8fPHt8bDKI2NOTAOwn6kJVgG7sQpaDyog+dYGG8/St076oIrBDA==
X-Received: by 2002:a05:600c:4e08:b0:3d2:139e:f64f with SMTP id
 b8-20020a05600c4e0800b003d2139ef64fmr39089601wmq.40.1672937077838; 
 Thu, 05 Jan 2023 08:44:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/34] target/arm: Remove unused includes from helper.c
Date: Thu,  5 Jan 2023 16:44:05 +0000
Message-Id: <20230105164417.3994639-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Fabiano Rosas <farosas@suse.de>

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20221213190537.511-6-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5d8971aa51e..d3e8e606475 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7,13 +7,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
 #include "qemu/log.h"
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
@@ -22,17 +20,12 @@
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/irq.h"
-#include "semihosting/semihost.h"
-#include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
-#include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
-#include "arm_ldst.h"
-#include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
-- 
2.25.1


