Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFFC5FAB29
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:27:30 +0200 (CEST)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5vV-0008Fj-Eu
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ny-0002Ta-5b
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:42 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nw-00034U-LA
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: by mail-pf1-x429.google.com with SMTP id 3so10807899pfw.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0R2KmhXeUORlGWyUT5i12Xi4lPWlzT7EyIDQTN1DvA=;
 b=KcMqU/Xcr2CHBCE2paYhzoNSizm9vQdhkyX/ZfGPOHF59yAEZ+nVT0N1g0rEFTGNOq
 BG8iaobKYuU/ByRbLfdF1fZq9Guq9ZujszQTg/ZgSNrBGcUn7eOD6+WfiRuZ/saQQ3jS
 3HI804XfwoQtmiiDKsO7uwhPLjMb6mKm29i67MWqj7wpsIJbh87FqhC5k8J1o8ZhuLJ6
 S6gAHN44Q+j/nqpIk4aBGieNfHaImM8YBgVTPrUgkK9gKvUcHOR37Vv6YxhHOZY2BsbR
 MpC+1OE7VxYFPW/QMQ9SR915CCaPqvlEejKpdjg+ngAv6DlNU+U1DCXvBD5ksgCBIKAM
 ThMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0R2KmhXeUORlGWyUT5i12Xi4lPWlzT7EyIDQTN1DvA=;
 b=QNvDzOXjaWbRGIjQiiiFHnnDG67zsBmOyGCNWs7xCDVKFTMNdyOmJEiFEQtCxKCEHH
 yGcyWVGB1ZCDHzek4vfir7bvjTu3v5mBWmnbG66ktiBKr7eUeJis/MCwdVdkiFft3F1s
 IfjVBlihJ7Y+breLJcqajSEq9vN9J5O4/yCVN2uhfr/UNgJLcJyZHOC4aGzxKItWGRLw
 x6k0CQJKIEWsI/OdPk9WthA2+N+2tveriAqVAiE7B6q2LkaI+u0VQkvGkpmrldgfDK2c
 P2IjI8zK0l4g/KYQhVkP561yvBhn0WzsrXvs6qWaLTvBVuaReKpVwJmtGKYPvpiboMnA
 oHsQ==
X-Gm-Message-State: ACrzQf3Q8nR91CpQbSLi7FZY3wJujgaVd2Os43/q1t2gCgCoaUu7wG2s
 kAodO3omhsiEVFLh0iwr3yJTiIIgLe97Zg==
X-Google-Smtp-Source: AMsMyM7JTqP0GG1Cg7g7vBTkGqq19Sq4SPzxLB+E3bbsq1uK6Wch/KAT+KvWvaUcTA9zD3S5LF0wiA==
X-Received: by 2002:a05:6a02:303:b0:458:1e4b:1e89 with SMTP id
 bn3-20020a056a02030300b004581e4b1e89mr18543551pgb.123.1665458379381; 
 Mon, 10 Oct 2022 20:19:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 14/24] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Mon, 10 Oct 2022 20:19:01 -0700
Message-Id: <20221011031911.2408754-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e9e77b7563..cde4e86db2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1


