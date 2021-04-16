Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2CF36218F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 15:58:49 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXOzg-0002GL-8w
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 09:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwp-0007JC-Rg
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwl-0004wI-55
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id c15so17848066wro.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtdhNpA3BF6tCi5f8+toaQnoZ0KKS5XaxPZHuzEnrl4=;
 b=P9VOfuYyJmKNvk18yqus4V1OwdIgZNFmHm8gnFI6iJAL9cNoHm53IChpbseJlV/C/w
 vTOEkgFnay3gcS/WN9LYJgUF781tX7NQsqqWNybPYQN964fZ6/rNDvKVdRQhCIu56kNV
 6iAEBFVmDb6tP1KoOx3DhKlXRaQpb2thMWbF0AL+r9A5jy+eiphVmoRu00ZzawSEiNo3
 Dbu/tzSlq+mrxdM7M7Y1DdGHcT4slDVa0QLBK29V1uewnHXOKecZBkMh1WTUCbxklrM0
 41YqQpIwhEz+bqYeHikBg96ldjfBtp0de4moluwpTj5cw+qyEDQ/oxFfDdzHio+eqlnQ
 IxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtdhNpA3BF6tCi5f8+toaQnoZ0KKS5XaxPZHuzEnrl4=;
 b=S/NhQTccj/lccQLoqHZKCn5qNcIWnIQjU6HkeaES5RpsMAM781oJk0FtONddTMt14p
 sEdI9UtOgYLySks0gpuEPDcP/XMrJaeC5shCKPYw+fnFqXHSXOTS25qcXkddFpUYg6TO
 IAQyc4vCu0YV8+9yGtxVtm2YMVmYjo83EwzHLqrgNPMMBbYGR6UWc4mgknwudjKcQ3Ba
 BfJIvV4xel02FqNkWkklrPbRS1Swk+km0AK7Fd0QTW7S/Q6cYAE2T454TyfXiXo5hASc
 bOb7uAgTvH1mUtEVmqu8ex65QibFeKRzvv2zTYhmpaMWFG8Ls8ZGiUrC+Kin9cDAV3kN
 89Ww==
X-Gm-Message-State: AOAM531ZowWJ4aTdWG+4jkBMYMVmH+ek6c665I2KzN5oJQT1lAF3scl/
 8QMYqIFGbgbgjs7bzAqTxS/sFN9fpAQetqaa
X-Google-Smtp-Source: ABdhPJxWrU3bFZ9rYmBoIluAaxzB7KoxN3G2ik9nKHB68114wyVEcckPC3+N24B4ewzu/nA4O5fZRw==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr9187543wrt.60.1618581345806; 
 Fri, 16 Apr 2021 06:55:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 1/6] osdep: include glib-compat.h before other QEMU
 headers
Date: Fri, 16 Apr 2021 14:55:38 +0100
Message-Id: <20210416135543.20382-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

glib-compat.h is sort of like a system header, and it needs to include
system headers (glib.h) that may dislike being included under
'extern "C"'.  Move it right after all system headers and before
all other QEMU headers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: Added comment about why glib-compat.h is special]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/osdep.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c569..ab84ecc7c1c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -111,6 +111,13 @@ extern int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+/*
+ * This is somewhat like a system header; it must be outside any extern "C"
+ * block because it includes system headers itself, including glib.h,
+ * which will not compile if inside an extern "C" block.
+ */
+#include "glib-compat.h"
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -123,7 +130,6 @@ extern int daemon(int, int);
 #include <AvailabilityMacros.h>
 #endif
 
-#include "glib-compat.h"
 #include "qemu/typedefs.h"
 
 /*
-- 
2.20.1


