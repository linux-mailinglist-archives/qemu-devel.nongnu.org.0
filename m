Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D85F4A13
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:04:11 +0200 (CEST)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofo9C-0005h9-LL
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyI-0001jM-Lv
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:54 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyG-0000F3-SK
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:54 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so1954939pjb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pPZ5BGim//7jDbDR7RtfT/BbVdLxSz70QtZLu4dhW0s=;
 b=Nzkdx8wMab2FC3EoOBOi6eRGllfgeMx1ZGIOPQOawZEnNIIL/+N3ZXTCX2MTICzW2w
 IkqV586uT9MYbLN0G1UVQacrg+4CnXO3uINDrVF+Kx7W+TK6Eg5GkVzi7t/QWLt8aEro
 /Ceb8Il+mLSmx32l0COkXdYMl3kGZLNRB26K56gMhmL4k0nJYcg0Hc7g17m1aOuXoUFk
 u4hiRsDSFlwHFkWMN/R726vC60FmcKL4Mlp3GIdyNvVQ2Ulinvxz6Kwh4kOiszOhYt+B
 2M+V4D9x0dxdPsS26QFrUt4E3GicEdbdqrb786++ylENHc7oHxOdZngX/XUJk1TfyTgi
 boFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pPZ5BGim//7jDbDR7RtfT/BbVdLxSz70QtZLu4dhW0s=;
 b=hrxMCocgjeq6lP/nQ5I+61HjQB6nLzW2euGxwGmWrK034v9U0mx8wG43sU2qSOThV7
 MyjfZQlQvp55FXkIIdge+DgzHCxRzPfOl18r2fTRcZnROnpWJVM+yj0uUt9D1qohmPY8
 CyqjzJwLmPwUCaYNhsh6Xo9tYRRlDWYCdsl+uhYNOMJNlUiaJ5e4YWPhPxVBxhQIWbCm
 fu00J3Xt4BXeMxuck3zJ22LPA2DyEihdgVJOx23CCuUXMfcA9FU0gvmj1cMLMAg8peTy
 fSnQlZCWh0J8DJRJOTQ49jk7Xa2UUYrnnaZXuPdwLzzs8ZHFLYuq6XvTIRcAbOIWHAjE
 vXXw==
X-Gm-Message-State: ACrzQf2xyzmUU+OMMQ+WA86S9nrz2y4JvOzoqwzs1xn8tiwD+Vdv2VVQ
 ntwVodqr/hVBqa1+i3C07LNbcNt/fcm0pg==
X-Google-Smtp-Source: AMsMyM5nywcae2wKpdH9zfM11oWZirkJq43BRx0J8boIBx0GPzaBXOELBh8TO611Idk61X1D/FPwtg==
X-Received: by 2002:a17:90b:4b47:b0:20a:cfcb:8561 with SMTP id
 mi7-20020a17090b4b4700b0020acfcb8561mr1256480pjb.55.1664913172092; 
 Tue, 04 Oct 2022 12:52:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 09/20] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Tue,  4 Oct 2022 12:52:30 -0700
Message-Id: <20221004195241.46491-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the target to cache items from the guest page tables.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5e12cc1854..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
 
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
+
+    /*
+     * Allow target-specific additions to this structure.
+     * This may be used to cache items from the guest cpu
+     * page tables for later use by the implementation.
+     */
+#ifdef TARGET_PAGE_ENTRY_EXTRA
+    TARGET_PAGE_ENTRY_EXTRA
+#endif
 } CPUTLBEntryFull;
 
 /*
-- 
2.34.1


