Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FF66F5183
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:30:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6p7-0007DA-Pn; Wed, 03 May 2023 03:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0006pZ-Lo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0007IV-IX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso30096045e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098550; x=1685690550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGVAM5f/fVkyzn3zO3fNGB1yt+oMwQWHTxZuqdKZ/tI=;
 b=rzPHAiQcP4uS+qD9CpuRceNXGD3+laQ0rs2EUMv1KcPlHJenRiIeo51QhNp1q8Ijt5
 c4xLQyLskfssYn6caSXi0rGmfVy+j/OuVGFBMes/HKEmJ/1IuBf5h746sn9imEI4dkiJ
 CSCXWN+dVmZiUEifWI1Ez1Z2Lr313NwJujqAdiCMOAyECk/CLgazvVTciGH4ZliTQ7NE
 5YVPlnHEySuJ6BDL5R9owiweegWMD4PUpiKPtqZ95dk0k9draCwCN9hjyJ6qh82PB+ux
 XKyjXFJXUZiI6bq46O5buqfCYRMMyUCzVIwgoIPmDjA3IUnY6mo0pW6mEqZg7shDnk1Y
 RLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098550; x=1685690550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGVAM5f/fVkyzn3zO3fNGB1yt+oMwQWHTxZuqdKZ/tI=;
 b=Sj4Za8VPG5MeaVi1wFk8FeAAgJy7H2k3vZuSKx+FyXMmSbqOXu7zfw35JE9BOrGA66
 ZMHbNhUJsXoWJ2gsUUPRisVN8r07zZutjHbqK+j9Ia00K0gLrcu5qSZJ8MdmKvDvfe7K
 Q09db3FoK2dUr5Zm3f13OL9Ry//LuOEU9Gh28arHLYF5LWrTOlzQkeL/4lA4XU34UPAC
 1nmh1/RV9GMQJa9GzvBNLcqnWyFQEMP2Xckju36f2Bnn27g3sQO6hJ02kN5QOClG4SVr
 SQM5+vIxvuZoZVnt+bgwvyO7GxzpbnJXnzCYP3T1dsEhh0tShglgLnRTaHpV78ssC+vl
 jVxg==
X-Gm-Message-State: AC+VfDxHRDTfSNIihj5KXbLxttWQp0kJ+LBIp7swDIW6IMKah4+gwtDm
 CsqdBQWQQy6W8XmrypyIuaJMvXScafoy5bdMNZPhAw==
X-Google-Smtp-Source: ACHHUZ6ZPxu97jKk+c6xdUlPTmlU4rQoJAKAUdWHH8P6cxaQrSicPE0e9UjW6bnPoeCgXL2+Pvf7oA==
X-Received: by 2002:a05:600c:257:b0:3f0:5887:bea3 with SMTP id
 23-20020a05600c025700b003f05887bea3mr14049789wmj.27.1683098550445; 
 Wed, 03 May 2023 00:22:30 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [PULL v2 06/12] tcg: Add tcg_gen_gvec_rotrs
Date: Wed,  3 May 2023 08:20:56 +0100
Message-Id: <20230503072221.1746802-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Add tcg expander and helper functions for rotate right
vector with scalar operand.

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Message-Id: <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
[rth: Split out of larger patch; mask rotation count.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h |  2 ++
 tcg/tcg-op-gvec.c         | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 6d58683171..a8183bfeab 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -371,6 +371,8 @@ void tcg_gen_gvec_sars(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_rotls(unsigned vece, uint32_t dofs, uint32_t aofs,
                         TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
 
 /*
  * Perform vector shift by vector element, modulo the element size.
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 9c14908a46..f51bcaa87b 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -3353,6 +3353,17 @@ void tcg_gen_gvec_rotls(unsigned vece, uint32_t dofs, uint32_t aofs,
     do_gvec_shifts(vece, dofs, aofs, shift, oprsz, maxsz, &g);
 }
 
+void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    TCGv_i32 tmp = tcg_temp_ebb_new_i32();
+
+    tcg_gen_neg_i32(tmp, shift);
+    tcg_gen_andi_i32(tmp, tmp, (8 << vece) - 1);
+    tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
+    tcg_temp_free_i32(tmp);
+}
+
 /*
  * Expand D = A << (B % element bits)
  *
-- 
2.34.1


