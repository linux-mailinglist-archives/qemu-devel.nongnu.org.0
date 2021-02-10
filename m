Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0991315AD7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:16:54 +0100 (CET)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dBd-0007t0-Ty
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy1-0003cD-R9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:49 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxo-0007zL-JF
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id q72so104695pjq.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
 b=BpsnM/W0dVFPPKqVwkqMkd+inlCrFMiVrA0iRndl0zVCQU59W4Xr8I5g3nIfcWEjAV
 bxxU0lpL94VC0JgOlkLldwhwAOjrkpz5JoS3vp+nXqXOaDTPFuc15iTjYb+ojEw8c6K9
 ecZUg3fSHI4heJiGH7UAB7GMIhvmd7aisfqDTze9SZO0fM1/ErUDv3OXHo3UzHeCp6uz
 62/hJhlITfQ3gc7ESlqWV9u2K1zRwCJ+WPLJAuzmGg9nmgRBJtJZSVdGv8T2mPOIsUcY
 WFACDf/A9ZwyD+p3M3pqnXzpfwYxaXJViAlyOP2aA5+gr74U3Zpq28Vo1sVNcCA7ksgn
 LaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
 b=ra+GbW5hK5oxh/qa3P45k+nG8Botjspf6GQyh3ozKeoqt7HDLt1zjKWB8MouuRsu9n
 9P8jMMLYMlyEtoyc4VXhZHAmFyExrGOoeYTztz3L4LJdUSd0RrlrUyzeHs6ZEXqxABfX
 aOhZT4O5cTngQX59fDeOzkzy+5TQySCeszLIx1lPtfPxIynpKjrCuxipZdmY5jwM8MtG
 vjoiDrlbz14muQGXG8u+g4Uq8oCijJel0i+n38GiZqu5stfStqnpzZN5w91/EWZdQIy8
 VGGPVtSfTCrSU5guswnm8TNIPXIzfNZ/hAhQZmEB86tcvQ9mNY7bK/aUmEadCO5JPjtZ
 rFtw==
X-Gm-Message-State: AOAM530ZI7isIEgf+UJfxvvsHMDGeRXBNwBAVJYfmHaaIL8CyzvPtscw
 4Oakp+XEdkDsCODwuG3Ap4Ne4yJL+/QCfQ==
X-Google-Smtp-Source: ABdhPJzRcock/4m+oZnKwgWLOk1oQkj7MYc1nisCPdskJoSmXlMny642U9Uk76dbkLN1ci0QfVndjA==
X-Received: by 2002:a17:902:56b:b029:e1:67f4:8ad6 with SMTP id
 98-20020a170902056bb02900e167f48ad6mr480465plf.7.1612915355377; 
 Tue, 09 Feb 2021 16:02:35 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/31] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Tue,  9 Feb 2021 16:02:00 -0800
Message-Id: <20210210000223.884088-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index f8bb1e5459..4076adabd0 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access. */
-- 
2.25.1


