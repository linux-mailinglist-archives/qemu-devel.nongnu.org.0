Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1C3905BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZCL-0007fv-Hr
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbU-0003R0-1s
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbI-0004NG-FD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id p7so28890188wru.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2HQLTB5OBAZlO3OfB62PJngqTTcG/QeDcb9UOWXlFWM=;
 b=tgoQ/pZO6YIfgACChkC5Fawzd7RWfEkRPcB9ux73W88MBnZGgBY1VW3xW3PiddCfh5
 y4TPQ8zy5jetGwhcmEGuDT494WjOMlC9gvUjLgSXick0j4rR3f/Opdn4oGk+CEg8uuyB
 j/rrjkBHq7JMGG0P4OhoCMY56UIoVfmmRjWdC6t2yTSs63ekzb0HyEvWPJcMrBNgNWPt
 jt/XGTmcfbfxhe/VYKZyv3eHoOUwPa9XWbTPqQp9Cxvpbil4QpHWHfTYuVIdU2Hjmp6d
 lAXzMQdlAP1uwpm/W4FdK17JSJGF8+Qb369JZ4zqAjX+pxLhTh4ObgzgpztrNT/sA4hc
 OmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HQLTB5OBAZlO3OfB62PJngqTTcG/QeDcb9UOWXlFWM=;
 b=Jc7EsMuKG4OYi6Aa4MD7csaHbcB12FmqLS0a8tg+/aKZh7bPgthCVgzsv1IqG7zFxC
 6XsGaMH5ana3d2Bj1oU1jtG7bxtkTN5clWTLVYTkDCeFjGoEWTYW5WIjnVh/Ll2DCUvk
 /zhSLUhjEffX85uKofUqMMHjZ2ogsLXk2BFkVbvqvAkUhAZUeqqDTOAUqrz1lIxapZXM
 qe6oDwbEARB6d43eWl/7fHDE45pYHiCPzU2obfDqJ9+P9dFtXXfhA7Y/FWoylxiOtlcg
 dOFyFYDs0AB0PlMB77U5omu9TnHws+vhB8I0/ET0JAQWZx4AS7QYf2wQi4garCPUH5pT
 qqqw==
X-Gm-Message-State: AOAM530dhzy5qm0xCRI+vO3YSG/LHdI95axeDpsumJPEqsKmrGx8e7jx
 TJyMDNrPEB789kQf3wUtrcLoTGVcHxZ3Je3M
X-Google-Smtp-Source: ABdhPJzZhX5KbmmQcF1OoctbyO8zV4wTBI/fs4vMFHqIvR9lCO5UF/OBGH6Qnk3BJUCODuoaOh1yAw==
X-Received: by 2002:a5d:6e03:: with SMTP id h3mr16299799wrz.138.1621955047068; 
 Tue, 25 May 2021 08:04:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 045/114] target/arm: Implement SVE2 integer absolute difference
 and accumulate
Date: Tue, 25 May 2021 16:02:15 +0100
Message-Id: <20210525150324.32370-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-24-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 695a16551e7..32b15e41923 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1266,3 +1266,9 @@ URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
 
 SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
 SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 integer absolute difference and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
+UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5e42ba350e6..202107de985 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6438,3 +6438,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
+
+static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
+}
+
+static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
+}
-- 
2.20.1


