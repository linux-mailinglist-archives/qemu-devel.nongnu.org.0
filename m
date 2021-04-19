Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2C364B22
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:27:22 +0200 (CEST)
Received: from localhost ([::1]:59354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaUL-00021D-P6
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQE-0006fu-Mv
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:06 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQC-0002NY-Iu
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:06 -0400
Received: by mail-qk1-x72b.google.com with SMTP id y136so5096643qkb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=CUx5FqwvMcQ5GnkmBZOK0N9P7JaGfvg2j3sj6Xghi5mGlm72dn3E2Sse1xiwPdQaxo
 uF0GNmADOK82BlMMPmJHRMCtDyyVHH0OVgZ7lnAG/QmjUbLWSwTeg8puQ9i+S/fCjvhB
 OD4bD0j6GGrHs6pD+urI8B7rnb5NHNnn5lLXk1OgfmSz/Mx2SyW/Fvjj3aOYwsIZDmg9
 BWOvhI4Ho4ZrR7LwPFSUk+5SXyG8lPe27TndNud8xwytn0zuaNCIov4WSphUuA7mRsnz
 3wcxP9f3DcCSNCbjZfTyupGZ6bJ4NNPPmsyMkPawW4l/CCWXX+ZlnouXa6sXdk3kItiP
 Cxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=sICd2VFuxJEzUIghY4ANsKwtBadKDFsTCrJnlUTrpS84984g+TPRJki0qIcpDIGtIM
 u0pKD0msCi/L5/Ygp0GBh2+c/3S668nkqwwjeBAW1XkINfKKmuMOGNIpO3n2yz0kYLhN
 1wSELM5VZLiPGZdLOIMqyE5joPymBmrrNuymPOxGELZDXNyGm0a1QE3X/Wj/0LUb5YWW
 EeDxadlPnCOZyfpwb7eRRuUwl+K5YYgNJOJ53nmlP65PqPOPAaZSkJdijM4d65njjLuF
 HS5iYuuLcBU6clAKhCdn1RfoGeKXvYI2tTmy1JNOIgGPq0UEFhc8NrJGptPoUMPKXDNq
 BOdA==
X-Gm-Message-State: AOAM530NqLYzkIii8fckxKTs82KxE9WCC/1+KTSvGg4Xbf59x1r1Fvkl
 ADahIaKNrTGhUWFN4QoTXjdj1o+P1ag8HQ==
X-Google-Smtp-Source: ABdhPJwJ8GiA6iSAy4KO3ONjgeykMfMzZ05rZZXona983nbmV6dxN0JX3rDgv3kJogeetRfsqA1H3Q==
X-Received: by 2002:a05:620a:1221:: with SMTP id
 v1mr14089333qkj.164.1618863783526; 
 Mon, 19 Apr 2021 13:23:03 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/31] target/arm: Fix decode of align in VLDST_single
Date: Mon, 19 Apr 2021 13:22:27 -0700
Message-Id: <20210419202257.161730-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e3..0a2a0e15db 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..0e5828744b 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -606,7 +606,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -621,7 +621,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.25.1


