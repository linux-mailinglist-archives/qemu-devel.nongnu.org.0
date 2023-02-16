Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD6698AFF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe8-0007Lp-AM; Wed, 15 Feb 2023 22:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe0-0007JI-4e
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:12 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdx-00007u-IQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:11 -0500
Received: by mail-pg1-x530.google.com with SMTP id b22so436196pgw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qVQKGg0JYDYl3B/Ezo35aJccYu0GMCuciVVV8M/s7Y=;
 b=w47xxmO2lqI1unGUC080deed+U6Mj9PRjzTr3USYcPDJlh0A0Phr08dnr+pn+QM5cf
 SlnyvUYdXZrxiCNC42QMnmMathLnh9Mc/DJbVcdOq4GtT2GPZRx+1aU+pE+zadD7fuX0
 kn9hRIL3V9CYDQL4m/8YMKl1YD3/JfX2Ul/xTKPJo1zjElEtnpSlNuVS0KZClBJ3c2Kt
 z2L99JAIZGYT9RlVISg3L4szFuRDFQO+XnnI2iintgXXUPMYSFU6IWlxUXZhri+5ICTL
 QL6Wf7L2Zbsft67vQVaTdnB36yd9NgUpNUq3TWY4HVdW6vkqy/Ue5BGprfO6xRxoUQ5W
 B66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qVQKGg0JYDYl3B/Ezo35aJccYu0GMCuciVVV8M/s7Y=;
 b=QN62RMUJZiHg4nVocVQCaPFXGvHEjISNCOyDFPm2n23sRGrGRPyxzNI3inhnav68IW
 nfEpz6utZp4JZA6rhMxEJWQJwxGYGxUw591/eWt+Sv6K0yKdEPVxN9kwKXd0i/LK4CCa
 9lwzJtT7d1Zcb5poRTJeXYyt6IF8x85FMPDJSRbCrUw89Mk/KxkXUOhiRPMqKzMcHoUK
 n4mP+LqavpUBPbr9YfUTIKW0t17o7nCzXMFKg8cf3p+pKPY0pJ0V0JX3JdjaubTI5LoV
 j3Zo9a5kUBiKVvQDeYufRehqRyGUYnphdTX7QV3eLlanBI4SfXlsCv1d2mQRUu2OFEzB
 ItPw==
X-Gm-Message-State: AO0yUKVXGcv1vYKAfIi1HUroojjGW6mItGISjvk3R2MHlI5NqRIxYsL+
 iPqzt5sgY4dTST++eqj8t4ZYNswsr0vPnWvAjgM=
X-Google-Smtp-Source: AK7set9fbs+2EyFkKIsL1NBgvOBiRm1NHAveGm7G5W9XI25IptzARIpT+exAEVWOS/pFQ+qE2gzYUg==
X-Received: by 2002:a62:52c6:0:b0:5a8:68c0:5607 with SMTP id
 g189-20020a6252c6000000b005a868c05607mr3535553pfb.21.1676516948196; 
 Wed, 15 Feb 2023 19:09:08 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 07/19] target/arm: Add feature test for FEAT_LSE2
Date: Wed, 15 Feb 2023 17:08:42 -1000
Message-Id: <20230216030854.1212208-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..2108caf753 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4049,6 +4049,11 @@ static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
 }
 
+static inline bool isar_feature_aa64_lse2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, AT) != 0;
+}
+
 static inline bool isar_feature_aa64_fwb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, FWB) != 0;
-- 
2.34.1


