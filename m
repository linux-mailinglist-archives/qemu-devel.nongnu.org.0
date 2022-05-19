Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518DB52D59E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:09:46 +0200 (CEST)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgqX-0006v7-Eg
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggc-0002Cl-6I; Thu, 19 May 2022 09:59:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgga-0001ZO-M8; Thu, 19 May 2022 09:59:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id a38so2280106pgl.9;
 Thu, 19 May 2022 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b6UlzvDweSn01XoFdH9Ht5swqfoLlqPhPpji1SjWP0s=;
 b=Gjc0N3RFAU9sCJ29lrpZdgwDHKB9PwmBxFvmepYnLVCzwpPfn6yCA1YyRb4f7muegA
 f8Wf13b1/nzW8/BsE9r+LNfTtN4RTfLFsRY/62eYJRtzWlqEObSuBgFSP6zivI5WjOol
 nHWxR1DPD46kDcUF8BfruJMjiXIrhhXIpGxs4KwLZ30MGOeA4CRVuG9miQT/07ihTZet
 5zHrUg2nT+B0Ft5qnCZu9m7hmcLmgyR/FJVKuk6IHfMfQ5CI1i9eGKoYG6j5PcTe6IZb
 drpS6sr01u2S8hR8H3h7xteVtTI9q6tvDdLIrvS+gznfwWFvtT8dARnTDw7+wZZNT953
 V0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b6UlzvDweSn01XoFdH9Ht5swqfoLlqPhPpji1SjWP0s=;
 b=3lqCX9saN3MM1TJHUcMhmbyGN5ARZQN5MCIzj3ZTjYtbwwiS4v9JdJtyrIshKkqopm
 VUkOo9cK1PbeDGdpeeAJafZgr32Gj2kqB139JcLeYFSz8bjCNmeqT9DhH+onTX9e4oI8
 i/5IIgf9g9DDHyBLWQByWLQzWO3qHwUcB8z6ZUbSqXf+AlvAngmXF4EE1efZgdHp3+Yc
 yJbLeSwPk/bOrUiyezCRi7mHAYLP5KabF7FJyuuzrVCIPnr3rd99AYPPx4HqTp9zUJ7h
 iBxul045PcG5zcy9Smzko83tzIDRAU0nONPSl5YL/YxBXRWZOYTtwRTzjysMnerrOOs8
 OnqA==
X-Gm-Message-State: AOAM531zYUUS9TEYx2Aa8hUcpEovDAZHNoJoASGBlqKEphLxAvUnAyw+
 U2KBn9kOJXy+G0BtxxROuk3TiXMdKaL5DQ==
X-Google-Smtp-Source: ABdhPJwU0eG4zY5wgQc70fq0Fqfkxp1ijTEQJfFs1jzs+eAl+8LQKyBqqJG68U1fCE8vC+j/NXVcIg==
X-Received: by 2002:a65:5b8a:0:b0:3f5:d3d6:8782 with SMTP id
 i10-20020a655b8a000000b003f5d3d68782mr4210132pgr.49.1652968766978; 
 Thu, 19 May 2022 06:59:26 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.131.68])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090b078800b001d9927ef1desm5603817pjz.34.2022.05.19.06.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:59:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/4] tcg/ppc: Optimize memory ordering generation with lwsync
Date: Thu, 19 May 2022 23:59:07 +1000
Message-Id: <20220519135908.21282-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519135908.21282-1-npiggin@gmail.com>
References: <20220519135908.21282-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

lwsync orders more than just LD_LD, importantly it matches x86 and
s390 default memory ordering.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 tcg/ppc/tcg-target.c.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3ff845d063..c0a5bca34f 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1832,11 +1832,14 @@ static void tcg_out_brcond2 (TCGContext *s, const TCGArg *args,
 
 static void tcg_out_mb(TCGContext *s, TCGArg a0)
 {
-    uint32_t insn = HWSYNC;
-    a0 &= TCG_MO_ALL;
-    if (a0 == TCG_MO_LD_LD) {
+    uint32_t insn;
+
+    if (a0 & TCG_MO_ST_LD) {
+        insn = HWSYNC;
+    } else {
         insn = LWSYNC;
     }
+
     tcg_out32(s, insn);
 }
 
-- 
2.35.1


