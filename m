Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF13BA0E5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:06:01 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIro-0007u0-Iz
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm7-0007cI-3x
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm2-0007el-JX
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id g7so12336044wri.7
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lqrA6R3NcSmRZoOwqEjjG4q5g+H1FjaFX1pr/cYb440=;
 b=xlOHx9adrufnXZVkSsZihbMQu0N6+hwxGRw8f+EStZjg/b0VTAU2wJXRIWQ8REtlRw
 MXHCQcFGA6H7W3cD9NWwbKWfHL4TkMISE9R9dqAMABGb4uYEl0HB7PgKsvYMhRrjRRI+
 1fRGAeCqt+kGWUUfQV/o/5Jsh1Wum5lddNJozlWkei/XQWzgIy1mvxj6oy6RBjjLYJ6i
 /ltkQJCpzOpxIdLPMihgfQ8HOBpWwPa7v2/28kt6CbTBVf5A87TLhMuoIXRi9LtmGsWN
 IOgUiQK9OSJS2RhJy/7yBYlREq1Kzqlr4+AH7+BK+uL+29TsbvH8clFGWPAVo0JwbQeb
 BRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqrA6R3NcSmRZoOwqEjjG4q5g+H1FjaFX1pr/cYb440=;
 b=R60TOmduoAxdL2EM3Db9TUv4ALiTtqpSpumQOxHkfDdcIqBamdHyedDaC618rP+hbE
 ueC+CoEoH6spXK+Db49awTWpE+JjAvD5bPCnVvNP1+Q5yoVAFQrSuKWrnVOHRDvKWaaf
 DAtnFus+WjSDut2FtfQx8nsml23FQo1cabCxVIMeKFD743sKADeJd0BGxLzRYUMc2ZRv
 HUId5N7iEKGx/0eQTjAOMJV9+9Z5jgEKpfgcwIsMXe6Y2+DNlXL5bBnhooyzyo9L8+HS
 nHE7+TrIdm1dszSEp6Zk7cKGWJFWMgj/5eDurhY0H9y2jk3NYQUOmGQcFeOWg0ytJdvE
 l9hw==
X-Gm-Message-State: AOAM533VGxN/yQRtW/Owr55yk/117jN+YUlgbaoGCNiyJlvFDN+Ubm4t
 DgASedy3zAGpeJ5w6jQvPjeDz6okp/+VJ/x0
X-Google-Smtp-Source: ABdhPJz9+HuaktijGl/FA6VKOwaift/vGvoELqyas7C/lXu4Pc51Yt+C9yOCqlzO0kJDW0mnjun9NQ==
X-Received: by 2002:adf:e507:: with SMTP id j7mr5741969wrm.152.1625230801184; 
 Fri, 02 Jul 2021 06:00:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] target/arm: Fix MVE widening/narrowing VLDR/VSTR offset
 calculation
Date: Fri,  2 Jul 2021 13:59:37 +0100
Message-Id: <20210702125954.13247-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

In do_ldst(), the calculation of the offset needs to be based on the
size of the memory access, not the size of the elements in the
vector.  This meant we were getting it wrong for the widening and
narrowing variants of the various VLDR and VSTR insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-2-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 67462bdf27d..e9a5442a724 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -120,7 +120,8 @@ static bool mve_skip_first_beat(DisasContext *s)
     }
 }
 
-static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
+static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn,
+                    unsigned msize)
 {
     TCGv_i32 addr;
     uint32_t offset;
@@ -141,7 +142,7 @@ static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
         return true;
     }
 
-    offset = a->imm << a->size;
+    offset = a->imm << msize;
     if (!a->a) {
         offset = -offset;
     }
@@ -178,22 +179,22 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
         { gen_helper_mve_vstrw, gen_helper_mve_vldrw },
         { NULL, NULL }
     };
-    return do_ldst(s, a, ldstfns[a->size][a->l]);
+    return do_ldst(s, a, ldstfns[a->size][a->l], a->size);
 }
 
-#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST)                  \
+#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST, MSIZE)           \
     static bool trans_##OP(DisasContext *s, arg_VLDR_VSTR *a)   \
     {                                                           \
         static MVEGenLdStFn * const ldstfns[2][2] = {           \
             { gen_helper_mve_##ST, gen_helper_mve_##SLD },      \
             { NULL, gen_helper_mve_##ULD },                     \
         };                                                      \
-        return do_ldst(s, a, ldstfns[a->u][a->l]);              \
+        return do_ldst(s, a, ldstfns[a->u][a->l], MSIZE);       \
     }
 
-DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
-DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
-DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
+DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h, MO_8)
+DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w, MO_8)
+DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w, MO_16)
 
 static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
 {
-- 
2.20.1


