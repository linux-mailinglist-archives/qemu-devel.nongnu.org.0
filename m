Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E15318C19
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:35:13 +0100 (CET)
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC7k-00084D-RW
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ6-0008Gk-JR
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:24 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ3-0008V0-Mt
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:24 -0500
Received: by mail-wr1-x435.google.com with SMTP id u14so4118035wri.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8hJfKWlZ7fO6Xix7TA92xQ2IC7VHBbIlzPjoCjc38sI=;
 b=zJ345KYZOFODnBQMFFox1pGLxWvXURd7EUOYw2+wGYCDz44qdjYzTcItuuqvAnrG8K
 DU8ssq4NtV/NSLRM9vMRUaGSpHgajqI87jljs8lFZlG1/LypLagsuMwhzfceKJLNhUVl
 LfMyh9ZWWPg4mLZR8FUCnZSA1/xJ/3EYb3vHnd0nX67bzZRFGmlvthbCeba8RJvB7dd6
 cm7XMOhps1DZ0LzL/Oc6ec3UqAQsqL0joVsBxyV4++KNSEPvwRL4Yi9NH+rCQgDy8/2H
 ZugSmZmqNQIMcUFyD9N0RImbyANrjOj71AAEDMvq7M5mv0HGgI0b4iOePQx+3nv192Xp
 3h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hJfKWlZ7fO6Xix7TA92xQ2IC7VHBbIlzPjoCjc38sI=;
 b=QnX2rSOanqLq/ETyrl2bZoW3/9afWyXwB2e9coZkpkLKfhxg57ki6hKeAhGEUiY4OQ
 tXixWngf7jo6a8Z+KgyJt1eodMoP8D2zfwChhnHAMfELHeUyYM6SZSdKbcUzRfCirgcv
 mUGYbXfhGMkxW//fVBMJrTh+yJFzG8YQKfQPDVxZ/ITiUm1+OOwq7jpmDoSZYIWNnN9b
 Lb12wdTqZJHsXlyW4ipzBPTv6DN3r9+v4h9lOcYfbTwZz/hr4QI7ZvjZ9p1i1tZzDu/y
 nXhWv8uK7sgRZ2V9P/G8uuitjudjxTkKsoZ00UYzwHYphG3kCa30BUDACYMjC1aiQz2E
 LM3w==
X-Gm-Message-State: AOAM530F/xy9SxyupFTKmeNZnlKPL4HK/F9ioZ3KUH9VNOM9ga1CxIap
 vrAICvyT9AITYqNjFTHSCpNjGlwVlu+IdQ==
X-Google-Smtp-Source: ABdhPJxAdriuBt3lpvTYkW3jhopbF0VnHYwLGoW/Nwfj6rK3HaqsqAjrjmXm5Q3jR/hRXkYMJEB21g==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr5491223wrq.402.1613048360474; 
 Thu, 11 Feb 2021 04:59:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/45] linux-user: Use guest_range_valid in access_ok
Date: Thu, 11 Feb 2021 12:58:38 +0000
Message-Id: <20210211125900.22777-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We're currently open-coding the range check in access_ok;
use guest_range_valid when size != 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9fbc5edc4bd..ba122a79039 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    if (!guest_addr_valid(addr)) {
-        return false;
-    }
-    if (size != 0 &&
-        (addr + size - 1 < addr ||
-         !guest_addr_valid(addr + size - 1))) {
+    if (size == 0
+        ? !guest_addr_valid(addr)
+        : !guest_range_valid(addr, size)) {
         return false;
     }
     return page_check_range((target_ulong)addr, size, type) == 0;
-- 
2.20.1


