Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794432704C
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 06:08:41 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGEJs-0005JZ-97
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 00:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEHd-00041N-S3; Sun, 28 Feb 2021 00:06:21 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEHc-00054z-DE; Sun, 28 Feb 2021 00:06:21 -0500
Received: by mail-pl1-x629.google.com with SMTP id ba1so7581650plb.1;
 Sat, 27 Feb 2021 21:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gbeFzvOCg2FfLYNNXxmrU/VInuwmU84mD73YK7KoSwo=;
 b=Pk629juDU1WulXygQh1/wwYJum+0dyF97p1zioD/+0gjtr8LYBpIB6rgHKIICl7WVP
 L6EhsC7fjIgWI9hAbZdMFBf9RILT7fFMYr7/fLEjG4k/jw3tVGY6VNzNSbwbDdAbXmPt
 DT4wqR+pkpMxI/Wq9+EXweNdGFdWpC/zybRTsR99PntdDVpiKoyisO2+YElzNSKwSlQO
 vcYoFFkBXvCxl28ksJrQ1N02cD7sNdPNP30S8q0pQn9gDs7vBSRWL9bhC5guHcIlxtzY
 QLzUy+GZgXRCarWP6Dum43H1ulOqF6Z4d6BTFAuUXWu191CL7gbqjCcPNklkZUQXgmkV
 JtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gbeFzvOCg2FfLYNNXxmrU/VInuwmU84mD73YK7KoSwo=;
 b=PouzQXQCal0O+o1KW2pYNARUEiMplSG3QTnddkVfP+hSStfh2t5OcACSWQBl8PfBmw
 HVNX8m/ntYhiONLxqeudCmOVCwaWpUti02i3OcnTyt8sBxgdyKVAJgkH7dZZdvga/6HO
 8tod6HQhz1Ob2zC8+z0BfQRKhCxd4KOzXeML4m+ZJlZCjpwAb/7Je6bd3kcyyKbsvqJy
 u8Ti1E4x0q0NHrYPDr6+5ug4fVhLpfEFH74XwKNGcYVbPW7Qivz8xt3MZ7PXs8tDtZl+
 A+r6z5nvleYbE6rZUvnjYQV2k9zscVZIlnc6Py98TEN3Swrv3LIDncCmUVNwjNaF07ZP
 8iZg==
X-Gm-Message-State: AOAM530KU1hakcqEaqruMcvyEZaLV1FYt2Tp3cGyGBKucRJmYmG96vWv
 R78QVXjdmf9/0p+UZoQy598=
X-Google-Smtp-Source: ABdhPJwQfimLmek5tczCtIhOl0E+LaUD2180Wy4Eiddsx4lbGsdThu+12tkHcCOt9F0KQWMp/vWTUw==
X-Received: by 2002:a17:90a:4104:: with SMTP id
 u4mr1551900pjf.81.1614488778519; 
 Sat, 27 Feb 2021 21:06:18 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d75sm11097736pfd.20.2021.02.27.21.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 21:06:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/sd: sd: Fix build error when DEBUG_SD is on
Date: Sun, 28 Feb 2021 13:06:09 +0800
Message-Id: <20210228050609.24779-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

"qemu-common.h" should be included to provide the forward declaration
of qemu_hexdump() when DEBUG_SD is on.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8b397effbc..7b09ce9c2e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -47,6 +47,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu-common.h"
 #include "sdmmc-internal.h"
 #include "trace.h"
 
-- 
2.25.1


