Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126B6F5158
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6dy-00052o-Fm; Wed, 03 May 2023 03:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dU-0002ye-Ha
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-000762-8A
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30940575e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097836; x=1685689836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
 b=eYCmvUQ7jW+zifuuVm6g7CyarVPdggpG4tmso//8686ULorCizgcwd53eoCKRxT6VB
 tbEh7m7sVf5ANunCPxQE3+XWM9c+v+wocXRryH1DN0hToxkUmcxjC+ERWNJsQ+kqm9cm
 HDI4s12+4orfxFOSuObx8MozUPXXXRm7e/bv987BQatu3G/+y+ELEgW+KGnJVcs2SAPY
 svWpnL5RUUEdR92qTd5Dm2mM++KOO5ujK4ueMJXgsyUWMYql7GXFByLsbXI4vhQdLVRL
 KWYS1oH2WT4znWVh6LRkyRy61wlBncGZP4Gow9ITv4jZcejYEulP/4+DnrgE1nzNyjrW
 wO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097836; x=1685689836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
 b=eVZVkvTi+YDH+6FCTDhYyAu6jr7CLMLrDrdl0OTY7tx9FSJXq8iMApb1l3Wv/SP69n
 3yITKKunlOeb8RIKMRRcC+8B6XCxY7QME0cRE/8hGDPKwJtypqFkTUKv+zM0wUizOMg8
 LDz/qw9Wc+AiDFqvxX26vH+1Xy4thOAMlUkYGcQ66ggwxQZzKFgbgghV/VmA0wZa7OI9
 hspLE1vieQFWtBJF1gUj4fGZpWEVirihcY1pqYr+iuHTFqBBq6em5j32E1lkuaZgOqQp
 PS7JKha5MvR8Crjd+co7Twc5wSbTiKJTAlQkGWtoI7N237JeI7U78zpBXyRJS/2iayDw
 +QPg==
X-Gm-Message-State: AC+VfDz3gNOj+QGwSrLkdlMUnz1zA4B5RFKkQ6ryCSeF34/H27+6zFaw
 qd9fWcjJoLhcodo7aqYL25QFZHUXlBlxWAMS7ehBzA==
X-Google-Smtp-Source: ACHHUZ4cJuZGZRFuBynQmAuP4fhWrDDDrsNP9SlyxHuX5UHRfBfhTqm7efsHyeO4K4XTZjfHs8jZ2w==
X-Received: by 2002:a05:600c:d7:b0:3f1:93c2:4df6 with SMTP id
 u23-20020a05600c00d700b003f193c24df6mr13402268wmm.12.1683097836219; 
 Wed, 03 May 2023 00:10:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:50 +0100
Message-Id: <20230503070656.1746170-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index bb23038529..4f9ec02b1f 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
+    MemOp s_bits = opc & MO_SIZE;
+    MemOp a_bits, atom_a, atom_u;
     unsigned a_mask;
 
     /* We don't support unaligned accesses. */
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
     a_bits = MAX(a_bits, s_bits);
     a_mask = (1u << a_bits) - 1;
 
-- 
2.34.1


