Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA7609A20
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:57:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompss-0007WM-TG; Mon, 24 Oct 2022 01:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompri-0006ZH-VW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprf-0002K8-65
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:10 -0400
Received: by mail-pf1-x42b.google.com with SMTP id f140so8141056pfa.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=dbfi46uB/7gS8ippsDDPhZaM5XIwv8C8/d1kVqkcpxlsE+qzNODqsqFISf9M8dQd+s
 gasowfX0iZwEFaTpDb6QaV1bK9WYXptzqRX7PCmLll9kAF2nDqf/0olhEO7JW532l7zj
 jOFEA0oLX8vkFj8kXvMRzKTTPDqylXx8zEUsLFZGR9tXFt+Zn0L4MTQ2yKiohXvsxjP9
 BiEMs1t251nMEoDnbK5xD6MNyeNYSHvFsHabW/vTx56qPSOsdTZiZ0rEydj9B+r806Bs
 vFu8Ic879Phb6qQDxcpVjj8cKyP1JJXuJwvbS04oihKB1lpfB+Kl/Ezg9aVHntz2+I8/
 jyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=FRP1xh2bVHcIz89sS4uSxEa6mOuUmh8F5zeOtq5Det9Jz1e7tzvrDDJOH5h+tFhvn0
 XpjjQpj64GHWdD7j/K45OZ33oraiUJ5AinzTTFrhRdyEs0Epuj00iiJWsZs1nOaka68y
 sW73x9uMRlm+yxVidT1rfmrv4u7lU/t7fSRo6U69WFbuk08DPBVpmjhuLJ4NiXLTqZxu
 84oWQTCgn+/QJEluVY+yWa1wfgg9Qdhxe16qE5ovIn3RbAbt1wyICOOfXym2STW42fO+
 NaIXGu+XVg53P9jXmcKZE/kh9zHAekPg65UBb4N6tHEzFJxONXRdFrt2vTnELtUsPcqJ
 fH8Q==
X-Gm-Message-State: ACrzQf3ozytqROTkUpMyWLYOAOrBF8w7kUzw7U2t83CeWwIyZAmdppWp
 JQ7A+4ds/x8X1dXC98/AuVTJCa9lbRFoRMgg
X-Google-Smtp-Source: AMsMyM5w213LcCW57+hEqO3c62ln6wJFPWfeGgGYCiqN05Lp5CTlYmvCKmASV3yOahlaQbxsWely9w==
X-Received: by 2002:a63:54b:0:b0:464:8e6:11e7 with SMTP id
 72-20020a63054b000000b0046408e611e7mr27325447pgf.212.1666588745685; 
 Sun, 23 Oct 2022 22:19:05 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 03/14] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Mon, 24 Oct 2022 15:18:40 +1000
Message-Id: <20221024051851.3074715-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c..0eeb4abe53 100644
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


