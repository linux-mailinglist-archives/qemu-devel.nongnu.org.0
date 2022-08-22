Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5159C5E9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:17:28 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBzL-0002T1-KK
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Og-0004dT-MZ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Od-0001bN-Q3
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:26 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c2so10258108plo.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=uNxbfM1LG+tkQwT2rbn07Zh7psqGNLMvTCti+0WRgNFkXLbuSUyqETrHtr7TdfYxDe
 428itT65OgxjTCHR8iZYXGSKdoyd2jq1VTnCSQJqt1+ukIF/kZG0mKfHlfus5kOPI5Ka
 KIOWCPZ0Oh28Tw0sYiOkklN55wi2OLAd4a1909QdcEUBsJcpg4erGyGzQi016VqRJ0Aj
 bHTGG0j2h9UrYGAjsCHCN/EbJYu7ekfY8zsVXeCMnmnBtkFe6NO4jduekuu9PUPG9C00
 fQYHjqXTkMRiFpSZZbk8jHCKKP0LeQL8MwXnY/lAD6J6vf1NPPzGvPR/3Tl7AyusmF8L
 HUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=1o193EGM4oo0av5xwdMWVdUa1KcBhQ6/2ZK0kucaDLojF6vIuZFX3powOwYCZXRZYg
 MRw7327I/TI+zq9lQWCwBdEDvj4rpVjaplo0ahRyCPe+7Lvtt15Vodugftje3/RmAdO7
 HJK0l0+plsxpj71QbWIhvq3nvp6icNB8uat2jNGlcP1rl7VKmjj9GYBnKn+wRY6/arWX
 YK3Zqw+LtkZLLtXfk1CpznytbYYsmlnuM66n/fmgoLOmLGowgycQU0kucDTLNImf3h1j
 E6gDMkJEJahe9TT2DxWqHP6vkfQZjNjd7qA9WfPysg8FPy7cO8/kARQutgHZUw5qxJXU
 2+5g==
X-Gm-Message-State: ACgBeo141lqlHfTWZNdB7JFWTKiyI+1McnAz1ML1gkCUcKNZnLMYA6C7
 wenEpQNy4oar2+AIYw3BbV4Sghzgo4F/SQ==
X-Google-Smtp-Source: AA6agR6R6WH7mCZEZ7++3k5x55U0dSRPB9mtgxVbyMqvFL6/N4BNYJ9+7KjtvkKnXeg6vTOeEJRI5g==
X-Received: by 2002:a17:902:eb90:b0:172:f986:a096 with SMTP id
 q16-20020a170902eb9000b00172f986a096mr1681082plg.94.1661182281916; 
 Mon, 22 Aug 2022 08:31:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 43/66] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 22 Aug 2022 08:27:18 -0700
Message-Id: <20220822152741.1617527-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


