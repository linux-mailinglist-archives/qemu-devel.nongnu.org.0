Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2AF338F3C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:57:59 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiIg-0002GO-7Q
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD2-0002ya-5i
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCr-0001yR-3i
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t9so1815232wrn.11
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a5SmdtXtNQCuCh0L9clBexWFP6zNbHMles8IQtFIu7o=;
 b=e+zPB1jzIYqxMUZGlX2grgALmAT+9Fz3H104zl38B6EgviB14JaFXj/1T4PQ57Xc9l
 XxQ8nmOOy1qUhK+70nI/7M8kUyThCEJSlKhbqPhCqSvYcz9El5YlxEYF0ZBJhFzj4iYD
 ybLvpKprp7hYbd+n5zh4rd4wXzD6CVNNG8zl9fTMdvXqru8XYYTmFEwcWFDn6uc+zXIm
 Jp01F3J3SFLMW0BypU2gJGQdSnTONPGZj83KBbRVhNcdo9y9l0Ee2+2xYiWbVdZtkbFK
 j2PANLiBRQmeMvkQMzTI8qJVPEIohBv1gFL2IQ0VW9W8fki+GLpe+TFp4aQuss28X5/l
 CNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5SmdtXtNQCuCh0L9clBexWFP6zNbHMles8IQtFIu7o=;
 b=Cbgus503DtVQoXcGwZtODqQE9su99FFspq5mAwc2QYF+DivBx22wP6gV/JLxBnLG6J
 4ZJXwbGwJNd09nDPdHyjtm0tFetTklqP7fztX3YP6CZOxpVmSBf1sx5/m5X7YH6CHFY9
 k4KNdfuNuna+Bl7zaXbQFdZYcfhZAmUmrPeGnsXtRFwyx84b4TrNXjsRHmpA6epEhWUP
 XVupXDbWZTjqP993ZlVxK0ogvBWcYynFkE9iEcpuPw4XPyb6h/Hf9BDT/cmZMVQ8XH7c
 hFZInUwyUeUP1hqNgHs7TfJI7sn2+oqEsIq6uJav/uAjfNKkUHZXrj86hVDfbD/9EV7O
 /5mA==
X-Gm-Message-State: AOAM532tQB0WfK99Vd818YNaKSo22hoFwMwwIp0MPZXe5xyp/m81Atyn
 KQbXKIrIN6fe9wCparEY88K8EwXelUboUJ8B
X-Google-Smtp-Source: ABdhPJziM83KvhZmReqzofqK6rXa8njb5DEzViDWxD6H6rmFo1xxwk4o9ysWzOIio5lfNQi4KtOKvA==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr14696781wrt.111.1615557114091; 
 Fri, 12 Mar 2021 05:51:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/39] target/arm: Update sve reduction vs simd_desc
Date: Fri, 12 Mar 2021 13:51:18 +0000
Message-Id: <20210312135140.1099-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

With the reduction operations, we intentionally increase maxsz to
the next power of 2, so as to fill out the reduction tree correctly.
Since e2e7168a214b, oprsz must equal maxsz, with exceptions for small
vectors, so this triggers an assertion for vector sizes > 32 that are
not themselves a power of 2.

Pass the power-of-two value in the simd_data field instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-9-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 2 +-
 target/arm/translate-sve.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6f4bc3a3cc2..fd6c58f96a8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2896,7 +2896,7 @@ static TYPE NAME##_reduce(TYPE *data, float_status *status, uintptr_t n) \
 }                                                                     \
 uint64_t HELPER(NAME)(void *vn, void *vg, void *vs, uint32_t desc)    \
 {                                                                     \
-    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_maxsz(desc);  \
+    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_data(desc);   \
     TYPE data[sizeof(ARMVectorReg) / sizeof(TYPE)];                   \
     for (i = 0; i < oprsz; ) {                                        \
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2420cd741b4..0eefb612144 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3440,7 +3440,7 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 {
     unsigned vsz = vec_full_reg_size(s);
     unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, p2vsz, 0));
+    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, vsz, p2vsz));
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
-- 
2.20.1


