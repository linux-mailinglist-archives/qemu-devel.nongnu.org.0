Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E36593CD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:23:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sQ-0003uT-IZ; Thu, 29 Dec 2022 19:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rU-00039C-Gz
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rQ-0002hC-75
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:59 -0500
Received: by mail-pl1-x62d.google.com with SMTP id m4so20371210pls.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz8pxyjZBQm1+qEjyv1TGYW3iZ6MjviUhbwrA5+bw+s=;
 b=jtjyBhhYno77HM+F5eUBjZ1SuFTej2CgJ2OxswNr/q3OM0VwdYq6OViQLsSvh5Sxoy
 xCUHZHUDQ6d69Cqi4ob4aM6qoLtXQeuKZD/mxuVtcBwmK13u4OYalfXQKZTbY4Y34+jF
 bwFbBC30kj+Wowrz4EdS2HXBj2JdH2GXi7DSo3/EJX509If63sRObPREkImSaKfVj2Jf
 0sLQsQg4FA9vECcG8xcEvsax0+zNtL4OMU6ejn5EG1O9CvZ/RoRZJCwYerpII9EQ8sxt
 TVgvQIESgHAYi/LPy+ylbgwQf5pyYgiLSw+bOpXK38QVkwNtPf//bLh17150hnpf3ML7
 bpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz8pxyjZBQm1+qEjyv1TGYW3iZ6MjviUhbwrA5+bw+s=;
 b=bwdgdapTQAWwenu/3mCfQPQYNKKFHnq/Dl5dm20w3h4gOW2wtYjmOtUPSZvhAQkBrD
 Iq5Ke6udLy9y7N8Wp07yJjRku4a2UrQC7eSu/UWs6dKK5hjq/8Xyvii2Zeux2+g76zYc
 4IETnz76pIVHRaN4Xkng5VnPyVrPKy/BuvTHsggemqkSnqeT5Xc4+PgECslsUYaj5NV7
 JeV+X7KNsQzz5nXd072dgWpKJUxJGshuTvIGBwNuuLPoDqvKiewGJku12DP2WQf81FU7
 jlZHp7cndql6hiH0CgdcZuzsWtJgMzZa3Jg2M3j3PN5ZrzGvdMH1QpQIAFv+mK4EKiUk
 Pzcg==
X-Gm-Message-State: AFqh2krIrXWMHbDkSnI9ROeX3ix9aG0xHNelwlrrfBAANigWDLAkekMx
 tMCIFB9mDGxd6MffnlxofBWG/TjKc7SsLwpE
X-Google-Smtp-Source: AMrXdXs5MsB2H+uAcUraUcyKRA88soZtNM9EHYFysw1bXfc4DjFMF3AFqXTmw/JnynW/SnworiwBNw==
X-Received: by 2002:a17:902:7805:b0:191:bb:c207 with SMTP id
 p5-20020a170902780500b0019100bbc207mr29946525pll.37.1672358568802; 
 Thu, 29 Dec 2022 16:02:48 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 28/47] tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
Date: Thu, 29 Dec 2022 16:02:02 -0800
Message-Id: <20221230000221.2764875-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the ABI of a function call.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


