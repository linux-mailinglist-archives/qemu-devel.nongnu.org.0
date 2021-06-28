Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016C3B5F86
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:02:42 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrqT-0005g4-5y
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrme-0002hS-LL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:44 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmZ-0005zq-Na
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u11so21376162wrw.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UtewGl0K+eTZVJgD9VxEV2gHGwexdZngsmOi5Ju2Gis=;
 b=fGwRW3zy44IjsK6sXnWBbTZ82bAIFLIV+QKEu+9xufiAl+7uZX4m8Y1mXNKjLWhA7E
 Ue8d5CMrIqFyOAtSSiPDFCmdhKhLcdGgAq0pL1k4dNPO95FNLMfW2y2JkvTOLp02tk7u
 2JKfHxxhlWw8nPonv8M723e10ka1ipW4nUvRb34VY2BGK+hWmWA9GtqcTbDt19b5EETt
 OEcUbNm40I8HVUCteo+0XQhjrI3UjkL+whv7nHBeQZPUveYxaYBr6VsE2UBByX1tDCs2
 A2SZSFRlR7lwC5n/scRfIdY8+rkriAOaVi4BUBGfgvzol7HaLsuBL7Mv11V+9IbxBCYa
 g/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtewGl0K+eTZVJgD9VxEV2gHGwexdZngsmOi5Ju2Gis=;
 b=gFvCRaLExFWXNCdFsBGfGc+VGZz6SbwEGG/7DL2zgptO4P7q8dARuXvJJr9UsyuE4a
 lC6mFLoq8MhBh0vit20rZON9qhc0zGfo2yhnneQiy/a4WBJpwtY32NHiRDKtBHuVjNPJ
 vTrSDBIps4VxNsHizy5Tzi8Hr/eJ0YrYgxxv0meWsiOj2jL5xorhZcuyxEOvOWQFYUKI
 p+vk7OF745ezP83H9+g/IqPHddCopLb2dqOcpooRHx7Uxt56Df6ZCi3IhTuA6jVmEvCs
 jTWtwAoZcn2hPki+HxTiweABk7A4+8jtvIcRN9iOLFhpBqMJqjSKEAljTzgeBiMDPY2U
 7pSA==
X-Gm-Message-State: AOAM533SEDQobzjbe3hALB/I4eIlEuUESqV6pZrjASxeZaZHRBWBs7rk
 7Q0/WN/zGknjvE6Y3tesery6QrPJCm9nZoB1
X-Google-Smtp-Source: ABdhPJyA/ehCQ69kfsTYVBum+61p8lYSQyilIqNRo+g3i8fs3ToPAl26J7cDkJP9dMjzvdYjakvbHQ==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr26653006wrq.34.1624888718277; 
 Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/18] target/arm: Fix MVE widening/narrowing VLDR/VSTR offset
 calculation
Date: Mon, 28 Jun 2021 14:58:18 +0100
Message-Id: <20210628135835.6690-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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


