Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D26A3F80
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaoq-0000Fy-57; Mon, 27 Feb 2023 05:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWaog-0000DE-1N
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:33:10 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWaoe-00018t-HB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:33:09 -0500
Received: by mail-wr1-x431.google.com with SMTP id l1so2598396wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2nY1zTRPRbQEspGXz7N1tgrBvNRnVFL1fwTqdC9gz0=;
 b=KecM5klwA4HxneGKxtXGaoqfmfrgiqzjeNtQD6NlFoIBNcBvJCaO8qJyl+0UNRlhmP
 8SvCs1zHuiBlyuwibevl2ph7xVangeWmViftr3NXwoWpERD9HaemzjudoJOKA07xIxG4
 bOlzfjdKaN0lzKRkpafLTRtGi7nR072TaobhuGxzVvhNfSdCV3YXEt1rBh9iRQmeqYTQ
 4YAYaxwT8viwb3+EyDI+qob2f72CBDB46HMYXJi9m6u0zPo6//9D1hvyMWlVWUtfwxnH
 g0PEF7jJ/jgjbQb2F3y8B6tdgJbObQ5rbaE9oXgPYLZXoH5lv43JT4fTr/U/NJ4u+q2Z
 /v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2nY1zTRPRbQEspGXz7N1tgrBvNRnVFL1fwTqdC9gz0=;
 b=Q4KgChNJwJBs7uN5lpxbYPErBKxnR8/ooMM2y2P0W8LWfqSpUxbZCimYJMAHiJGZ0Q
 VKuyhR2e2QpNRL5tIUdh91CWXWYQUiVwXueJXoWbJIT60MlBEB3Ltx6CVwX6gDc0q/3u
 aWHKzvKWcynJ6MJSsYJVJD2GE0fTWknAFLLZr9txFSnrHGh29p93Oj5oCLM67OLh+GoE
 HYojwCMHjtadjSeZziIDLyMg/vanv4xjoJjhdQeanW86QwlEt6RWiU4XcKQKDxInOn3Z
 5/ZnwS/7EVrPCTxvmGHB+RqD3waDC56z4EZ/qzc6B71UYRekDo5jpHOlm8xTJD5I09hH
 y3vA==
X-Gm-Message-State: AO0yUKU9D1i3/sT10AXYaJbean4hZnCvyfygq4IRew5FB/IMdXxO2G4u
 SvYeTenqEtB+1vKGCn+E24CL8c2pjaY8Z6au
X-Google-Smtp-Source: AK7set8kTAR3iq6i+5NThlSnOi/fEVWDeziAj+eISzunJpONSZGJn84ZoBGm8gCJYspuZvS414jd5A==
X-Received: by 2002:a5d:56c9:0:b0:2c8:7750:1769 with SMTP id
 m9-20020a5d56c9000000b002c877501769mr6926294wrw.68.1677493986792; 
 Mon, 27 Feb 2023 02:33:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056000104b00b002be0b1e556esm6582568wrx.59.2023.02.27.02.33.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 02:33:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h' header
Date: Mon, 27 Feb 2023 11:32:57 +0100
Message-Id: <20230227103258.13295-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227103258.13295-1-philmd@linaro.org>
References: <20230227103258.13295-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/migration.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a2c3d9bade..f9ac074c63 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -24,7 +24,6 @@
 #include "migration/misc.h"
 #include "qapi/error.h"
 #include "exec/ramlist.h"
-#include "exec/ram_addr.h"
 #include "pci.h"
 #include "trace.h"
 #include "hw/hw.h"
-- 
2.38.1


