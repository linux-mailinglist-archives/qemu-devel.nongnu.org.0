Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3204364CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:57:34 +0200 (CEST)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaxZ-0001n0-SW
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQi-0007d8-HJ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:36 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQg-0002eg-04
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:36 -0400
Received: by mail-qk1-x72e.google.com with SMTP id i12so5661949qke.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ani1RQARSJNMvdPCb6o+N5qGQXgFXuDUDDCdjTRmkaM=;
 b=bCWHmY6HN7l+ILbW31SeegtWX/pXmZ9QJfgIZfPlwIjL2+CPN7zWjNTXD0AyJJxmXU
 RyKsNMjDAd4WKGhI39f0UfYkfmlGYtko1+zqp+ki1LxTrF1owELJThCz7ZTWFgjk5kLa
 4xW8Vvk7SPGClrawJoraFsEQO74EI/SnfCL7sCr8yuTDFQT7aAlPbemX30Vnk7IE5JB+
 gCXoAJHvRveVo5jorD3UfGZsY1RCilbQreq6qt0kU2tddNF7lknv3pP9buTw78HrAckz
 M61uamVOCZrW0U1pFW65+fAL7BoxUf0+sfuvtj4zUIkBE8QSmhly4gvrlv4tzBHJNnCw
 MnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ani1RQARSJNMvdPCb6o+N5qGQXgFXuDUDDCdjTRmkaM=;
 b=FgxsQgQVjb+N9HJR2hqidz8Mp97lR9b2tfTbQmY3eGINkoJ8nB+yppOIgaRTqcU4nk
 LfvLe3JZ+COAkKs6ottso+0i0FnqHmNvHYJuoWR+98MJL8t8dXB4Pb24zT50QgBILLw6
 71Dm5ar6jnldQMeRqYahgWuhzf3ZQUl13vUopi7PIVnTYei+jQUST3VBskTX1yBLnmdB
 f9IW/On9ea17bkSMjv+ckSIR26jabB0Yh3Q20jTsl7YSCocfcga0da3BvP8KbdPlq+IT
 7mfRzvbmoKUy0GdvLZChFqZ5ysTmsy+WaG53znDl0ehgg1ucp8a605P6A9Qwy5ImXwqm
 6gQg==
X-Gm-Message-State: AOAM5322sNJhos52PSXIrv+d+AYZBsfCau2PhtMHNyyIEm7Z5mR7IPJT
 SPPJTvr/FBqXg86ievLfbiPqzaZO8a7jpAjO
X-Google-Smtp-Source: ABdhPJxhTnvDiGiy6pzk8XofQaOvznI/UxweTb/9z8qTqHUf9pKlFd+Lw+pg53aZW/kG9OhUQRBxMw==
X-Received: by 2002:a05:620a:1323:: with SMTP id
 p3mr5105821qkj.367.1618863813133; 
 Mon, 19 Apr 2021 13:23:33 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/31] target/arm: Enforce alignment for RFE
Date: Mon, 19 Apr 2021 13:22:44 -0700
Message-Id: <20210419202257.161730-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f58ac4f018..2cdf58daa1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8341,10 +8341,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1


