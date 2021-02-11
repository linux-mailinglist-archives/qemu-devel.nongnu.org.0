Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A51318C11
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:31:54 +0100 (CET)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC4X-0004Vf-Cr
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ1-0008A1-1e
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:19 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYw-0008Q4-L1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id 190so5475451wmz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DCszVGUp3iayThJPWT9pda+ZcUuou8eH26qHc7GyT0A=;
 b=jtu8C/ANWsLvM4OemxJadzfYWfZS/rY26KL+zdqAsqBhFQRhhL8XrkPpFqCDd/cUqK
 KjP5jzS/h9Rwsj94Wnw1An20qfHhHfouM+H63lFxZnEKidT9KIzSv1Y6mVbnuHCa5cYL
 4iMvHFoH2lwA8DOOY4Atp1pEiT4GyF6rB66uQbB89seHGeiLZakbVToA21SXkrLXqmZ6
 yojqLqjBGLY4wA51INtMPAfws8rVBKlt1fNONyKwXOz+txOpNiCzcPHicNAlFgtvm7op
 V32D6TF7GasdgHi4Aq2qqeaaUkFAy41WDJKVoTTI/SLJvWrolOpQtqYsEjQjmuJGfUgb
 erxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DCszVGUp3iayThJPWT9pda+ZcUuou8eH26qHc7GyT0A=;
 b=hk6r09wjHax+WXwnuBYHSUKqqGmSKYWnTUqDkA6TED66Vlhgb6+X33cymkfj6YSITn
 mFIK2c3THA7+KOQg2/vNq7q2QdT22K4Q46sAkMCx63aUf0hbjDnT3abbEOS3xsqy/8ic
 fOdHFVW6gUJvvhQitv0QqXN/DXQvfRw4mbvKQjD0rXH4F90DpmgkVM++5tt/y/2IupKm
 ty9RkZ9Y5cCazLjhn/lnMnOhJmS0CBROjkGDDXNz6ckhMYyNijGe2N8dBgXEVwjSqYcd
 M0hBcYsq7dry24nPcpt3YIQ6edOZmJrKj9Mzu8mtwgfkH1SdfEeLx3UE79VPSPll1DVF
 igKg==
X-Gm-Message-State: AOAM532Fba2x+JHjZRRY9Exwc6TT7iRvNw8OYoQYXZHUeAbfvWbnSUPP
 B5iMNWwRQYDNPY+AT7RMM6vXy0j//4ZMAQ==
X-Google-Smtp-Source: ABdhPJz7zgP2CHNOYX8OV2+atBFhLOSlxbEnJTGtWJkZYsoi/Vwi4IxVLHnYOeH4dNRDHl/3YtPOww==
X-Received: by 2002:a1c:720b:: with SMTP id n11mr5180014wmc.154.1613048353390; 
 Thu, 11 Feb 2021 04:59:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/45] exec: Improve types for guest_addr_valid
Date: Thu, 11 Feb 2021 12:58:29 +0000
Message-Id: <20210211125900.22777-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aaded..5e8878ee9b1 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.20.1


