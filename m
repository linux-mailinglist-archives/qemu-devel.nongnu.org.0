Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB831CDFA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:27:56 +0100 (CET)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Cd-0003ZG-Dr
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32m-0007x2-Es
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32G-0002PJ-1m
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v1so13778811wrd.6
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6C9LXCdHBjO1xQ9UNLXYukrE+VL/m5JY39MhpMQnyLY=;
 b=elEMITV2ni7ifMHiY099V9zlN5tNnng1zBQiz+CDdI/Jn8mVpxYV7BdMSh4BEoW/hO
 Zstl/pdFVpTbilbUEnxEjRsCz/FuFHTYNPsNUgQq+ukTyPiq5iKSG/Vit7J4/7vhlWGN
 1sZNCWn6CTI3occkzc7NiCCV6FwIR2biM6nmdEJxE+nGwRwNQE2AROedVCAp4KVD8NOk
 LDFDWISZdRk2cpa7LAs1P4W3orYWiaep7VB3/oszlQJVFJY4h7jW6Y7i10XIDqeiiuJ5
 Uzxh4PT07W2wNkx2F2sV5Lpc2/dAxoY3lxYfQvTR9CHzXUqraltRvV1i3rjbC7NPB7Ut
 yjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6C9LXCdHBjO1xQ9UNLXYukrE+VL/m5JY39MhpMQnyLY=;
 b=m+9MHyFuLdgzPS9X7V9hoMENO6yw0jxf4mR0h0MJ5sfQCl6yUxRq77nDV0s4/OlBfT
 lvBsJpBGbydqOdt4MYPzCh2YLYDhJwEkKqIir/Kp3GE3uEH4lj2D7UyNUaq7E7S9A3Ry
 HPq4abFE++BGzXO9xz9x24TsfSsse9yWL3QzvA6BXsWTo8Ve9UfMpG/IeBbKG1BS0BeP
 xw8T+yONjp8Qy3EwovOvJ/sFF9CiYCutn87Tf+au3ELWsaKZYBw9OYivIhre/tfUshGk
 IDxiAYz+Oe7Ea0pvjY9gUIL4Lpypg9tawBCbbnqfNk80Iiexdpqnpo4PBQaUMa2UeGNf
 MU/A==
X-Gm-Message-State: AOAM533tVxUs+REXOag4r5yNkBQQ33OFG9eQ79QpHv+a1VcJQaYQwE05
 47aukdEsvcsuOJEYv/EMauVpfv+meB4T3g==
X-Google-Smtp-Source: ABdhPJzlG7Dzhv8MkteAwCeFr3dm5LWwjXQzlwdysCAIAD07qE+5dUJ1HMGpWKVO+XNgWK0iPyOuMQ==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr24895380wrq.102.1613492230290; 
 Tue, 16 Feb 2021 08:17:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/40] linux-user: Use guest_range_valid in access_ok
Date: Tue, 16 Feb 2021 16:16:32 +0000
Message-Id: <20210216161658.29881-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Message-id: 20210212184902.1251044-15-richard.henderson@linaro.org
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


