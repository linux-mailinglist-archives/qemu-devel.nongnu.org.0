Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D458332D92
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:51:32 +0100 (CET)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgW3-0004HZ-K6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6z-0007Pm-7v
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:34 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:33801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6b-0002To-SG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:32 -0500
Received: by mail-oo1-xc35.google.com with SMTP id x23so3183290oop.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PNu/k9q7y7xSUi1QwShDN3GcUxd7gykmxrek3+gYYGs=;
 b=M12jkkYqw9CF3LWYBlAFIk3eJ/3n8aSy1g7SZFhkOCwDMXyDgf6f/yt87+guBlqB4g
 fhI0xc+hLV7hAw7jN0W+m1etKTSI1EGrh6d8o7NE5GcxHGJ0Bg9hp0zFxfR+D/TaDRZY
 mclH4ioIVhORR+xQ9CVxh0oQJ/6nVNfpENH2dmnwFlHJL1ScsqSagdPXoq1gn5alYuWl
 wDfJNeYH+0q21s2GZyw+GfJ3zvO8UXtxjeaFqyyv7ugcVOl4sFnOmnh+Daj1SHgMD4K1
 hj2SPaL8ZLI9b9joJWGEep6c34SZZKsAvUDe1Xtlb7+gMMbToDuWbqdJQ+hQvVnmySGS
 WrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNu/k9q7y7xSUi1QwShDN3GcUxd7gykmxrek3+gYYGs=;
 b=Tr7MIHkdPKIwlyXuAau2YkgdBTVLLyXNTw6ZLbSLS8n7LOR0zhwtmONTFBnMj9WNGb
 yA2BYZILuGvJWFpOLDPAkI5TTO8idSBQl0A7rqvRdAgFfQyvTLNsktMvkEA/oGxb4vY+
 RQjHWo6dJZTcBpkFzi9Mbs1U5srpEm+5uVJeutc0npa+kXQM5ddCl3rpB1PXvPodqD4v
 e/OTiUZbJ11gojzwiIynH3H13ooEawBIvZNGCiLbcxqwG3EaNdgwS3HzwpAwLXf44JX7
 Ey20ePwXykHgXqCyM5/kSOAxDTty2EdYZtoQiPR+gRA5txuSspB+uQfHm0aZwp6c1k2U
 LcuA==
X-Gm-Message-State: AOAM531jKSsVaRW7EUVQFq+RkaTlBhSbXXKQKhKMOE0IJJdaUPdeBXy0
 1cj8L7TqHQij6psKSlGROVCBxwhpN/AQoAX+
X-Google-Smtp-Source: ABdhPJxD+vv3cSzy9dNul4yTwAYCYPlnmcwJwPmPUZ3FzkIGvcQSUoqMQAZUjJ4Lbef5FlLhT6KChQ==
X-Received: by 2002:a4a:96b3:: with SMTP id s48mr22923006ooi.11.1615306868833; 
 Tue, 09 Mar 2021 08:21:08 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/78] target/arm: Implement SVE2 integer absolute
 difference and accumulate
Date: Tue,  9 Mar 2021 08:19:46 -0800
Message-Id: <20210309162041.23124-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 695a16551e..32b15e4192 100644
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
index d41fbd9697..d27fab2b80 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6439,3 +6439,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
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
2.25.1


