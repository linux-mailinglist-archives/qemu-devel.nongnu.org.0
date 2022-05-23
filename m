Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F41531D5D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:07:50 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFHJ-00086D-6v
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-0008Ly-T6
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy1-00051m-Pg
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n10so15049984pjh.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dt8CbxTVDB+ShnUD/KaNguE181rKbT/m4QnA7xOaLPg=;
 b=fG4pX36Yf8/hRDRO2f5GBI2/9XQPsgkU7OGc21rMw49eRDW8u1QkdRWkx5i51NN4u1
 tSfHqKB2ZhBZXRi+fYS4xiJUGvXHtFWLIG8tRdE7UwcSNQJk5YHtjrLQq+mjcYE5TVnt
 rInEtTwyDsu/+JRHPPHV+cyokdvx+nmdLxk1z+eXCT6HxdgH7mYxky1x52lQmPv0RjR7
 KwFskHuL2Dp7UWS+cPIuZx3EIty6yAMRP9YGDSTT/RVwwsxpHRJ93oCQp9oOI2pKo4oC
 zDIAM+QX0ZEQUw3aYq4Hq7wgyD25k3nO155gpOpB6CujRKXbmDqGKBsgn2MgEWVc6ihH
 IDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dt8CbxTVDB+ShnUD/KaNguE181rKbT/m4QnA7xOaLPg=;
 b=ajGtOgjbVr+BtvMb3j9+8KSEis0F1BTfF5nWQeJHuGvru3YdwGC8DaKKU58wkVog6s
 E7Nzim5qmU/T3gFEwHkCdtaXCChnCDung2wty7KZ5bZgw0eAmhknMd+eifvIkNsYrSS5
 KZHutNqQ0q+EoxSf6y9IO4CiPcwYeFR2Tu03BhZERzp72rJy2qJNhQgeckYj73R8mIeD
 46XQ4AVWNWdi2h5sEI1+D6VSD3b6NMwksZ4rridKS4lHNyhq9PPRVblXxzsUk6s/1MAY
 CDADiWlvR+jB1bjt7uTQ9oNrL2I1Nd/vXJRXr1GECZCruiSctcl5I3lNPf/goiqN/cfF
 tttA==
X-Gm-Message-State: AOAM531HQuQOS5froym6Fz3dOQQTk6uSQYaVhtuG+f10t2Z69UEVqayN
 OxmETvD+0bfhhgtW5yP1n5f07m4YQ80PrQ==
X-Google-Smtp-Source: ABdhPJyXdnLYJA6fdX3RLB4yt2iZoj2+UJNDd67k9IBskEHvIGsL1BzKDWNTUdEsFRQIZyKPQPf/tw==
X-Received: by 2002:a17:902:d2c7:b0:161:9c9f:35b8 with SMTP id
 n7-20020a170902d2c700b001619c9f35b8mr24474771plc.81.1653338872386; 
 Mon, 23 May 2022 13:47:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/18] target/arm: Use is_a64 in arm_generate_debug_exceptions
Date: Mon, 23 May 2022 13:47:32 -0700
Message-Id: <20220523204742.740932-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the accessor rather than the raw structure member.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2bbf065b3a..3a86901779 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -98,7 +98,7 @@ bool arm_generate_debug_exceptions(CPUARMState *env)
 {
     int cur_el = arm_current_el(env);
 
-    if (env->aarch64) {
+    if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env, cur_el);
     } else {
         return aa32_generate_debug_exceptions(env, cur_el);
-- 
2.34.1


