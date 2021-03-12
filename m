Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBA338F31
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:54:36 +0100 (CET)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiFP-0004lt-Vj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCu-0002mK-1s
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCg-0001vF-E3
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e9so1816391wrw.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Cxy5kE0XNvFPwMzhDlEv7f+ogAIeq+g64WrdWOpTyMw=;
 b=kmeOwK5XJwsjmpt6GSxLjfPzUQMgWKK5yqhrkx7EmEIejPtlWahMHqBmckx3rlqVfs
 tXkDWTh22SYQTlyw0fP+FG6EZF71g6XzE5zpooIjCWW1PgYlz/Apy2t4YBhASfnSk3Za
 tthdQGoGy6M8eGDejVeTUuxsjRKcan2fmJ6RpZz4r6PNhZ6AhuwopshS5JKWF3zUMWbc
 yy0pHSsKEj9PXhB3r6upoJD43/dOa/Ppw8/luVoreYDv1B3J+gqn5Ur5SGJ42iAsufrs
 iRFMP+5IaVfMioDnIhncBim+Dmgi21SiKRspD2O1eQHZlZed2i/SUuy2NO/xGns3/7Fy
 5+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cxy5kE0XNvFPwMzhDlEv7f+ogAIeq+g64WrdWOpTyMw=;
 b=FZDRUuSbs1+4lix735BrBAWr4f7hQhDSgO3VtqwQ4I9UipXSUOC/CaOH367a13QLe3
 hIsYumaDTPT30VWVacTfqGtO6lLupOxAJq7y1Q9JgjAxTTVXn9MrpHmZav8lUlJP5sJ0
 dznQuxPQUzWgxSEbAsqulen3Dbnr89TJ8p05Ld9F4d13UbKwGy6RWEuryMm1jClRQ+Gc
 8NfIQkgTHVGyGMOYIVKB1t06ZCmXR5maYhk4OwYSFR5DzYH+rxE0lYiqQr/+JTJmioAc
 RVcJfna4Caepy7IASVAwoXjM/+K6Dbe6tY79HxYpP6xq8pYzCD3/JnT9j6EOC6XZgb8U
 /vbw==
X-Gm-Message-State: AOAM532oF3lGoB6cNXAhKCygSE26rpu3rXoLr8YsqFga5Th2/Z+Y+alP
 a5Gqg4cJFiY+2QE+0nlf+Xveee9fVKpfNy1g
X-Google-Smtp-Source: ABdhPJxnWTOh3hfcKEUjWe0cPMa58wMsjAO3MOTrHWzcNmcbJS818WAdJfeEhjZUWt17yqo4CZvEQg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr14586413wrw.235.1615557105085; 
 Fri, 12 Mar 2021 05:51:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/39] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
Date: Fri, 12 Mar 2021 13:51:04 +0000
Message-Id: <20210312135140.1099-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

With -Werror=maybe-uninitialized configuration we get
../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
 1888 |     mask = ~mask;
      |     ~~~~~^~~~~~~

Add a g_assert_not_reached() to avoid the error.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210309102742.30442-2-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/intel_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b4f5094259e..3206f379f8b 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1884,6 +1884,8 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
     case 3:
         mask = 7;   /* Mask bit 2:0 in the SID field */
         break;
+    default:
+        g_assert_not_reached();
     }
     mask = ~mask;
 
-- 
2.20.1


