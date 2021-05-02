Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB5370FCE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:28:33 +0200 (CEST)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLVo-0003u9-DW
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMm-0008NV-5e
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMg-0002zG-8X
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:10 -0400
Received: by mail-pj1-x1030.google.com with SMTP id p17so2049317pjz.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j2oZWIWZW+wm4CMCfiCPmwaL+UY6rp5UnrdyXg3UtJs=;
 b=r/jvyBpzEOR249ESHxv2Gd/SQK0aEfncSClqJrIJWUSsE8q0I5ANwrg0L7gNomdZDa
 MME8dmO4aQbQtlqQpWnG5DJOCFHzGyQ7DUBwZinMQPRfZc1jLu/xNohDLheJ5TtB9Z+T
 0EyHPSzrVWeHNGsphAgF5H+lVItGhtjcQl0eedPIq0Qn8p6GPySZLFN9QA82vEuqFwWx
 lp/pXvsJXJlvLe+mfSk7qYyGscF0X+kz1eXAEjYGgaeenodjWr9DYqZsd7LDb6tsGhQP
 qYD6XZYlBahhb5RoicHBeM1h9Q1xsbsoIklBfZ/J29kiBZ7ftLOvidqmiKrgsCLklJst
 Wqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2oZWIWZW+wm4CMCfiCPmwaL+UY6rp5UnrdyXg3UtJs=;
 b=FGqJjdeuD7W1dSjlMY3tvOoqsoKA0AKnZY1xofLoWxKtUn5WfUQOIQHrV2GdLXR56f
 yEaHj11a8t4R5ly+gHUmnvMKvHMliq38kXLDP94XkonwGSX4Wp40NQ8Vc/GEh+tmLwdr
 tHgub1CUY6I3hTq0pt59ZtuqLsSMXlkp525ZDgJ9ZlwudIZxxKOD/Dx1L2W6AZ3HeT7t
 FHcLJRDy6Z91EIDkGVN+GMBC6oES18X2kpO2lhgBCgX59VKQnNUAubLCrjaeHUGVL/5B
 NxeILoI/Eog0sXzdEU3cOVhAep1lZH8mvm4/CqKpXKH2Y7Z38b12bspmNev+HOnyuKdF
 4r6w==
X-Gm-Message-State: AOAM530xuB0Cksostaoid3qwZ4WCGoQz6UdvDLosspUm3h5EXSBZDEU5
 hdaigFBx7t9VtwsF2KgPuSRD24hOFKc1Hw==
X-Google-Smtp-Source: ABdhPJx2tuxG2P0LxVNIWxoL7hoYFvmfJQZDCXHXAARRImU8uhOafsTveIxp0sR8o/DVo1v+eOFhSQ==
X-Received: by 2002:a17:90a:cc0b:: with SMTP id
 b11mr18020529pju.190.1619997543920; 
 Sun, 02 May 2021 16:19:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/28] util/osdep: Add qemu_mprotect_rw
Date: Sun,  2 May 2021 16:18:40 -0700
Message-Id: <20210502231844.1977630-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For --enable-tcg-interpreter on Windows, we will need this.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 1 +
 util/osdep.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index cb2a07e472..c4a675b9a3 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -512,6 +512,7 @@ void sigaction_invoke(struct sigaction *action,
 #endif
 
 int qemu_madvise(void *addr, size_t len, int advice);
+int qemu_mprotect_rw(void *addr, size_t size);
 int qemu_mprotect_rwx(void *addr, size_t size);
 int qemu_mprotect_none(void *addr, size_t size);
 
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..42a0a4986a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -97,6 +97,15 @@ static int qemu_mprotect__osdep(void *addr, size_t size, int prot)
 #endif
 }
 
+int qemu_mprotect_rw(void *addr, size_t size)
+{
+#ifdef _WIN32
+    return qemu_mprotect__osdep(addr, size, PAGE_READWRITE);
+#else
+    return qemu_mprotect__osdep(addr, size, PROT_READ | PROT_WRITE);
+#endif
+}
+
 int qemu_mprotect_rwx(void *addr, size_t size)
 {
 #ifdef _WIN32
-- 
2.25.1


