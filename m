Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBF3DB798
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:07:12 +0200 (CEST)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QMB-0004BC-Sd
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF9-0008SJ-Ev
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF7-0002Vz-Vr
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so8918874wmh.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuBWBP4vcXuymhCT8y6Q6tBW7TauWFamJhEjeIMDokc=;
 b=mr0j8nUbFHySFwzQZ85dAARv71QqFrxjm7qz/dtn0c5CKLy24RRQW01luQ8ExBytj1
 qM1gGwV07KEVpYcb65rdeO0XwXE/b4Zjv3UFp/8O2yy0vN7mqjfbLHaXlhfEawGiPRD/
 irIOOGfAqTNvFX3RQwukjUgJXhcZEWxFSHgM7kDsIdVbCRKd4B1o3Hkg2enCCSHwOU2N
 RNN0xB+iRwtm5tUgwxmbFMtwWXdIyABowizIdOw9YYoYZI11xDatCjA76nuHSdKgth9b
 ovi58ryAA12aVr9MOG3aTrPJLUK8hKzhRTO3kOQriVbDeu5RW5h1ItLm/JiYnYR8NfgV
 wcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuBWBP4vcXuymhCT8y6Q6tBW7TauWFamJhEjeIMDokc=;
 b=KqGDGC9Ca+ru5ZxsdCWvH14TBZgYsJnlAAVfMgFCkYwvqEj91ec0dLG+K4xkVPzHqD
 Tn73CdkR6Q/nHstv14rjL5JwN/KWfm05hjZLgrzhMvE7uphBAP+g8WA0vxPHdbVN7OaD
 toytuXxnX1msOi+ufMl6fWB6HbOiKZg66P1Ee1JdyMcnqqeSe+NtW9yyPb9RAMvt1q7e
 UvAea9vxSWAbRbGuu4or/85HHS4jDTckTIWa3d0g/XaAhLn6E+FfkwwPLC/G4iJc8R36
 AuS8u+1pt1ItfTLLslLAuyXLwS0+Ym+xf5Yfa9GlMhXO++IeleRvAPu+q0SB7c+ooB6H
 n7ZQ==
X-Gm-Message-State: AOAM532qj7/2iWcvKxrOAvf+eKS6vlZ8+WoIroJLMgcuy0jJYZqRHmqy
 Y/rqrCeKMvh+BcNIHTUKcqqZj3mBz4K0vA==
X-Google-Smtp-Source: ABdhPJz4l9X2CtiNYEpDmUgIisKV9r8/55WkYQ+OPVS6qlKP89J/A76JtK7BOSLmHTN3EePwpQ+tfg==
X-Received: by 2002:a05:600c:c9:: with SMTP id
 u9mr2406848wmm.146.1627642792444; 
 Fri, 30 Jul 2021 03:59:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 3/8] softmmu/arch_init.c: Trim down include list
Date: Fri, 30 Jul 2021 11:59:42 +0100
Message-Id: <20210730105947.28215-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

arch_init.c does very little but has a long list of #include lines.
Remove all the unnecessary ones.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/arch_init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 9011af74e4a..91cbf883e28 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -23,13 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "sysemu/arch_init.h"
-#include "hw/pci/pci.h"
-#include "hw/audio/soundhw.h"
-#include "qapi/error.h"
-#include "qemu/config-file.h"
-#include "qemu/error-report.h"
-#include "hw/acpi/acpi.h"
-#include "qemu/help_option.h"
 
 #ifdef TARGET_SPARC
 int graphic_width = 1024;
-- 
2.20.1


